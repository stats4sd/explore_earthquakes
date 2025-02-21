
 html1<- HTML("<p>Now it's time for you to start exploring some data to see what you can find. The dataset we will be using concerns earthquakes observed in an area around Fiji since 1964, obtained from Harvard University Department of Geophysics. A summary of the variables is below:</p>
<div id='efduhejhal' style='padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;'>
<style>#efduhejhal table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#efduhejhal thead, #efduhejhal tbody, #efduhejhal tfoot, #efduhejhal tr, #efduhejhal td, #efduhejhal th {
  border-style: none;
}

#efduhejhal p {
  margin: 0;
  padding: 0;
}

#efduhejhal .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#efduhejhal .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#efduhejhal .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#efduhejhal .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#efduhejhal .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#efduhejhal .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#efduhejhal .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#efduhejhal .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#efduhejhal .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#efduhejhal .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#efduhejhal .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#efduhejhal .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#efduhejhal .gt_spanner_row {
  border-bottom-style: hidden;
}

#efduhejhal .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#efduhejhal .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#efduhejhal .gt_from_md > :first-child {
  margin-top: 0;
}

#efduhejhal .gt_from_md > :last-child {
  margin-bottom: 0;
}

#efduhejhal .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#efduhejhal .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#efduhejhal .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#efduhejhal .gt_row_group_first td {
  border-top-width: 2px;
}

#efduhejhal .gt_row_group_first th {
  border-top-width: 2px;
}

#efduhejhal .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#efduhejhal .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#efduhejhal .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#efduhejhal .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#efduhejhal .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#efduhejhal .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#efduhejhal .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#efduhejhal .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#efduhejhal .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#efduhejhal .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#efduhejhal .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#efduhejhal .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#efduhejhal .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#efduhejhal .gt_left {
  text-align: left;
}

#efduhejhal .gt_center {
  text-align: center;
}

#efduhejhal .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#efduhejhal .gt_font_normal {
  font-weight: normal;
}

#efduhejhal .gt_font_bold {
  font-weight: bold;
}

#efduhejhal .gt_font_italic {
  font-style: italic;
}

#efduhejhal .gt_super {
  font-size: 65%;
}

#efduhejhal .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#efduhejhal .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#efduhejhal .gt_indent_1 {
  text-indent: 5px;
}

#efduhejhal .gt_indent_2 {
  text-indent: 10px;
}

#efduhejhal .gt_indent_3 {
  text-indent: 15px;
}

#efduhejhal .gt_indent_4 {
  text-indent: 20px;
}

#efduhejhal .gt_indent_5 {
  text-indent: 25px;
}

#efduhejhal .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#efduhejhal div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class='gt_table' data-quarto-disable-processing='false' data-quarto-bootstrap='false'>
  <thead>
    <tr class='gt_col_headings'>
      <th class='gt_col_heading gt_columns_bottom_border gt_left' rowspan='1' colspan='1' scope='col' id='column'>column</th>
      <th class='gt_col_heading gt_columns_bottom_border gt_left' rowspan='1' colspan='1' scope='col' id='details'>details</th>
      <th class='gt_col_heading gt_columns_bottom_border gt_left' rowspan='1' colspan='1' scope='col' id='type'>type</th>
    </tr>
  </thead>
  <tbody class='gt_table_body'>
    <tr><td headers='column' class='gt_row gt_left'>lat</td>
<td headers='details' class='gt_row gt_left'>Latitude of earthquake</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
    <tr><td headers='column' class='gt_row gt_left'>long</td>
<td headers='details' class='gt_row gt_left'>Longitude of earthquake</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
    <tr><td headers='column' class='gt_row gt_left'>depth</td>
<td headers='details' class='gt_row gt_left'>Depth (km)</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
    <tr><td headers='column' class='gt_row gt_left'>mag</td>
<td headers='details' class='gt_row gt_left'>Richter Scale Magnitude</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
    <tr><td headers='column' class='gt_row gt_left'>stations</td>
<td headers='details' class='gt_row gt_left'>Number of stations reporting the earthquake</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
    <tr><td headers='column' class='gt_row gt_left'>order</td>
<td headers='details' class='gt_row gt_left'>Order in which the earthquakes occurred</td>
<td headers='type' class='gt_row gt_left'>numeric</td></tr>
  </tbody>
  
  
</table>
</div>
<p>You can access the raw data here: <a href='https://raw.githubusercontent.com/stats4sd/explore_earthquakes/refs/heads/dev/quakes.csv' class='uri'>https://raw.githubusercontent.com/stats4sd/explore_earthquakes/refs/heads/dev/quakes.csv</a></p>

<p>This interactive tool has a limited set of functionality, to cover some of the key tasks that you might need:</p>
<ul>
<li>View the data<br>
<li>Produce summary statistics of each variable, or split by categories created in the 'Categorise' menu<br>
<li>Visualise the data in various different ways<br>
<li>Filter the data, to produce different subsets. The results of the filter will then be applied to each of the other menus<br>
<li>Categorise variables into new variables - e.g. create groups based on latitude/longitude/order to allow exploration in different ways within the other menus. The 'fixed' option allows you to specify exactly the groups, or you can experiment with any of the other built in methods. Note that you can only create one categorised variable at a time. <br>
</ul>
<br>

<p>Try to recreate what you have been able to produce using the interactive app, and then to keep exploring further beyond those pre-built capabilities!</p>
<p>You are welcome to explore the data in whatever way you see fit; depending on what you might find interesting or what patterns you start to uncover.</p>
<p>But to help guide your explorations, here are some questions that a researcher might have when getting started with a project based on this data:</p>
<ul>
<li>Does the structure of the data make sense, and does it match what would be expected from the description above?</li>
<li>Are there certain properties of the data that are unexpected or might be problematic?<br>
</li>
<li>How could the distribution of the 'magnitude' and 'depth' variables be described?</li>
<li>How commonly observed are earthquakes that would be classified as “moderate” (5-6 magnitude on the Richter scale) or “strong” (6 and above)?</li>
<li>Are the depth or number of stations variables correlated with the magnitude of the earthquakes? How would you describe these relationships?</li>
<li>Are there any trends in the magnitude, the depth, or the number of stations reporting each earthquake over time?</li>
<li>Are there any patterns in the locations of the earthquakes over space, and does the magnitude, depth or number of stations reporting vary according to the locations?</li>
</ul>")