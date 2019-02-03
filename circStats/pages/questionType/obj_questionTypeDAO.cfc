<cfcomponent displayname="questionTypeDAO" output="false">
	
	<cffunction name="init" access="public" output="false" returntype="circStats.pages.questionType.obj_questionTypeDAO" hint="Constructor for this CFC">
		<!--- take DSN as argument --->
		<cfargument name="dsn" type="string" required="true" hint="The datasource name" />
		
		<!--- put dsn in variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
					
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
		
	
	<!--- CRUD methods (create, read, update, delete) --->
	<!--- CREATE: inserts a question into the database --->
	<cffunction name="create" access="public" output="false" returntype="void" hint="Creates a new question record">
	
		<!--- take question bean as argument --->
		<cfargument name="questionType" type="circStats.pages.questionType.obj_questionType" required="true" />
				
		<!--- initialize variables --->
		<cfset var insertQuestionType = 0 />
						
			<cfquery name="insertQuestionType" datasource="#VARIABLES.dsn#">
			
				INSERT INTO tbl_circStatsQuestionType (questionType, employeeTypeID, formType, isActive, created) 
					VALUES 
						(
							<cfqueryparam value="#ARGUMENTS.questionType.getQuestionType()#" cfsqltype="cf_sql_char" />,
							<cfqueryparam value="#ARGUMENTS.questionType.getEmployeeTypeID()#" cfsqltype="cf_sql_integer" />,
							<cfqueryparam value="#ARGUMENTS.questionType.getFormType()#" cfsqltype="cf_sql_char" />,
							<cfqueryparam value="#ARGUMENTS.questionType.getIsActive()#" cfsqltype="cf_sql_bit" />,
							#now()#
					 	)
			</cfquery>
																					
	</cffunction>
	
	
	<cffunction name="read" access="public" output="false" returntype="query" hint="gets all question types">
	
		<cfargument name="questionTypeID" type="numeric" required="false" />
		
		<!--- initialize variables --->
		<cfset var getQuestionType = 0 />
		
		<cfquery name="getQuestionType" datasource="#VARIABLES.dsn#">
			SELECT 	questionTypeID, questionType
			FROM 	tbl_circStatsQuestionType<!--- view TODO: double check the view in sql server to make sure this is the only needed change --->
			
			<cfif IsDefined ("URL.page") AND URL.page EQ "viewStatsForm" AND URL.page EQ "staff">
				WHERE	questionTypeID = <cfqueryparam value="#ARGUMENTS.questionTypeID#" cfsqltype="cf_sql_integer" />
			</cfif>  
		</cfquery>
		
		<cfreturn getQuestionType />
	</cffunction>
	
	
	<cffunction name="readQuestionTypeID" access="public" output="false" returntype="query" hint="gets question type id - used by dsp_circStatsViewStats.cfm">
	
		<cfargument name="questionType" type="string" required="true" />
		
		<!--- initialize variables --->
		<cfset var getQuestionTypeID = 0 />
		
		<cfquery name="getQuestionTypeID" datasource="#VARIABLES.dsn#">
			SELECT	questionTypeID
			FROM	tbl_circStatsQuestionType
			WHERE	questionType = <cfqueryparam value="#ARGUMENTS.questionType#" cfsqltype="cf_sql_char" /> 
		</cfquery>
		
		<cfreturn getQuestionTypeID />
	</cffunction>  
	
	
	<cffunction name="getQuestionTypeRecordCount" access="public" output="false" returntype="query" hint="used by capture FORM / gets only active questionTypes">
				
		<!--- initialize variables --->
		<cfset var getQuestionTypeRecordCount = 0 />
		
		<cfquery name="getQuestionTypeRecordCount" datasource="#VARIABLES.dsn#">
			SELECT	* 
			FROM	tbl_circStatsQuestionType
			WHERE	formType <> 'text'
			AND		isActive = 1 
		</cfquery>
		
		<cfreturn getQuestionTypeRecordCount />		
	</cffunction>
	
	
	<cffunction name="readQuestionType" access="public" output="false" returntype="query" hint="used by questionType FORM / gets all questionTypes for form drop down menu">
				
		<!--- initialize variables --->
		<cfset var getQuestionType = 0 />
		
		<cfquery name="getQuestionType" datasource="#VARIABLES.dsn#">
			SELECT	* 
			FROM	tbl_circStatsQuestionType
			WHERE	formType <> 'text' 
		</cfquery>
		
		<cfreturn getQuestionType />		
	</cffunction>
	
	
	<cffunction name="readQuestionTypeForEdit" access="public" output="false" returntype="query" hint="used by questionType FORM / specific questionType for update or delete">
						
		<cfargument name="questionTypeID" type="numeric" required="true" />				
		<!--- initialize variables --->
		<cfset var getQuestionTypes = 0 />
		
		<cfquery name="getQuestionTypes" datasource="#VARIABLES.dsn#">
			SELECT	questionTypeID, questionType, employeeTypeID, formType, isActive 
			FROM	tbl_circStatsQuestionType
			WHERE	questionTypeID = <cfqueryparam value="#ARGUMENTS.questionTypeID#" cfsqltype="cf_sql_integer" maxlength="10" /> 
		</cfquery>
					
		<cfreturn getQuestionTypes />
	</cffunction>
	
	
	<cffunction name="update" access="public" output="false" returntype="void" hint="used by questionType FORM / specific questionType for update or delete">
						
		<cfargument name="questionType" type="circStats.pages.questionType.obj_questionType" required="true" />
						
		<!--- initialize variables --->
		<cfset var updateQuestionType = 0 />
		
		<cfquery name="updateQuestionType" datasource="#VARIABLES.dsn#">
			UPDATE tbl_circStatsQuestionType
				SET 
					questionType = <cfqueryparam value="#ARGUMENTS.questionType.getQuestionType()#" cfsqltype="cf_sql_char" />,
					employeeTypeID = <cfqueryparam value="#ARGUMENTS.questionType.getEmployeeTypeID()#" cfsqltype="cf_sql_integer" />,
					isActive = <cfqueryparam value="#ARGUMENTS.questionType.getIsActive()#" cfsqltype="cf_sql_bit" />, 
					modified = #now()#
				
				WHERE	questionTypeID = <cfqueryparam value="#ARGUMENTS.questionType.getQuestionTypeID()#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
							
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="void" hint="used by questionType FORM / specific questionType for update or delete">
						
		<cfargument name="questionType" type="circStats.pages.questionType.obj_questionType" required="true" />
						
		<!--- initialize variables --->
		<cfset var deleteQuestionType = 0 />
		
		<cfquery name="updateQuestionType" datasource="#VARIABLES.dsn#">
			DELETE 
			FROM  	tbl_circStatsQuestionType
			WHERE	questionTypeID = <cfqueryparam value="#ARGUMENTS.questionType.getQuestionTypeID()#" cfsqltype="cf_sql_integer" maxlength="10" /> 
		</cfquery>
							
	</cffunction>
		
</cfcomponent>