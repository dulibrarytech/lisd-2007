<cfsetting enablecfoutputonly="true">
<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=test.pdf">
<cfdocument format="PDF" localurl="yes"
marginTop=".25" marginLeft=".25" marginRight=".25" marginBottom=".25"
pageType="custom" pageWidth="8.5" pageHeight="10.2">


<cfif NOT IsDefined("FORM.selectedDateStart") AND NOT IsDefined("FORM.selectedDateEnd")><cflocation url="#REQUEST.rootPath#?page=stats" addtoken="false" /></cfif>
<cfsilent>
<!--- FORM VALIDATION --->
<cfscript>
	//validates FORM values
	validate = APPLICATION.obj_lisdFormController.formValidation(FORM.selectedDateStart, FORM.selectedDateEnd);
</cfscript>
<cfif IsDefined("validate.error") AND validate.error>
	<cfif IsDefined("validate.selectedDateError") AND validate.selectedDateError>
		<cfset VARIABLES.selectedDateError = "&selectedDateErrorMessage=#validate.selectedDateMessage#" />
	<cfelse>
		<cfset VARIABLES.selectedDateError = "" />
	</cfif>
	<cflocation url="#cgi.HTTP_REFERER##VARIABLES.selectedDateError#" addtoken="false" /> 
	<cfabort>
</cfif>

<cfscript>
	//gets views
	pageView = APPLICATION.obj_lisdEventController.getPageView();
</cfscript>
</cfsilent>

<cfflush interval="10" />
<cfoutput>
	<h2>#FORM.selectedDateStart# to #FORM.selectedDateEnd# Fiscal Year</h2>
</cfoutput>
<!--- MONTH --->
<cfif IsDefined("FORM.getStatsByMonth")>
<h3>Stats by Month</h3>
<cfscript>
	// get total students by month
	fiscalYearByMonthRecordSet = APPLICATION.obj_lisdStatsController.getFiscalYearTotalsByMonth(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get total students by department
	totalStudentsByDepartmentRecordSet = APPLICATION.obj_lisdStatsController.getTotalStudentsByDepartment(FORM.selectedDateStart, FORM.selectedDateEnd);
	// gets total class by department  
	totalClassesByDepartmentRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByDepartment(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get data to populate department drop down 
	totalClassesByLocationRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByLocation(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get data to populate department drop down 
	totalClassesByClassTypeRecordSet = APPLICATION.obj_lisdStatsController.getTotalClassesByClassType(FORM.selectedDateStart, FORM.selectedDateEnd);
</cfscript>
	<div class="displayStats">
		<cfinclude template="#pageView.totalStudentsByMonth#" />
	</div>
		<br />	
	<div class="displayStats">
		<cfinclude template="#pageView.totalStudentsByDepartment#" />
	</div>
		<br />
	<div class="displayStats">
		<cfinclude template="#pageView.totalClassesByDepartment#" />
	</div>
		<br />
	<div class="displayStats">
		<cfinclude template="#pageView.totalClassesByLocation#" />
	</div>
		<br />
	<div class="displayStats">
		<cfinclude template="#pageView.totalClassesByClassType#" />
	</div>
</cfif>
<br />
<!--- YEAR --->
<cfif IsDefined("FORM.getStatsByYear")>
<h3>Stats by Year</h3>
<cfscript>
	// get student totals for fiscal year 
	fiscalYearRecordSet = APPLICATION.obj_lisdStatsController.getFiscalYearTotals(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get total students by year
	totalStudentsByDepartmentYearResults = APPLICATION.obj_lisdStatsController.getTotalStudentsByDepartmentYear(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get yearly class totals by department
	totalClassesByDepartmentYearResults = APPLICATION.obj_lisdStatsController.getTotalClassesByDepartmentYear(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get yearly class totals by location
	totalClassesByLocationYearResults = APPLICATION.obj_lisdStatsController.getTotalClassesByLocationYear(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get class totals by classType
	totalClassesByClassTypeYearResults = APPLICATION.obj_lisdStatsController.getTotalClassesByClassTypeYear(FORM.selectedDateStart, FORM.selectedDateEnd);
	// get class total
	classTotalsResults = APPLICATION.obj_lisdStatsController.getClassTotals(FORM.selectedDateStart, FORM.selectedDateEnd);
</cfscript>
	<div class="displayStats">
		<cfinclude template="#pageView.fiscalYearTotals#" />
	</div>
		<br />
	<div class="displayStats">
		<cfinclude template="#pageView.totalStudentsByDepartmentYear#" /> 
	</div>
		<br />
	<div class="displayStats">	
		<cfinclude template="#pageView.totalClassesByDepartmentYear#" />
	</div>
		<br />
	<div class="displayStats">	
		<cfinclude template="#pageView.totalClassesByLocationYear#" />
	</div>
		<br />
	<div class="displayStats">	
		<cfinclude template="#pageView.totalClassesByClassTypeYear#" />
	</div>
		<br />
</cfif>

</cfdocument>