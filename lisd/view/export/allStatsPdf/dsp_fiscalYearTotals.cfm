<cfoutput>
<h3>Student Totals</h3>
<a href="javascript:collapse6.slidedown()">Open</a> || <a href="javascript:collapse6.slideup()">Close</a>

<div id="totalStudentsByYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse6=new animatedcollapse("totalStudentsByYear", 500, false)
</script>
<br />
	<table width="100%">
		<tr align="center" bgcolor="##FFE373">
			<th width="50%">Students</th>
			<th>Totals</th>
		</tr>
		<tr align="center" bgcolor="##FFF3BD">
			<td align="center">Undergraduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.underGraduates#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF3BD">
			<td>Graduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.graduates#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF3BD">
			<td>Faculty</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.faculty#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF3BD">
			<td>Other</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearRecordSet.fiscalYearResults.other#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFFFEF">
			<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
			<td><b>#fiscalYearRecordSet.fiscalYearTotal#</b></td>
		</tr>
	</table> 
</div>
</cfoutput>