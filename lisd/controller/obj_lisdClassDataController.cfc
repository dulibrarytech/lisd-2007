<cfcomponent extends="init" output="false" hint="gets librarian Class Data">

	<cffunction name="getClassData" access="public" output="false" returntype="struct" hint="get class data by selected librarian">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearStart = "#selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#selectedDateEnd#-07-01" /> 
		<cfset var classDataRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_classData#" method="getClassData" returnvariable="classDataRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn classDataRecordSet />
	</cffunction>
	
	<cffunction name="sortClassData" access="public" output="false" returntype="struct" hint="sorts class data by selected librarian">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfargument name="orderBy" type="string" required="true" />
		<cfargument name="sortField" type="numeric" required="true" />
		<cfset var fiscalYearStart = "#selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#selectedDateEnd#-07-01" /> 
		<cfset var classDataRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_classData#" method="sortClassData" returnvariable="classDataRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="fiscalYearStart" value="#fiscalYearStart#" />
			<cfinvokeargument name="fiscalYearEnd" value="#fiscalYearEnd#" />
			<cfinvokeargument name="orderBy" value="#ARGUMENTS.orderBy#" />
			<cfinvokeargument name="sortField" value="#ARGUMENTS.sortField#" />
		</cfinvoke>
		<cfreturn classDataRecordSet />
	</cffunction>

</cfcomponent>