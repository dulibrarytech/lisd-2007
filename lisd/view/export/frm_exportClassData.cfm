<cfsilent>
<cfscript>
	// get data to populate FORM options
	recordSet = APPLICATION.obj_lisdFormController.getFormData();
	// generates drop down data / fiscal years
	yearStruct = APPLICATION.obj_lisdFormController.createDropDown();
</cfscript>
</cfsilent>

<h2>Export class data</h2>
<br />
<cfoutput>
<div class="forms">
	<cfif IsDefined("URL.librarianErrorMessage")>
		<font color="red">
			#URL.librarianErrorMessage#<br />
		</font>
	</cfif>
<cfflush />
<form name="librarianClassData" method="post" action="#REQUEST.rootPath#?page=exportClassData">
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
	<!---
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
	--->
	
	
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
	<input name="getClassData" type="submit" value="Export Stats" />
</form>
<br />
</div>
</cfoutput>