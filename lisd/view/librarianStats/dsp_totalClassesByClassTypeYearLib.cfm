<cfoutput>
<h3>Total Classes by Class Type</h3>

<a href="javascript:collapse10.slidedown()">Open</a> || <a href="javascript:collapse10.slideup()">Close</a>

<div id="totalClassesByClassTypeYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse10=new animatedcollapse("totalClassesByClassTypeYear", 500, false)
</script>
<br />
Total Classes:&nbsp;#classTotalsLibResults.classCount#
<br /><br />
<table width="100%">
	<tr align="center">
		<th width="50%" bgcolor="##FFE271">Class Type</th>
		<th bgcolor="##FFE271">Total</th>
	</tr>
	<cfloop query="TotalClassesByClassTypeYearLibResults">
	<tr align="center">
		<td  bgcolor="##FFF2BF">#totalClassesByClassTypeYearLibResults.classType#</td>
		<td bgcolor="##FFFFEF">#totalClassesByClassTypeYearLibResults.classCount#</td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>