<cfoutput>
<h3>Total Students by Department</h3>

<br />
<table width="100%" border="1px">
	<tr align="center">
		<th>Department</th>
		<th>Undergraduates</th>
		<th>Graduates</th>
		<th>Faculty</th>
		<th>Other</th>
		<th>Total</th>
	</tr>
	<cfloop query="totalStudentsByDepartmentYearLibResults">
	<tr align="center">
		<td>#totalStudentsByDepartmentYearLibResults.department#</td>
		<td>#totalStudentsByDepartmentYearLibResults.undergraduates#</td>
		<td>#totalStudentsByDepartmentYearLibResults.graduates#</td>
		<td>#totalStudentsByDepartmentYearLibResults.faculty#</td>
		<td>#totalStudentsByDepartmentYearLibResults.other#</td>
		<cfset VARIABLES.studentsByDepartmentTotal = 
			#totalStudentsByDepartmentYearLibResults.underGraduates# +
			#totalStudentsByDepartmentYearLibResults.graduates# +
			#totalStudentsByDepartmentYearLibResults.faculty# +
			#totalStudentsByDepartmentYearLibResults.other#					
			/>
		<td>#VARIABLES.studentsByDepartmentTotal#</td>
	</tr>
	</cfloop>
</table>

</cfoutput>