<cfoutput>
<h3>Total Students by Department</h3>
<a href="javascript:collapse2.slidedown()">Open</a> || <a href="javascript:collapse2.slideup()">Close</a>

<div id="totalStudentsByDepartment" style="width: 820px;">
<script type="text/javascript">
	//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase), [initialstate] )
	var collapse2=new animatedcollapse("totalStudentsByDepartment", 500, false)
</script>
<br />

			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.julyRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.july#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.julyResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.julyResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.julyResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.julyResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.julyResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.julyResults.otherCount#</td>
					<cfset VARIABLES.julyDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.julyResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.julyResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.julyResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.julyResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.julyDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.augustRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.august#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.augustResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.augustResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.augustResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.augustResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.augustResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.augustResults.otherCount#</td>
					<cfset VARIABLES.augustDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.augustResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.augustResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.augustResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.augustResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.augustDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.septemberRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.september#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.septemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.septemberResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.septemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.septemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.septemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.septemberResults.otherCount#</td>
					<cfset VARIABLES.septemberDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.septemberResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.septemberResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.septemberResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.septemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.septemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.octoberRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.october#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.octoberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.octoberResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.octoberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.octoberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.octoberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.octoberResults.otherCount#</td>
					<cfset VARIABLES.octoberDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.octoberResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.octoberResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.octoberResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.octoberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.octoberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.novemberRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.november#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.novemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.novemberResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.novemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.novemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.novemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.novemberResults.otherCount#</td>
					<cfset VARIABLES.novemberDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.novemberResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.novemberResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.novemberResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.novemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.novemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.decemberRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.december#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.decemberResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.decemberResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.decemberResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.decemberResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.decemberResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.decemberResults.otherCount#</td>
					<cfset VARIABLES.decemberDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.decemberResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.decemberResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.decemberResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.decemberResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.decemberDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.januaryRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.january#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.januaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.januaryResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.januaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.januaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.januaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.januaryResults.otherCount#</td>
					<cfset VARIABLES.januaryDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.januaryResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.januaryResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.januaryResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.januaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.januaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.februaryRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.february#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.februaryResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.februaryResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.februaryResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.februaryResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.februaryResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.februaryResults.otherCount#</td>
					<cfset VARIABLES.februaryDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.februaryResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.februaryResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.februaryResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.februaryResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.februaryDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.marchRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.march#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.marchResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.marchResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.marchResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.marchResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.marchResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.marchResults.otherCount#</td>
					<cfset VARIABLES.marchDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.marchResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.marchResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.marchResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.marchResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.marchDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.aprilRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.april#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.aprilResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.aprilResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.aprilResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.aprilResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.aprilResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.aprilResults.otherCount#</td>
					<cfset VARIABLES.aprilDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.aprilResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.aprilResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.aprilResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.aprilResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.aprilDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.mayRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.may#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.mayResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.mayResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.mayResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.mayResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.mayResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.mayResults.otherCount#</td>
					<cfset VARIABLES.mayDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.mayResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.mayResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.mayResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.mayResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.mayDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
			<br />
			<table width="100%"><!--- inner table --->
				<cfif totalStudentsByDepartmentLibRecordSet.juneRecordCount NEQ 0>
				<tr align="center" bgcolor="##FFE271">
					<th width="35%">#totalStudentsByDepartmentLibRecordSet.june#</th>
					<th>Undergraduates</th>
					<th>Graduates</th>
					<th>faculty</th>
					<th>Other</th>
					<th bgcolor="##FFFFEF">Total</th>
				</tr>
				<cfloop query="totalStudentsByDepartmentLibRecordSet.juneResults">
				<tr align="center" bgcolor="##FFF2BF">
					<td>#totalStudentsByDepartmentLibRecordSet.juneResults.department#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.juneResults.underGraduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.juneResults.graduateCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.juneResults.facultyCount#</td>
					<td>#totalStudentsByDepartmentLibRecordSet.juneResults.otherCount#</td>
					<cfset VARIABLES.juneDepartmentTotal = 
					#totalStudentsByDepartmentLibRecordSet.juneResults.underGraduateCount# +
					#totalStudentsByDepartmentLibRecordSet.juneResults.graduateCount# +
					#totalStudentsByDepartmentLibRecordSet.juneResults.facultyCount# +
					#totalStudentsByDepartmentLibRecordSet.juneResults.otherCount#					
					/>
					<td bgcolor="##FFFFEF">#VARIABLES.juneDepartmentTotal#</td>
				</tr>
				</cfloop>
				</cfif>
			</table>
		
</div>
</cfoutput>
