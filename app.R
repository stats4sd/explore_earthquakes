library(shiny)
library(tidyverse)
library(datamods)
library(shinyWidgets)
library(shinydashboard)
library(DT)
library(reactable)
library(plotly)
library(gt)
library(Hmisc)

quakes<-readRDS("quakes.RDS")
 source("html.R")
ui <- dashboardPage(
  
  dashboardHeader(title = "Earthquakes!"),
  dashboardSidebar(
    sidebarMenu(
   menuItem("Introduction", tabName = "Intro"),
    menuItem("View", tabName = "view"),
    menuItem("Summarise", tabName = "summary"),
    menuItem("Visualise", tabName = "plot"),
    menuItem("Filter", tabName = "filter"),
    menuItem("Categorise", tabName = "create"))
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Intro",
              HTML(html1)),
              tabItem(tabName = "filter",
  tags$h2("Filter data"),
  fluidRow(
    column(
      width = 3,
      filter_data_ui("filtering", max_height = "500px")
    ),
    column(
      width = 9,
      shinyWidgets::progressBar(
        id = "pbar", value = 100,
        total = 100, display_pct = TRUE
      ),
      reactable::reactableOutput(outputId = "table")
    )
  )
),
tabItem(tabName = "summary",
        tags$h2("Summarise data"),
        selectInput("table_var","Select Variable",choices=colnames(quakes),selected="mag"),
        selectInput("grp","Table Type",choices=c("Single Variable"=FALSE)),
        gt::gt_output("summary_table")

),

tabItem(tabName = "view",
        tags$h2("View data"),
        DT::DTOutput("dataview")
),
tabItem(tabName = "plot",
        tags$h2("Visualise data"),
        fluidRow(
          column(  width = 6,
        selectInput("y",label="Y axis variable",choices=colnames(quakes),selected="mag"),
        conditionalPanel("input.plot_type=='scatter'|input.plot_type=='mean_se'|input.plot_type=='boxplot'",
                         selectInput("x",label="X axis variable",choices="None")),
        selectInput("plot_type",label="Type of plot",
                    choices=c("Scatterplot"="scatter","Boxplot"="boxplot",
                    "Histogram"="histogram","Density"="density","Mean + Errorbars"="mean_se")),
        conditionalPanel("input.plot_type=='scatter'",
              checkboxInput("smooth","Add Trend Line?")
        )
          ),
        column(  width = 6,
                 conditionalPanel("input.plot_type=='scatter'",
        selectInput("colour",label="colour variable",choices=c("None",colnames(quakes))),
        conditionalPanel("input.colour!='None'",
                         selectInput("palette",label="Colour Scheme",
                                     choices = c("Reds"="Reds","Blues"="Blues","Greens"="Greens",
                                                 "Rainbow"="Spectral","Traffic Lights"="RdYlGn"))),
        selectInput("size",label="size variable",c("None",colnames(quakes)))),
        conditionalPanel("input.y!='lat'",selectInput("transform_y",label="transform y variable?",choices=c("No","log"))),
        conditionalPanel("input.plot_type=='scatter' & input.x!='lat'",
                         selectInput("transform_x",label="transform x variable?",choices=c("No","log"))),
        )
        ),
        plotlyOutput("plot1")
),
tabItem(tabName = "create",
        tags$h2("Create new columns"),
        tags$h2("Convert Numeric to Factor"),
        fluidRow(
          column(
            width = 12,
            cut_variable_ui("inline")
          ),
          column(
            width = 12,
            reactableOutput(outputId = "table2")
          )
        )
)
)
)
)


