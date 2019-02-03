<cfcomponent displayname="obj_interactionTypeDAO" output="false" hint="">
	
	<cffunction name="init" access="public" output="false" returntype="circStats.pages.interactionType.obj_interactionTypeDAO" hint="Constructor for this CFC">
		<!--- take DSN as argument --->
		<cfargument name="dsn" type="string" required="true" hint="The datasource name" />
				
		<!--- put dsn in variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
			
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
		
	
	<!--- CRUD methods (create, read, update, delete) --->
	<!--- CREATE: inserts an interactionType into the database --->
	<cffunction name="create" access="public" output="false" returntype="void" hint="Creates a new interactionType">
	
		<!--- take question bean as argument --->
		<cfargument name="obj_interactionType" type="circStats.pages.interactionType.obj_interactionType" required="true" />
				
		<!--- initialize variables --->
		<cfset var insertInteractionType = 0 />
			
		<!--- insert the button label --->
		
			<cfquery name="insertInteractionType" datasource="#VARIABLES.dsn#">
			
				INSERT INTO tbl_circStatsInteractionType (interactionType, isActive, created) 
				
				VALUES 
							
				(
					<cfqueryparam value="#ARGUMENTS.obj_interactionType.getInteractionType()#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#ARGUMENTS.obj_interactionType.getIsActive()#" cfsqltype="cf_sql_bit" />,
					#now()#
				)
				
			</cfquery>
																					
	</cffunction>
	
	
	<cffunction name="read" access="public" output="false" returntype="query" hint="retrieves all active interactiontypes">
							
		<cfargument name="interactionTypeID" type="numeric" required="false" />
							
		<!--- initialize variables --->
		<cfset var readInteractionType = 0 />
				
			<cfquery name="readInteractionType" datasource="#VARIABLES.dsn#">
				SELECT	interactionTypeID, interactionType
				FROM	tbl_circStatsInteractionType
				WHERE	isActive = 1
				<cfif IsDefined ("FORM.submit") AND URL.page EQ "viewStats">
					AND	interactionTypeID = #ARGUMENTS.interactionTypeID#
				</cfif>
			</cfquery>
																					
		<cfreturn readInteractionType />
	</cffunction>
	
	
	<cffunction name="readID" access="public" output="false" returntype="query" hint="retrieves active interactiontypeID">
		
		<cfargument name="interactionType" type="string" required="true" />
		
		<!--- initialize variables --->
		<cfset var readInteractionTypeID = 0 />
				
			<cfquery name="readInteractionTypeID" datasource="#VARIABLES.dsn#">
				SELECT	interactionTypeID
				FROM	tbl_circStatsInteractionType
				WHERE	interactionType = <cfqueryparam value="#ARGUMENTS.interactionType#" cfsqltype="cf_sql_char" />
				AND		isActive = 1
			</cfquery>
																					
		<cfreturn readInteractionTypeID />
	</cffunction>
	
	
	<cffunction name="readInteractionType" access="public" output="false" returntype="query" hint="used by interactionType FORM / gets all interactionTypes">
				
		<!--- initialize variables --->
		<cfset var getInteractionType = 0 />
		
		<cfquery name="getInteractionType" datasource="#VARIABLES.dsn#">
			SELECT	* 
			FROM	tbl_circStatsInteractionType 
		</cfquery>
		
		<cfreturn getInteractionType />		
	</cffunction>
	
	
	<cffunction name="readInteractionTypeForEdit" access="public" output="false" returntype="query" hint="used by interactionType FORM / specific interactionType for update or delete">
						
		<cfargument name="interactionTypeID" type="numeric" required="true" />				
		<!--- initialize variables --->
		<cfset var getInteractionTypes = 0 />
		
		<cfquery name="getInteractionTypes" datasource="#VARIABLES.dsn#">
			SELECT	interactionTypeID, interactionType, isActive 
			FROM	tbl_circStatsInteractionType
			WHERE	interactionTypeID = <cfqueryparam value="#ARGUMENTS.interactionTypeID#" cfsqltype="cf_sql_integer" maxlength="10" /> 
		</cfquery>
					
		<cfreturn getInteractionTypes />
	</cffunction>
	
	
	<cffunction name="update" access="public" output="false" returntype="void" hint="used by interactionType FORM / specific interactionType for update or delete">
						
		<cfargument name="interactionType" type="circStats.pages.interactionType.obj_interactionType" required="true" />
						
		<!--- initialize variables --->
		<cfset var updateInteractionType = 0 />
		
		<cfquery name="updateInteractionType" datasource="#VARIABLES.dsn#">
			UPDATE tbl_circStatsInteractionType
				SET 
					interactionType = <cfqueryparam value="#ARGUMENTS.interactionType.getInteractionType()#" cfsqltype="cf_sql_char" />,
					isActive = <cfqueryparam value="#ARGUMENTS.interactionType.getIsActive()#" cfsqltype="cf_sql_bit" />, 
					modified = #now()#
				
				WHERE	interactionTypeID = <cfqueryparam value="#ARGUMENTS.interactionType.getInteractionTypeID()#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
							
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="void" hint="used by interactionType FORM / specific interactionType for update or delete">
						
		<cfargument name="interactionType" type="circStats.pages.interactionType.obj_interactionType" required="true" />
						
		<!--- initialize variables --->
		<cfset var deleteInteractionType = 0 />
		
		<cfquery name="updateInteractionType" datasource="#VARIABLES.dsn#">
			DELETE 
			FROM  	tbl_circStatsInteractionType
			WHERE	interactionTypeID = <cfqueryparam value="#ARGUMENTS.interactionType.getInteractionTypeID()#" cfsqltype="cf_sql_integer" maxlength="10" /> 
		</cfquery>
							
	</cffunction>
	
</cfcomponent>