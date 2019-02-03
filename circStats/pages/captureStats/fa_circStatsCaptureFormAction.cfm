<!---
DESCRIPTION: 
ENTERING FROM: dsp_circStatsCaptureForm.cfm 
EXITING TO: dsp_circStatsCaptureForm.cfm
DEPENDENCIES: obj_captureStats.cfc, obj_captureStatsDAO.cfc
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->


<cfdump var="#FORM#" />
<!--- <cfabort> --->

<cfif IsDefined ("FORM.interactionType")>
<cflock scope="application" timeout="10" type="exclusive">
<cfoutput>
	<!--- validation for staff form--->
	<cfif IsDefined ("employeeTypeID") AND employeeTypeID EQ 1 AND NOT IsDefined ("FORM.questionTypeID") AND 
		Len(#FORM.questionStaffText#) LT 1>   
						
		<b>Please make a selection!</b><br />
		<a href="#REQUEST.rootPath#?page=stats">Return to FORM</a><br /> 
	
	<cfabort>
	</cfif>
	
	<!--- more staff validation, if the text box contains data, the radio button is set to null TURNED OFF...f.r.
	<cfif IsDefined ("employeeTypeID") AND employeeTypeID EQ 1 <!--- AND Len(#FORM.questionStaffText#) GT 0 --->>
			<cfscript>
				// instantiates object - passess datasource to init function
				getQuestionTypeID = APPLICATION.questionTypeDAO.readQuestionTypeID(FORM.questionType);
			</cfscript>
			<cfset FORM.questionTypeID = #getQuestionTypeID.questionTypeID# />
	</cfif> --->
		
	<!--- validation for student form --->
	<cfif IsDefined ("employeeTypeID") AND employeeTypeID EQ 2 AND NOT IsDefined ("FORM.questionTypeID") AND 
		Len(#FORM.questionStudentText#) LT 1>   
						
		<b>Please make a selection!</b><br />
		<a href="#REQUEST.rootPath#?page=stats">Return to FORM</a><br /> 
	
	<cfabort>
	</cfif>
	
	<!--- more student validation, if the text box contains data, the radio button is set to null --->
	<cfif IsDefined ("employeeTypeID") AND employeeTypeID EQ 2 AND Len(#FORM.questionStudentText#) GT 0>
			<cfscript>
				// instantiates object - passess datasource to init function
				getQuestionTypeID = APPLICATION.questionTypeDAO.readQuestionTypeID(FORM.questionType);
			</cfscript>
			<cfset FORM.questionTypeID = #getQuestionTypeID.questionTypeID# />
	</cfif>

	<cfif IsDefined ("FORM.questionStaffText")>
		<cfset FORM.questionTextType = "#FORM.questionStaffText#">
			<cfelseif NOT IsDefined ("FORM.questionStaffText") AND NOT IsDefined ("FORM.questionStudentText")>
				<cfset FORM.questionTextType = "Other">
					</cfif>
					
	<cfif IsDefined ("FORM.questionStudentText")>
		<cfset FORM.questionTextType = "#FORM.questionStudentText#">
			<cfelseif NOT IsDefined ("FORM.questionStudentText") AND NOT IsDefined ("FORM.questionStaffText")>
				<cfset FORM.questionTextType = " ">
					</cfif>

	
	<cfscript>
		// executes read method
		readInteractionTypeID = APPLICATION.interactionTypeDAO.readID(FORM.interactionType);
	</cfscript>
	
		<cfset VARIABLES.interactionTypeID = #readInteractionTypeID.interactionTypeID# />
			
	<cfscript>
						
		// instantiates object - passess datasource and username and password to init function
		capturestatsDAO = CreateObject("component", 
			"#REQUEST.cfcPath#captureStats.obj_captureStatsDAO").init(REQUEST.dsn);
											
		// instantiates object - passess form variables to init function 
		captureStats = CreateObject ("component", 
			"#REQUEST.cfcPath#captureStats.obj_captureStats").init(FORM.employeeTypeID, FORM.questionTypeID, VARIABLES.interactionTypeID, FORM.questionTextType);
													
		// executes create method to insert data from FORM into db 
		captureStatsDAO.create(captureStats);
		
	</cfscript>

		<!--- returns user to form --->
		<cflocation url="#REQUEST.rootPath#?page=stats" addtoken="no" />

</cfoutput>
</cflock>
</cfif>