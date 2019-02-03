<!---
DESCRIPTION: interaction type FORM / used to create, update and delete interaction types
ENTERING FROM: 
EXITING TO: 
DEPENDENCIES: obj_interactionType.cfc, obj_interactionTypeDAO.cfc
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
--->

<!--- ========GET ALL INTERACTION TYPES===== --->
<cfsilent>
<cflock scope="application" timeout="10" type="exclusive">
<cfscript>
	// execute method to get all question types
	getInteractionType = APPLICATION.interactionTypeDAO.readInteractionType();
</cfscript>
</cflock>
</cfsilent>

<!--- =================MENU LINKS================== --->
<cfinclude template="#REQUEST.menuLinks#" />

<!--- ===========SETS update variable to false========--->
<cfparam name="VARIABLES.update" default="false" />
<cfparam name="VARIABLES.interactionType" default="" />
<cfparam name="error" type="boolean" default="false">

<cfif IsDefined ("FORM.exec")>
<!--- ==========FORM FIELD VALIDATION========== --->
	<!--- if FORM.interactionType is empty, then set error --->
	<cfif FORM.interactionType EQ ""><cfset VARIABLES.errorInteractionType=true><cfset error=true></cfif>
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
			interactionTypeID = 0;
													
			// instantiates object - passess form variables to init function 
			interactionType = CreateObject ("component", 
				"#REQUEST.cfcPath#interactionType.obj_interactionType").init(VARIABLES.interactionTypeID, FORM.interactionType, FORM.isActive);
													
			// inserts data from FORM into db 
			APPLICATION.interactionTypeDAO.create(interactionType);
		</cfscript>
	</cfsilent>
			<br /><br />Interaction Type inserted....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	<cfelseif IsDefined ("FORM.update")>
		<cfscript>
			// instatiates object - passes form variables to init function
			interactionType = CreateObject ("component",
				"#REQUEST.cfcPath#interactionType.obj_interactionType").init(FORM.interactionTypeID, FORM.interactionType, FORM.isActive);
				
			// execute update method
			APPLICATION.interactionTypeDAO.update(interactionType);
		</cfscript>
			<br /><br />Interaction Type updated....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	<cfelseif IsDefined ("FORM.delete")>
		<cfscript>
			// instatiates object - passes form variables to init function
			interactionType = CreateObject ("component",
				"#REQUEST.cfcPath#interactionType.obj_interactionType").init(FORM.interactionTypeID, FORM.interactionType, FORM.isActive);
				
			// execute update method
			APPLICATION.interactionTypeDAO.delete(interactionType);
		</cfscript>
			<br /><br />Interaction Type deleted....<br />
			<cfheader name="refresh" value="1;URL=#REQUEST.rootPath#?#cgi.QUERY_STRING#">
			<cfabort>
	</cfif> <!--- form actions --->
	</cflock>
	</cfif> <!--- error --->
</cfif><!--- exec --->

<!--- =================SET VARAIBLES================ --->
<cfsilent>
<cfif IsDefined ("FORM.interactionTypeID")>
	<!--- form validation for edit drop down menu --->
	<cfif IsDefined ("FORM.interactionTypeID") AND (FORM.interactionTypeID EQ 0)><cfset VARIABLES.errorInteractionTypeID=true><cfset VARIABLES.error=true></cfif>
	<cfset VARIABLES.interactionTypeID = #FORM.interactionTypeID# />
	<cfscript>
		// executes method
		getInteractionTypes = APPLICATION.interactionTypeDAO.readInteractionTypeForEdit(VARIABLES.interactionTypeID);
	</cfscript>
	<cfif error><cfset VARIABLES.update = false /><cfelse><cfset VARIABLES.update = true /></cfif>
	<cfset VARIABLES.interactionTypeID = "#getInteractionTypes.interactionTypeID#" />
	<cfset VARIABLES.interactionType = "#getInteractionTypes.interactionType#" />
</cfif>
</cfsilent>

<!--- ============DISPLAY ALL INTERACTION TYPES IN DROP DOWN MENU ========= --->
<br /><br />
	<cfoutput>
	<cfif IsDefined ("VARIABLES.errorInteractionTypeID")><font color="red">Please select an interaction type if you would like to edit</font></cfif>
	<form name="edit" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#" method="post">
		<cfif IsDefined ("VARIABLES.errorInteractionTypeID")><font color="red">*</font></cfif>
		<select name="interactionTypeID" >
			<!--- option value is set to 0 to prevent error --->
	    	<option value="0" >Select a Interaction Type</option>
			<option value="0" >-----------------</option> 
	      		<cfloop query="getInteractionType">
            		<option value="#interactionTypeID#" <cfif update AND getInteractionType.interactionTypeID EQ getInteractionTypes.interactionTypeID>selected</cfif>>#interactionType#</option>
				</cfloop>
	      </select>
	    &nbsp;&nbsp;<input name="select" type="submit" value="Edit" />
     </form>
	</cfoutput>
<br />

<!--- ==============FORM BEGINS=================== --->
<h3><cfif update>Update<cfelse>Add</cfif>&nbsp;Interaction Type</h3>
<br />
<cfoutput>
<cfform name="interactionType" method="post" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#">
	
	<cfif update><input name="interactionTypeID" type="hidden" value="#VARIABLES.interactionTypeID#" /></cfif>
	
	<cfif IsDefined ("VARIABLES.errorInteractionType")><font color="red">*</font></cfif>
	<b>Interaction Type:</b>&nbsp;(ex. phone, in person etc...)<br />
	<input name="interactionType" type="text" <cfif update>value="#TRIM(VARIABLES.interactionType)#"<cfelse>value="#TRIM(VARIABLES.interactionType)#"</cfif> size="30" /><br />
	<br />
	<input name="isActive" 
		<cfif update>type="checkbox"<cfelse>type="hidden"</cfif>  
			<cfif update AND getInteractionTypes.isActive EQ 1>checked </cfif>/>
				<cfif update>Active (checked, if yes)</cfif><br /><br />
	
	<cfif update>
		<input name="update" type="submit" value="Save Changes" />
		<!--- <input name="delete" type="submit" value="Delete" onClick="return confirm('Are you sure you want to delete?')" /> --->
	<cfelse>
		<input name="insert" type="submit" value="Save" />
	</cfif>
		<input name="exec" type="hidden" />
		
</cfform>
</cfoutput>