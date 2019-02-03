<cfsilent>
DESCRIPTION: Compiles and displays hourly circulation statistics
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: 
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
</cfsilent>
<cfparam name="FORM.dateType" default="NULL" />
<cfif IsDefined("FORM.submit")>
	<cfscript>
		// get totals for both staff and students by date selected by user
		hourlyStats = APPLICATION.circStatsController.getHourlyStats(FORM.cDate, FORM.dateType);
	</cfscript>
<cfelse>
	<cfset VARIABLES.cDate = #now()# />
	<cfscript>
		// get totals for both staff and students
		hourlyStats = APPLICATION.circStatsController.getHourlyStats(VARIABLES.cDate, FORM.dateType);
	</cfscript>
</cfif>

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
<!--- end preloadnow() --->
<cfoutput>
<script type="text/javascript" src="includes/calendarDateInput.js">
/***********************************************
* Jason's Date Input Calendar- By Jason Moon http://calendar.moonscript.com/dateinput.cfm
* Script featured on and available at http://www.dynamicdrive.com
* Keep this notice intact for use.
***********************************************/
</script>
<div class="viewStats">
<br />
<h3>Circulation Activity by HOUR&nbsp;<cfif NOT IsDefined("FORM.submit")>(#dateFormat(now(), "mmmyy")#)</cfif>
<cfif IsDefined("FORM.submit")>
	<cfif IsDefined("FORM.dateType") AND FORM.dateType EQ "cDay">
		(#dateFormat(cDate, 'mmmm d, yyyy')#)
	<cfelseif IsDefined("FORM.dateType") AND FORM.dateType EQ "cYear">
		(#dateFormat(cDate, 'yyyy')#)
	<cfelse>
		(#dateFormat(cDate, 'mmmyy')#)
	</cfif>
</cfif> 
</h3><br />
<b>HOUR</b><br /><br />
<table>
	<tr>
		<td align="right"><font size="-1">12am - 1am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[1]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">1am - 2am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[2]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">2am - 3am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[3]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">3am - 4am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[4]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">4am - 5am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[5]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">5am - 6am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[6]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">6am - 7am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[7]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">7am - 8am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[8]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">8am - 9am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[9]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">9am - 10am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[10]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">10am - 11am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[11]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">11am - 12pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[12]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">12pm - 1pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[13]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">1pm - 2pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[14]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">2pm - 3pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[15]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">3pm - 4pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[16]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">4pm - 5pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[17]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">5pm - 6pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[18]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">6pm - 7pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[19]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">7pm - 8pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[20]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">8pm - 9pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[21]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">9pm - 10pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[22]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">10pm - 11pm:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[23]#</font></td>
	</tr>
	<tr>
		<td align="right"><font size="-1">11pm - 12am:</font></td>
		<td>&nbsp;&nbsp;<font size="-1">#hourlyStats[24]#</font></td>
	</tr>
</table>
<br />
</div>
<div id="statsForm">
<br />
<!--- form begins --->
<cfform name="getStats" method="post" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#">
	<br /><br />
	<input name="byHour" type="hidden" value="hour" />
	<b>Get Stats By Month, day, and year:</b><br /><br />
	 <script>DateInput('cDate', true, 'YYYY-MM-DD')</script><br />
	
	 Get Hourly stats by:<br /><br />
	 <input name="dateType" type="radio" value="cDay" />&nbsp;Day&nbsp;<em>(input day above)<br />
	 <font size="-3">Selecting this option will get stats for the specified DAY.  ex. May 6, 2007 or June 23, 2007</font></em><br /><br />
	 <input name="dateType" type="radio" value="cYear" />&nbsp;Year Only&nbsp;<em>(input year above)<br />
	 <font size="-3">Selecting this option will get stats for the entire YEAR specified  ex. 2006 or 2007</font></em><br /><br />
	<cfinput name="submit" type="submit" value="Get Stats" />
</cfform>
<!--- form ends --->
<br />
</cfoutput>
</div>
<div class="clear"></div>