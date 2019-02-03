<cfcomponent displayname="captureStatsDAO" output="false" hint="">
	
	<cffunction name="init" access="public" output="false" returntype="circStats.pages.captureStats.obj_captureStatsDAO" hint="Constructor for this CFC">
		<!--- take DSN as argument --->
		<cfargument name="dsn" type="string" required="true" hint="The datasource name" />
				
		<!--- put dsn in variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
			
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
		
	
	<!--- CREATE: inserts form values into the database --->
	<cffunction name="create" access="public" output="false" returntype="void" hint="Creates a new stat record">
	
		<!--- take question bean as argument --->
		<cfargument name="captureStats" type="circStats.pages.captureStats.obj_captureStats" required="true" />
				
		<!--- initialize variables --->
		<cfset var insertStat = 0 />
							
			<cfquery name="insertStat" datasource="#VARIABLES.dsn#">
										
				INSERT INTO tbl_circStats (employeeTypeID, questionTypeID, interactionTypeID, questionTextType, dateCreated) 
				
				VALUES 
							
				(
					<cfqueryparam value="#ARGUMENTS.captureStats.getEmployeeTypeID()#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#ARGUMENTS.captureStats.getQuestionTypeID()#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#ARGUMENTS.captureStats.getInteractionTypeID()#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#ARGUMENTS.captureStats.getQuestionTextType()#" cfsqltype="cf_sql_char" />,
					#now()# 
					
				)
				
			</cfquery>
																					
	</cffunction>
	
</cfcomponent>