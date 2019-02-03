<cfset fileName = now() />

<cfheader name="Content-Disposition" value="inline; filename=#DateFormat(fileName, "mmm-dd-yyyy")#-class-data.xls">
<cfcontent type="application/vnd.msexcel">

<cfif NOT IsDefined("FORM.librarianID")><cflocation url="#REQUEST.rootPath#?page=frmClassData" addtoken="false" /></cfif>
<cfoutput>
<!--- css/js for this template only / highlights table rows 
<link rel="stylesheet" href="#REQUEST.assetPath#view/includes/tablecloth.css" type="text/css" />
<script type="text/javascript" src="#REQUEST.assetPath#view/js/tablecloth.js"></script>
--->
</cfoutput>
<cfsilent>
<!--- FORM VALIDATION --->
<cfif IsDefined("FORM.librarianID")>
	<cfscript>
		//validates FORM values
		validate = APPLICATION.obj_lisdFormController.formValidation(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	</cfscript>
	<cfif IsDefined("validate.error") AND validate.error>
		<cfif IsDefined("validate.librarianError") AND validate.librarianError>
			<cfset VARIABLES.librarianError = "&librarianErrorMessage=#validate.librarianMessage#" />
		<cfelse>
			<cfset VARIABLES.librarianError = "" />
		</cfif>
		<cfif IsDefined("validate.selectedDateError") AND validate.selectedDateError>
			<cfset VARIABLES.selectedDateError = "&selectedDateErrorMessage=#validate.selectedDateMessage#" />
		<cfelse>
			<cfset VARIABLES.selectedDateError = "" />
		</cfif>
		<cflocation url="#cgi.HTTP_REFERER##VARIABLES.librarianError##VARIABLES.selectedDateError#" addtoken="false" /> 
		<cfabort>
	</cfif>
<!--- FORM VALIDATION ENDS --->
</cfif>

<cfparam name="URL.orderBy" default="department" />
<cfparam name="URL.lastSort" default="null" />

<cfif URL.lastSort NEQ URL.orderBy>
	<cfset URL.sortField = 0 />
<cfelse>
	<cfif URL.sortField EQ 0>
		<cfset URL.sortField = 1 />
	<cfelse>
		<cfset URL.sortField = 0 />
	</cfif>
</cfif>

<cfif IsDefined("URL.selectedDateStart")>
	<cfscript>
		// gets and sorts class data
		classDataRecordSet = APPLICATION.obj_lisdClassDataController.sortClassData(URL.librarianID, URL.selectedDateStart, URL.selectedDateEnd, URL.orderBy, URL.sortField);
	</cfscript>
<cfelse>
	<cfscript>
		// gets class data based on librarianID
		classDataRecordSet = APPLICATION.obj_lisdClassDataController.getClassData(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	</cfscript>
</cfif>

<cfif IsDefined("FORM.librarianID") OR IsDefined("URL.librarianID")>
	<cfset VARIABLES.librarianID = "#librarianID#" /><!--- takes var from both form and url scope --->
	<cfscript>
		// get librarian name 
		librarianNameResults = APPLICATION.obj_lisdStatsController.getLibrarianName(VARIABLES.librarianID);	
	</cfscript>
</cfif>
</cfsilent>

<cfflush>	
<cfoutput>
<h2>#librarianNameResults.librarian#</h2>
<cfif IsDefined("FORM.librarianID") OR IsDefined("URL.librarianID")>
	<cfset VARIABLES.selectedDateStart = "#selectedDateStart#" /><!--- takes var from both form and url scope --->
	<cfset VARIABLES.selectedDateEnd = "#selectedDateEnd#" /><!--- takes var from both form and url scope --->
	<h2>#VARIABLES.selectedDateStart# to #VARIABLES.selectedDateEnd# Fiscal Year</h2>
</cfif>

<b>#classDataRecordSet.classData.recordCount# Class<cfif classDataRecordSet.classData.recordCount GT 1>es</cfif></b>
<table width="100%" border="1px"><!---  cellpadding="8" cellspacing="1" --->
	 <tr align="center">
		<th>
			Department
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=department&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Department');return false">Department</a>&nbsp;
			<cfif URL.orderBy EQ "department"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Class Name
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=className&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Name');return false">CN</a>&nbsp;
			<cfif URL.orderBy EQ "className"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Class Date
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=classDate&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Date');return false">CD</a>&nbsp;
			<cfif URL.orderBy EQ "classDate"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Course Number
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=courseNumber&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Course Number');return false">CN</a>&nbsp;
			<cfif URL.orderBy EQ "courseNumber"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Class Type
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=classType&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Type');return false">CT</a>&nbsp;
			<cfif URL.orderBy EQ "classType"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Instructor
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=instructor&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Instructor');return false">I</a>&nbsp;
			<cfif URL.orderBy EQ "instructor"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
			--->
		</th>
		<th>
			Undergraduates
			<!---
			<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Undergraduates');return false">U</a>
			--->
		</th>
		<th>
			Graduates
			<!---
			<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Graduates');return false">G</a>
			--->
		</th>
		<th>
			Faculty
			<!---
			<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Faculty');return false">F</a>
			--->
		</th>
		<th>
			Other
			<!---
			<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Other');return false">O</a>
			--->
		</th>
		<th>
			Location
			<!---
			<a href="#REQUEST.rootPath#?page=classData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=location&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Location');return false">L</a>&nbsp;
			<cfif URL.orderBy EQ "location"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="desc" /></cfif></cfif>
			--->
		</th>
	</tr>
	<cfloop query="classDataRecordSet.classData">
	<tr align="center">
		<td>#classDataRecordSet.classData.department#</td>
		<td>#classDataRecordSet.classData.className#</td>
		<td>#DateFormat(classDataRecordSet.classData.classDate, "mm/dd/yyyy")#</td>
		<td>#classDataRecordSet.classData.courseNumber#</td>
		<td>#classDataRecordSet.classData.classType#</td>
		<td>#classDataRecordSet.classData.instructor#</td>
		<td>#classDataRecordSet.classData.undergraduates#</td>
		<td>#classDataRecordSet.classData.graduates#</td>
		<td>#classDataRecordSet.classData.faculty#</td>
		<td>#classDataRecordSet.classData.other#</td>
		<td>#classDataRecordSet.classData.location#</td>
	</tr>	
	</cfloop>
</table>
</cfoutput>
<cfabort>