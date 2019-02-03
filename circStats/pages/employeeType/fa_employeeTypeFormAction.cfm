<!--- 
DATE: 9.23.06  
CREATOR: Fernando Reyes
DESCRIPTION: instatiates question Object in order to insert employeetypes into database
ENTERING FROM: dsp_addEmployeeTypeForm.cfm
EXITING TO: dsp_addEmployeeTypeForm.cfm
DEPENDENCIES: obj_employeeType.cfc, obj_employeeTypeDAO.cfc
EXPECTING: FORM.employeeType, FORM.isActive

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->

<!--- form action --->
<cfif IsDefined ("FORM.submit")>
	
   	<cfscript>
		// set local variable
		employeeTypeID = 0;
	
		// instantiates object - passess datasource to init function
		employeeTypeDAO = CreateObject("component", 
			"#REQUEST.cfcPath#employeeType.obj_employeeTypeDAO").init(REQUEST.dsn);
										
		// instantiates object - passess form variables to init function 
		employeeType = CreateObject ("component", 
			"#REQUEST.cfcPath#employeeType.obj_employeeType").init(VARIABLES.employeeTypeID, FORM.employeeType, FORM.isActive);
												
		// inserts data from FORM into db 
		employeeTypeDAO.create(employeeType);
	</cfscript>
			
</cfif>

<!--- returns use to form --->
<cflocation url="#REQUEST.rootPath#?page=employeeTypeForm" addtoken="no" />  