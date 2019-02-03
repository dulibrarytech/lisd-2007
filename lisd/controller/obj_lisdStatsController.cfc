<cfcomponent extends="init" output="false" hint="gets Stats">
	
	<cffunction name="getFiscalYearTotals" access="public" output="false" returntype="struct" hint="gets fiscal year totals">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearRecordSet = "" /><!--- #VARIABLES.cfcPath# --->
		<cfinvoke component="#APPLICATION.obj_stats#" method="getFiscalYearTotals" returnvariable="fiscalYearRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn fiscalYearRecordSet />
	</cffunction>
	
	<cffunction name="getFiscalYearTotalsByMonth" access="public" output="false" returntype="struct" hint="gets fiscal year monthly totals">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearByMonthRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getFiscalYearTotalsByMonth" returnvariable="fiscalYearByMonthRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn fiscalYearByMonthRecordSet />
	</cffunction>
		
	<cffunction name="getTotalClassesByDepartment" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByDepartment" returnvariable="totalClassesByDepartmentRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByDepartmentRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByDepartmentYear" access="public" output="false" returntype="query" hint="gets class totals by department for the year">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentYearResults = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByDepartmentYear" returnvariable="totalClassesByDepartmentYearResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByDepartmentYearResults />
	</cffunction>
	
	<cffunction name="getTotalStudentsByDepartment" access="public" output="false" returntype="struct" hint="gets student totals by department">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalStudentsByDepartment" returnvariable="totalStudentsByDepartmentRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalStudentsByDepartmentRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByLocation" access="public" output="false" returntype="struct" hint="gets class totals by location">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByLocation" returnvariable="totalClassesByLocationRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByLocationRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassType" access="public" output="false" returntype="struct" hint="gets class totals by class type">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByClassType" returnvariable="totalClassesByClassTypeRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByClassTypeRecordSet />
	</cffunction>
	
	<cffunction name="getFiscalYearTotalsLib" access="public" output="false" returntype="struct" hint="gets fiscal year totals">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getFiscalYearTotalsLib" returnvariable="fiscalYearLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn fiscalYearLibRecordSet />
	</cffunction>
	
	<cffunction name="getTotalStudentsByDepartmentLib" access="public" output="false" returntype="struct" hint="gets student totals by department for librarian selected">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalStudentsByDepartmentLib" returnvariable="totalStudentsByDepartmentLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalStudentsByDepartmentLibRecordSet />
	</cffunction>
		
	<cffunction name="getTotalClassesByDepartmentLib" access="public" output="false" returntype="struct" hint="gets class totals by department for librarian selected">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByDepartmentLib" returnvariable="totalClassesByDepartmentLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByDepartmentLibRecordSet />
	</cffunction>
	
	<cffunction name="getFiscalYearTotalsByMonthLib" access="public" output="false" returntype="struct" hint="gets fiscal year monthly totals for selected librarian">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearByMonthLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getFiscalYearTotalsByMonthLib" returnvariable="fiscalYearByMonthLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn fiscalYearByMonthLibRecordSet />
	</cffunction>

	<cffunction name="getTotalClassesByDepartmentYearLib" access="public" output="false" returntype="query" hint="gets class totals by department for the year">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentYearLibResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByDepartmentYearLib" returnvariable="totalClassesByDepartmentYearLibResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByDepartmentYearLibResults />
	</cffunction>

	<cffunction name="getTotalClassesByLocationLib" access="public" output="false" returntype="struct" hint="gets class totals by location">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByLocationLib" returnvariable="totalClassesByLocationLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByLocationLibRecordSet />
	</cffunction>
		
	<cffunction name="getTotalClassesByClassTypeLib" access="public" output="false" returntype="struct" hint="gets class totals by class type">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeLibRecordSet = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByClassTypeLib" returnvariable="totalClassesByClassTypeLibRecordSet">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByClassTypeLibRecordSet />
	</cffunction>
	
	<cffunction name="getLibrarianName" access="public" output="false" returntype="query" hint="gets librarian name">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfset var librarianNameResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getLibrarianName" returnvariable="librarianNameResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
		</cfinvoke>
		<cfreturn librarianNameResults />
	</cffunction>
	
	<cffunction name="getTotalStudentsByDepartmentYearLib" access="public" output="false" returntype="query" hint="gets student totals by department for the year">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentYearLibResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalStudentsByDepartmentYearLib" returnvariable="totalStudentsByDepartmentYearLibResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalStudentsByDepartmentYearLibResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByLocationYearLib" access="public" output="false" returntype="query" hint="gets class totals by location for the year">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationYearLibResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByLocationYearLib" returnvariable="totalClassesByLocationYearLibResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByLocationYearLibResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassTypeYearLib" access="public" output="false" returntype="query" hint="gets class totals by class type for the year">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeYearLibResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getTotalClassesByClassTypeYearLib" returnvariable="totalClassesByClassTypeYearLibResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByClassTypeYearLibResults />
	</cffunction>
	
	<cffunction name="getTotalStudentsByDepartmentYear" access="public" output="false" returntype="query" hint="gets student totals by department for the year">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentYearResults = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalStudentsByDepartmentYear" returnvariable="totalStudentsByDepartmentYearResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalStudentsByDepartmentYearResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByLocationYear" access="public" output="false" returntype="query" hint="gets class totals by location for the year">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationYearResults = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByLocationYear" returnvariable="totalClassesByLocationYearResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByLocationYearResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassTypeYear" access="public" output="false" returntype="query" hint="gets class totals by class type for the year">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeYearResults = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getTotalClassesByClassTypeYear" returnvariable="totalClassesByClassTypeYearResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn totalClassesByClassTypeYearResults />
	</cffunction>
	
	<cffunction name="getClassTotals" access="public" output="false" returntype="query">
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var classTotalsResults = "" />
		<cfinvoke component="#APPLICATION.obj_stats#" method="getClassTotals" returnvariable="classTotalsResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn classTotalsResults />
	</cffunction>
	
	<cffunction name="getClassTotalsLib" access="public" output="false" returntype="query">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var classTotalsLibResults = "" />
		<cfinvoke component="#APPLICATION.obj_librarianStats#" method="getClassTotalsLib" returnvariable="classTotalsLibResults">
			<cfinvokeargument name="dsn" value="#VARIABLES.dsn#" />
			<cfinvokeargument name="librarianID" value="#ARGUMENTS.librarianID#" />
			<cfinvokeargument name="selectedDateStart" value="#ARGUMENTS.selectedDateStart#" />
			<cfinvokeargument name="selectedDateEnd" value="#ARGUMENTS.selectedDateEnd#" />
		</cfinvoke>
		<cfreturn classTotalsLibResults />
	</cffunction>
	
</cfcomponent>