<cfoutput>
<h3>Total Students By Department</h3>
<a href="javascript:collapse2.slidedown()">Open</a> || <a href="javascript:collapse2.slideup()">Close</a>

<div id="totalStudentsByDepartment" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse2=new animatedcollapse("totalStudentsByDepartment", 500, false)
</script>
<br />

		<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.julyRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.july#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.julyResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.julyResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.otherCount#</td>
					<cfset VARIABLES.julyDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.julyResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.julyDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.augustRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.august#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.augustResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.augustResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.otherCount#</td>
					<cfset VARIABLES.augustDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.augustResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.augustDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.septemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.september#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.septemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.otherCount#</td>
					<cfset VARIABLES.septemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.septemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.septemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.octoberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.october#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.octoberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.otherCount#</td>
					<cfset VARIABLES.octoberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.octoberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.octoberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.novemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.november#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.novemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.otherCount#</td>
					<cfset VARIABLES.novemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.novemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.novemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.decemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.december#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.decemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.otherCount#</td>
					<cfset VARIABLES.decemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.decemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.decemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.januaryRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.january#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.januaryResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.otherCount#</td>
					<cfset VARIABLES.januaryDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.januaryResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.januaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.februaryRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.february#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.februaryResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.otherCount#</td>
					<cfset VARIABLES.februaryDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.februaryResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.februaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.marchRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.march#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.marchResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.marchResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.otherCount#</td>
					<cfset VARIABLES.marchDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.marchResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.marchDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.aprilRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.april#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.aprilResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.otherCount#</td>
					<cfset VARIABLES.aprilDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.aprilResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.aprilDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.mayRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.may#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.mayResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.mayResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.otherCount#</td>
					<cfset VARIABLES.mayDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.mayResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.mayDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.juneRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentRecordSet.june#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.juneResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.juneResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.otherCount#</td>
					<cfset VARIABLES.juneDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.juneResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.juneDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		
</div>
</cfoutput>



<!--->
<table width="100%"><!--- outer table --->
	<tr valign="top">
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.julyRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.july#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.julyResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.julyResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.julyResults.otherCount#</td>
					<cfset VARIABLES.julyDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.julyResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.julyResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.julyDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.augustRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.august#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.augustResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.augustResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.augustResults.otherCount#</td>
					<cfset VARIABLES.augustDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.augustResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.augustResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.augustDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		</tr>
		<tr>		
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.septemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.september#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.septemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.septemberResults.otherCount#</td>
					<cfset VARIABLES.septemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.septemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.septemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.septemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.octoberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.october#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.octoberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.octoberResults.otherCount#</td>
					<cfset VARIABLES.octoberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.octoberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.octoberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.octoberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		</tr>
		<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.novemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.november#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.novemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.novemberResults.otherCount#</td>
					<cfset VARIABLES.novemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.novemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.novemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.novemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.decemberRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.december#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.decemberResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.decemberResults.otherCount#</td>
					<cfset VARIABLES.decemberDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.decemberResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.decemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.decemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.januaryRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.january#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.januaryResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.januaryResults.otherCount#</td>
					<cfset VARIABLES.januaryDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.januaryResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.januaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.januaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.februaryRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.february#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.februaryResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.februaryResults.otherCount#</td>
					<cfset VARIABLES.februaryDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.februaryResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.februaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.februaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.marchRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.march#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.marchResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.marchResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.marchResults.otherCount#</td>
					<cfset VARIABLES.marchDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.marchResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.marchResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.marchDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.aprilRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.april#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.aprilResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.aprilResults.otherCount#</td>
					<cfset VARIABLES.aprilDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.aprilResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.aprilResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.aprilDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.mayRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.may#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.mayResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.mayResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.mayResults.otherCount#</td>
					<cfset VARIABLES.mayDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.mayResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.mayResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.mayDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
		<td valign="top">
			<table><!--- inner table --->
				<cfif totalStudentsByDepartmentRecordSet.juneRecordCount NEQ 0>
				<tr valign="top" align="center" bgcolor="##FFE271">
					<th>#totalStudentsByDepartmentRecordSet.june#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentRecordSet.juneResults">
				<tr valign="top" align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentRecordSet.juneResults.department#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentRecordSet.juneResults.otherCount#</td>
					<cfset VARIABLES.juneDepartmentTotal = 
					#totalStudentsByDepartmentRecordSet.juneResults.underGraduateCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.graduateCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.facultyCount# +
					#totalStudentsByDepartmentRecordSet.juneResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.juneDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		</td>
	</tr>
</table><!--- outer table --->
</div> 

---->