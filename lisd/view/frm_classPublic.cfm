<cfoutput>

<cfif IsDefined("FORM.submit")>
			
	<cfif NOT IsDefined("FORM.locationID")><cfset FORM.locationID = "" /></cfif>
	
	<!--- FORM VALIDATION --->
	<cfscript>
		//validates FORM values, FORM.location
		validate = APPLICATION.obj_lisdFormController.formValidation(FORM.librarianID, FORM.departmentID, FORM.classTypeID, FORM.className, FORM.courseNumber, FORM.instructor, FORM.locationID);
	</cfscript>

	<cfif IsDefined("validate.error") AND validate.error>
		<br /><br />
		Please correct the error(s) below:<br />
		<font color="red">
			<cfif IsDefined("validate.librarianError") AND validate.librarianError>Please select a librarian<br /></cfif>
			<cfif IsDefined("validate.departmentError") AND validate.departmentError>Please select a department<br /></cfif>
			<cfif IsDefined("validate.classTypeError") AND validate.classTypeError>Please select a class type<br /></cfif>
			<cfif IsDefined("validate.classNameError") AND validate.classNameError>Please enter a class name<br /></cfif>
			<cfif IsDefined("validate.courseNumberError") AND validate.courseNumberError>Please enter a course number<br /></cfif>
			<cfif IsDefined("validate.instructorError") AND validate.instructorError>Please enter an instructor name<br /></cfif>
			<cfif IsDefined("validate.locationError") AND validate.locationError>Please select a location<br /></cfif>
		</font>
		
	<cfelse>
		
		<cfscript>
			// pass FORM values to capture component
			message = APPLICATION.obj_lisdFormController.captureFormData(FORM.librarianID, FORM.departmentID, FORM.classTypeID, 
															FORM.classDate, FORM.className, FORM.courseNumber, FORM.instructor, 
																FORM.undergraduates, FORM.graduates, FORM.faculty, FORM.other, FORM.locationID);
		</cfscript> 
		#message#<br />
		<cfheader name="refresh" value="3;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
		<cfabort>
	</cfif>	
</cfif>

	<cfscript>
		// get data to populate FORM options
		recordSet = APPLICATION.obj_lisdFormController.getFormData();
	</cfscript>
	
<!--- FORM BEGINS --->
<cfparam name="className" default="" />
<cfparam name="classDate" default="" />
<cfparam name="courseNumber" default="" />
<cfparam name="instructor" default="" />
<cfparam name="undergraduates" default="0" />
<cfparam name="graduates" default="0" />
<cfparam name="faculty" default="0" />
<cfparam name="other" default="0" />
<cfparam name="locationID" default="" />

<h2>Entry form</h2>
<div class="entryForm">
<form id="classEntryForm" name="classEntryForm" method="post" action="#REQUEST.rootPath#">
	
	<cfif IsDefined("validate.librarianError") AND validate.librarianError><font color="red">*</font></cfif>
	<select name="librarianID">
		<!--- option value is set to 0 to force selection --->
		<option value="0">Select a librarian&nbsp;</option>
		<option value="0">-----------------------</option>
		<cfloop query="recordSet.librarianResults">
        	<option value="#librarianID#" <cfif IsDefined("FORM.librarianID") AND FORM.librarianID EQ librarianID>selected</cfif>>#librarian#</option>
		</cfloop>
	</select>
	&nbsp;&nbsp;
	<cfif IsDefined("validate.departmentError") AND validate.departmentError><font color="red">*</font></cfif>
	<select name="departmentID">
		<!--- option value is set to 0 to force selection --->
		<option value="0">Select a department&nbsp;</option>
		<option value="0">-----------------------</option>
		<cfloop query="recordSet.departmentResults">
        	<option value="#departmentID#" <cfif IsDefined("FORM.departmentID") AND FORM.departmentID EQ departmentID>selected</cfif>>#department#</option>
		</cfloop>
	</select>
	&nbsp;&nbsp;
	<cfif IsDefined("validate.classTypeError") AND validate.classTypeError><font color="red">*</font></cfif>
	<select name="classTypeID">
		<!--- option value is set to 0 to force selection --->
		<option value="0">Select a class type&nbsp;</option>
		<option value="0">-----------------------</option>
		<cfloop query="recordSet.classTypeResults">
        	<option value="#classTypeID#" <cfif IsDefined("FORM.classTypeID") AND FORM.classTypeID EQ classTypeID>selected</cfif>>#classType#</option>
		</cfloop>
	</select>
	
	<br /><br /><br />
	
	 <b>Class Date:</b><br />
	 <cfif IsDefined("validate.error") AND validate.error>
		<input name="classDate" type="text" value="#classDate#" size="10" /> 
	<cfelse>
		<script>DateInput('classDate', true, 'YYYY-MM-DD')</script> 
	</cfif>
	
	<br /><br />
	
	<cfif IsDefined("validate.classNameError") AND validate.classNameError><font color="red">*</font></cfif>
	<b>Class Name:</b><br />
	<input name="className" type="text" size="30" value="#className#" />
	<br /><br />
	<cfif IsDefined("validate.courseNumberError") AND validate.courseNumberError><font color="red">*</font></cfif>
	<b>Course Number:</b><br />
	<input name="courseNumber" type="text" size="30" value="#courseNumber#" />
	<br /><br />
	<cfif IsDefined("validate.instructorError") AND validate.instructorError><font color="red">*</font></cfif>
	<b>Instructor Name:</b><br />
	<input name="instructor" type="text" size="30" value="#instructor#">
	<br /><br /><br />
	
	<cfif IsDefined("validate.studentError") AND validate.studentError><font color="red">* Please enter a value greater than zero for at least one of the options below.</font><br /><br /></cfif>
	<input name="undergraduates" type="text" size="1" value="#undergraduates#" class="required digits" />&nbsp;&nbsp;<b>Enter number of Undergraduates</b>
	<br /><br />
	<input name="graduates" type="text" size="1" value="#graduates#" class="required digits" />&nbsp;&nbsp;<b>Enter number of Graduates</b>
	<br /><br />
	<input name="faculty" type="text" size="1" value="#faculty#" class="required digits" />&nbsp;&nbsp;<b>Enter number of Faculty</b>
	<br /><br />
	<input name="other" type="text" size="1" value="#other#" class="required digits" />&nbsp;&nbsp;<b>Enter number of "Other"</b>
	<br /><br />
	<br />
	
	<cfif IsDefined("validate.locationError") AND validate.locationError><font color="red">*</font></cfif>
	<b>Location:</b>&nbsp;<br />
	<cfloop query="recordSet.locationResults">
		<input name="locationID" type="radio" value="#locationID#" <cfif IsDefined("FORM.locationID") AND FORM.locationID EQ locationID>checked</cfif> />&nbsp;#location#&nbsp;&nbsp;&nbsp;<br />
	</cfloop>
			
	<br /><br />
	
	<input name="submit" type="submit" value="Save">
	
</form>
<br />
</div>
</cfoutput>