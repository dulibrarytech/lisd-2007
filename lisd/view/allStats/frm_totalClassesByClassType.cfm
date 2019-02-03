<h3>Number of classes each month/year by Class Type</h3>
<br />
<form name="getTotalClassesByClassTypeResults" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
	<b>Enter Year Range:</b>&nbsp;&nbsp;
	<input name="selectedClassDateStart" type="text" value="2007" size="5" />&nbsp;&nbsp;
	<input name="selectedClassDateEnd" type="text" value="2008" size="5" />&nbsp;&nbsp;
	<input name="getTotalClassByClassType" type="submit" value="Get Data" />
	&nbsp;<em>ex. 2007, 2008</em><br />
	<br /><br /><br />
</form>

<cfif IsDefined("FORM.getTotalClassByClassType")>
	<cfscript>
		// get data to populate department drop down 
		totalClassesByClassTypeRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByClassType(2007, 2008);
	</cfscript>
	
	<h4>Total classes for current fiscal year:&nbsp;<b>#totalClassesByClassTypeRecordSet.yearTotal#</b></h4><br />

			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.julyRecordCount EQ 0>
					No stats available for #totalClassesByClassTypeRecordSet.july#.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.july#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.julyResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.augustRecordCount EQ 0>
					No stats available for #totalClassesByClassTypeRecordSet.august#.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.august#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.augustResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.septemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.september#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.september#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.octoberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.october#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.october#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.novemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.november#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.november#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.decemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.december#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.december#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.januaryRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.january#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.january#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.februaryRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.february#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.february#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.marchRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.march#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.march#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.marchResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.aprilRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.april#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.april#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.mayRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.may#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.may#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.mayResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.juneRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.june#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th width="50%">#totalClassesByClassTypeRecordSet.june#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.juneResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		
</cfif>	

<!---
<table width="100%"><!--- outer table --->
	<tr valign="top">
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.julyRecordCount EQ 0>
					No stats available for #totalClassesByClassTypeRecordSet.july#.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.july#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.julyResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.julyResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.julyTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.augustRecordCount EQ 0>
					No stats available for #totalClassesByClassTypeRecordSet.august#.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.august#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.augustResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.augustResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.augustTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.septemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.september#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.september#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.septemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.septemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.octoberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.october#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.october#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.octoberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.octoberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.novemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.november#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.november#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.novemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.novemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.decemberRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.december#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.december#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.decemberResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.decemberTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.januaryRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.january#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.january#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.januaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.januaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.februaryRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.february#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.february#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.februaryResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.februaryTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.marchRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.march#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.march#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.marchResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.marchResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.marchTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.aprilRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.april#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.april#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.aprilResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.aprilTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.mayRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.may#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.may#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.mayResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.mayResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.mayTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
		<td>
			<table><!--- inner table --->
				<cfif totalClassesByClassTypeRecordSet.juneRecordCount EQ 0>
					No stats available for <b>#totalClassesByClassTypeRecordSet.june#</b>.
				<cfelse>
				<tr align="center" bgcolor="##FFE271">
					<th>#totalClassesByClassTypeRecordSet.june#</th>
					<th>&nbsp;</th>
				</tr>
				<cfloop query="totalClassesByClassTypeRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalClassesByClassTypeRecordSet.juneResults.classType#</td>
					<td>#totalClassesByClassTypeRecordSet.juneResults.classCount#</td>
				</tr>
				</cfloop>
				<tr bgcolor="##FFFFEF">
					<td align="right"><b><em>Total</em></b>:</td>
					<td>#totalClassesByClassTypeRecordSet.juneTotal#</td>
				</tr>
				</cfif>
			</table>
		</td>
	</tr>
</table><!--- outer table --->
</cfif>	
--->