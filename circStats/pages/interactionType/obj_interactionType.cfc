<cfcomponent name="addInteractionType" displayname="addInteractionType" hint="addInteractionType bean (class)">
		
	<!--- properties: used for self-documentation --->
	<cfproperty name="interactionTypeID" displayname="interactionTypeID" type="numeric" required="false" hint=""/>	
	<cfproperty name="interactionType" displayname="interactionType" type="string" required="false" hint=""/>
	<cfproperty name="isActive" displayname="isActive" type="boolean" required="false" hint=""/>
			
	<!--- constructor: takes in arguments and calls setters for each attribute of the bean --->
	<cffunction name="init" displayname="init" hint="Constructor for this CFC" access="public" output="false" returntype="circStats.pages.interactionType.obj_interactionType">
		
		<!--- arguments for the constructor, all of which are optional (no-arg constructor) --->
		<cfargument name="interactionTypeID" displayName="interactionTypeID" type="numeric" required="false" default="" hint=""/>
		<cfargument name="interactionType" displayName="interactionType" type="string"  required="false" default="" hint=""/>
		<cfargument name="isActive" displayName="isActive" type="boolean" required="false" default="" hint=""/>
		
		<!--- call the setters for each of the attributes and pass in the arguments --->
		<cfscript>
			setInteractionTypeID(ARGUMENTS.interactionTypeID);
			setInteractionType(ARGUMENTS.interactionType);
			setIsActive(ARGUMENTS.isActive);
		</cfscript>
		
		<!--- return this bean --->
		<cfreturn this />
	</cffunction>
	
	<!--- getters and setters (aka accessors and mutators) --->
	<cffunction name="getInteractionTypeID" access="public" output="false" returntype="numeric">
		<cfreturn VARIABLES.interactionTypeID />
	</cffunction>

	<cffunction name="setInteractionTypeID" access="public" output="false" returntype="void">
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfset VARIABLES.InteractionTypeID = ARGUMENTS.interactionTypeID />
	</cffunction>
	
	<cffunction name="getInteractionType" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.interactionType />
	</cffunction>

	<cffunction name="setInteractionType" access="public" output="false" returntype="void">
		<cfargument name="interactionType" type="string" required="true" />
		<cfset VARIABLES.interactionType = ARGUMENTS.interactionType />
	</cffunction>
		
	<cffunction name="getIsActive" access="public" output="false" returntype="boolean">
		<cfreturn VARIABLES.isActive />
	</cffunction>

	<cffunction name="setIsActive" access="public" output="false" returntype="void">
		<cfargument name="isActive" type="boolean" required="true" />
		<cfset VARIABLES.isActive = ARGUMENTS.isActive />
	</cffunction>
			
</cfcomponent>