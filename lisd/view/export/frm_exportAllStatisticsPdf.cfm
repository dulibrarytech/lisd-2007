<cfoutput>
<cfsilent>
<cfscript>
	// generates drop down data / fiscal years
	yearStruct = APPLICATION.obj_lisdFormController.createDropDown();
</cfscript>
</cfsilent>

<cfflush interval="10" />
<h2>Export all statistics</h2>
<div class="forms">
<form name="allStats" method="post" action="#REQUEST.rootPath#?page=exportAllStatsPdf">
	<cfif IsDefined("URL.selectedDateErrorMessage")>
		<font color="red">
			#URL.selectedDateErrorMessage#<br />
		</font>
	</cfif>
	<b>Select fiscal year range:</b><br />	
	
	<!--- get current/next year --->
	<cfset currentYear = year(now()) />
	<cfset nextYear = currentYear + 1 />
	
	<select name="selectedDateStart">
		<cfloop from="1" to="#arrayLen(yearStruct.startYear)#" index="i" step="1">
			<cfif yearStruct.startYear[i] EQ currentYear >
				<option selected value="#yearStruct.startYear[i]#">#yearStruct.startYear[i]#</option>
			<cfelse>
				<option value="#yearStruct.startYear[i]#">#yearStruct.startYear[i]#</option>
			</cfif>
		</cfloop>
	</select>
					
	<select name="selectedDateEnd">
		<cfloop from="1" to="#arrayLen(yearStruct.endYear)#" index="i" step="1">
			<cfif yearStruct.endYear[i] EQ nextYear > 
				<option selected value="#yearStruct.endYear[i]#">#yearStruct.endYear[i]#</option>
			<cfelse>
				<option value="#yearStruct.endYear[i]#">#yearStruct.endYear[i]#</option>
			</cfif>
		</cfloop>
	</select>
	<br /><br />
	<input name="getStatsByMonth" type="checkbox" value="getStatsByMonth" checked  />&nbsp;&nbsp;Get Fiscal Year Monthly Totals
	<br />
	<input name="getStatsByYear" type="checkbox" value="getStatsByYear" checked />&nbsp;&nbsp;Get Fiscal Year Totals
	<br />
	<!--- <input type="checkbox" name="checkall" onclick="checkUncheckAll(this);"/>&nbsp;&nbsp;<b>select all/unselect all</b> --->
	<br />
	<input name="getStats" type="submit" value="Get Stats" />
</form>
</div>
</cfoutput>