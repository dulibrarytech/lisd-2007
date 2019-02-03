<cfcomponent output="false" hint="controls application events">
	<cffunction name="getPage" access="public" output="false" returntype="string" hint="gets page">
		<cfargument name="page" type="string" required="true" />
		<cfset var event = "" />
		<cfinvoke component="#APPLICATION.obj_event#" method="getPage" returnvariable="event">
			<cfinvokeargument name="page" value="#ARGUMENTS.page#" /> 
		</cfinvoke>
	<cfreturn event />
	</cffunction>
	
	<cffunction name="getPageView" access="public" output="false" returntype="struct" hint="gets page views">
		<cfset var pageView = "" />
		<cfinvoke component="#APPLICATION.obj_pageView#" method="getPageView" returnvariable="pageView">
	<cfreturn pageView />
	</cffunction>
	
	<cffunction name="getPageViewLib" access="public" output="false" returntype="struct" hint="gets page views">
		<cfset var pageViewLib = "" />
		<cfinvoke component="#APPLICATION.obj_pageViewLib#" method="getPageViewLib" returnvariable="pageViewLib">
	<cfreturn pageViewLib />
	</cffunction>
	
	<cffunction name="sendMail" access="public" output="false" returntype="void" hint="sends email">
		<cfargument name="devEmail" type="string" required="true" />
		<cfargument name="applicationEmail" type="string" required="true" />
		<cfargument name="subject" type="string" required="true" />
		<cfargument name="message" type="string" required="true" />
		<cfinvoke component="#APPLICATION.obj_sendMail#" method="sendMail">
			<cfinvokeargument name="devEmail" value="#ARGUMENTS.devEmail#" />
			<cfinvokeargument name="applicationEmail" value="#ARGUMENTS.applicationEmail#" />
			<cfinvokeargument name="subject" value="#ARGUMENTS.subject#" />
			<cfinvokeargument name="message" value="#ARGUMENTS.message#" />	
		</cfinvoke>
	</cffunction>
	
</cfcomponent>