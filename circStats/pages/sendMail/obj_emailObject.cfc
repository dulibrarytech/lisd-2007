<cfcomponent displayname="emailObject" output="false" hint="">
	
	<cffunction name="sendMail" access="public" output="false" returntype="void" hint="send email with error details">
	
		<!--- take emailClass bean as argument --->
		<cfargument name="emailClass" type="circStats.pages.sendMail.obj_emailClass" required="true" />
				
		<!--- initialize variables --->
		<cfset var sendMail = 0 />
			
		<!--- send email --->
			<cfmail to="#ARGUMENTS.emailClass.getToEmailAddress()#" 
				from="#ARGUMENTS.emailClass.getFromEmailAddress()#" 
					subject="#ARGUMENTS.emailClass.getEmailSubject()#" 
						type="html">
				#ARGUMENTS.emailClass.getEmailMessage()#
			</cfmail>
											
	</cffunction>
	
</cfcomponent>