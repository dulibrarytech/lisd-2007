<cfoutput>
<cfflush interval="10" />
<cfscript>
	// get data to populate FORM options
	recordSet = APPLICATION.obj_lisdFormController.getFormData();
	// generates drop down data / fiscal years
	yearStruct = APPLICATION.obj_lisdFormController.createDropDown();
</cfscript>
<br />
<h2>Print statistics by librarian</h2>
<br />
<div class="forms">
	<cfif IsDefined("URL.librarianErrorMessage")>
		<font color="red">
			#URL.librarianErrorMessage#<br />
		</font>
	</cfif>
<br />
<form name="librarianStats" method="post" action="#REQUEST.rootPath#view/printStats/dsp_printStats.cfm"><!--- ?page=viewPrintStats --->
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
	<select name="selectedDateStart">
		<cfloop from="1" to="#arrayLen(yearStruct.startYear)#" index="i" step="1">
			<option value="#yearStruct.startYear[i]#">#yearStruct.startYear[i]#</option>
		</cfloop>
	</select>
	<select name="selectedDateEnd">
		<cfloop from="1" to="#arrayLen(yearStruct.endYear)#" index="i" step="1">
			<option value="#yearStruct.endYear[i]#">#yearStruct.endYear[i]#</option>
		</cfloop>
	</select>
	<br /><br />
	<strong>Stats by month:</strong><br />
	<input name="getFiscalYearDataLib" type="checkbox" value="getFiscalYearData" />&nbsp;Total Students<br />
	<input name="getTotalStudentsByDepartmentLib" type="checkbox" value="getTotalStudentsByDepartmentLib" />&nbsp;Total Students by Department<br />
	<input name="getTotalClassesByDepartmentLib" type="checkbox" value="getTotalClassesByDepartment" />&nbsp;Total Classes by Department<br />
	<input name="getTotalClassesByLocationLib" type="checkbox" value="getTotalClassesByLocation" />&nbsp;Total Classes by Location<br />
	<input name="getTotalClassesByClassTypeLib" type="checkbox" value="getTotalClassesByClassType" />&nbsp;Total Classes by Class Type<br /><br />
	<strong>Stats by Year:</strong><br />
	<input name="getFiscalYearTotalsLib" type="checkbox" value="getFiscalYearTotals" />&nbsp;Total Students<br />
	<input name="getTotalClassesByDepartmentYearLib" type="checkbox" value="getTotalClassesByDepartmentYear" />&nbsp;Total Students by Department<br />
	<input name="getTotalStudentsByDepartmentYearLib" type="checkbox" value="getTotalStudentsByDepartmentYearLib" />&nbsp;Total Classes by Department<br />
	<input name="getTotalClassesByLocationYearLib" type="checkbox" value="getTotalClassesByLocationYearLib" />&nbsp;Total Classes by Location<br />
	<input name="getTotalClassesByClassTypeYearLib" type="checkbox" value="getTotalClassesByClassTypeYearLib" />&nbsp;Total Classes by Class Type<br />
	<br /><br />
	<input name="getStats" type="submit" value="Get Stats" />
</form>
<br />
</div>
</cfoutput>