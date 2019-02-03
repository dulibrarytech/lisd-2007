<cfif NOT ISDefined("SESSION.userID")>
	<cflocation url="#REQUEST.rootPath#?page=login" addtoken="false" />
</cfif> 
<cfoutput>
<!--- css/js for this template only / highlights table rows --->
<link rel="stylesheet" href="#REQUEST.assetPath#view/includes/tablecloth.css" type="text/css" />
<script type="text/javascript" src="#REQUEST.assetPath#view/js/tablecloth.js"></script>
<cfswitch expression="#action#">
<!--- ============================================================================= --->	
	<cfcase value="add">
		<cfif IsDefined("SESSION.role") AND SESSION.role EQ 1><cflocation url="#REQUEST.rootPath#?page=admin&action=frmClassData" addtoken="false" /></cfif>
		<cfif IsDefined("FORM.fieldNames")>
			<!--- FORM VALIDATION --->
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
				method="formValidation" 
					returnvariable="validate" 
						argumentcollection="#FORM#" />
			
			<cfif NOT IsDefined("validate.error")>
				<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
					method="captureAdminFormData" 
						returnvariable="message" 
							argumentcollection="#FORM#" />	
				<br /><br /><br />
				<cfoutput><strong>#message#</strong></cfoutput><br />
				<cfheader name="refresh" value="2;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfabort>
			</cfif>
		</cfif>
		
		<!--- FORM BEGINS --->
		<cfparam name="librarian" default="" />
		<cfparam name="department" default="" />
		<cfparam name="classType" default="" />
		<cfparam name="location" default="" />
		<h2>Add/Edit</h2>
		<div class="forms">
		
			<form name="addLibrarian" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<b>Librarian:</b><br />
				<cfif IsDefined("validate.librarianError") AND validate.librarianError><font color="red">*&nbsp;#validate.librarianMessage#</font></cfif>
				<input name="librarian" type="text" size="30" value="#librarian#" />
				<input name="addLibrarian" type="submit" value="Add" />
			</form>
			<br />
			<form name="addDepartment" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<b>Department:</b><br />
				<cfif IsDefined("validate.departmentError") AND validate.departmentError><font color="red">*&nbsp;#validate.departmentMessage#</font></cfif>
				<input name="department" type="text" size="30" value="#department#" />
				<input name="addDepartment" type="submit" value="Add" />
			</form>
			<br />
			<form name="addClassType" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<b>Class Type:</b><br />
				<cfif IsDefined("validate.classTypeError") AND validate.classTypeError><font color="red">*&nbsp;#validate.classTypeMessage#</font></cfif>
					<input name="classType" type="text" size="30" value="#classType#" />
					<input name="addClassType" type="submit" value="Add" />
			</form>
			<br />
			<form name="addLocation" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">	
				<b>Location:</b><br />
				<cfif IsDefined("validate.locationError") AND validate.locationError><font color="red">*&nbsp;#validate.locationMessage#</font></cfif>
					<input name="location" type="text" size="30" value="#location#" />
					<input name="addLocation" type="submit" value="Add" />
			</form><br /><br />
		</div>
	</cfcase>
