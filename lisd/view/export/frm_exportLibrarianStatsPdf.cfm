<cfsilent>
<cfscript>
	// get data to populate FORM options
	recordSet = APPLICATION.obj_lisdFormController.getFormData();
	// generates drop down data / fiscal years
	yearStruct = APPLICATION.obj_lisdFormController.createDropDown();
</cfscript>
</cfsilent>

<h2>Export statistics by librarian</h2>
<cfflush interval="10" />
<cfoutput>
<div class="forms">
<br />
<form name="librarianStats" method="post" action="#REQUEST.rootPath#?page=exportLibrarianStatsPdf">
	<input name="getFiscalYearDataLib" type="hidden" value="getFiscalYearData" />
	<input name="getTotalStudentsByDepartmentLib" type="hidden" value="getTotalStudentsByDepartmentLib" />
	<input name="getTotalClassesByDepartmentLib" type="hidden" value="getTotalClassesByDepartment" />
	<input name="getTotalClassesByLocationLib" type="hidden" value="getTotalClassesByLocation" />
	<input name="getTotalClassesByClassTypeLib" type="hidden" value="getTotalClassesByClassType" />

	<input name="getFiscalYearTotalsLib" type="hidden" value="getFiscalYearTotals" />
	<input name="getTotalClassesByDepartmentYearLib" type="hidden" value="getTotalClassesByDepartmentYear" />
	<input name="getTotalStudentsByDepartmentYearLib" type="hidden" value="getTotalStudentsByDepartmentYearLib" />
	<input name="getTotalClassesByLocationYearLib" type="hidden" value="getTotalClassesByLocationYearLib" />
	<input name="getTotalClassesByClassTypeYearLib" type="hidden" value="getTotalClassesByClassTypeYearLib" />
	
	<cfif IsDefined("URL.librarianErrorMessage")>
		<font color="red">
			#URL.librarianErrorMessage#<br />
		</font>
	</cfif>	
	
	<select name="librarianID">
		<!--- option value is set to 0 to force selection --->
		<option value="0">Select a librarian&nbsp;</option>
		<option value="0">-----------------------</option>
		<cfloop query="recordSet.librarianResults">
        	<option value="#librarianID#" <cfif IsDefined("FORM.librarianID") AND FORM.librarianID EQ librarianID>selected</cfif>>#librarian#</option>
		</cfloop>
	</select>
	<br /><br />
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
	<br /><br />
	<!--- <input type="checkbox" name="checkall" onclick="checkUncheckAll(this);"/>&nbsp;&nbsp;<b>select all/unselect all</b>
	<br /><br /><br /> --->
	<input name="getStats" type="submit" value="Export Stats" />
</form>
<br />
</div>
</cfoutput>