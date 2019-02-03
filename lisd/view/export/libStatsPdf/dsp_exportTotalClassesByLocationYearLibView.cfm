<cfoutput>
<h3>Total Classes by Location</h3>

<br />
<table width="100%" border="1px">
	<tr align="center">
		<th width="50%">Location</th>
		<th>Total</th>
	</tr>
	<cfloop query="totalClassesByLocationYearLibResults">
	<tr align="center">
		<td>#totalClassesByLocationYearLibResults.location#</td>
		<td>#totalClassesByLocationYearLibResults.classCount#</td>
	</tr>
	</cfloop>
	<tr align="center">
		<td align="right"><strong><em>Total:</em></strong></td>
		<td>#classTotalsLibResults.classCount#</td>
	</tr>
</table>

</cfoutput>