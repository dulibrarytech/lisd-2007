<cfset fileName = now() />

<cfheader name="Content-Disposition" value="inline; filename=#DateFormat(fileName, "mmm-dd-yyyy")#-librarian-stats.xls">
<cfcontent type="application/vnd.msexcel">

<cfsilent>
<!--- FORM VALIDATION --->
<cfif IsDefined("FORM.librarianID")>
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
<!--- FORM VALIDATION ENDS --->
</cfif>

<cfif IsDefined("FORM.librarianID") OR IsDefined("URL.librarianID")>
	<cfset VARIABLES.librarianID = "#librarianID#" /><!--- takes var from both form and url scope --->
	<cfscript>
		// get librarian name 
		librarianNameResults = APPLICATION.obj_lisdStatsController.getLibrarianName(VARIABLES.librarianID);	
	</cfscript>
	<cfscript>
		//gets views
		pageViewLib = APPLICATION.obj_lisdEventController.getPageViewLib();
	</cfscript>
</cfif>
</cfsilent>


<cfif NOT IsDefined("librarianNameResults.librarian")><cflocation url="#REQUEST.rootPath#?page=librarianStats" addtoken="false" /></cfif>

<cfflush interval="10" />	
<cfoutput>

<!---
<table>
<tr><td><strong>#librarianNameResults.librarian#</strong></td></tr>
--->

<cfif IsDefined("FORM.librarianID") OR IsDefined("URL.librarianID")>
	<cfset VARIABLES.selectedDateStart = "#selectedDateStart#" /><!--- takes var from both form and url scope --->
	<cfset VARIABLES.selectedDateEnd = "#selectedDateEnd#" /><!--- takes var from both form and url scope --->
	<h2>#VARIABLES.selectedDateStart# to #VARIABLES.selectedDateEnd# Fiscal Year</h2>
	<!---<h2>#VARIABLES.selectedDateStart# to #VARIABLES.selectedDateEnd# Fiscal Year</h2>--->
</cfif>
</cfoutput>


<!--- MONTH --->
<cfif IsDefined("FORM.getStatsByMonth")>
<cfscript>
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
</cfscript>

<!---
<tr><td><strong>Stats by Month</strong></td></tr>
</table>
--->
<h3><cfoutput>#librarianNameResults.librarian#</cfoutput></h3>
<h3>Stats by Month</h3>

	<cfinclude template="#pageViewLib.exportTotalStudentsByMonthLib#" /> 
	<br />
	<cfinclude template="#pageViewLib.exportTotalStudentsByDepartmentLib#" /> 
	<br />
	<cfinclude template="#pageViewLib.exportTotalClassesByDepartmentLib#" />
	<br />
	<cfinclude template="#pageViewLib.exportTotalClassesByLocationLib#" />
	<br />
</cfif>

<!--- YEAR --->
<cfif IsDefined("FORM.getStatsByYear")>
<cfscript>
	// get department data by current Fiscal Year 
	fiscalYearLibRecordSet = APPLICATION.obj_lisdStatsController.getFiscalYearTotalsLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	// get total students by year
	totalStudentsByDepartmentYearLibResults = APPLICATION.obj_lisdStatsController.getTotalStudentsByDepartmentYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	// get yearly class totals by department
	totalClassesByDepartmentYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByDepartmentYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	// get yearly class totals by location
	totalClassesByLocationYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByLocationYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	// get class totals by classType
	totalClassesByClassTypeYearLibResults = APPLICATION.obj_lisdStatsController.getTotalClassesByClassTypeYearLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	// get class total
	classTotalsLibResults = APPLICATION.obj_lisdStatsController.getClassTotalsLib(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
</cfscript>
<h3>Stats by Year</h3>

	<cfinclude template="#pageViewLib.exportFiscalYearTotalsLib#" />
	<br />
	<cfinclude template="#pageViewLib.exportTotalStudentsByDepartmentYearLib#" />
	<br />
	<cfinclude template="#pageViewLib.exportTotalClassesByDepartmentYearLib#" />
	<br />
	<cfinclude template="#pageViewLib.exportTotalClassesByLocationYearLib#" />
	<br />
	<cfinclude template="#pageViewLib.exportTotalClassesByClassTypeYearLib#" />
	<br />
</cfif>

<cfabort>