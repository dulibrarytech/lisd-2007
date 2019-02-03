<cfoutput>

<h3>Total Students</h3>

<a href="javascript:collapse6.slidedown()">Open</a> || <a href="javascript:collapse6.slideup()">Close</a>

<div id="totalStudentsByYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse6=new animatedcollapse("totalStudentsByYear", 500, false)
</script>
<br />
	<table width="100%">
		<tr align="center" bgcolor="##FFE271">
			<th width="50%">Students</th>
			<th>Total</th>
		</tr>
		<tr align="center" bgcolor="##FFF2BF">
			<td align="center">Undergraduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.underGraduates#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF2BF">
			<td>Graduates</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.graduates#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF2BF">
			<td>Faculty</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.faculty#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFF2BF">
			<td>Other</td>
			<td>&nbsp;&nbsp;<b>#fiscalYearLibRecordSet.fiscalYearResults.other#</b></td>
		</tr>
		<tr align="center" bgcolor="##FFFFEF">
			<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
			<td><b>#fiscalYearLibRecordSet.fiscalYearTotal#</b></td>
		</tr>
	</table> 
</div>
</cfoutput>