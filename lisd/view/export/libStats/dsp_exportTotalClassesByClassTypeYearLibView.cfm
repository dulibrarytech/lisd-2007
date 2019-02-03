<cfoutput>
<h3>Total Classes by Class Type</h3>

<br />
<table width="100%" border="1px">
	<tr align="center">
		<th width="50%">Class Type</th>
		<th>Total</th>
	</tr>
	<cfloop query="TotalClassesByClassTypeYearLibResults">
	<tr align="center">
		<td>#totalClassesByClassTypeYearLibResults.classType#</td>
		<td>#totalClassesByClassTypeYearLibResults.classCount#</td>
	</tr>
	</cfloop>
	<tr>
		<td align="right"><strong><em>Total:</em></strong></td>
		<td align="center">#classTotalsLibResults.classCount#</td>
	</tr>
</table>
</div>
</cfoutput>