<!--- ============================================================================= --->
	<cfcase value="edit">
		<cfif IsDefined("FORM.Update")>
			<!--- FORM VALIDATION --->
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
				method="formValidation" 
					returnvariable="validate" 
						argumentcollection="#FORM#" />
			
			<cfif NOT IsDefined("validate.error")>
				<cfif NOT IsDefined("FORM.isActive")><cfset FORM.isActive = 1 /><cfelse><cfset FORM.isActive = 0 /></cfif>
				<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
					method="updateAdminFormData" 
						returnvariable="message" 
							argumentcollection="#FORM#" />	
				<br /><br /><br />
				<cfoutput><strong>#message#</strong></cfoutput><br />
				<cfheader name="refresh" value="2;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfabort>
			</cfif>
		</cfif>
		<cfif IsDefined("FORM.delete")>
			<!--- FORM VALIDATION --->
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
				method="formValidation" 
					returnvariable="validate" 
						argumentcollection="#FORM#" />
			
			<cfif NOT IsDefined("validate.error")>
				<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
					method="deleteAdminFormData" 
						returnvariable="message" 
							argumentcollection="#FORM#" />	
				<br /><br /><br />
				<cfoutput><strong>#message#</strong></cfoutput><br />
				<cfheader name="refresh" value="2;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfabort>
			</cfif>
		</cfif>
		<cfif IsDefined("FORM.librarianID") OR IsDefined("FORM.departmentID") OR IsDefined("FORM.classTypeID") OR IsDefined("FORM.locationID") AND NOT IsDefined("FORM.update")>
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" 
				method="editAdminFormData" 
					returnvariable="editResults" 
						argumentcollection="#FORM#" />
		</cfif>		
		<cfscript>
			// get data to populate FORM options
			recordSet = APPLICATION.obj_lisdFormController.getAdminFormData();
		</cfscript>
	
		<!--- FORM BEGINS --->
		<cfparam name="librarian" default="" />
		<cfparam name="department" default="" />
		<cfparam name="classType" default="" />
		<cfparam name="location" default="" />
		
		<h2>Add/Edit</h2>
		<div class="forms">
		
			<form name="addLibrarian" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfif IsDefined("validate.librarianError") AND validate.librarianError><font color="red">*</font></cfif>
				<select name="librarianID" onChange="submit();">
					<!--- option value is set to 0 to force selection --->
					<option value="0">Select a librarian to edit&nbsp;</option>
					<option value="0">-----------------------</option>
				<cfloop query="recordSet.librarianResults">
		        	<option value="#librarianID#" <cfif IsDefined("FORM.librarianID") AND FORM.librarianID EQ librarianID>selected</cfif>>#librarian#</option>
				</cfloop>
				</select>
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form name="addDepartment" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfif IsDefined("validate.departmentError") AND validate.departmentError><font color="red">*</font></cfif>
				<select name="departmentID" onChange="submit();">
					<!--- option value is set to 0 to force selection --->
					<option value="0">Select a department to edit&nbsp;</option>
					<option value="0">-----------------------</option>
				<cfloop query="recordSet.departmentResults">
		        	<option value="#departmentID#" <cfif IsDefined("FORM.departmentID") AND FORM.departmentID EQ departmentID>selected</cfif>>#department#<cfif isActive EQ 1>&nbsp;&nbsp;[not active]</cfif></option>
				</cfloop>
				</select><br />
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form name="addClassType" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
				<cfif IsDefined("validate.classTypeError") AND validate.classTypeError><font color="red">*</font></cfif>
				<select name="classTypeID" onChange="submit();">
					<!--- option value is set to 0 to force selection --->
					<option value="0">Select a class type to edit&nbsp;</option>
					<option value="0">-----------------------</option>
				<cfloop query="recordSet.classTypeResults">
		        	<option value="#classTypeID#" <cfif IsDefined("FORM.classTypeID") AND FORM.classTypeID EQ classTypeID>selected</cfif>>#classType#</option>
				</cfloop>
				</select><br />
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form name="addLocation" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">	
				<select name="locationID" onChange="submit();">
					<!--- option value is set to 0 to force selection --->
					<option value="0">Select a location to edit&nbsp;</option>
					<option value="0">-----------------------</option>
				<cfloop query="recordSet.locationResults">
		        	<option value="#locationID#" <cfif IsDefined("FORM.locationID") AND FORM.locationID EQ locationID>selected</cfif>>#location#</option>
				</cfloop>
				</select><br />
			</form>	
			<br /><br /><br />	
			<form name="addLocation" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">	
				<cfif IsDefined("FORM.librarianID")> 
					<input name="librarianID" type="hidden" value="#FORM.librarianID#" />
					<input name="librarian" type="text" size="20" value="#editResults.librarian#" />
					<input name="update" type="submit" value="Update" /><br /><br />
					<input name="isActive" type="checkbox" value="#editResults.isActive#" <cfif editResults.isActive EQ 0>checked</cfif> />Active if checked
					<!--- <input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
				</cfif>
				<cfif IsDefined("FORM.departmentID")>
					<input name="departmentID" type="hidden" value="#FORM.departmentID#" />
 					<input name="department" type="text" size="20" value="#editResults.department#" />
					<input name="update" type="submit" value="Update" /><br /><br />
					<input name="isActive" type="checkbox" value="#editResults.isActive#" <cfif editResults.isActive EQ 0>checked</cfif> />Active if checked
					<!--- <input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
				</cfif>
				<cfif IsDefined("FORM.classTypeID")>
					<input name="classTypeID" type="hidden" value="#FORM.classTypeID#" />
					<input name="classType" type="text" size="20" value="#editResults.classType#" />
					<input name="update" type="submit" value="Update" /><br /><br />
					<input name="isActive" type="checkbox" value="#editResults.isActive#" <cfif editResults.isActive EQ 0>checked</cfif> />Active if checked
					<!--- <input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
				</cfif>
				<cfif IsDefined("FORM.locationID")>
					<!---<cfdump var="#editResults#" />--->
					<input name="locationID" type="hidden" value="#FORM.locationID#" />
					<input name="location" type="text" size="20" value="#editResults.location#" />
					<input name="update" type="submit" value="Update" /><br /><br />
					<input name="isActive" type="checkbox" value="#editResults.isActive#" <cfif editResults.isActive EQ 0>checked</cfif> />Active if checked
					<!--- <input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
				</cfif>
			</form>
			<br /><br />
		</div>
	</cfcase>
