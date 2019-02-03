<cfcomponent output="false" hint="sends mail">
	
	<cffunction name="sendMail" access="public" output="false" returntype="void">
		<cfargument name="devEmail" type="string" required="true" />
		<cfargument name="applicationEmail" type="string" required="true" />
		<cfargument name="subject" type="string" required="true" />
		<cfargument name="message" type="string" required="true" />
		<cfset var sendMail =  "" />
		<!--- send email --->
			<cfmail to="#ARGUMENTS.devEmail#" 
				from="#ARGUMENTS.applicationEmail#" 
						subject="#ARGUMENTS.subject#" 
							type="html">
				#ARGUMENTS.message#
			</cfmail>
	</cffunction>
	
</cfcomponent>