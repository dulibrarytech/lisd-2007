<cfoutput>
<h3>Total Classes By Location</h3>

<br />

			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.julyRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.july#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.julyResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.julyResults.location#</td>
					<td>#totalClassesByLocationRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.augustRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.august#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.augustResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.augustResults.location#</td>
					<td>#totalClassesByLocationRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.septemberRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.september#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.septemberResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.septemberResults.location#</td>
					<td>#totalClassesByLocationRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.octoberRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.october#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.octoberResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.octoberResults.location#</td>
					<td>#totalClassesByLocationRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.novemberRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.november#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.novemberResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.novemberResults.location#</td>
					<td>#totalClassesByLocationRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.decemberRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.december#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.december#</th>
					<th>Class Count;</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.decemberResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.decemberResults.location#</td>
					<td>#totalClassesByLocationRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.januaryRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.january#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.januaryResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.januaryResults.location#</td>
					<td>#totalClassesByLocationRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.februaryRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.february#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.februaryResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.februaryResults.location#</td>
					<td>#totalClassesByLocationRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.marchRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.march#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.marchResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.marchResults.location#</td>
					<td>#totalClassesByLocationRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.aprilRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.april#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.aprilResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.aprilResults.location#</td>
					<td>#totalClassesByLocationRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.mayRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.may#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.mayResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.mayResults.location#</td>
					<td>#totalClassesByLocationRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%" border="1px"><!--- inner table --->
				<cfif totalClassesByLocationRecordSet.juneRecordCount EQ 0>
					<!---
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationRecordSet.june#</td></tr>
					--->
				<cfelse>
				<tr align="center">
					<th width="50%">#totalClassesByLocationRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationRecordSet.juneResults">
				<tr align="center">
					<td>#totalClassesByLocationRecordSet.juneResults.location#</td>
					<td>#totalClassesByLocationRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>

</cfoutput>
