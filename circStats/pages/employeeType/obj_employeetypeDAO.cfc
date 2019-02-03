<cfcomponent displayname="obj_employeeTypeDAO" output="false" hint="">
	
	<cffunction name="init" access="public" output="false" returntype="circStats.pages.employeeType.obj_employeeTypeDAO" hint="Constructor for this CFC">
		<!--- take DSN as argument --->
		<cfargument name="dsn" type="string" required="true" hint="The datasource name" />
				
		<!--- put dsn in variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
			
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
		
	
	<!--- CRUD methods (create, read, update, delete) --->
	<!--- CREATE: inserts an employeeType into the database --->
	<cffunction name="create" access="public" output="false" returntype="void" hint="Creates a new interactionType">
	
		<!--- take question bean as argument --->
		<cfargument name="obj_employeeType" type="circStats.pages.employeeType.obj_employeeType" required="true" />
				
		<!--- initialize variables --->
		<cfset var insertEmployeeType = 0 />
							
			<cfquery name="insertEmployeeType" datasource="#VARIABLES.dsn#">
			
				INSERT INTO tbl_circStatsEmployeeType (employeeType, isActive, created) 
				
				VALUES 
							
				(
					<cfqueryparam value="#ARGUMENTS.obj_employeeType.getEmployeeType()#" cfsqltype="cf_sql_char" />,
					<cfqueryparam value="#ARGUMENTS.obj_employeeType.getIsActive()#" cfsqltype="cf_sql_bit" />,
					#now()#
				)
				
			</cfquery>
																					
	</cffunction>
	
	
	<cffunction name="read" access="public" output="false" returntype="query" hint="retrieves all active employeetypes">
							
		<!--- initialize variables --->
		<cfset var readEmployeeType = 0 />
				
			<cfquery name="readEmployeeType" datasource="#VARIABLES.dsn#">
				SELECT	employeeTypeID, employeeType
				FROM	tbl_circStatsEmployeeType
				WHERE	isActive = 1
			</cfquery>
																					
		<cfreturn readEmployeeType />
	</cffunction>
	
</cfcomponent>