server <- function(input, output, session) {

 # quakes_data <- reactive(quakes)
  vars <- reactive({
NULL
  })
  
  res_filter <- filter_data_server(
    id = "filtering",
    data = reactive(quakes),
    vars = vars,
    widget_num = "slider",
    widget_date = "slider",
    label_na = "Missing"
  )
  
  observeEvent(res_filter$filtered(), {
    updateProgressBar(
      session = session, id = "pbar",
      value = nrow(res_filter$filtered()), total = nrow(quakes))
  })
  
  output$table <- reactable::renderReactable({
    reactable::reactable(res_filter$filtered())
  })

  data_inline_r <- cut_variable_server(
    id = "inline",
    data_r = reactive(res_filter$filtered())
  )
  observeEvent(data_inline_r(), {

res_filter$filtered <- reactive(data_inline_r())




updateSelectInput(session = session,"x",choices=c("None",colnames(data_inline_r())))


updateSelectInput(session = session,"colour",choices=c("None",colnames(data_inline_r())))

updateSelectInput(session = session,"table_var",choices=c(colnames(data_inline_r())))

if(ncol(data_inline_r())==7){
updateSelectInput(session = session,"grp",choices=c("Single Variable"=FALSE,
                                                   "Split by New Group"=TRUE))
}
 output$dataview<-renderDT({
        if(exists("res_filter")){
          res_filter$filtered()
        }else{
          quakes
        }
      })
      
      
  # Show result
  output$table2 <- renderReactable({
 
    data <- req(res_filter$filtered())
    reactable(
      data = data,
      bordered = TRUE,
      compact = TRUE,
      striped = TRUE
    )
  })
  
  
  output$summary_table<-render_gt({
    if(nrow(res_filter$filtered()>0)){
      data<-res_filter$filtered()
    }else{
      data<- quakes
    }
    data$var<-data[,input$table_var]
    
    if(ncol(data)==7 | input$grp==FALSE){
      data$Variable<-input$table_var
      name="Variable"
    }
    else{
      data$Variable<-data[,7]
      name=colnames(data)[7]
      print(name)
    }
 
    
    if(is.numeric(data$var)){
      
    data %>%
        group_by(Variable)%>%
       summarise("Number of Observations"=n(),
                Mean=mean(var)%>%round(1),
                "Standard Deviation"=sd(var)%>%round(1),
                Median=median(var)%>%round(1),
                "Minimum"=min(var)%>%round(1),
                "Maximum"=max(var)%>%round(1)
      )->table_stat
colnames(table_stat)[1]<-name
      
    }
    else{
      data %>%
        group_by(var)%>%
        summarise("Frequency"=n())%>%
        mutate(Percentage=scales::percent(Frequency/sum(Frequency)))->table_stat
    }
    
    gt::gt(table_stat) %>%
      gt::fmt_number()
    
  })

output$plot1<-renderPlotly({
    if(nrow(res_filter$filtered()>0)){
      data<-res_filter$filtered()
    }else{
      data<- quakes
    }
    
    data$None<-1
    data$x<-data[,input$x]
    data$y<-data[,input$y]
    data$colour<-data[,input$colour]
    data$size<-data[,input$size]
   
   
    if(input$plot_type=="scatter"){
      p1<-ggplot(data,aes(x=x,y=y,size=size))+
        {if(input$colour!="None")  geom_point(aes(fill=colour),shape=21,alpha=0.75,stroke=0.5)}+
        {if(input$colour=="None")  geom_point(shape=21,alpha=0.75,stroke=0.5)}+
        scale_size_continuous(range=c(0.25,2))+
        {if(is.numeric(data$colour)) scale_fill_distiller(palette=input$palette,direction=1)}+
        {if(!is.numeric(data$colour)) scale_fill_brewer(palette=input$palette,direction=1)}+
        labs(x=input$x,y=input$y)+
        {if(input$colour!="None")    labs(fill=input$colour)}+
        {if(input$size!="None")    labs(size=input$size)}+
        {if(input$transform_x=="log"& class(data$x)%in%c("numeric","integer")& input$y!="lat" )  scale_x_log10()}+
        {if(input$transform_y=="log" & input$y!="lat" ) scale_y_log10() }
      
      if(input$smooth==TRUE){
        p1<-p1+geom_smooth(aes(x=as.numeric(x),group=1),size=0.5,alpha=0.5,se=FALSE,colour="red")
      }
    }
    
    if(input$plot_type=="histogram"){
      p1<-ggplot(data,aes(x=y))+
           geom_histogram() +
        labs(y=input$x)+
          {if(input$transform_y=="log") scale_x_log10() }
    }
    if(input$plot_type=="density"){
      p1<-ggplot(data,aes(x=y))+
        geom_density() +
        labs(y=input$x)+
        {if(input$transform_y=="log") scale_x_log10() }
    }
    if(input$plot_type=="boxplot"){
      p1<-ggplot(data,aes(x=x,y=y,group=x,colour=colour))+
           geom_boxplot() +
        labs(x=input$x,y=input$y)+
        {if(class(data$colour)=="numeric") scale_colour_distiller(palette=input$palette,direction=1)}+
        {if(class(data$colour)!="numeric") scale_colour_brewer(palette=input$palette,direction=1)}+
        labs(x=input$x,y=input$y)+
        {if(input$colour!="None")    labs(colour=input$colour)}+
        {if(input$size!="None")    labs(size=input$size)}+
        {if(input$transform_y=="log") scale_y_log10() }
      if(input$smooth==TRUE){
        p1<-p1+geom_smooth(aes(x=as.numeric(x),group=1),size=0.5,alpha=0.5,se=FALSE,colour="red")
      }
    }
    if(input$plot_type=="violin"){
      p1<-ggplot(data,aes(x=x,y=y,group=x,colour=colour))+
           geom_violin() +
        labs(x=input$x,y=input$y)+
        {if(class(data$colour)=="numeric") scale_colour_distiller(palette=input$palette,direction=1)}+
        {if(class(data$colour)!="numeric") scale_colour_brewer(palette=input$palette,direction=1)}+
        labs(x=input$x,y=input$y)+
        {if(input$colour!="None")    labs(colour=input$colour)}+
        {if(input$size!="None")    labs(size=input$size)+
            {if(input$transform_y=="log") scale_y_log10() }}
      
      if(input$smooth==TRUE){
        p1<-p1+geom_smooth(aes(x=as.numeric(x),group=1),size=0.5,alpha=0.5,se=FALSE,colour="red")
      }
    }
    if(input$plot_type=="mean_se"){
      p1<-ggplot(data,aes(x=x,y=y,group=x))+
        stat_summary(fun.data=mean_cl_normal,
                     conf.int=0.95) +
        labs(x=input$x,y=input$y)+
        labs(x=input$x,y=input$y)+
        {if(input$colour!="None")    labs(colour=input$colour)}+
        {if(input$size!="None")    labs(size=input$size)+
            {if(input$transform_y=="log") scale_y_log10() }}
      
      if(input$smooth==TRUE){
       # p1<-p1+geom_smooth(aes(x=as.numeric(x),group=1),
        #                   size=0.5,alpha=0.5,se=FALSE,colour="red")
      }
    }
    
    (p1 + 
      theme_light()) %>%
      ggplotly()
    
  })
  
  
  }
  )
  
  
}

shinyApp(ui, server)
