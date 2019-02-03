<cfoutput>
<h3>Total Classes By Class Type</h3>
<a href="javascript:collapse5.slidedown()">Open</a> || <a href="javascript:collapse5.slideup()">Close</a>

<div id="totalClassesByClassType" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse5=new animatedcollapse("totalClassesByClassType", 500, false)
</script>
<br />


			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.julyResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.augustResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.marchResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.mayRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.mayResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th width="50%">#totalClassesByClassTypeRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.juneResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
					<td align="center">#totalClassesByClassTypeRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</div>
</cfoutput>


<!---
<table width="100%"><!--- outer table --->
	<tr valign="top">
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.julyRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.july#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.july#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.julyResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.augustRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.august#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.august#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.augustResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.septemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.september#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.september#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.octoberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.october#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.october#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.novemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.november#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.november#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.decemberRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.december#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.december#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.januaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.january#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.january#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.februaryRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.february#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.february#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.marchRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.march#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.march#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.marchResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.aprilRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.april#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.april#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.mayRecordCount EQ 0>
					<tr align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.may#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.may#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.mayResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td align="center">#totalClassesByClassTypeRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.juneRecordCount EQ 0>
					<tr  align="center" bgcolor="##FFE373"><td>No stats available for #totalClassesByClassTypeRecordSet.june#</td></tr>
				<cfelse>
				<tr align="center" bgcolor="##FFE373">
					<th>#totalClassesByClassTypeRecordSet.june#</th>
					<th>Class Count</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.juneResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
					<td align="center">#totalClassesByClassTypeRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
</table><!--- outer table --->
</div>
</cfoutput>
--->