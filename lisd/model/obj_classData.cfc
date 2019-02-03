<cfcomponent output="false">

	<cffunction name="getClassData" access="public" output="false" returntype="struct" hint="get class data by selected librarian">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />
		<cfset var getClassDataResults = "" /> 
		<cfset var classDataRecordSet = structNew() />
			<!--- stored procedure used to get librarian class data 
			<cfstoredproc procedure="spGetClassData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
				<cfprocparam value="#fiscalYearStart#" cfsqltype="CF_SQL_DATE" type="in">
				<cfprocparam value="#fiscalYearEnd#" cfsqltype="CF_SQL_DATE" type="in">
				<cfprocresult name="getClassDataResults">
			</cfstoredproc>
			--->

			<cfquery name="getClassDataResults" datasource="#ARGUMENTS.dsn#">
				SELECT		a.lisdID, c.department, d.classType, e.location, a.classDate, a.className, a.courseNumber, a.instructor, a.undergraduates, a.graduates, a.faculty, a.other
				FROM		tbl_lisd a, tbl_lisdDepartment c, tbl_lisdClassType d, tbl_lisdLocation e	
				WHERE  		a.librarianID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.librarianID#" />
				AND		a.classDate BETWEEN '#fiscalYearStart#' AND '#fiscalYearEnd#'
				AND		a.departmentID = c.departmentID
				AND		a.classTypeID = d.classTypeID
				AND		a.locationID = e.locationID 
				ORDER BY	a.classDate 
			</cfquery>

		<cfset classDataRecordSet.classData = #getClassDataResults# />
		<cfreturn classDataRecordSet />
	</cffunction>
		
	<cffunction name="sortClassData" access="public" output="false" returntype="struct" hint="sorts classData">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="fiscalYearStart" type="string" required="true" />
		<cfargument name="fiscalYearEnd" type="string" required="true" />
		<cfargument name="orderBy" type="string" required="true" />
		<cfargument name="sortField" type="numeric" required="true" />
		<cfset var sort = "" />
		<cfset var classDataRecordSet = structNew() />
		<cfquery name="sort" datasource="#ARGUMENTS.dsn#">
			SELECT	a.lisdID, c.department, d.classType, e.location, a.classDate, a.className, a.courseNumber, a.instructor, a.undergraduates, a.graduates, a.faculty, a.other
			FROM	tbl_lisd a, tbl_lisdDepartment c, tbl_lisdClassType d, tbl_lisdLocation e	
			WHERE  	a.librarianID = #ARGUMENTS.librarianID#
			AND		a.classDate BETWEEN '#ARGUMENTS.fiscalYearStart#' AND '#ARGUMENTS.fiscalYearEnd#'
			AND		a.departmentID = c.departmentID
			AND		a.classTypeID = d.classTypeID
			AND		a.locationID = e.locationID 
			
			 <cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "department">
				ORDER BY	c.department <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "className">
				ORDER BY	a.className <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "classDate">
				ORDER BY	a.classDate <cfif ARGUMENTS.sortField EQ 0>desc</cfif> 
			</cfif>
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "courseNumber">
				ORDER BY	a.courseNumber <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "classType">
				ORDER BY	d.classType <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "instructor">
				ORDER BY	a.instructor <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>  
			<cfif IsDefined("ARGUMENTS.orderBy") AND ARGUMENTS.orderBy EQ "location">
				ORDER BY	e.location <cfif ARGUMENTS.sortField EQ 0>desc</cfif>
			</cfif>  
		</cfquery>
	<cfset classDataRecordSet.classData = #sort# />
	<cfreturn classDataRecordSet />
	</cffunction>

</cfcomponent>
