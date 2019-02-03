<!---
DESCRIPTION: instatiates questionGateway Object and generates statistics FORM
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: obj_circStatsCreateFormDAO.cfc, obj_interactionTypeDAO.cfc
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->

<cfsilent>
<cflock scope="application" timeout="10" type="exclusive">
<cfscript>

	// instantiates object - passess datasource to init function
	circStatsCreateFormDAO = CreateObject("component", "circStats.pages.circStatsCaptureForm.obj_circStatsCreateFormDAO").init(REQUEST.dsn);
		
	// executes getAllSfaffRadioQuestions method
	getAllStaffRadioQuestions = circStatsCreateFormDAO.getAllStaffRadioQuestions();
	
	// executes getAllSfaffTextQuestions method
	getAllStaffTextQuestions = circStatsCreateFormDAO.getAllStaffTextQuestions();
	
	// executes getAllStudentRadioQuestions method
	getAllStudentRadioQuestions = circStatsCreateFormDAO.getAllStudentRadioQuestions();
	
	// executes getAllStudentTextQuestions method
	getAllStudentTextQuestions = circStatsCreateFormDAO.getAllStudentTextQuestions();
	
	// executes getAllRadioQuestions method
	getAllRadioQuestions = circStatsCreateFormDAO.getAllRadioQuestions();
	
	// executes getAllTextQuestions method
	getAllTextQuestions = circStatsCreateFormDAO.getAllTextQuestions();
	
	// executes read method
	readInteractionType = APPLICATION.interactionTypeDAO.read();
	
</cfscript>
</cflock>
</cfsilent>

<!--- FORM Begins --->
<cfoutput>  
<!--- <b>Staff:</b><br /><br />--->
<form name="staffCircStatsPublic" method="post" action="#REQUEST.captureStats#">
			
	<input name="employeeTypeID" type="hidden" value="1" />
	
	<cfloop query="getAllRadioQuestions">
		<input name="questionTypeID" 
			type="radio" 
				value="#getAllRadioQuestions.questionTypeID#" />
					#getAllRadioQuestions.questionType#<br />
						</cfloop>
	
	<cfloop query="getAllStaffRadioQuestions">
		<input name="questionTypeID" 
			type="radio" 
				value="#getAllStaffRadioQuestions.questionTypeID#" />
					#getAllStaffRadioQuestions.questionType#<br />	
						</cfloop>
					
	<br />
	<cfloop query="getAllTextQuestions">
		#getAllTextQuestions.questionType#:<br />
		<input name="questionType" type="hidden" value="#TRIM(getAllTextQuestions.questionType)#" />
		<input name="questionStaffText" 
			type="text" 
				size="35" /><br />	
					</cfloop>
					
	<!--- <cfloop query="getAllStaffTextQuestions">
		#getAllStaffTextQuestions.question#:<br />
		<input name="questionStaffText" 
			type="text" 
				size="40" /><br />	
					</cfloop>  --->
					
		<br />

	<cfloop query="readInteractionType">
		<input name="interactionType" type="submit" value="#TRIM(readInteractionType.interactionType)#" />
			</cfloop>
			
</form>   

<br /><br />

<!---
<b>Student:</b><br /><br />
<form name="studentCircStatsPublic" method="post" action="#REQUEST.captureStats#">
	
	<input name="employeeTypeID" type="hidden" value="2" />
	
	<cfloop query="getAllRadioQuestions">
		<input name="questionTypeID" 
			type="radio" 
				value="#getAllRadioQuestions.questionTypeID#" />
					#getAllRadioQuestions.questionType#<br />
						</cfloop>
	
	<cfloop query="getAllStudentRadioQuestions">
		<input name="questionTypeID" 
			type="radio" 
				value="#getAllStudentRadioQuestions.questionTypeID#" />#getAllStudentRadioQuestions.questionType#<br />	
					</cfloop>
					
	<br />
	<cfloop query="getAllTextQuestions">
		#getAllTextQuestions.questionType#:<br />
		<input name="questionType" type="hidden" value="#TRIM(getAllTextQuestions.questionType)#" />
		<input name="questionStudentText" 
			type="text" 
				size="35" /><br />	
					</cfloop>
					
	<!--- <cfloop query="getAllStudentTextQuestions">
		#getAllStudentTextQuestions.question#:<br />
		<input name="questionStudentText" 
			type="text" 
				size="40" /> <br />	
					</cfloop> --->
					
		<br />

	<cfloop query="readInteractionType">
		<input name="interactionType" type="submit" value="#TRIM(readInteractionType.InteractionType)#" />
			</cfloop>

</form> --->
</cfoutput>
