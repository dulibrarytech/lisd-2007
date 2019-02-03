<cfoutput>
<h3>Total Classes By Location</h3>

<a href="javascript:collapse9.slidedown()">Open</a> || <a href="javascript:collapse9.slideup()">Close</a>

<div id="totalClassesByLocationYear" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse9=new animatedcollapse("totalClassesByLocationYear", 500, false)
</script>
<br />
Total Classes:&nbsp;#classTotalsResults.classCount#
<br /><br />
<table width="100%">
	<tr align="center">
		<th width="50%" bgcolor="##FFE271">Location</th>
		<th bgcolor="##FFE271">Total</th>
	</tr>
	<cfloop query="totalClassesByLocationYearResults">
	<tr align="center">
		<td  bgcolor="##FFF2BF">#totalClassesByLocationYearResults.location#</td>
		<td bgcolor="##FFFFEF">#totalClassesByLocationYearResults.classCount#</td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>