<cfscript>
	// execute method to get all question types
	getQuestionTypeRecordCount = APPLICATION.questionTypeDAO.getQuestionTypeRecordCount();
</cfscript>

<!--- default values for pop-up capture form --->
<cfset VARIABLES.baseHeight =  275 />
<cfset VARIABLES.baseRecordCount = 4 />

<cfoutput>
<cfif getQuestionTypeRecordCount.recordCount GT VARIABLES.baseRecordCount>

	<cfset VARIABLES.heightIncrement =  #getQuestionTypeRecordCount.recordCount# * 25 /><!--- 25 is a random number that I chose --->
	<cfset VARIABLES.newHeight = #VARIABLES.baseHeight# + #VARIABLES.heightIncrement# />

<cfelseif getQuestionTypeRecordCount.recordCount LTE 4>
	<cfset VARIABLES.newHeight = #VARIABLES.baseHeight# />
</cfif> 

<!--- links used in question type and interaction type forms --->
<cfif IsDefined ("URL.page") AND URL.page EQ "questionTypeForm" OR URL.page EQ "interactionTypeForm">
	<a href="#REQUEST.rootPath#?page=questionTypeForm">Question Type</a>&nbsp;|&nbsp;
	<a href="#REQUEST.rootPath#?page=interactionTypeForm">Interaction Type</a>
<cfelse>
<!--- javaScript used to "pop up" the stats capture form --->
<script type="text/javascript">
<!-- Begin
	function popUp(URL) {
	day = new Date();
	id = day.getTime();
	eval("page" + id + " = window.open(URL,'" + id + "','toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=325, height=#VARIABLES.newHeight#,left = 0,top = 0');");
	}
// End -->
</script>
	<!--- links used to render the capture and view statistics forms --->
	<a href="javascript:popUp('#REQUEST.rootPath#?page=stats')">Get Stats</a>
		&nbsp;|&nbsp;
	 <a href="#REQUEST.rootPath#?page=viewStatsForm&activity=staff">View Stats</a> 
</cfif>
</cfoutput>