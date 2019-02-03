<cfoutput>
<link rel="stylesheet" href="#REQUEST.rootPath#includes/circStatsForms.css" type="text/css" />
</cfoutput>
<div id="mainContainer">
	<div id="header">
	<h3>Circulation Stats</h3>
	</div>
<div class="outer">
<div class="inner">
 	<div class="contentWrap"> 
<p>
<b>Error </b> 
<br />
<br />
[A message has been sent to the Developer with full details.]
<br /><br />
Please Try Again Later.<br /><br />

<cfset REQUEST.emailMessage = 
"
	<!---CFM Template: #error.Template#<br>  page that had error --->
	Error Date/Time: #dateformat(error.dateTime,"dddd, mmmm d, yyyy")# #TimeFormat(error.dateTime)#<br>
	User's Browser: #error.browser#<br> <!--- client browser --->
	Error Location: #error.HTTPReferer#<br> <!--- what page did they come from before they got error --->
	Query String: #error.queryString#<br> <!--- show url variables --->
	User's IP Address: #error.RemoteAddress#<br> <!--- client ip address --->
	Error Details: #error.Diagnostics#<br> <!--- coldfusion error message --->

" /> 
</p> 
<cfscript>
	// instantiates object - passess form variables to init function 
	emailClass = CreateObject ("component", 
		"#REQUEST.cfcPath#sendMail.obj_emailClass").init(REQUEST.toEmailAddress, REQUEST.fromEmailAddress, 
													REQUEST.emailSubject, REQUEST.emailMessage);
								
	// executes method and sends email with error details to developer
	APPLICATION.emailObject.sendMail(emailClass);
</cfscript>
</div>
</div>
</div>
</div>