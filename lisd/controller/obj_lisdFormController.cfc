<cfcomponent extends="init" output="false" hint="lisd FORM API">
	
	<cffunction name="formValidation" access="public" returntype="struct" hint="validates form">
		<cfset var validate = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formValidation" method="formValidation" returnvariable="validate" argumentcollection="#FORM#" />
	<cfreturn validate />
	</cffunction>
		
	<cffunction name="getFormData" access="public" output="false" returntype="struct" hint="gets data to populate FORM values">
		<cfset var recordSet = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="getFormData" returnvariable="recordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn recordSet />	
	</cffunction>
	
	<cffunction name="getAdminFormData" access="public" output="false" returntype="struct" hint="gets data to populate admin edit FORM values">
		<cfset var recordSet = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="getAdminFormData" returnvariable="recordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn recordSet />	
	</cffunction>
	
	<cffunction name="captureFormData" access="public" output="false" returntype="string" hint="captures FORM input data">
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="captureFormData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="captureAdminFormData" access="public" output="false" returntype="string" hint="captures admin FORM input data">
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="captureAdminFormData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="updateAdminFormData" access="public" output="false" returntype="string" hint="update admin FORM input data">
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="updateAdminFormData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="editAdminFormData" access="public" output="false" returntype="query" hint="pulls admin FORM input data for update">
		<cfset var editResults = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="editAdminFormData" returnvariable="editResults" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn editResults />	
	</cffunction>
	
	<cffunction name="editClassData" access="public" output="false" returntype="query" hint="pulls class data for update">
		<cfargument name="lisdID" type="numeric" required="true" />
		<cfset var classDataRecordSet = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="editClassData" returnvariable="classDataRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="lisdID" value="#ARGUMENTS.lisdID#" />
		</cfinvoke>
	<cfreturn classDataRecordSet />	
	</cffunction>
	
	<cffunction name="updateClassData" access="public" output="false" returntype="string" hint="updates class data">
		<cfargument name="lisdID" type="numeric" required="true" />
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="updateClassData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="lisdID" value="#ARGUMENTS.lisdID#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="deleteClassData" access="public" output="false" returntype="string" hint="deletes class data">
		<cfargument name="lisdID" type="numeric" required="true" />
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="deleteClassData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="lisdID" value="#ARGUMENTS.lisdID#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="deleteAdminFormData" access="public" output="false" returntype="string" hint="delete admin FORM input data">
		<cfset var message = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="deleteAdminFormData" returnvariable="message" argumentcollection="#FORM#">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
		</cfinvoke>
	<cfreturn message />	
	</cffunction>
		
	<cffunction name="createDropDown" access="public" output="false" returntype="struct" hint="generates drop down data">
		<cfset var yearStruct = "" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_formData" method="createDropDown" returnvariable="yearStruct" />
	<cfreturn yearStruct />	
	</cffunction>
	
	<cffunction name="authenticate" access="public" output="false" returntype="void" hint="authenticates user">
		<cfargument name="userName" type="string" required="true" />
		<cfargument name="pwd" type="string" required="true" />
		<cfinvoke component="#VARIABLES.cfcPath#obj_login" method="authenticate">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="userName" value="#ARGUMENTS.userName#" />
			<cfinvokeargument name="pwd" value="#ARGUMENTS.pwd#" />
		</cfinvoke>
	</cffunction>
	
</cfcomponent>