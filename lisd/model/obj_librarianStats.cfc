<cfcomponent output="false" hint="gets data by user selected librarian and month and year">
	
	<!--- used by all functions in component --->
	<!--- list of months using numeric values / begin with July - fiscal year --->
	<cfset VARIABLES.months = "7,8,9,10,11,12,1,2,3,4,5,6" />
	<!--- convert list to array / performs better when using it in a loop --->	
	<cfset VARIABLES.monthsInArray = listToArray("#VARIABLES.months#")/>
	
	<cffunction name="getLibrarianName" access="public" output="false" returntype="query" hint="gets librarian's name">
		<cfargument name="librarianID" type="numeric" required="true" />
		
		<!--- stored procedure used to get librarian name 
		<cfstoredproc procedure="spGetLibrarianName" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="librarianNameResults">
		</cfstoredproc> --->

		<cfquery name="librarianNameResults" datasource="#ARGUMENTS.dsn#">
			SELECT	librarian
			FROM	tbl_lisdLibrarian
			WHERE	librarianID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#ARGUMENTS.librarianID#" /> 
		</cfquery>

	<cfreturn librarianNameResults />
	</cffunction>
	
	<cffunction name="getTotalStudentsByDepartmentLib" access="public" output="false" returntype="struct" hint="gets total students by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<!--- set empty struct --->
		<cfset var totalStudentsByDepartmentLibResults = "" />
		<cfset var totalStudentsByDepartmentLibRecordSet = structNew() />
					
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="totalStudentsByDepartmentLibResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		department, SUM(a.underGraduates) AS underGraduateCount, SUM(a.graduates) AS graduateCount, SUM(a.faculty) AS facultyCount, SUM(a.other) AS otherCount
				FROM		tbl_lisd a, tbl_lisdDepartment b
				WHERE 		0=0
				AND			a.librarianID = #ARGUMENTS.librarianID#
				AND			a.departmentID = b.departmentID
				AND			MONTH(classDate) = #monthsInArray[i]#
				<cfif monthsInArray[i] EQ 7 OR monthsInArray[i] EQ 8 OR monthsInArray[i] EQ 9 OR monthsInArray[i] EQ 10 OR monthsInArray[i] EQ 11 OR monthsInArray[i] EQ 12>
					AND 	YEAR(classDate) = '#ARGUMENTS.selectedDateStart#' 
				<cfelseif monthsInArray[i] EQ 1 OR monthsInArray[i] EQ 2 OR monthsInArray[i] EQ 3 OR monthsInArray[i] EQ 4 OR monthsInArray[i] EQ 5 OR monthsInArray[i] EQ 6> 
				 	AND		YEAR(classDate) = '#ARGUMENTS.selectedDateEnd#'
				</cfif> 
				Group By 	b.department
			</cfquery>
						
			<!--- set results for each month in empty struct --->
			<cfswitch expression="#monthsInArray[i]#">
				<cfcase value="7">
					<cfset totalStudentsByDepartmentLibRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.julyResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.julyRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="8">
					<cfset totalStudentsByDepartmentLibRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.augustResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.augustRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="9">
					<cfset totalStudentsByDepartmentLibRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.septemberResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.septemberRecordCount = #totalStudentsByDepartmentLibResults.recordCount#>
				</cfcase> 
				<cfcase value="10">
					<cfset totalStudentsByDepartmentLibRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.octoberResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.octoberRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="11">
					<cfset totalStudentsByDepartmentLibRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.novemberResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.novemberRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="12">
					<cfset totalStudentsByDepartmentLibRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.decemberResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.decemberRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="1">
					<cfset totalStudentsByDepartmentLibRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.januaryResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.januaryRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="2">
					<cfset totalStudentsByDepartmentLibRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.februaryResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.februaryRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="3">
					<cfset totalStudentsByDepartmentLibRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalStudentsByDepartmentLibRecordSet.marchResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.marchRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				 <cfcase value="4">
					<cfset totalStudentsByDepartmentLibRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.aprilResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.aprilRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase>
				<cfcase value="5">
					<cfset totalStudentsByDepartmentLibRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.mayResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.mayRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase> 
				<cfcase value="6">
					<cfset totalStudentsByDepartmentLibRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentLibRecordSet.juneResults = #totalStudentsByDepartmentLibResults# />
					<cfset totalStudentsByDepartmentLibRecordSet.juneRecordCount = #totalStudentsByDepartmentLibResults.recordCount# />
				</cfcase> 
			</cfswitch> 
		</cfloop>
	<cfreturn totalStudentsByDepartmentLibRecordSet />
	</cffunction>
		
	<cffunction name="getFiscalYearTotalsLib" access="public" output="false" returntype="struct" hint="gets fiscal year totals">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearLibResults = "" />
		<cfset var fiscalYearStart = "#selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#selectedDateEnd#-06-30" /> 
		<cfset var fiscalYearTotal = "" />
		<!--- set empty struct --->
		<cfset var fiscalYearLibRecordSet = structNew() />
						
		<!--- stored procedure used to get fiscal year totals for selected librarian --->
		<!--- <cfstoredproc procedure="spGetFiscalYearTotalsLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#fiscalYearStart#" cfsqltype="CF_SQL_DATE" type="in">
			<cfprocparam value="#fiscalYearEnd#" cfsqltype="CF_SQL_DATE" type="in">
			<cfprocresult name="fiscalYearLibResults">
		</cfstoredproc>  --->
		
		
		<cfquery name="fiscalYearLibResults" datasource="#ARGUMENTS.dsn#">
		
				SELECT 	SUM(undergraduates) AS underGraduates, SUM(graduates) AS graduates, SUM(faculty) AS faculty, SUM(other) AS other
				FROM	tbl_lisd
				WHERE	librarianID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.librarianID#" />
				AND		classDate BETWEEN '#fiscalYearStart#' AND '#fiscalYearEnd#'
			
		</cfquery>
		
		<cfif fiscalYearLibResults.underGraduates EQ ""><cfset fiscalYearLibResults.underGraduates = 0 /></cfif>
		<cfif fiscalYearLibResults.graduates EQ ""><cfset fiscalYearLibResults.graduates = 0 /></cfif>
		<cfif fiscalYearLibResults.faculty EQ ""><cfset fiscalYearLibResults.faculty = 0 /></cfif>
		<cfif fiscalYearLibResults.other EQ ""><cfset fiscalYearLibResults.other = 0 /></cfif>
		
		
		<!--- calculate fy total --->		
		<cfset fiscalYearTotal = #fiscalYearLibResults.undergraduates# + #fiscalYearLibResults.graduates# + #fiscalYearLibResults.faculty# + #fiscalYearLibResults.other# />
		<!--- populate struct with data returned from stored procedures --->
		<cfset fiscalYearLibRecordSet.fiscalYearResults = #fiscalYearLibResults# />
		<cfset fiscalYearLibRecordSet.fiscalYearStart = #fiscalYearStart# />
		<cfset fiscalYearLibRecordSet.fiscalYearEnd = #fiscalYearEnd# />
		<cfset fiscalYearLibRecordSet.fiscalYearTotal = #fiscalYearTotal# />
				
	<cfreturn fiscalYearLibRecordSet />
	</cffunction>
		
	<cffunction name="getFiscalYearTotalsByMonthLib" access="public" output="false" returntype="struct" hint="gets fiscal year totals by month">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var fiscalYearMonthlyLibResults = "" />
		<!--- set empty struct --->
		<cfset var fiscalYearByMonthLibRecordSet = structNew() />
				
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="fiscalYearMonthlyLibResults" datasource="#ARGUMENTS.dsn#">
				SELECT	SUM(undergraduates) AS underGraduates, SUM(graduates) AS graduates, SUM(faculty) AS faculty, SUM(other) AS other
				FROM	tbl_lisd
				WHERE	0=0
				AND		librarianID = #ARGUMENTS.librarianID#
				AND     MONTH(classDate) = #monthsInArray[i]#
				<cfif monthsInArray[i] EQ 7 OR monthsInArray[i] EQ 8 OR monthsInArray[i] EQ 9 OR monthsInArray[i] EQ 10 OR monthsInArray[i] EQ 11 OR monthsInArray[i] EQ 12>
					AND 	YEAR(classDate) = '#ARGUMENTS.selectedDateStart#' 
				<cfelseif monthsInArray[i] EQ 1 OR monthsInArray[i] EQ 2 OR monthsInArray[i] EQ 3 OR monthsInArray[i] EQ 4 OR monthsInArray[i] EQ 5 OR monthsInArray[i] EQ 6> 
				 	AND		YEAR(classDate) = '#ARGUMENTS.selectedDateEnd#'
				</cfif> 
			</cfquery>
						
			<!--- set results for each month in empty struct --->
			<cfswitch expression="#monthsInArray[i]#">
				<cfcase value="7">
					<cfset fiscalYearByMonthLibRecordSet.july = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.julyResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.julyTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="8">
					<cfset fiscalYearByMonthLibRecordSet.august = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.augustResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.augustTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="9">
					<cfset fiscalYearByMonthLibRecordSet.september = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.septemberResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.septemberTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="10">
					<cfset fiscalYearByMonthLibRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.octoberResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.octoberTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="11">
					<cfset fiscalYearByMonthLibRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.novemberResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.novemberTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="12">
					<cfset fiscalYearByMonthLibRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.decemberResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.decemberTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="1">
					<cfset fiscalYearByMonthLibRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.januaryResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.januaryTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="2">
					<cfset fiscalYearByMonthLibRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.februaryResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.februaryTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="3">
					<cfset fiscalYearByMonthLibRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset fiscalYearByMonthLibRecordSet.marchResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.marchTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="4">
					<cfset fiscalYearByMonthLibRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.aprilResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.aprilTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase>
				<cfcase value="5">
					<cfset fiscalYearByMonthLibRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.mayResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.mayTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase> 
				<cfcase value="6">
					<cfset fiscalYearByMonthLibRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthLibRecordSet.juneResults = #fiscalYearMonthlyLibResults# />
					<cfif fiscalYearMonthlyLibResults.underGraduates EQ ""><cfset fiscalYearMonthlyLibResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.graduates EQ ""><cfset fiscalYearMonthlyLibResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.faculty EQ ""><cfset fiscalYearMonthlyLibResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyLibResults.other EQ ""><cfset fiscalYearMonthlyLibResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthLibRecordSet.juneTotal = #fiscalYearMonthlyLibResults.underGraduates# + #fiscalYearMonthlyLibResults.graduates# + #fiscalYearMonthlyLibResults.faculty# + #fiscalYearMonthlyLibResults.other# />
				</cfcase> 
			</cfswitch>
		</cfloop>
	<cfreturn fiscalYearByMonthLibRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByDepartmentLib" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByDepartmentLibResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByDepartmentLibRecordSet = structNew() />
		<!--- set empty variables for monthly totals --->
		<cfset var getJulyTotal = "" />
		<cfset var getAugustTotal = "" />
		<cfset var getSeptemberTotal = "" />
		<cfset var getOctoberTotal = "" />
		<cfset var getNovemberTotal = "" />
		<cfset var getDecemberTotal = "" />
		<cfset var getJanuaryTotal = "" />
		<cfset var getFebruaryTotal = "" />
		<cfset var getMarchTotal = "" />
		<cfset var getAprilTotal = "" />
		<cfset var getMayTotal = "" />
		<cfset var getJuneTotal = "" />
			
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="totalClassesByDepartmentLibResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		department, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdDepartment b
				WHERE 		0=0
				AND			a.librarianID = #ARGUMENTS.librarianID#
				AND			a.departmentID = b.departmentID
				AND			MONTH(classDate) = #monthsInArray[i]#
				<cfif monthsInArray[i] EQ 7 OR monthsInArray[i] EQ 8 OR monthsInArray[i] EQ 9 OR monthsInArray[i] EQ 10 OR monthsInArray[i] EQ 11 OR monthsInArray[i] EQ 12>
					AND 	YEAR(classDate) = '#ARGUMENTS.selectedDateStart#' 
				<cfelseif monthsInArray[i] EQ 1 OR monthsInArray[i] EQ 2 OR monthsInArray[i] EQ 3 OR monthsInArray[i] EQ 4 OR monthsInArray[i] EQ 5 OR monthsInArray[i] EQ 6> 
				 	AND		YEAR(classDate) = '#ARGUMENTS.selectedDateEnd#'
				</cfif> 
				Group By 	b.department
			</cfquery>
			
			<!--- set results for each month in empty struct --->
			<cfswitch expression="#monthsInArray[i]#">
				<cfcase value="7">
					<cfset totalClassesByDepartmentLibRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.julyResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.julyRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByDepartmentLibRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.augustResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.augustRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByDepartmentLibRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.septemberResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.septemberRecordCount = #totalClassesByDepartmentLibResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentLibRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByDepartmentLibRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.octoberResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.octoberRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentLibRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByDepartmentLibRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.novemberResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.novemberRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentLibRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByDepartmentLibRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.decemberResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.decemberRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByDepartmentLibRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.januaryResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.januaryRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentLibRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByDepartmentLibRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.februaryResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.februaryRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentLibRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByDepartmentLibRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByDepartmentLibRecordSet.marchResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.marchRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByDepartmentLibRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.aprilResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.aprilRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByDepartmentLibRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.mayResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.mayRecordCount = #totalClassesByDepartmentLibResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByDepartmentLibRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentLibRecordSet.juneResults = #totalClassesByDepartmentLibResults# />
					<cfset totalClassesByDepartmentLibRecordSet.juneRecordCount = #totalClassesByDepartmentLibResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByDepartmentLibResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByDepartmentLibRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentLibRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch> 
		</cfloop>
	<cfset totalClassesByDepartmentLibRecordSet.yearTotal = #totalClassesByDepartmentLibRecordSet.julyTotal# + #totalClassesByDepartmentLibRecordSet.augustTotal# + #totalClassesByDepartmentLibRecordSet.septemberTotal# + #totalClassesByDepartmentLibRecordSet.octoberTotal# + #totalClassesByDepartmentLibRecordSet.novemberTotal# + #totalClassesByDepartmentLibRecordSet.decemberTotal# + #totalClassesByDepartmentLibRecordSet.januaryTotal# + #totalClassesByDepartmentLibRecordSet.februaryTotal# + #totalClassesByDepartmentLibRecordSet.marchTotal# + #totalClassesByDepartmentLibRecordSet.aprilTotal# + #totalClassesByDepartmentLibRecordSet.mayTotal# + #totalClassesByDepartmentLibRecordSet.juneTotal# />
	<cfreturn totalClassesByDepartmentLibRecordSet />
	</cffunction>

	<cffunction name="getClassTotalsLib" access="public" output="false" returntype="query">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var classTotalsLibResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />
				
		 <!--- stored procedure used to get class totals   
		<cfstoredproc procedure="spGetClassTotalsLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="classTotalsLibResults">
		</cfstoredproc> --->

		<cfquery name="classTotalsLibResults" datasource="#ARGUMENTS.dsn#">
			SELECT 	COUNT(className) AS classCount
			FROM	tbl_lisd 
			WHERE	librarianID = #ARGUMENTS.librarianID#
			AND	classDate BETWEEN '#fiscalYearStart#' AND '#fiscalYearEnd#'
		</cfquery>
	
	<cfreturn classTotalsLibResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByDepartmentYearLib" access="public" output="false" returntype="query" hint="gets class totals by department for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentYearLibResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />
				
		 <!--- stored procedure used to get yearly class totals by department   
		<cfstoredproc procedure="spGetTotalClassesByDepartmentYearLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByDepartmentYearLibResults">
		</cfstoredproc> --->

		<cfquery name="totalClassesByDepartmentYearLibResults" datasource="#ARGUMENTS.dsn#">	
 			SELECT 	department, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdDepartment b
			WHERE	a.librarianID = #ARGUMENTS.librarianID#
			AND		a.departmentID = b.departmentID
			AND		classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#' 
			Group By 	b.department	
		</cfquery>

												
	<cfreturn totalClassesByDepartmentYearLibResults />
	</cffunction>
		
	<cffunction name="getTotalClassesByLocationLib" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByLocationLibResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByLocationLibRecordSet = structNew() />
		<!--- set empty variables for monthly totals --->
		<cfset var getJulyTotal = "" />
		<cfset var getAugustTotal = "" />
		<cfset var getSeptemberTotal = "" />
		<cfset var getOctoberTotal = "" />
		<cfset var getNovemberTotal = "" />
		<cfset var getDecemberTotal = "" />
		<cfset var getJanuaryTotal = "" />
		<cfset var getFebruaryTotal = "" />
		<cfset var getMarchTotal = "" />
		<cfset var getAprilTotal = "" />
		<cfset var getMayTotal = "" />
		<cfset var getJuneTotal = "" />
			
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="totalClassesByLocationLibResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		b.location, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdLocation b
				WHERE 		0=0
				AND			a.librarianID = #ARGUMENTS.librarianID#
				AND			a.locationID = b.locationID
				AND			MONTH(classDate) = #monthsInArray[i]#
				<cfif monthsInArray[i] EQ 7 OR monthsInArray[i] EQ 8 OR monthsInArray[i] EQ 9 OR monthsInArray[i] EQ 10 OR monthsInArray[i] EQ 11 OR monthsInArray[i] EQ 12>
					AND 	YEAR(classDate) = '#ARGUMENTS.selectedDateStart#' 
				<cfelseif monthsInArray[i] EQ 1 OR monthsInArray[i] EQ 2 OR monthsInArray[i] EQ 3 OR monthsInArray[i] EQ 4 OR monthsInArray[i] EQ 5 OR monthsInArray[i] EQ 6> 
				 	AND		YEAR(classDate) = '#ARGUMENTS.selectedDateEnd#'
				</cfif> 
				 Group By 	b.location 
			</cfquery>
			
			<!--- set results for each month in empty struct --->
			<cfswitch expression="#monthsInArray[i]#">
				<cfcase value="7">
					<cfset totalClassesByLocationLibRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.julyResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.julyRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByLocationLibRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.augustResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.augustRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByLocationLibRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.septemberResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.septemberRecordCount = #totalClassesByLocationLibResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationLibRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByLocationLibRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.octoberResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.octoberRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationLibRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByLocationLibRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.novemberResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.novemberRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationLibRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByLocationLibRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.decemberResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.decemberRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByLocationLibRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.januaryResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.januaryRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationLibRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByLocationLibRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.februaryResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.februaryRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationLibRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByLocationLibRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByLocationLibRecordSet.marchResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.marchRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByLocationLibRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.aprilResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.aprilRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByLocationLibRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.mayResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.mayRecordCount = #totalClassesByLocationLibResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByLocationLibRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationLibRecordSet.juneResults = #totalClassesByLocationLibResults# />
					<cfset totalClassesByLocationLibRecordSet.juneRecordCount = #totalClassesByLocationLibResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByLocationLibResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByLocationLibRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationLibRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch>
		</cfloop>
	<cfset totalClassesByLocationLibRecordSet.yearTotal = #totalClassesByLocationLibRecordSet.julyTotal# + #totalClassesByLocationLibRecordSet.augustTotal# + #totalClassesByLocationLibRecordSet.septemberTotal# + #totalClassesByLocationLibRecordSet.octoberTotal# + #totalClassesByLocationLibRecordSet.novemberTotal# + #totalClassesByLocationLibRecordSet.decemberTotal# + #totalClassesByLocationLibRecordSet.januaryTotal# + #totalClassesByLocationLibRecordSet.februaryTotal# + #totalClassesByLocationLibRecordSet.marchTotal# + #totalClassesByLocationLibRecordSet.aprilTotal# + #totalClassesByLocationLibRecordSet.mayTotal# + #totalClassesByLocationLibRecordSet.juneTotal# />
	<cfreturn totalClassesByLocationLibRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassTypeLib" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByClassTypeLibResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByClassTypeLibRecordSet = structNew() />
		<!--- set empty variables for monthly totals --->
		<cfset var getJulyTotal = "" />
		<cfset var getAugustTotal = "" />
		<cfset var getSeptemberTotal = "" />
		<cfset var getOctoberTotal = "" />
		<cfset var getNovemberTotal = "" />
		<cfset var getDecemberTotal = "" />
		<cfset var getJanuaryTotal = "" />
		<cfset var getFebruaryTotal = "" />
		<cfset var getMarchTotal = "" />
		<cfset var getAprilTotal = "" />
		<cfset var getMayTotal = "" />
		<cfset var getJuneTotal = "" />
			
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="totalClassesByClassTypeLibResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		b.classType, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdClassType b
				WHERE 		0=0
				AND			a.librarianID = #ARGUMENTS.librarianID#
				AND			a.classTypeID = b.classTypeID
				AND			MONTH(classDate) = #monthsInArray[i]#
				<cfif monthsInArray[i] EQ 7 OR monthsInArray[i] EQ 8 OR monthsInArray[i] EQ 9 OR monthsInArray[i] EQ 10 OR monthsInArray[i] EQ 11 OR monthsInArray[i] EQ 12>
					AND 	YEAR(classDate) = '#ARGUMENTS.selectedDateStart#' 
				<cfelseif monthsInArray[i] EQ 1 OR monthsInArray[i] EQ 2 OR monthsInArray[i] EQ 3 OR monthsInArray[i] EQ 4 OR monthsInArray[i] EQ 5 OR monthsInArray[i] EQ 6> 
				 	AND		YEAR(classDate) = '#ARGUMENTS.selectedDateEnd#'
				</cfif> 
				 Group By 	b.classType 
			</cfquery>
			
			<!--- set results for each month in empty struct --->
			<cfswitch expression="#monthsInArray[i]#">
				<cfcase value="7">
					<cfset totalClassesByClassTypeLibRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.julyResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.julyRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByClassTypeLibRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.augustResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.augustRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByClassTypeLibRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.septemberResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.septemberRecordCount = #totalClassesByClassTypeLibResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeLibRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByClassTypeLibRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.octoberResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.octoberRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeLibRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByClassTypeLibRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.novemberResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.novemberRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeLibRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByClassTypeLibRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.decemberResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.decemberRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByClassTypeLibRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.januaryResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.januaryRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeLibRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByClassTypeLibRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.februaryResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.februaryRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeLibRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByClassTypeLibRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByClassTypeLibRecordSet.marchResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.marchRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByClassTypeLibRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.aprilResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.aprilRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByClassTypeLibRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.mayResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.mayRecordCount = #totalClassesByClassTypeLibResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByClassTypeLibRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeLibRecordSet.juneResults = #totalClassesByClassTypeLibResults# />
					<cfset totalClassesByClassTypeLibRecordSet.juneRecordCount = #totalClassesByClassTypeLibResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByClassTypeLibResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByClassTypeLibRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeLibRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch> 
		</cfloop>
		<cfset totalClassesByClassTypeLibRecordSet.yearTotal = #totalClassesByClassTypeLibRecordSet.julyTotal# + #totalClassesByClassTypeLibRecordSet.augustTotal# + #totalClassesByClassTypeLibRecordSet.septemberTotal# + #totalClassesByClassTypeLibRecordSet.octoberTotal# + #totalClassesByClassTypeLibRecordSet.novemberTotal# + #totalClassesByClassTypeLibRecordSet.decemberTotal# + #totalClassesByClassTypeLibRecordSet.januaryTotal# + #totalClassesByClassTypeLibRecordSet.februaryTotal# + #totalClassesByClassTypeLibRecordSet.marchTotal# + #totalClassesByClassTypeLibRecordSet.aprilTotal# + #totalClassesByClassTypeLibRecordSet.mayTotal# + #totalClassesByClassTypeLibRecordSet.juneTotal# />
	<cfreturn totalClassesByClassTypeLibRecordSet />
	</cffunction>
					
	<cffunction name="getTotalStudentsByDepartmentYearLib" access="public" output="false" returntype="query" hint="gets student totals by department for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentYearLibResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />		
				
		 <!--- stored procedure used to get yearly class totals by department  
		<cfstoredproc procedure="spGetTotalStudentsByDepartmentYearLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalStudentsByDepartmentYearLibResults">
		</cfstoredproc> ---> 

		<cfquery name="totalStudentsByDepartmentYearLibResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		department, SUM(a.undergraduates) AS underGraduates, SUM(a.graduates) AS graduates, SUM(a.faculty) AS faculty, SUM(a.other) AS other
			FROM		tbl_lisd a, tbl_lisdDepartment b
			WHERE		a.librarianID = #ARGUMENTS.librarianID#
			AND			a.departmentID = b.departmentID
			AND			classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.department	
		</cfquery>
												
	<cfreturn totalStudentsByDepartmentYearLibResults />
	</cffunction>

	<cffunction name="getTotalClassesByLocationYearLib" access="public" output="false" returntype="query" hint="gets class totals by location for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationYearLibResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />	
				
		 <!--- stored procedure used to get yearly class totals by location   
		<cfstoredproc procedure="spGetTotalClassesByLocationYearLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByLocationYearLibResults">
		</cfstoredproc> --->

		<cfquery name="totalClassesByLocationYearLibResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		location, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdLocation b
			WHERE		a.librarianID = #ARGUMENTS.librarianID#
			AND			a.locationID = b.locationID
			AND			classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.location	
		</cfquery>			
												
	<cfreturn totalClassesByLocationYearLibResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassTypeYearLib" access="public" output="false" returntype="query" hint="gets class totals by class type for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeYearLibResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />		
				
		 <!--- stored procedure used to get yearly class totals by location  
		<cfstoredproc procedure="spGetTotalClassesByClassTypeYearLib" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByClassTypeYearLibResults">
		</cfstoredproc> --->

		<cfquery name="totalClassesByClassTypeYearLibResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		classType, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdClassType b
			WHERE		a.librarianID = #ARGUMENTS.librarianID#
			AND			a.classTypeID = b.classtypeID
			AND			classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.classType	
		</cfquery>
												
	<cfreturn totalClassesByClassTypeYearLibResults />
	</cffunction>
		
</cfcomponent>
