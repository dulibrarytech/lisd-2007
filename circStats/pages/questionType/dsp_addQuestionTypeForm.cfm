<!---
DESCRIPTION: question type FORM / used to create, update and delete question types
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: obj_questionType.cfc, obj_questionTypeDAO.cfc, obj_employeeTypeDAO.cfc
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->

<!--- ========get ALL employee and queston types===== --->
<cfsilent>
<cflock scope="application" timeout="10" type="exclusive">
<cfscript>
	// instantiates object - passess datasource to init function
	employeeTypeDAO = CreateObject("component", 
			"#REQUEST.cfcPath#employeeType.obj_employeeTypeDAO").init(REQUEST.dsn);
									
	// execute method to get all employee types 
	readEmployeeType = employeeTypeDAO.read();
															
	// execute method to get all question types
	getQuestionType = APPLICATION.questionTypeDAO.readQuestionType();
</cfscript>
</cflock>
</cfsilent>

<!--- =================MENU LINKS================== --->
<cfinclude template="#REQUEST.menuLinks#" />

<!--- ===========SETS default FORM variables ========--->
<cfparam name="VARIABLES.update" default="false" />
<cfparam name="VARIABLES.questionType" default="" />
<cfparam name="VARIABLES.employeeTypeID" default="" />
<cfparam name="VARIABLES.error" type="boolean" default="false">

<cfif IsDefined ("FORM.exec")>
<!--- ==========FORM FIELD VALIDATION========== --->
	<!--- if FORM.questionType is empty, then set error --->
	<cfif FORM.questionType EQ ""><cfset VARIABLES.errorQuestionType=true><cfset VARIABLES.error=true></cfif>
	<!--- if radio button not selected, set error. --->
	 <cfif NOT IsDefined("FORM.employeeTypeID")><cfset VARIABLES.errorEmployeeTypeID=true><cfset VARIABLES.error=true></cfif>     
	<!--- check if the variable error was set to true above --->
	 <cfif Error>
	 <!--- error was defined, do not run form action, show errors on form below.  --->
	 <font color="red"><br /><br />Error(s) need to be corrected below before processing data.</font>
	<cfelse>
	<!--- ============FORM ACTIONS======================= --->
	<cfif IsDefined ("FORM.isActive")>
		<cfset FORM.isActive = 1 />
	<cfelseif NOT IsDefined ("FORM.isActive")>
		<cfset FORM.isActive = 0 />
	</cfif>
	<cflock scope="application" timeout="10" type="exclusive">
	<cfif IsDefined ("FORM.insert")>
	<cfsilent>
		<cfscript>
			// set local variable
			questionTypeID = 0;
														
			// instantiates object - passes form variables to init function 
			questionType = CreateObject ("component", 
					"#REQUEST.cfcPath#questionType.obj_questionType").init(VARIABLES.questionTypeID, FORM.questionType, FORM.employeeTypeID, FORM.formType, FORM.isActive);
													
			// inserts data from FORM into db 
			APPLICATION.questionTypeDAO.create(questionType);
		</cfscript>
	</cfsilent>
			<br /><br />Question Type inserted....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	<cfelseif IsDefined ("FORM.update")>
		<cfscript>
			// instatiates object - passes form variables to init function
			questionType = CreateObject ("component",
				"#REQUEST.cfcPath#questionType.obj_questionType").init(FORM.questionTypeID, FORM.questionType, FORM.employeeTypeID, FORM.formType, FORM.isActive);
				
			// execute update method
			APPLICATION.questionTypeDAO.update(questionType);
		</cfscript>
			<br /><br />Question Type updated....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	<cfelseif IsDefined ("FORM.delete")>
		<!--- disable users ability to delete questions that have been used to capture statistics --->
		<cfscript>
			// instatiates object - passes form variables to init function
			questionType = CreateObject ("component",
				"#REQUEST.cfcPath#questionType.obj_questionType").init(FORM.questionTypeID, FORM.questionType, FORM.employeeTypeID, FORM.formType, FORM.isActive);
				
			// execute update method
			APPLICATION.questionTypeDAO.delete(questionType);
		</cfscript>
			<br /><br />Question Type deleted....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	</cfif>
	</cflock>
	</cfif> <!--- error --->
