<cfoutput>
	<p>An error has occurred.  Full details about the problem have been sent to the developer.</p>
	<cfset VARIABLES.devEmail = "#REQUEST.devEmail#" />
	<cfset VARIABLES.applicationEmail = "#REQUEST.applicationEmail#" />
	<cfset VARIABLES.subject = "Error occurred on the Library Instruction Database" />
	<cfset VARIABLES.message = "CFM Template: #error.Template#
		Error Date/Time: #dateformat(error.DateTime,"dddd, mmmm d, yyyy")# #TimeFormat(error.DateTime)#<br />
		User's Browser: #error.Browser#<br />
		HTTP Referer: #error.HTTPReferer#<br />
		User's IP Address: #error.RemoteAddress#<br />
		Query String: #error.QueryString#<br />
		Error Details: #error.Diagnostics#" />
</cfoutput>
<cfscript>
	APPLICATION.obj_lisdEventController.sendMail(VARIABLES.devEmail, VARIABLES.applicationEmail, VARIABLES.subject, VARIABLES.message);
</cfscript>