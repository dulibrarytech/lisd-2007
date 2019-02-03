<cfcomponent output="false" hint="circStats">

	<cfset THIS.name="circStats">
    <cfset THIS.sessionmanagement="yes">
    <cfset THIS.setclientcookies="no">
    <!--- <cfset THIS.sessiontimeout="#CreateTimeSpan(0,5,0,0)#"> --->
				
	<cffunction name="onRequestStart" output="false" returntype="void">
		
		<!--- DSN --->
		<cfset REQUEST.dsn="circstatsdb" />
		
		<!--- CFC PATH --->
		<cfset REQUEST.cfcPath = "circStats.pages." /> 
		
		<!--- ROOT PATH --->
		<cfset REQUEST.rootPath = "http://lib-moon.cair.du.edu:8181/railo/circStats/" />
		
		<!--- code below allows objects to persist --->
		<cflock scope="application" timeout="10" type="exclusive">
			<cfparam name="APPLICATION.initialized" default="false" />
			<cfset REQUEST.initialized = APPLICATION.initialized />
		</cflock>
		
		<cfif NOT REQUEST.initialized>
			<!--- INSTANTIATE DATA ACCESS OBJECTS --->
			<cflock scope="application" timeout="10" type="exclusive">
				<cfset APPLICATION.emailObject = CreateObject ("component", "circStats.pages.sendMail.obj_emailObject") />
				<cfset APPLICATION.circStatsTotal = CreateObject("component", "circStats.pages.circStatsViewForm.obj_circStatsTotal").init(REQUEST.dsn) /> 
				<cfset APPLICATION.questionTypeDAO = CreateObject("component", "circStats.pages.questionType.obj_questionTypeDAO").init(REQUEST.dsn) />
				<cfset APPLICATION.interactionTypeDAO = CreateObject("component", "circStats.pages.interactionType.obj_interactionTypeDAO").init(REQUEST.dsn) />
				<cfset APPLICATION.circStatsController = CreateObject("component", "circStats.controller.obj_circStatsController").init(REQUEST.dsn) />
			</cflock>
		</cfif>
				
		<!--- EMAIL VARIABLES --->
		<cfset REQUEST.toEmailAddress = "freyes@du.edu" />
		<cfset REQUEST.fromEmailAddress = "circStats@du.edu" />
		<cfset REQUEST.emailSubject = "CircStats Error" />
		<cfset REQUEST.emailMessage = "" /><!--- populated when error details when error occurs --->
						
		<!--- INTERACTION TYPE --->
		<cfset REQUEST.interactionTypeForm = "pages/interactionType/dsp_addInteractionTypeForm.cfm" />
		<cfset REQUEST.interactionTypeFormAction = "pages/interactionType/fa_InteractionTypeFormAction.cfm" />
		
		<!--- QUESTION TYPE --->
		<cfset REQUEST.questionTypeForm = "pages/questionType/dsp_addQuestionTypeForm.cfm" />
		<cfset REQUEST.questionTypeFormAction = "pages/questionType/fa_questionTypeFormAction.cfm" />
				
		<!--- EMPLOYEE TYPE --->
		<cfset REQUEST.employeeTypeForm = "pages/employeeType/dsp_addEmployeeTypeForm.cfm" />
		<cfset REQUEST.employeeTypeFormAction = "pages/employeeType/fa_employeeTypeFormAction.cfm" />
		
		<!--- CIRCSTATS FORM --->
		<cfset REQUEST.stats = "pages/circStatsCaptureForm/dsp_circStatsCaptureForm.cfm" />
		
		<!--- CAPTURE STATS --->
		<cfset REQUEST.captureStats = "pages/captureStats/fa_circStatsCaptureFormAction.cfm">
		
		<!--- VIEW STATS FORM--->
		<cfset REQUEST.viewStatsForm = "pages/circStatsViewForm/dsp_circStatsViewForm.cfm" />
						
		<!--- COMPILE STATS --->
		<cfset REQUEST.viewStats = "pages/circStatsViewForm/dsp_circStatsViewStats.cfm" />
		
		<!--- MENU LINKS --->
		<cfset REQUEST.menuLinks = "../../includes/inc_menuLinks.cfm" /><!--- used in forms  --->
		<cfset REQUEST.menuLinks0 = "includes/inc_menuLinks.cfm" /><!--- used as public links --->
				
		<!--- ERROR CATCHING 
		<cferror type="exception" template="includes/inc_error.cfm" />	--->
	</cffunction>
	
</cfcomponent>
