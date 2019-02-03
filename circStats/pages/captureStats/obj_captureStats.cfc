<cfcomponent name="captureStats" displayname="captureStats" hint="captureStats bean (class)">
		
	<!--- properties: used for self-documentation --->
	<cfproperty name="employeeTypeID" displayname="employeeTypeID" type="numeric" required="false" />
	<cfproperty name="questionTypeID" displayname="questionTypeID"  type="numeric" required="false" />
	<cfproperty name="interactionTypeID" displayname="interactionTypeID"  type="numeric" required="false" />
	<cfproperty name="questionTextType" displayname="questionTextType" type="string" required="false" />
			
	<!--- constructor: takes in arguments and calls setters for each attribute of the bean --->
	<cffunction name="init" displayname="init" hint="Constructor for this CFC" access="public" output="false" returntype="circStats.pages.captureStats.obj_captureStats">
		
		<!--- arguments for the constructor, all of which are optional (no-arg constructor) --->
		<cfargument name="employeeTypeID" displayName="employeeTypeID" type="numeric"  required="false" default="" />
		<cfargument name="questionTypeID" displayName="questionTypeID" type="numeric"  required="false" default="" />
		<cfargument name="interactionTypeID" displayName="interactionTypeID" type="numeric"  required="false" default="" />
		<cfargument name="questionTextType" displayName="questionTextType" type="string" required="false" default="" />
		
		<!--- call the setters for each of the classroomLesson attributes and pass in the arguments --->
		<cfscript>
			setEmployeeTypeID(ARGUMENTS.employeeTypeID);
			setQuestionTypeID(ARGUMENTS.questionTypeID);
			setInteractionTypeID(ARGUMENTS.interactionTypeID);
			setQuestionTextType(ARGUMENTS.questionTextType);
		</cfscript>
		
		<!--- return this bean --->
		<cfreturn this />
	</cffunction>
	
	<!--- getters and setters (aka accessors and mutators) --->
	<cffunction name="getEmployeeTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.employeeTypeID />
	</cffunction>

	<cffunction name="setEmployeeTypeID" access="public" output="false" returntype="void">
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfset VARIABLES.employeeTypeID = ARGUMENTS.employeeTypeID />
	</cffunction>
	
	<cffunction name="getQuestionTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.questionTypeID />
	</cffunction>

	<cffunction name="setQuestionTypeID" access="public" output="false" returntype="void">
		<cfargument name="questionTypeID" type="numeric" required="true" />
		<cfset VARIABLES.questionTypeID = ARGUMENTS.questionTypeID />
	</cffunction>
	
	<cffunction name="getInteractionTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.interactionTypeID />
	</cffunction>

	<cffunction name="setInteractionTypeID" access="public" output="false" returntype="void">
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfset VARIABLES.interactionTypeID = ARGUMENTS.interactionTypeID />
	</cffunction>
	
	<cffunction name="getQuestionTextType" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.questionTextType />
	</cffunction>

	<cffunction name="setQuestionTextType" access="public" output="false" returntype="void">
		<cfargument name="questionTextType" type="string" required="false" />
		<cfset VARIABLES.questionTextType = ARGUMENTS.questionTextType />
	</cffunction>
			
</cfcomponent>