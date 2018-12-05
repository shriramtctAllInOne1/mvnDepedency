<#--
  #%L
  License Maven Plugin
  %%
  Copyright (C) 2012 Codehaus, Tony Chemit
  %%
  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Lesser Public License for more details.
  You should have received a copy of the GNU General Lesser Public
  License along with this program.  If not, see
  <http://www.gnu.org/licenses/lgpl-3.0.html>.
  #L%
  -->
<#-- To render the third-party file.
 Available context :
 - dependencyMap a collection of Map.Entry with
   key are dependencies (as a MavenProject) (from the maven project)
   values are licenses of each dependency (array of string)
 - licenseMap a collection of Map.Entry with
   key are licenses of each dependency (array of string)
   values are all dependencies using this license
-->
<#function licenseFormat licenses>
    <#assign result = ""/>
    <#list licenses as license>
	<#if license?starts_with("The") >
        <#assign result = result + "${license?substring(3)}"/>
	<#else>
	<#assign result = result + "${license}"/>
	</#if>
    </#list>
    <#return result>
</#function>
<#if dependencyMap?size == 0>
The project has no dependencies.
<#else>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script src="FileSaver.js"></script>
<script src="jquery.wordexport.js"></script>
<style type="text/css">
		#table {
    font-family: "Times New Roman", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#table td, #table th {
    border: 1px solid #ddd;
    padding: 2px;
}

#table tr:nth-child(even){background-color: #f2f2f2;}

#table tr:hover {background-color: #ddd;}

#table th {
    padding-top: 3px;
    padding-bottom: 3px;
    text-align: center;
    background-color: #4CAF50;
    color: white;
}
	</style>
</head>
<body onload="sortTable()">
<div id="export-content">
<a class="word-export" href="javascript:void(0)">Download ThirdParty Depedency As Doc</a>
<div id="page-content">
<table id="table">
    <tr>
        <th>Component</th>
        <th>Files</th>
		<th>Version</th>
		<th>URL HOME</th>
		<th id="licence">Licence</th>
		<th>COMMENTS</th>
    </tr>
    <#list dependencyMap as e>
	     <#assign project = e.getKey()/>
        <#assign licenses = e.getValue()/>
        <tr>
            <td>${project.name?capitalize}</td>
			<td>${project.artifactId + "-" + project.version+".jar"}</td>
            <td>${project.version}</td>
			<td>${project.url!"no url defined"}</td>
			<td>${licenseFormat(licenses)}</td>
        </tr>
    </#list>
</table>
</div>
</div>

</body>
<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("table");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch= true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
<script type="text/javascript">

	jQuery(document).ready(function($) {

	$("a.word-export").click(function(event) {

	$("#page-content").wordExport("ThirdPartyDependency");

	});

	});
	</script>
</html>
</#if>

