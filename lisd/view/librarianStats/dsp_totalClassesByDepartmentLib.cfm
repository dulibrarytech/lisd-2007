<cfoutput>
<h3>Total Classes by Department</h3>
<a href="javascript:collapse3.slidedown()">Open</a> || <a href="javascript:collapse3.slideup()">Close</a>

<div id="totalClassesByDepartment" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse3=new animatedcollapse("totalClassesByDepartment", 500, false)
</script>
<br />

			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.julyResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.augustResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.septemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.octoberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.novemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.decemberResults"><!--- f.r. fixed queryname --->
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.decemberResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.januaryResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.februaryResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.marchRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.marchResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.aprilResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.mayRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.mayResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentLibRecordSet.juneRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentLibRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentLibRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentLibRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentLibRecordSet.juneResults.department#</td>
					<td>#totalClassesByDepartmentLibRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentLibRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</div>
</cfoutput>
