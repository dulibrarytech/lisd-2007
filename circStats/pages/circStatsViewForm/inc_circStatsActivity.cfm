<cfsilent>
DESCRIPTION: Compiles and displays staff and student employee circulation statistics
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: 
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
</cfsilent>
<script type="text/javascript" src="includes/calendarDateInput.js">
/***********************************************
* Jason's Date Input Calendar- By Jason Moon http://calendar.moonscript.com/dateinput.cfm
* Script featured on and available at http://www.dynamicdrive.com
* Keep this notice intact for use.
***********************************************/
</script>
<cfoutput>
<cfif IsDefined("URL.activity") AND URL.activity EQ "staff">
	<cfset VARIABLES.employeeTypeID = 1 /><!--- staff --->
<cfelseif IsDefined("URL.activity") AND URL.activity EQ "student">
	<cfset VARIABLES.employeeTypeID = 2 /><!--- student --->
</cfif>
<!--- form action --->
<cfif IsDefined("FORM.submit")>
	<cfscript>
		// retrieve stats by the date range selected by the user
		currentStats = APPLICATION.circStatsController.getStats(VARIABLES.employeeTypeID, dateRange1, dateRange2);
	</cfscript>
<cfelse>
	<cfscript>
		// get current month's stats
		currentStats = APPLICATION.circStatsController.getCurrentStats(VARIABLES.employeeTypeID);
	</cfscript>
</cfif>
	<cfscript>
		// get interaction types
		types = APPLICATION.circStatsController.createViewStatForm();
	</cfscript>

<p id="loading">
<br /><font size="-1">Loading...</font><br />
<cfoutput>#repeatString("", 250)#</cfoutput>
</p>
<cfflush>
<!--- slow process --->
<cfscript>
go_to = createObject("java", "java.lang.Thread");
go_to.sleep(1000); //sleep time in milliseconds (1 sec.)</cfscript>
</cfscript>
<script language="javaScript">
loadingBlock = document.getElementById('loading');
loadingBlock.style.display='none';
</script>
<!--- end preload --->
<div class="viewStats"><!--- contains output on left side of the screen --->
<br />
<em>The stats for the current month and year are displayed by default.</em>
<h3>Circulation Activity <!--- by #URL.activity#&nbsp; ---><cfif IsDefined("FORM.submit")><br /><br />&nbsp;&nbsp;[#dateFormat(dateRange1, 'mmmm d, yyyy')# to #dateFormat(dateRange2, 'mmmm d, yyyy')#]<cfelse>(#dateFormat(now(), "mmmyy")#)</cfif></h3><br />
<cfoutput>
<table>
<cfloop query="types.questionType"><!--- outer loop / query nested in "types" structure--->
<tr>
	<td width="45%" align="right" valign="top">
		<font size="-2">
			<b>#types.questionType.questionType#:</b>&nbsp;&nbsp;
		</font>
	</td>
		<cfquery name="getQuestion" dbtype="query">
			SELECT	questionTypeID, interactionTypeID, questionTextType, dateCreated
			FROM	currentStats<!--- cached data (query of queries)--->
			WHERE	questionTypeID = <cfqueryparam value="#types.questionType.questionTypeID#" cfsqltype="cf_sql_integer" maxlength="10" />
		</cfquery>
	<td width="55%">
		<cfloop query="types.interactionType"><!--- inner loop / query nested in "types" structure --->
			<cfquery name="countInteraction" dbtype="query">
				SELECT	COUNT(interactionTypeID) AS interactionTypeCount
				FROM	getQuestion<!--- cached data (query of queries) --->
				WHERE	interactionTypeID = <cfqueryparam value="#types.interactionType.interactionTypeID#" cfsqltype="cf_sql_integer" maxlength="10" />
			</cfquery>
			<font size="-2">
				#types.interactionType.interactionType#:&nbsp;<cfif countInteraction.interactionTypeCount EQ "">0<cfelse>#countInteraction.interactionTypeCount#</cfif>
			</font>
		<br />
		</cfloop>
		<br />
	</td> 
</tr>
</cfloop>
</table>
</div>
<div id="statsForm"><!--- contains output on right side of the screen --->
<br /><br />
<!--- form begins --->
<cfform name="getStats" method="post" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#">
	<b>Get Stats By Date Range:</b><br /><br />
	 <script>DateInput('dateRange1', true, 'YYYY-MM-DD')</script><br />
	 <script>DateInput('dateRange2', true, 'YYYY-MM-DD')</script><br />
<cfinput name="submit" type="submit" value="Get Stats" />
</cfform> 
<!--- form ends --->
<br /><br /><br />

<h3><!---#URL.activity#&nbsp;--->Totals&nbsp;(#DateFormat(now(), 'yyyy')#)</h3>
<cfloop query="types.interactionType"><!--- loop over "types" structure --->
	<cfscript>
		totals = APPLICATION.circStatsController.getTotals(VARIABLES.employeeTypeID, types.interactionType.interactionTypeID);
	</cfscript>
	<b>#types.interactionType.interactionType#:</b>&nbsp;<cfif totals.interactionTypeTotal EQ "">0<cfelse>#totals.interactionTypeTotal#</cfif>
	<br />
</cfloop>
<br />

<!---
<br /><br />
<h3>staff and student totals&nbsp;(#DateFormat(now(), 'yyyy')#)</h3>
<cfloop query="types.interactionType"><!--- loop "types" structure --->
	<cfscript>
		// get totals for both staff and students
		allTotals = APPLICATION.circStatsController.getAllTotals(types.interactionType.interactionTypeID);
	</cfscript>
	<b>#types.interactionType.interactionType#:</b>&nbsp;<cfif allTotals.allTypeTotals EQ "">0<cfelse>#allTotals.allTypeTotals#</cfif>
	<br />
</cfloop>
--->

<!--- list of questions asked by patrons / under the "Other:" interactionType--->
<cfset arrayOther = arrayNew(1) />
<cfloop query="types.questionType">
	<cfquery name="getQuestion" dbtype="query">
		SELECT	DISTINCT questionTextType
		FROM	currentStats<!--- cached data (query of queries)--->
		WHERE	questionTypeID = <cfqueryparam value="#types.questionType.questionTypeID#" cfsqltype="cf_sql_integer" maxlength="10" />
	</cfquery>
	<cfloop query="getQuestion">
		<cfif getQuestion.questionTextType NEQ "">
			<cfset arrayAppend(arrayOther, "#getQuestion.questionTextType#") />
		</cfif>
	</cfloop>
</cfloop>
<br /><br /><br />
<h3>Other: Questions asked by patrons</h3><!---outputs questions for "Other" interactionType --->
<form>
<select name="otherQuestions" size="18" style="font-size:11px; width:300px; overflow: scroll;" >
	<cfloop from="1" to="#arrayLen(arrayOther)#" index="i" step="1">
		<option value="" style="font-size:11px; width:300px;">#arrayOther[i]#</option>
	</cfloop>
</select>
</form>
</cfoutput>
</div>
</cfoutput>
<div class="clear"></div>