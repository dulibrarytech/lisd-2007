<cfoutput>
<h3>Total Students</h3>

<a href="javascript:collapse1.slidedown()">Open</a> || <a href="javascript:collapse1.slideup()">Close</a>

<div id="totalStudentsByMonth" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse1=new animatedcollapse("totalStudentsByMonth", 500, false)
</script>
<br />
<table width="100%">
	<tr align="center" bgcolor="##FFE271">
		<th>&nbsp;</th>
		<th>#fiscalYearByMonthLibRecordSet.july#</th>
		<th>#fiscalYearByMonthLibRecordSet.august#</th>
		<th>#fiscalYearByMonthLibRecordSet.september#</th>
		<th>#fiscalYearByMonthLibRecordSet.october#</th>
		<th>#fiscalYearByMonthLibRecordSet.november#</th>
		<th>#fiscalYearByMonthLibRecordSet.december#</th>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Undergraduates:</td>
		<td>#fiscalYearByMonthLibRecordSet.julyResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.augustResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.septemberResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.octoberResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.novemberResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.decemberResults.underGraduates#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Graduates:</td>
		<td>#fiscalYearByMonthLibRecordSet.julyResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.augustResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.septemberResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.octoberResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.novemberResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.decemberResults.graduates#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Faculty:</td>
		<td>#fiscalYearByMonthLibRecordSet.julyResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.augustResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.septemberResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.octoberResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.novemberResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.decemberResults.faculty#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Other:</td>
		<td>#fiscalYearByMonthLibRecordSet.julyResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.augustResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.septemberResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.octoberResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.novemberResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.decemberResults.other#</td>
	</tr>
	<tr align="center" bgcolor="##FFFFEF">
		<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
		<td>#fiscalYearByMonthLibRecordSet.julyTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.augustTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.septemberTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.octoberTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.novemberTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.decemberTotal#</td>
	</tr>
	<!--- second 6 months begins --->
	<tr align="center" bgcolor="##FFE271">
		<th>&nbsp;</th>
		<th>#fiscalYearByMonthLibRecordSet.january#</th>
		<th>#fiscalYearByMonthLibRecordSet.february#</th>
		<th>#fiscalYearByMonthLibRecordSet.march#</th>
		<th>#fiscalYearByMonthLibRecordSet.april#</th>
		<th>#fiscalYearByMonthLibRecordSet.may#</th>
		<th>#fiscalYearByMonthLibRecordSet.june#</th>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Undergraduates</td>
		<td>#fiscalYearByMonthLibRecordSet.januaryResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.februaryResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.marchResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.aprilResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.mayResults.underGraduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.juneResults.underGraduates#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Graduates:</td>
		<td>#fiscalYearByMonthLibRecordSet.januaryResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.februaryResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.marchResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.aprilResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.mayResults.graduates#</td>
		<td>#fiscalYearByMonthLibRecordSet.juneResults.graduates#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Faculty:</td>
		<td>#fiscalYearByMonthLibRecordSet.januaryResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.februaryResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.marchResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.aprilResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.mayResults.faculty#</td>
		<td>#fiscalYearByMonthLibRecordSet.juneResults.faculty#</td>
	</tr>
	<tr align="center" bgcolor="##FFF2BF">
		<td>Other:</td>
		<td>#fiscalYearByMonthLibRecordSet.januaryResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.februaryResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.marchResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.aprilResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.mayResults.other#</td>
		<td>#fiscalYearByMonthLibRecordSet.juneResults.other#</td>
	</tr>
	<tr align="center" bgcolor="##FFFFEF">
		<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
		<td>#fiscalYearByMonthLibRecordSet.januaryTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.februaryTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.marchTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.aprilTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.mayTotal#</td>
		<td>#fiscalYearByMonthLibRecordSet.juneTotal#</td>
	</tr>
</table>
</div>
</cfoutput>