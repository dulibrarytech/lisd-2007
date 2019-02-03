<cfoutput>
<h3>Total Students by Department</h3>

<a href="javascript:collapse7.slidedown()">Open</a> || <a href="javascript:collapse7.slideup()">Close</a>

<div id="totalStudentsByDepartmentYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse7=new animatedcollapse("totalStudentsByDepartmentYear", 500, false)
</script>
<br />
<table width="100%">
	<tr align="center">
		<th bgcolor="##FFE271">Department</th>
		<th bgcolor="##FFE271">Undergraduates</th>
		<th bgcolor="##FFE271">Graduates</th>
		<th bgcolor="##FFE271">Faculty</th>
		<th bgcolor="##FFE271">Other</th>
		<th bgcolor="##FFE271">Total</th>
	</tr>
	<cfloop query="totalStudentsByDepartmentYearLibResults">
	<tr align="center">
		<td bgcolor="##FFF2BF">#totalStudentsByDepartmentYearLibResults.department#</td>
		<td bgcolor="##FFF2BF">#totalStudentsByDepartmentYearLibResults.undergraduates#</td>
		<td bgcolor="##FFF2BF">#totalStudentsByDepartmentYearLibResults.graduates#</td>
		<td bgcolor="##FFF2BF">#totalStudentsByDepartmentYearLibResults.faculty#</td>
		<td bgcolor="##FFF2BF">#totalStudentsByDepartmentYearLibResults.other#</td>
		<cfset VARIABLES.studentsByDepartmentTotal = 
			#totalStudentsByDepartmentYearLibResults.underGraduates# +
			#totalStudentsByDepartmentYearLibResults.graduates# +
			#totalStudentsByDepartmentYearLibResults.faculty# +
			#totalStudentsByDepartmentYearLibResults.other#					
			/>
		<td bgcolor="##FFFFEF">#VARIABLES.studentsByDepartmentTotal#</td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>