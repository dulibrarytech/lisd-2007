<cfoutput>
<h3>Total Classes By Department</h3>
<a href="javascript:collapse8.slidedown()">Open</a> || <a href="javascript:collapse8.slideup()">Close</a>

<div id="totalClassesByDepartmentYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse8=new animatedcollapse("totalClassesByDepartmentYear", 500, false)
</script>
<br />
Total Classes:&nbsp;#classTotalsResults.classCount#
<br /><br />
<table width="100%">
	<tr align="center" bgcolor="##FFE271">
		<th width="50%">Department</th>
		<th>Total</th>
	</tr>
	<cfloop query="TotalClassesByDepartmentYearResults">
	<tr align="center" bgcolor="##FFF2BF">
		<td bgcolor="##FFF2BF">#TotalClassesByDepartmentYearResults.department#</td>
		<td bgcolor="##FFFFEF">#TotalClassesByDepartmentYearResults.classCount#</td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>