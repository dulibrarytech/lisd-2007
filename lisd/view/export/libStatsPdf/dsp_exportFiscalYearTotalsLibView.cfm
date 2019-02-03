<cfoutput>

<h3>Total Students</h3>

	<table width="100%" border="1px"><!--- width="40%" --->
		<tr align="center">
			<th width="50%">Students</th>
			<th>Total</th>
		</tr>
		<tr align="center">
			<td align="center">Undergraduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.underGraduates#</b></td>
		</tr>
		<tr align="center">
			<td>Graduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.graduates#</b></td>
		</tr>
		<tr align="center">
			<td>Faculty</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.faculty#</b></td>
		</tr>
		<tr align="center">
			<td>Other</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.other#</b></td>
		</tr>
		<tr align="center">
			<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
			<td><b>#fiscalYearLibRecordSet.fiscalYearTotal#</b></td>
		</tr>
	</table> 

</cfoutput>
