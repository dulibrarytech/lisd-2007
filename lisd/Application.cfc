<cfcomponent output="false" hint="lisd">

	<cfset THIS.name="lisd">
    <cfset THIS.sessionmanagement="yes">
    <cfset THIS.setclientcookies="yes">
    				
	<cffunction name="onRequestStart" output="false" returntype="void">
		<!--- DSN --->
		<cfset VARIABLES.dsn="lisddb" />
		<!--- CFC PATH --->
		<cfset VARIABLES.cfcPath = "lisd.model." /> 
		<!--- ROOT PATH --->
		<cfset REQUEST.rootPath = "http://lib-moon.cair.du.edu:8181/railo/lisd/index.cfm" />
		<cfset REQUEST.assetPath = "http://lib-moon.cair.du.edu:8181/railo/lisd/" />
		<cfset REQUEST.devEmail = "freyes@du.edu" />
		<cfset REQUEST.applicationEmail = "lisd@du.edu" />
		
		<!--- code below allows objects to persist --->
		<cflock scope="application" timeout="10" type="exclusive">
			<cfparam name="APPLICATION.initialized" default="false" />
			<cfset REQUEST.initialized = APPLICATION.initialized />
		</cflock>
		
		<cfif NOT REQUEST.initialized>
			<!--- INSTANTIATE DATA ACCESS OBJECTS AND CONTROLLERS --->
			<cflock scope="application" timeout="10" type="exclusive">
				<cfset APPLICATION.obj_lisdFormController = CreateObject("component", "lisd.controller.obj_lisdFormController").init(VARIABLES.dsn, VARIABLES.cfcPath) />
				<cfset APPLICATION.obj_lisdStatsController = CreateObject("component", "lisd.controller.obj_lisdStatsController").init(VARIABLES.dsn, VARIABLES.cfcPath) />
				<cfset APPLICATION.obj_lisdEventController = CreateObject("component", "lisd.controller.obj_lisdEventController") />
				<cfset APPLICATION.obj_lisdClassDataController = CreateObject("component", "lisd.controller.obj_lisdClassDataController").init(VARIABLES.dsn, VARIABLES.cfcPath) />
				<cfset APPLICATION.obj_event = CreateObject("component", "lisd.model.obj_event") /> 
				<cfset APPLICATION.obj_stats = CreateObject("component", "lisd.model.obj_stats") />
				<cfset APPLICATION.obj_librarianStats = CreateObject("component", "lisd.model.obj_librarianStats") />
				<cfset APPLICATION.obj_classData = CreateObject("component", "lisd.model.obj_classData") />
				<cfset APPLICATION.obj_pageView = CreateObject("component", "lisd.model.obj_pageView") />
				<cfset APPLICATION.obj_pageViewLib = CreateObject("component", "lisd.model.obj_pageViewLib") />
				<cfset APPLICATION.obj_sendMail = CreateObject("component", "lisd.model.obj_sendMail") />
			</cflock>
		</cfif>
		
		<cfif IsDefined ("URL.logout")>
			<cfset structclear(SESSION)>
			<cflocation url="#REQUEST.rootPath#?page=login">
		</cfif> 			
		
		<!--- SITE WIDE ERROR CATCHING --->
		<cferror type="exception" exception="any" template="view/includes/inc_error.cfm" />
		 			
	</cffunction>
	
</cfcomponent>
