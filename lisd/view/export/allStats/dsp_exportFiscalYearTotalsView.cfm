<cfoutput>
<h3>Student Totals</h3>

<br />
	<table width="100%" border="1px">
		<tr align="center">
			<th width="50%">Students</th>
			<th>Totals</th>
		</tr>
		<tr align="center">
			<td align="center">Undergraduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.underGraduates#</b></td>
		</tr>
		<tr align="center">
			<td>Graduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.graduates#</b></td>
		</tr>
		<tr align="center">
			<td>Faculty</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.faculty#</b></td>
		</tr>
		<tr align="center">
			<td>Other</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.other#</b></td>
		</tr>
		<tr align="center">
			<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
			<td><b>#fiscalYearRecordSet.fiscalYearTotal#</b></td>
		</tr>
	</table> 

</cfoutput>