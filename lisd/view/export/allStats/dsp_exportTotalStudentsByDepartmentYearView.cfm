<cfoutput>
<h3>Total Students By Department</h3>

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
	<cfloop query="totalStudentsByDepartmentYearResults">
	<tr align="center">
		<td>#totalStudentsByDepartmentYearResults.department#</td>
		<td>#totalStudentsByDepartmentYearResults.undergraduates#</td>
		<td>#totalStudentsByDepartmentYearResults.graduates#</td>
		<td>#totalStudentsByDepartmentYearResults.faculty#</td>
		<td>#totalStudentsByDepartmentYearResults.other#</td>
		<cfset VARIABLES.studentsByDepartmentTotal = 
			#totalStudentsByDepartmentYearResults.underGraduates# +
			#totalStudentsByDepartmentYearResults.graduates# +
			#totalStudentsByDepartmentYearResults.faculty# +
			#totalStudentsByDepartmentYearResults.other#					
			/>
		<td>#VARIABLES.studentsByDepartmentTotal#</td>
	</tr>
	</cfloop>
</table>

</cfoutput>