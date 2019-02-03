<cfoutput>
<h3>Total Classes By Location</h3>

<br />
<!--->Total Classes:&nbsp;#classTotalsResults.classCount#--->

<table width="100%" border="1px">
	<tr align="center">
		<th width="50%">Location</th>
		<th>Total</th>
	</tr>
	<cfloop query="totalClassesByLocationYearResults">
	<tr align="center">
		<td>#totalClassesByLocationYearResults.location#</td>
		<td>#totalClassesByLocationYearResults.classCount#</td>
	</tr>
	</cfloop>
</table>

</cfoutput>