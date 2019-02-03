<cfcomponent displayname="buttonGateway" output="false" hint="returns all button values for stats form">
	
	<!--- constructor --->
	<cffunction name="init" access="public" output="false" 
		returntype="circStats.cfc.buttonGateway" hint="Constructor for this CFC">
		<!--- take dsn as argument --->
		<cfargument name="dsn" type="string" required="true" />
				
		<!--- set dsn to variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
				
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
	
	
	
	<!--- get button labels --->
	<cffunction name="getAllButtons" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all button labels in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllButtons = 0 />
		
		<!--- run query --->
		<cfquery name="getAllButtons" datasource="#VARIABLES.dsn#">
			SELECT		buttonID, button, active
			FROM 		tbl_circStatsButtons
			WHERE		active = 1
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllButtons />
	</cffunction>
	
			
			
</cfcomponent>