<!--- ============================================================================= --->
	<cfcase value="frmClassData">
		<cfscript>
			// get data to populate FORM options
			recordSet = APPLICATION.obj_lisdFormController.getFormData();
			// generates drop down data / fiscal years
			yearStruct = APPLICATION.obj_lisdFormController.createDropDown();
		</cfscript>
		
		<h2>Edit Class Data</h2>
				
		<div class="forms">
			
		<cfif IsDefined("URL.librarianErrorMessage")>
			<font color="red">
				#URL.librarianErrorMessage#
			</font>
		</cfif>
		
		<form name="librarianClassData" method="post" action="#REQUEST.rootPath#?page=admin&action=viewClassData">
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
			<input name="getClassData" type="submit" value="Get Stats" />
		</form>
		</div>
	</cfcase>
<!--- ============================================================================= --->
	<cfcase value="viewClassData">
		<cfif NOT IsDefined("FORM.librarianID") AND NOT IsDefined("URL.librarianID")><cflocation url="#REQUEST.rootPath#?page=admin&action=frmClassData" addtoken="false" /></cfif>
		<cfsilent>
		<cfif IsDefined("FORM.librarianID")>
			<!--- FORM VALIDATION --->
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
		</cfif>
		<!--- FORM VALIDATION ENDS --->
		
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
				// gets class Data
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
		<h2>#librarianNameResults.librarian#</h2>
		<cfif IsDefined("FORM.librarianID") OR IsDefined("URL.librarianID")>
			<cfset VARIABLES.selectedDateStart = "#selectedDateStart#" /><!--- takes var from both form and url scope --->
			<cfset VARIABLES.selectedDateEnd = "#selectedDateEnd#" /><!--- takes var from both form and url scope --->
			<h2>#VARIABLES.selectedDateStart# to #VARIABLES.selectedDateEnd# Fiscal Year</h2>
		</cfif>
		
		<div class="displayStats">
    		<b>#classDataRecordSet.classData.recordCount# Class<cfif classDataRecordSet.classData.recordCount GT 1>es</cfif></b>
			<table width="100%" cellpadding="5" cellspacing="2">
				<tr align="center" bgcolor="##FFE271">
					<th><a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Click on an icon below to edit the record');return false">Edit</a></th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=department&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Department');return false">D</a>&nbsp;
						<cfif URL.orderBy EQ "department"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
					</th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=className&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Name');return false">CN</a>&nbsp;
						<cfif URL.orderBy EQ "className"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>	
					</th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=classDate&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Date');return false">CD</a>&nbsp;
						<cfif URL.orderBy EQ "classDate"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
					</th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=courseNumber&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Course Number');return false">CN</a>&nbsp;
						<cfif URL.orderBy EQ "courseNumber"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
					</th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=classType&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Class Type');return false">CT</a>&nbsp;
						<cfif URL.orderBy EQ "classType"><cfif URL.sortField EQ 0><img src="#REQUEST.rootPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.rootPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
					</th>
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=instructor&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Instructor');return false">I</a>&nbsp;
						<cfif URL.orderBy EQ "instructor"><cfif URL.sortField EQ 0><img src="#REQUEST.assetPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.assetPath#view/images/up_arrow.gif" border="0" alt="asc" /></cfif></cfif>
					</th>
					<th>
						<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Undergraduates');return false">U</a>
					</th>
					<th>
						<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Graduates');return false">G</a>
					</th>
					<th>
						<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Faculty');return false">F</a>
					</th>
					<th>
						<a href="##" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Other');return false">O</a>
					</th> 
					<th>
						<a href="#REQUEST.rootPath#?page=admin&action=viewClassData&librarianID=#librarianID#&selectedDateStart=#selectedDateStart#&selectedDateEnd=#selectedDateEnd#&orderBy=location&lastSort=#URL.orderBy#&sortField=#sortField#" onmouseout="hideTooltip()" onmouseover="showTooltip(event,'Location');return false">L</a>&nbsp;
						<cfif URL.orderBy EQ "location"><cfif URL.sortField EQ 0><img src="#REQUEST.rootPath#view/images/down_arrow.gif" border="0" alt="desc" /><cfelse><img src="#REQUEST.rootPath#view/images/up_arrow.gif" border="0" alt="desc" /></cfif></cfif>
					</th>
				</tr>
				<cfloop query="classDataRecordSet.classData">
				<tr align="center" bgcolor="###IIF(classDataRecordSet.classData.currentRow MOD 2, DE('FFF2BF'), DE('FFFFEF'))#">
					<td><a href="#REQUEST.rootPath#?page=admin&action=editClassData&getData=true&lisdID=#classDataRecordSet.classData.lisdID#"><img src="#REQUEST.assetPath#view/images/edit.gif" border="0" alt="Edit" /><!--- #classDataRecordSet.classData.lisdID# ---></a></td>
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
		</div>
	</cfcase>