</cfif><!--- exec --->

<!--- =================SET VARAIBLES================ --->
<cfsilent>
<cflock scope="application" timeout="10" type="exclusive">
<cfif IsDefined ("FORM.questionTypeID")>
	<!--- form validation for edit drop down menu --->
	<cfif IsDefined ("FORM.questionTypeID") AND (FORM.questionTypeID EQ 0)><cfset VARIABLES.errorQuestionTypeID=true><cfset VARIABLES.error=true></cfif>
	<cfset VARIABLES.questionTypeID = #FORM.questionTypeID# />
	<cfscript>
	// executes method
		getQuestionTypes = APPLICATION.questionTypeDAO.readQuestionTypeForEdit(VARIABLES.questionTypeID);
	</cfscript>
	<cfif error><cfset VARIABLES.update = false /><cfelse><cfset VARIABLES.update = true /></cfif>
	<cfset VARIABLES.questionTypeID = "#getQuestionTypes.questionTypeID#" />
	<cfset VARIABLES.questionType = "#getQuestionTypes.questionType#" />
	<cfset VARIABLES.employeeTypeID = "#getQuestionTypes.employeeTypeID#" />
</cfif>
</cflock>
</cfsilent>

<!--- ============DISPLAY ALL QUESTION TYPES IN DROP DOWN MENU ========= --->
<br /><br />
	<cfoutput>
	<cfif IsDefined ("VARIABLES.errorQuestionTypeID")><font color="red">Please select a question type if you would like to edit</font></cfif>
	<form name="edit" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#" method="post">
	<cfif IsDefined ("VARIABLES.errorQuestionTypeID")><font color="red">*</font></cfif>
		<select name="questionTypeID" required="true">
			<option value="0" >Select a Question Type</option>
			<option value="0" >-----------------</option> 
	      		<cfloop query="getQuestionType">
            		<option value="#questiontypeID#" <cfif update AND getQuestionType.questionTypeID EQ getQuestionTypes.questionTypeID>selected</cfif>>#questionType# <cfif isActive EQ 0>(not active)</cfif></option>
				</cfloop>
	      </select>
	    &nbsp;&nbsp;<input name="select" type="submit" value="Edit" />
     </form>
	</cfoutput>
<br />

<!--- ==============FORM BEGINS=================== --->
<h3><cfif update>Update<cfelse>Add</cfif>&nbsp;Question Type</h3>
<br />
<cfoutput>
<cfform name="questionType" method="post" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#">
	
	<cfif update><input name="questionTypeID" type="hidden" value="#VARIABLES.questionTypeID#" /></cfif>
	
	<cfif IsDefined ("VARIABLES.errorQuestionType")><font color="red">*</font></cfif>
	<b>Question Type:</b>&nbsp;(ex. reserves, interlibrary loan etc...)<br />
	<input name="questionType" type="text" <cfif update>value="#TRIM(VARIABLES.questionType)#"<cfelse>value="#TRIM(VARIABLES.questionType)#"</cfif> size="30" required="true" message="Please enter a question type ex. reserves" /><br />
		<br />
	<cfif IsDefined ("VARIABLES.errorEmployeeTypeID")><font color="red">*</font></cfif>
	<b>Employee Type:</b><br /><br />
	<cfloop query="readEmployeeType">
		<input name="employeetypeID" class="radio" type="radio" value="#readEmployeeType.employeeTypeID#"<cfif update AND readEmployeeType.employeeTypeID EQ getQuestionTypes.employeeTypeID>checked</cfif>/>#readEmployeeType.employeeType#
	</cfloop>
		<br />								
		<input name="formType" type="hidden" value="radio" />
		 <br />
		<input name="isActive" 
			<cfif update>type="checkbox"<cfelse>type="hidden"</cfif> 
				<cfif update AND getQuestionTypes.isActive EQ 1>checked</cfif>/>
					<cfif update>Active (checked, if yes)</cfif><br /><br />
		<cfif update>
			<input name="update" type="submit" value="Save Changes" />
			<!---<input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
		<cfelse>
			<input name="insert" type="submit" value="Save" />
		</cfif>
			<input name="exec" type="hidden" />
</cfform>
</cfoutput> 