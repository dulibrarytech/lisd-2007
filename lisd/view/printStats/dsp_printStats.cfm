<cfsilent>
	<!--- FORM VALIDATION --->
	<cfscript>
		//validates FORM values
		validate = APPLICATION.obj_lisdFormController.formValidation(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	</cfscript>
	<cfif IsDefined("validate.error") AND validate.error>
		<cfif IsDefined("validate.librarianError") AND validate.librarianError>
			<cfset VARIABLES.librarianError = "&librarianErrorMessage=#validate.librarianMessage#" />
		<cfelse>
			<cfset VARIABLES.librarianError = "" />
		</cfif>
		<cfif IsDefined("validate.selectedDateError") AND validate.selectedDateError>
			<cfset VARIABLES.selectedDateError = "&selectedDateErrorMessage=#validate.selectedDateMessage#" />
		<cfelse>
			<cfset VARIABLES.selectedDateError = "" />
		</cfif>
		<cflocation url="#cgi.HTTP_REFERER##VARIABLES.librarianError##VARIABLES.selectedDateError#" addtoken="false" /> 
		<cfabort>
	</cfif>

	<cfscript>
		// get librarian name 
		librarianNameResults = APPLICATION.obj_lisdStatsController.getLibrarianName(FORM.librarianID);	
		//gets views
		pageViewLib = APPLICATION.obj_lisdEventController.getPageViewLib();
		// get total students by month
		fiscalYearByMonthLibRecordSet = APPLICATION.obj_lisdStatsController.getFiscalYearTotalsByMonthLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get data to populate department drop down 
		totalStudentsByDepartmentLibRecordSet = APPLICATION.obj_lisdStatsController.getTotalStudentsByDepartmentLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// gets total class by department  
		totalClassesByDepartmentLibRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByDepartmentLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get data to populate department drop down 
		totalClassesByLocationLibRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByLocationLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get data to populate department drop down 
		totalClassesByClassTypeLibRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByClassTypeLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get department data by current Fiscal Year 
		fiscalYearLibRecordSet = APPLICATION.obj_lisdStatsController.getFiscalYearTotalsLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get total students by year
		totalStudentsByDepartmentYearLibResults = APPLICATION.obj_lisdStatsController.getTotalStudentsByDepartmentYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get yearly class totals by department
		TotalClassesByDepartmentYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByDepartmentYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get yearly class totals by location
		totalClassesByLocationYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByLocationYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
		// get class totals by classType
		totalClassesByClassTypeYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByClassTypeYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	</cfscript>
	</cfsilent>
<!--- <cfdocument format="PDF" margintop=".5" marginbottom="1" marginleft="1" marginright="1"> --->
	<!--- <cfdocumentitem type="header">Penrose Library</cfdocumentitem> --->
	<cfoutput>
	<!--- css --->
	<link rel="stylesheet" href="#REQUEST.rootPath#view/includes/inc_lisd.css" type="text/css" />
	<h2>#librarianNameResults.librarian#</h2>
	<h2>#FORM.selectedDateStart# to #FORM.selectedDateEnd# Fiscal Year</h2>
	<div id="content"> 
	<!--- MONTH --->
	<!--- --->
	<h3>Stats by Month</h3>
<!--- =================================================================== --->
		<cfif IsDefined("FORM.getFiscalYearDataLib")>
	 <div id="printDisplayStats">	
		<h4>Total Students</h4>
			<table width="100%">
				<tr align="center">
					<th>&nbsp;</th>
					<th>#fiscalYearByMonthLibRecordSet.july#</th>
					<th>#fiscalYearByMonthLibRecordSet.august#</th>
					<th>#fiscalYearByMonthLibRecordSet.september#</th>
					<th>#fiscalYearByMonthLibRecordSet.october#</th>
					<th>#fiscalYearByMonthLibRecordSet.november#</th>
					<th>#fiscalYearByMonthLibRecordSet.december#</th>
				</tr>
				<tr align="center">
					<td>Undergraduates:</td>
					<td>#fiscalYearByMonthLibRecordSet.julyResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.augustResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.septemberResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.octoberResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.novemberResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.decemberResults.underGraduates#</td>
				</tr>
				<tr align="center">
					<td>Graduates:</td>
					<td>#fiscalYearByMonthLibRecordSet.julyResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.augustResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.septemberResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.octoberResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.novemberResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.decemberResults.graduates#</td>
				</tr>
				<tr align="center">
					<td>Faculty:</td>
					<td>#fiscalYearByMonthLibRecordSet.julyResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.augustResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.septemberResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.octoberResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.novemberResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.decemberResults.faculty#</td>
				</tr>
				<tr align="center">
					<td>Other:</td>
					<td>#fiscalYearByMonthLibRecordSet.julyResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.augustResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.septemberResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.octoberResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.novemberResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.decemberResults.other#</td>
				</tr>
				<tr align="center">
					<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
					<td>#fiscalYearByMonthLibRecordSet.julyTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.augustTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.septemberTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.octoberTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.novemberTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.decemberTotal#</td>
				</tr>
				<!--- second 6 months begins --->
				<tr align="center">
					<th>&nbsp;</th>
					<th>#fiscalYearByMonthLibRecordSet.january#</th>
					<th>#fiscalYearByMonthLibRecordSet.february#</th>
					<th>#fiscalYearByMonthLibRecordSet.march#</th>
					<th>#fiscalYearByMonthLibRecordSet.april#</th>
					<th>#fiscalYearByMonthLibRecordSet.may#</th>
					<th>#fiscalYearByMonthLibRecordSet.june#</th>
				</tr>
				<tr align="center">
					<td>Undergraduates</td>
					<td>#fiscalYearByMonthLibRecordSet.januaryResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.februaryResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.marchResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.aprilResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.mayResults.underGraduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.juneResults.underGraduates#</td>
				</tr>
				<tr align="center">
					<td>Graduates:</td>
					<td>#fiscalYearByMonthLibRecordSet.januaryResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.februaryResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.marchResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.aprilResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.mayResults.graduates#</td>
					<td>#fiscalYearByMonthLibRecordSet.juneResults.graduates#</td>
				</tr>
				<tr align="center">
					<td>Faculty:</td>
					<td>#fiscalYearByMonthLibRecordSet.januaryResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.februaryResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.marchResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.aprilResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.mayResults.faculty#</td>
					<td>#fiscalYearByMonthLibRecordSet.juneResults.faculty#</td>
				</tr>
				<tr align="center">
					<td>Other:</td>
					<td>#fiscalYearByMonthLibRecordSet.januaryResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.februaryResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.marchResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.aprilResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.mayResults.other#</td>
					<td>#fiscalYearByMonthLibRecordSet.juneResults.other#</td>
				</tr>
				<tr align="center">
					<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
					<td>#fiscalYearByMonthLibRecordSet.januaryTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.februaryTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.marchTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.aprilTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.mayTotal#</td>
					<td>#fiscalYearByMonthLibRecordSet.juneTotal#</td>
				</tr>
			</table>
		</div>
		</cfif>
		
		<br /><br />
<!--- =================================================================== --->
		<cfif IsDefined("FORM.getTotalStudentsByDepartmentLib")>
		<h4>Total Students by Department</h4>
			<table width="100%"><!--- outer table --->
				<tr valign="top">
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.julyRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.july#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.julyResults">
							<tr align="center">
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
								<td>#VARIABLES.julyDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.augustRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.august#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.augustResults">
							<tr align="center">
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
								<td>#VARIABLES.augustDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					</tr>
					<tr>		
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.septemberRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.september#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.septemberResults">
							<tr align="center">
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
								<td>#VARIABLES.septemberDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.octoberRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.october#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentRecordSet.octoberResults">
							<tr align="center">
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
								<td>#VARIABLES.octoberDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					</tr>
					<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.novemberRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.november#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentRecordSet.novemberResults">
							<tr align="center">
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
								<td>#VARIABLES.novemberDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.decemberRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.december#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.decemberResults">
							<tr align="center">
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
								<td>#VARIABLES.decemberDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.januaryRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.january#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.januaryResults">
							<tr align="center">
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
								<td>#VARIABLES.januaryDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.februaryRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.february#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.februaryResults">
							<tr align="center">
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
								<td>#VARIABLES.februaryDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.marchRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.march#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentRecordSet.marchResults">
							<tr align="center">
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
								<td>#VARIABLES.marchDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.aprilRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.april#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentRecordSet.aprilResults">
							<tr align="center">
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
								<td>#VARIABLES.aprilDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.mayRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.may#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.mayResults">
							<tr align="center">
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
								<td>#VARIABLES.mayDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalStudentsByDepartmentLibRecordSet.juneRecordCount NEQ 0>
							<tr align="center">
								<th>#totalStudentsByDepartmentLibRecordSet.june#</th>
								<th>Undergraduates</th>
								<th>Graduates</th>
								<th>faculty</th>
								<th>Other</th>
								<th>Total</th>
							</tr>
							<cfloop query="totalStudentsByDepartmentLibRecordSet.juneResults">
							<tr align="center">
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
								<td>#VARIABLES.juneDepartmentTotal#</td>
							</tr>
							</cfloop>
							</cfif>
						</table>
					</td>
				</tr>
			</table><!--- outer table --->
		</cfif>
		<br /><br />
<!--- =================================================================== --->
		<cfif IsDefined("FORM.getTotalClassesByDepartmentLib")>
		<h4>Total Classes by Department</h4>
			<table width="100%"><!--- outer table --->
				<tr valign="top">
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.julyRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.july#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.july#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.julyResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.julyResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.julyResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.julyTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.augustRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.august#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.august#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.augustResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.augustResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.augustResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.augustTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.septemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.september#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.september#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.septemberResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.septemberResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.septemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.septemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.octoberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.october#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.october#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.octoberResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.octoberResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.octoberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.octoberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.novemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.november#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.november#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.novemberResults">
							<tr align="center">
								<td>#totalClassesByDepartmentRecordSet.novemberLibResults.department#</td>
								<td>#totalClassesByDepartmentRecordSet.novemberLibResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.novemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.decemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.december#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.december#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentRecordSet.decemberResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.decemberResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.decemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.decemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.januaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.january#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.january#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentRecordSet.januaryResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.januaryResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.januaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.januaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.februaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.february#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.february#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.februaryResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.februaryResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.februaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.februaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.marchRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.march#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.march#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentRecordSet.marchResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.marchResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.marchResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.marchTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.aprilRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.april#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.april#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.aprilResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.aprilResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.aprilResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.aprilTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.mayRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.may#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.may#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.mayResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.mayResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.mayResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.mayTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByDepartmentLibRecordSet.juneRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByDepartmentLibRecordSet.june#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByDepartmentLibRecordSet.june#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByDepartmentLibRecordSet.juneResults">
							<tr align="center">
								<td>#totalClassesByDepartmentLibRecordSet.juneResults.department#</td>
								<td>#totalClassesByDepartmentLibRecordSet.juneResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByDepartmentLibRecordSet.juneTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
			</table><!--- outer table --->
		</cfif>
		<br /><br />		
<!--- =================================================================== --->
		<cfif IsDefined("FORM.getTotalClassesByLocationLib")>
		<h4>Toatal Classes by Location</h4>
			<table width="100%"><!--- outer table --->
				<tr valign="top">
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.julyRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.july#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.july#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.julyResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.julyResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.julyResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.julyTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.augustRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.august#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.august#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.augustResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.augustResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.augustResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.augustTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.septemberRecordCount EQ 0>
								<tr  align="center" bgcolor="##FFE271"><td>No stats available for #totalClassesByLocationLibRecordSet.september#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.september#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.septemberResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.septemberResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.septemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.septemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.octoberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.october#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.october#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.octoberResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.octoberResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.octoberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.octoberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.novemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.november#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.november#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.novemberResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.novemberResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.novemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.novemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.decemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.december#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.december#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.decemberResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.decemberResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.decemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.decemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.januaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.january#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.january#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.januaryResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.januaryResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.januaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.januaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.februaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.february#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.february#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.februaryResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.februaryResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.februaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.februaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.marchRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.march#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.march#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationRecordSet.marchResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.marchResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.marchResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.marchTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.aprilRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.april#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.april#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationRecordSet.aprilResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.aprilResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.aprilResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.aprilTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.mayRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.may#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.may#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.mayResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.mayResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.mayResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.mayTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByLocationLibRecordSet.juneRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByLocationLibRecordSet.june#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByLocationLibRecordSet.june#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByLocationLibRecordSet.juneResults">
							<tr align="center">
								<td>#totalClassesByLocationLibRecordSet.juneResults.location#</td>
								<td>#totalClassesByLocationLibRecordSet.juneResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByLocationLibRecordSet.juneTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
			</table><!--- outer table --->
		</cfif>
		<br /><br />
<!--- =================================================================== --->		
		<cfif IsDefined("FORM.getTotalClassesByClassTypeLib")>
		<h4>Total Classes by Class Type</h4>
			<table width="100%"><!--- outer table --->
				<tr valign="top">
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.julyRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.july#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.july#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.julyResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.julyResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.julyResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.julyTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.augustRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.august#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.august#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.augustResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.augustResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.augustResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.augustTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.septemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.september#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.september#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.septemberResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.septemberResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.septemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.septemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.octoberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.october#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.october#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeRecordSet.octoberResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.octoberResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.octoberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.octoberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.novemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.november#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.november#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.novemberResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.novemberResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.novemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.novemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.decemberRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.december#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.december#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.decemberResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.decemberResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.decemberResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.decemberTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.januaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.january#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.january#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.januaryResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.januaryResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.januaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.januaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.februaryRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.february#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.february#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.februaryResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.februaryResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.februaryResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.februaryTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.marchRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.march#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.march#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.marchResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.marchResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.marchResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.marchTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.aprilRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.april#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.april#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeRecordSet.aprilResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.aprilResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.aprilResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.aprilTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.mayRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.may#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.may#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeRecordSet.mayResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.mayResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.mayResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total</em></b>:</td>
								<td>#totalClassesByClassTypeLibRecordSet.mayTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td>
						<table><!--- inner table --->
							<cfif totalClassesByClassTypeLibRecordSet.juneRecordCount EQ 0>
								<tr  align="center"><td>No stats available for #totalClassesByClassTypeLibRecordSet.june#</td></tr>
							<cfelse>
							<tr align="center">
								<th>#totalClassesByClassTypeLibRecordSet.june#</th>
								<th>&nbsp;</th>
							</tr>
							<cfloop query="totalClassesByClassTypeLibRecordSet.juneResults">
							<tr align="center">
								<td>#totalClassesByClassTypeLibRecordSet.juneResults.classType#</td>
								<td>#totalClassesByClassTypeLibRecordSet.juneResults.classCount#</td>
							</tr>
							</cfloop>
							<tr>
								<td align="right"><b><em>Total:</em></b>&nbsp;&nbsp;</td>
								<td>#totalClassesByClassTypeLibRecordSet.juneTotal#</td>
							</tr>
							</cfif>
						</table>
					</td>
				</tr>
			</table><!--- outer table --->
		</cfif>
<br /><br />
<!--- =================================================================== --->
	
</cfoutput>	
	<!--- 	<br />
		<div class="displayStats">
			<cfinclude template="#pageViewLib.totalStudentsByDepartmentLib#" />
		</div>
			<br />
		<div class="displayStats">
			<cfinclude template="#pageViewLib.totalClassesByDepartmentLib#" />
		</div>
			<br />
		<div class="displayStats">
			<cfinclude template="#pageViewLib.totalClassesByLocationLib#" />
		</div>
			<br />
		<div class="displayStats">	
			<cfinclude template="#pageViewLib.totalClassesByClassTypeLib#" />
		</div>
			<br />
	</cfif> --->
</div>	
	<!--- YEAR --->
	<cfif IsDefined("FORM.getStatsByYear")>
	<h3>Stats by Year</h3>
		<div class="displayStats">
			<cfinclude template="#pageViewLib.fiscalYearTotalsLib#" />
		</div>
			<br />
		<div class="displayStats">
			<cfinclude template="#pageViewLib.totalStudentsByDepartmentYearLib#" /> 
		</div>
			<br />
		<div class="displayStats">	
			<cfinclude template="#pageViewLib.totalClassesByDepartmentYearLib#" />
		</div>
			<br />
		<div class="displayStats">	
			<cfinclude template="#pageViewLib.totalClassesByLocationYearLib#" />
		</div>
			<br />
		<div class="displayStats">	
			<cfinclude template="#pageViewLib.totalClassesByClassTypeYearLib#" />
		</div>
			<br />
	</cfif>
<!--- </cfdocument> --->