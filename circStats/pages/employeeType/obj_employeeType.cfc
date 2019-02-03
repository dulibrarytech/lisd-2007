<cfcomponent name="employeeType" displayname="employeeType" hint="employeeType bean (class)">
		
	<!--- properties: used for self-documentation --->
	<cfproperty name="employeeTypeID" displayname="employeeTypeID" type="numeric" required="false" hint=""/>	
	<cfproperty name="employeeType" displayname="employeeType" type="string" required="false" hint=""/>
	<cfproperty name="isActive" displayname="isActive" type="boolean" required="false" hint=""/>
			
	<!--- constructor: takes in arguments and calls setters for each attribute of the bean --->
	<cffunction name="init" displayname="init" hint="Constructor for this CFC" access="public" output="false" returntype="circStats.pages.employeeType.obj_employeeType">
		
		<!--- arguments for the constructor, all of which are optional (no-arg constructor) --->
		<cfargument name="employeeTypeID" displayName="employeeID" type="numeric" required="false" default="" hint=""/>
		<cfargument name="employeeType" displayName="employee" type="string"  required="false" default="" hint=""/>
		<cfargument name="isActive" displayName="isActive" type="boolean" required="false" default="" hint=""/>
		
		<!--- call the setters for each of the attributes and pass in the arguments --->
		<cfscript>
			setEmployeeTypeID(ARGUMENTS.employeeTypeID);
			setEmployeeType(ARGUMENTS.employeeType);
			setIsActive(ARGUMENTS.isActive);
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
	
	<cffunction name="getEmployeeType" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.employeeType />
	</cffunction>

	<cffunction name="setEmployeeType" access="public" output="false" returntype="void">
		<cfargument name="employeeType" type="string" required="true" />
		<cfset VARIABLES.employeeType = ARGUMENTS.employeeType />
	</cffunction>
		
	<cffunction name="getIsActive" access="public" output="false" returntype="boolean">
		<cfreturn VARIABLES.isActive />
	</cffunction>

	<cffunction name="setIsActive" access="public" output="false" returntype="void">
		<cfargument name="isActive" type="boolean" required="true" />
		<cfset VARIABLES.isActive = ARGUMENTS.isActive />
	</cffunction>
			
</cfcomponent>