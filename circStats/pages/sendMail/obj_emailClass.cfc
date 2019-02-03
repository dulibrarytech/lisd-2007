<cfcomponent name="emailClass" displayname="emailClass" hint="email bean (class)">
		
	<!--- properties: used for self-documentation --->
	<cfproperty name="toEmailAddress" displayname="toEmailAddress" type="string" required="false" hint=""/>	
	<cfproperty name="fromEmailAddress" displayname="fromEmailAddress" type="string" required="false" hint=""/>
	<cfproperty name="emailSubject" displayname="emailSubject"  type="string" required="false" hint=""/>
	<cfproperty name="emailMessage" displayname="emailMessage"  type="string" required="false" hint=""/>
				
	<!--- constructor: takes in arguments and calls setters for each attribute of the bean --->
	<cffunction name="init" displayname="init" hint="Constructor for this CFC" access="public" output="false" returntype="circStats.pages.sendMail.obj_emailClass">
		
		<!--- arguments for the constructor, all of which are optional (no-arg constructor) --->
		<cfargument name="toEmailAddress" type="string" required="false" default="" />
		<cfargument name="fromEmailAddress" type="string" required="false" default="" />
		<cfargument name="emailSubject" type="string" required="false" default="" />
		<cfargument name="emailMessage" type="string" required="false" default="" />
				
		<cfscript>
			setToEmailAddress(ARGUMENTS.toEmailAddress);
			setFromEmailAddress(ARGUMENTS.fromEmailAddress);
			setEmailSubject(ARGUMENTS.emailSubject);
			setEmailMessage(ARGUMENTS.emailMessage);
		</cfscript>
				
		<!--- return this bean --->
		<cfreturn this />
	</cffunction>
	
	<!--- getters and setters (aka accessors and mutators) --->
	<cffunction name="getToEmailAddress" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.toEmailAddress />
	</cffunction>

	<cffunction name="setToEmailAddress" access="public" output="false" returntype="void">
		<cfargument name="toEmailAddress" type="string" required="true" />
		<cfset VARIABLES.toEmailAddress = ARGUMENTS.toEmailAddress />
	</cffunction>
	
	<cffunction name="getFromEmailAddress" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.fromEmailAddress />
	</cffunction>

	<cffunction name="setFromEmailAddress" access="public" output="false" returntype="void">
		<cfargument name="fromEmailAddress" type="string" required="true" />
		<cfset VARIABLES.fromEmailAddress = ARGUMENTS.fromEmailAddress />
	</cffunction>
	
	<cffunction name="getEmailSubject" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.emailSubject />
	</cffunction>

	<cffunction name="setEmailSubject" access="public" output="false" returntype="void">
		<cfargument name="emailSubject" type="string" required="true" />
		<cfset VARIABLES.emailSubject = ARGUMENTS.emailSubject />
	</cffunction>
	
	<cffunction name="getEmailMessage" access="public" output="false" returntype="string">
		<cfreturn VARIABLES.emailMessage />
	</cffunction>

	<cffunction name="setEmailMessage" access="public" output="false" returntype="void">
		<cfargument name="emailMessage" type="string" required="true" />
		<cfset VARIABLES.emailMessage = ARGUMENTS.emailMessage />
	</cffunction>
				
</cfcomponent>