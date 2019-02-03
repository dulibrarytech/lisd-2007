<cfoutput>
<h3>Total Classes By Department</h3>

<br />
<!---Total Classes:&nbsp;#classTotalsResults.classCount#--->
<table width="100%" border="1px">
	<tr align="center">
		<th width="50%">Department</th>
		<th>Total</th>
	</tr>
	<cfloop query="TotalClassesByDepartmentYearResults">
	<tr align="center">
		<td>#TotalClassesByDepartmentYearResults.department#</td>
		<td>#TotalClassesByDepartmentYearResults.classCount#</td>
	</tr>
	</cfloop>
	<tr>
		<td align="right"><strong><em>Total:</em></strong></td>
		<td align="center">#classTotalsResults.classCount#</td>
	</tr>
</table>

</cfoutput>