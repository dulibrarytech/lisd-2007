<cfcomponent output="no" hint="circStats api / This is used only with files under circStatsViewForm...I was experimenting">

	<cffunction name="init" access="public" output="false" returntype="circStats.controller.obj_circStatsController" hint="Constructor for this CFC">
		<!--- take DSN as argument --->
		<cfargument name="dsn" type="string" required="true" hint="The datasource name" />
		<!--- put dsn in variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
	<!--- return this CFC --->
	<cfreturn this />
	</cffunction>
	
	<cffunction name="createViewStatForm" access="public" output="false" returntype="struct" hint="creates form">
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="createViewStatForm" returnvariable="types">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn types />
	</cffunction>
	
	<cffunction name="getCurrentStats" access="public" output="false" returntype="query" hint="gets stats">
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="getCurrentStats" returnvariable="currentStats">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="employeeTypeID" value="#ARGUMENTS.employeeTypeID#" />
		</cfinvoke>
	<cfreturn currentStats />
	</cffunction>
	
	<cffunction name="getTotals" access="public" output="false" returntype="query" hint="gets yearly totals for staff and students">
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="getTotals" returnvariable="totals">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="employeeTypeID" value="#ARGUMENTS.employeeTypeID#" />
			<cfinvokeargument name="interactionTypeID" value="#ARGUMENTS.interactionTypeID#" />
		</cfinvoke>
	<cfreturn totals />
	</cffunction>
	
	<cffunction name="getAllTotals" access="public" output="false" returntype="query" hint="gets yearly totals for staff and students">
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="getAllTotals" returnvariable="allTotals">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="interactionTypeID" value="#ARGUMENTS.interactionTypeID#" />
		</cfinvoke>
	<cfreturn allTotals />
	</cffunction>
	
	<cffunction name="getStats" access="public" output="false" returntype="query" hint="get stats based on date range">
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfargument name="dateRange1" type="date" required="true" />
		<cfargument name="dateRange2" type="date" required="true" />
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="getStats" returnvariable="currentStats">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="employeeTypeID" value="#ARGUMENTS.employeeTypeID#" />
			<cfinvokeargument name="dateRange1" value="#ARGUMENTS.dateRange1#" />
			<cfinvokeargument name="dateRange2" value="#ARGUMENTS.dateRange2#" />
		</cfinvoke>
	<cfreturn currentStats />
	</cffunction>
	
	<cffunction name="getHourlyStats" access="public" output="false" returntype="array" hint="gets hourly stats">
		<cfargument name="cDate" type="date" required="true" />
		<cfargument name="dateType" type="string" required="true" />
		<cfinvoke component="circStats.pages.circStatsViewForm.obj_circStatsDAO" method="getHourlyStats" returnvariable="hourlyStats">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="cDate" value="#ARGUMENTS.cDate#" />
			<cfinvokeargument name="dateType" value="#ARGUMENTS.dateType#" /><!---  --->
		</cfinvoke>
	<cfreturn hourlyStats />	
	</cffunction>

</cfcomponent>