<cfcomponent output="false">

	<cffunction name="init" access="public" output="false" hint="initializes component for use">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="cfcPath" type="string" required="true" />
			<cfset VARIABLES.dsn = ARGUMENTS.dsn />
			<cfset VARIABLES.cfcPath = ARGUMENTS.cfcPath />
	<cfreturn this />
	</cffunction>

</cfcomponent>