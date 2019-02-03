<cfoutput>
<h3>Total Classes by Location</h3>
<a href="javascript:collapse4.slidedown()">Open</a> || <a href="javascript:collapse4.slideup()">Close</a>

<div id="totalClassessByLocation" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse4=new animatedcollapse("totalClassessByLocation", 500, false)
</script>
<br />

			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.julyResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.augustResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.septemberResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.octoberResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.novemberResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.decemberResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.januaryResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.februaryResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.marchResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.aprilResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.mayRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.mayResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByLocationLibRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByLocationLibRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByLocationLibRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByLocationLibRecordSet.juneResults.location#</td>
					<td>#totalClassesByLocationLibRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByLocationLibRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</div>
</cfoutput>
