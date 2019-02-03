<cfcomponent name="questionType" displayname="questionType" hint="questionType bean (class)">
		
	<!--- properties: used for self-documentation --->
	<cfproperty name="questionTypeID" displayname="questionTypeID" type="numeric" required="false" />	
	<cfproperty name="questionType" displayname="questionType" type="string" required="false" />
	<cfproperty name="employeeTypeID" displayname="employeeTypeID" type="numeric" required="false" />
	<cfproperty name="formType" displayname="formType"  type="string" required="false" />
	<cfproperty name="isActive" displayname="isActive" type="boolean" required="false" />
			
	<!--- constructor: takes in arguments and calls setters for each attribute of the bean --->
	<cffunction name="init" displayname="init" hint="Constructor for this CFC" access="public" output="false" returntype="circStats.pages.questionType.obj_questionType">
		
		<!--- arguments for the constructor, all of which are optional (no-arg constructor) --->
		<cfargument name="questionTypeID" displayName="questionTypeID" type="numeric" required="false" default="" />
		<cfargument name="questionType" displayName="questionType" type="string"  required="false" default="" />
		<cfargument name="employeeTypeID" displayName="employeeTypeID" type="numeric"  required="false" default="" />
		<cfargument name="formType" displayName="type" type="string"  required="false" default="" />
		<cfargument name="isActive" displayName="active" type="boolean" required="false" default="" />
		
		<!--- call the setters for each of the attributes and pass in the arguments --->
		<cfscript>
			setQuestionTypeID(ARGUMENTS.questionTypeID);
			setQuestionType(ARGUMENTS.questionType);
			setEmployeeTypeID(ARGUMENTS.employeeTypeID);
			setFormType(ARGUMENTS.formType);
			setIsActive(ARGUMENTS.isActive);
		</cfscript>
		
		<!--- return this bean --->
		<cfreturn this />
	</cffunction>
	
	<!--- getters and setters (aka accessors and mutators) --->
	<cffunction name="getQuestionTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.questionTypeID />
	</cffunction>

	<cffunction name="setQuestionTypeID" access="public" output="false" returntype="void">
		<cfargument name="questionTypeID" type="numeric" required="true" />
		<cfset VARIABLES.questionTypeID = ARGUMENTS.questionTypeID />
	</cffunction>
	
	<cffunction name="getQuestionType" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.questionType />
	</cffunction>

	<cffunction name="setQuestionType" access="public" output="false" returntype="void">
		<cfargument name="questionType" type="string" required="true" />
		<cfset VARIABLES.questionType = ARGUMENTS.questionType />
	</cffunction>
	
	<cffunction name="getEmployeeTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.employeeTypeID />
	</cffunction>

	<cffunction name="setEmployeeTypeID" access="public" output="false" returntype="void">
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfset VARIABLES.employeeTypeID = ARGUMENTS.employeeTypeID />
	</cffunction>
	
	<cffunction name="getFormType" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.formType />
	</cffunction>

	<cffunction name="setFormType" access="public" output="false" returntype="void">
		<cfargument name="formType" type="string" required="true" />
		<cfset VARIABLES.formType = ARGUMENTS.formType />
	</cffunction>

	<cffunction name="getIsActive" access="public" output="false" returntype="boolean">
		<cfreturn VARIABLES.isActive />
	</cffunction>

	<cffunction name="setIsActive" access="public" output="false" returntype="void">
		<cfargument name="isActive" type="boolean" required="true" />
		<cfset VARIABLES.isActive = ARGUMENTS.isActive />
	</cffunction>
			
</cfcomponent>