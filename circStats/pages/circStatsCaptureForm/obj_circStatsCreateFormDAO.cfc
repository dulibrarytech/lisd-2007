<cfcomponent displayname="obj_circStatsCreateFormDAO" output="false" hint="returns all values for stats form">
	
	<!--- constructor ---> 
	<cffunction name="init" access="public" output="false" 
		returntype="circStats.pages.circStatsCaptureForm.obj_circStatsCreateFormDAO" hint="Constructor for this CFC">
		<!--- take dsn as argument --->
		<cfargument name="dsn" type="string" required="true" />
				
		<!--- set dsn to variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
				
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
	
		
	<!--- get staff questions (radio button)--->
	<cffunction name="getAllStaffRadioQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all staff questions with radio in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllStaffRadioQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllStaffRadioQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 1 <!---staff --->
			AND			formType = 'radio'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllStaffRadioQuestions />
	</cffunction>
	
	
	
	<!--- get staff questions (text box) --->
	<cffunction name="getAllStaffTextQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all staff questions with a text box in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllStaffTextQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllStaffTextQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 1 <!--- staff --->
			AND			formType = 'text'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllStaffTextQuestions />
	</cffunction>
	
	
	
	<!--- get student questions (radio button)--->
	<cffunction name="getAllStudentRadioQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all studnet questions with a radio button in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllStudentRadioQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllStudentRadioQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 2 <!--- student --->
			AND			formType = 'radio'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllStudentRadioQuestions />
	</cffunction>
	
	
	
	<!--- get student questions (text box)--->
	<cffunction name="getAllStudentTextQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all student questions with a text box in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllStudentTextQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllStudentTextQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 2 <!--- student --->
			AND			formType = 'text'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllStudentTextQuestions />
	</cffunction>
	
	
	
	<!--- get all "both" radio questions --->
	<cffunction name="getAllRadioQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all both questions with a radio button in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllRadioQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllRadioQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 3 <!--- All --->
			AND			formType = 'radio'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllRadioQuestions />
	</cffunction>
	
	
	
	<!--- get all "both" text questions --->
	<cffunction name="getAllTextQuestions" access="public" output="false" returntype="query" 
		hint="Returns a query object containing all both questions with a text box in the database">
		<!--- this function takes no arguments --->
		
		<!--- initialize variables --->
		<cfset var getAllTextQuestions = 0 />
		
		<!--- run query --->
		<cfquery name="getAllTextQuestions" datasource="#VARIABLES.dsn#">
			SELECT		questionTypeID, questionType, formType, isActive
			FROM 		tbl_circStatsQuestionType
			WHERE		isActive = 1
			AND			employeeTypeID = 3 <!--- All --->
			AND			formType = 'text'
		</cfquery>
				
		<!--- return the query object --->
		<cfreturn getAllTextQuestions />
	</cffunction>
				
</cfcomponent>