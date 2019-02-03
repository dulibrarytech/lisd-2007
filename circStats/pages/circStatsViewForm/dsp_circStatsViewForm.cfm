<cfsilent>
<!---
DESCRIPTION: Displays circulation statistics
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: 
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->

<cflock scope="application" timeout="10" type="exclusive">
<cfscript>
	// executes getCurrentYearTotal method
	getCurrentYearTotal = APPLICATION.circStatsTotal.getCurrentYearTotal();
	
	// executes getCurrentMonthTotal method
	getCurrentMonthTotal = APPLICATION.circStatsTotal.getCurrentMonthTotal();
	
	// executes getCurrentDayTotal method
	getCurrentDayTotal = APPLICATION.circStatsTotal.getCurrentDayTotal();
	
	// executes getCurrentDayTotal method
	getCurrentHourTotal = APPLICATION.circStatsTotal.getCurrentHourTotal();
			
	// executes read method
	readInteractionType = APPLICATION.interactionTypeDAO.read();
	
	// executes read method
	readQuestionType = APPLICATION.questionTypeDAO.read();
</cfscript>
</cflock>

</cfsilent>

<cfoutput>

<p>(!!Beta!!)<br />
<!--- displays yearly, monthly, daily, and hourly totals --->
<b>Total clicks this year:</b>&nbsp;#getCurrentYearTotal.yearTotal#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>Total clicks this month:</b>&nbsp;#getCurrentMonthTotal.monthTotal#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<b>Total clicks today:</b>&nbsp;#getCurrentDayTotal.dayTotal#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<b>Total clicks this hour:</b>&nbsp;#getCurrentHourTotal.hourTotal# 
</p> 
<br />
<!--- menu items --->
[<a href="#cgi.SCRIPT_NAME#?page=#URL.page#&activity=staff">Circulation Activity <!--- By Staff ---></a>]
<!--- [<a href="#cgi.SCRIPT_NAME#?page=#URL.page#&activity=student">Circulation Activity By Student</a>] --->
[<a href="#cgi.SCRIPT_NAME#?page=#URL.page#&activity=totalsByHour">All Circulation Transactions By HOUR</a>]

<br /><br />
<!--- activity types pulled in depending on URL variable --->
<cfparam name="URL.activity" default="" />
<cfswitch expression="#URL.activity#">
	<cfcase value="staff">
		<cfinclude template="inc_circStatsActivity.cfm" />
	</cfcase>
	<cfcase value="student">
		<cfinclude template="inc_circStatsActivity.cfm" />
	</cfcase>
	<cfcase value="totalsByHour">
		<cfinclude template="inc_circStatsAllTransActionsByHour.cfm" />
	</cfcase>
</cfswitch>		

</cfoutput>