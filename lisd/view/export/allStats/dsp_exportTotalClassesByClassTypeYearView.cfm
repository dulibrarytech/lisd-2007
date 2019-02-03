<cfoutput>
<h3>Total Classes By Class Type</h3>

<br />
<!---Total Classes:&nbsp;#classTotalsResults.classCount# --->

<table width="100%" border="1px">
	<tr align="center">
		<th width="50%">Class Type</th>
		<th>Total</th>
	</tr>
	<cfloop query="TotalClassesByClassTypeYearResults">
	<tr align="center">
		<td>#totalClassesByClassTypeYearResults.classType#</td>
		<td>#totalClassesByClassTypeYearResults.classCount#</td>
	</tr>
	</cfloop>
</table>

</cfoutput>