<!--- ============================================================================= --->
	<cfcase value="editClassData">
		<cfscript>
			// get data to populate FORM options
			recordSet = APPLICATION.obj_lisdFormController.getFormData();
			//gets lisd record
			classDataRecordSet = APPLICATION.obj_lisdFormController.editClassData(URL.lisdID);
		</cfscript>
		
		<cfif IsDefined("FORM.update")>
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" method="updateClassData" returnvariable="message" argumentcollection="#FORM#" />
			<br />#message#<br />
			<cfheader name="refresh" value="3;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
		<cfabort>
		</cfif>
		<cfif IsDefined("FORM.delete")>
			<cfinvoke component="#APPLICATION.obj_lisdFormController#" method="deleteClassData" returnvariable="message" argumentcollection="#FORM#" />
			<br />#message#<br />
			<cfheader name="refresh" value="3;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
		<cfabort>
		</cfif>
		<br />
		<form name="editClassData" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<input name="lisdID" type="hidden" value="#classDataRecordSet.lisdID#" />
			Record Number: <strong>#classDataRecordSet.lisdID#</strong><br /><br />
			<select name="librarianID">
				<cfloop query="recordSet.librarianResults">
		       		<option value="#librarianID#" <cfif IsDefined("classDataRecordSet.librarianID") AND classDataRecordSet.librarianID EQ librarianID>selected</cfif>>#librarian#</option>
				</cfloop>
			</select>
			&nbsp;&nbsp;&nbsp;
			<select name="departmentID">
				<cfloop query="recordSet.departmentResults">
		       		<option value="#departmentID#" <cfif IsDefined("classDataRecordSet.departmentID") AND classDataRecordSet.departmentID EQ departmentID>selected</cfif>>#department#</option>
				</cfloop>
			</select>
			&nbsp;&nbsp;&nbsp;
		 	<select name="locationID">
				<cfloop query="recordSet.locationResults">
		       		<option value="#locationID#" <cfif IsDefined("classDataRecordSet.locationID") AND classDataRecordSet.locationID EQ locationID>selected</cfif>>#location#</option>
				</cfloop>
			</select>
			&nbsp;&nbsp;&nbsp;
			<select name="classTypeID">
				<cfloop query="recordSet.classTypeResults">
		       		<option value="#classTypeID#" <cfif IsDefined("classDataRecordSet.classTypeID") AND classDataRecordSet.classTypeID EQ classTypeID>selected</cfif>>#classType#</option>
				</cfloop>
			</select>
			<br />
			<br />
			<strong>Class Name:</strong><br />
			<input name="className" type="text" size="30" value="#classDataRecordSet.className#" />
			<br /><br />
			<strong>Class Date:</strong><br />
			<input name="classDate" type="text" size="10" value="#DateFormat(classDataRecordSet.classDate, "YYYY-MM-DD")#" /><!---  --->
			<br /><br />
			<strong>Course Number:</strong><br />
			<input name="courseNumber" type="text" size="30" value="#classDataRecordSet.courseNumber#" />
			<br /><br />
			<strong>Instructor:</strong><br />
			<input name="instructor" type="text" size="30" value="#classDataRecordSet.instructor#" />
			<br /><br />
			<strong>Undergraduates:</strong><br />
			<input name="undergraduates" type="text" size="2" value="#classDataRecordSet.undergraduates#" />
			<br /><br />
			<strong>Graduates:</strong><br />
			<input name="graduates" type="text" size="2" value="#classDataRecordSet.graduates#" />
			<br /><br />
			<strong>Faculty:</strong><br />
			<input name="faculty" type="text" size="2" value="#classDataRecordSet.faculty#" />
			<br /><br />
			<strong>Other:</strong><br />
			<input name="other" type="text" size="2" value="#classDataRecordSet.other#" />
			<br /><br />
			<input name="update" type="submit" value="Update" />&nbsp;&nbsp;
			
			<cfif IsDefined("SESSION.role") AND (SESSION.role EQ 0)>
				<input name="delete" type="submit" value="Delete" onClick="confirm('Are you sure you want to delete this record?')" />		
			</cfif>
		</form>
	</cfcase>
</cfswitch>
</cfoutput>
