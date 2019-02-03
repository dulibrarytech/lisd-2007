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
				<cfif totalClassesByDepartmentRecordSet.julyRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.julyResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.augustResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.septemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.octoberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.novemberRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.novemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.decemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.januaryResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.februaryResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.marchResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.aprilResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.mayRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.mayResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByDepartmentRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.juneResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</div>
</cfoutput>


<!---
<table valign="top" width="100%"><!--- outer table --->
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.julyResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.augustResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.septemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.octoberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.novemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.decemberResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.januaryResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.februaryResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.marchResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.aprilResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.mayRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.mayResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByDepartmentRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByDepartmentRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByDepartmentRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByDepartmentRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByDepartmentRecordSet.juneResults.department#</td>
					<td>#totalClassesByDepartmentRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByDepartmentRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
</table><!--- outer table --->
</div>
</cfoutput>
--->