<cfoutput>
<h3>Total Classes by Class Type</h3>
<a href="javascript:collapse5.slidedown()">Open</a> || <a href="javascript:collapse5.slideup()">Close</a>

<div id="totalClassesByClassType" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse5=new animatedcollapse("totalClassesByClassType", 500, false)
</script>
<br />

			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.julyResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.augustResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.septemberResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.octoberResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.novemberResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.decemberResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.januaryResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.februaryResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.marchResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.aprilResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.mayRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.mayResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeLibRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByClassTypeLibRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeLibRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeLibRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeLibRecordSet.juneResults.classType#</td>
					<td>#totalClassesByClassTypeLibRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
					<td align="center">#totalClassesByClassTypeLibRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</div>
</cfoutput>
