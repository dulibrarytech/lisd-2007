<cfoutput>
<h3>Total Classes by Department</h3>

<br />
	
	<cfif totalClassesByDepartmentLibRecordSet.julyRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.july#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.julyResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.julyResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.julyTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
		</cfif>
		
			<br />
		
		<cfif totalClassesByDepartmentLibRecordSet.augustRecordCount NEQ 0>
		
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.august#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.augustResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.augustResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.augustTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.septemberRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.september#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.septemberResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.septemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.septemberTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.octoberRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.october#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.octoberResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.octoberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.octoberTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.novemberRecordCount EQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.november#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.novemberResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.novemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.novemberTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.decemberRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.december#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.decemberResults"><!--- f.r. fixed queryname --->
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.decemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.decemberTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.januaryRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.january#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.januaryResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.januaryResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.januaryTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.februaryRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.february#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.februaryResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.februaryResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.februaryTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.marchRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.marchRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.march#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.marchResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.marchResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.marchTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.aprilRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.april#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.aprilResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.aprilResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.aprilTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.mayRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.mayRecordCount EQ 0>
					<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.may#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.mayResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.mayResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.mayTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
			<br />
			<cfif totalClassesByDepartmentLibRecordSet.juneRecordCount NEQ 0>
			<table width="100%" border="1px"><!--- inner table --->
				<!---<cfif totalClassesByDepartmentLibRecordSet.juneRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.june#</td></tr>
				<cfelse>--->
				<tr align="center">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.juneResults">
				<tr align="center">
					<td>#totalClassesByDepartmentLibRecordSet.juneResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr>
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.juneTotal#</td>
				</tr>
				<!---</cfif>--->
			</table>
			</cfif>
		
</cfoutput>
