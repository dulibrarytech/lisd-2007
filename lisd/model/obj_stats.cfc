<cfcomponent output="false" hint="gets data by user selected fiscal year">
	
	<!--- used by all functions in component --->
	<!--- list of months using numeric values / begin with July - fiscal year --->
	<cfset VARIABLES.months = "7,8,9,10,11,12,1,2,3,4,5,6" />
	<!--- convert list to array / performs better when using it in a loop --->	
	<cfset VARIABLES.monthsInArray = listToArray("#VARIABLES.months#")/>
	
	<cffunction name="getTotalStudentsByDepartment" access="public" output="false" returntype="struct" hint="gets total students by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalStudentsByDepartmentResults = "" />
		<!--- set empty struct --->
		<cfset var totalStudentsByDepartmentRecordSet = structNew() />
					
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="totalStudentsByDepartmentResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		department, SUM(a.underGraduates) AS underGraduateCount, SUM(a.graduates) AS graduateCount, SUM(a.faculty) AS facultyCount, SUM(a.other) AS otherCount
				FROM		tbl_lisd a, tbl_lisdDepartment b
				WHERE 		0=0
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
					<cfset totalStudentsByDepartmentRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.julyResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.julyRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="8">
					<cfset totalStudentsByDepartmentRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.augustResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.augustRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="9">
					<cfset totalStudentsByDepartmentRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.septemberResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.septemberRecordCount = #totalStudentsByDepartmentResults.recordCount#>
				</cfcase> 
				<cfcase value="10">
					<cfset totalStudentsByDepartmentRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.octoberResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.octoberRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="11">
					<cfset totalStudentsByDepartmentRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.novemberResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.novemberRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="12">
					<cfset totalStudentsByDepartmentRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.decemberResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.decemberRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="1">
					<cfset totalStudentsByDepartmentRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.januaryResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.januaryRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="2">
					<cfset totalStudentsByDepartmentRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.februaryResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.februaryRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="3">
					<cfset totalStudentsByDepartmentRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalStudentsByDepartmentRecordSet.marchResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.marchRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				 <cfcase value="4">
					<cfset totalStudentsByDepartmentRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.aprilResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.aprilRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase>
				<cfcase value="5">
					<cfset totalStudentsByDepartmentRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.mayResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.mayRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase> 
				<cfcase value="6">
					<cfset totalStudentsByDepartmentRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalStudentsByDepartmentRecordSet.juneResults = #totalStudentsByDepartmentResults# />
					<cfset totalStudentsByDepartmentRecordSet.juneRecordCount = #totalStudentsByDepartmentResults.recordCount# />
				</cfcase> 
			</cfswitch> 
		</cfloop>
	<cfreturn totalStudentsByDepartmentRecordSet />
	</cffunction>
		
	<cffunction name="getFiscalYearTotals" access="public" output="false" returntype="struct" hint="gets fiscal year totals">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var fiscalYearStart = "#selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#selectedDateEnd#-06-30" /> 
		<cfset var fiscalYearResults = "" />
		<cfset var fiscalYearTotal = "" />
		<!--- set empty struct --->
		<cfset var fiscalYearRecordSet = structNew() />
						
		<!--- stored procedure used to get fiscal year totals --->
		<!--- <cfstoredproc procedure="spGetFiscalYearTotals" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#fiscalYearStart#" cfsqltype="CF_SQL_DATE" type="in">
			<cfprocparam value="#fiscalYearEnd#" cfsqltype="CF_SQL_DATE" type="in">
			<cfprocresult name="fiscalYearResults">
		</cfstoredproc> --->
		
		<cfquery name="fiscalYearResults" datasource="#ARGUMENTS.dsn#">
			
				SELECT	SUM(undergraduates) AS undergraduates, SUM(graduates) AS graduates, SUM(faculty) AS faculty, SUM(other) AS other
				FROM	tbl_lisd
				WHERE 	classDate BETWEEN '#fiscalYearStart#' AND '#fiscalYearEnd#'
		
		</cfquery>
		
		
		<!--- calculate fy total --->
		<cfif fiscalYearResults.undergraduates EQ ""><cfset fiscalYearResults.undergraduates = 0 /></cfif>
		<cfif fiscalYearResults.graduates EQ ""><cfset fiscalYearResults.graduates = 0 /></cfif>
		<cfif fiscalYearResults.faculty EQ ""><cfset fiscalYearResults.faculty = 0 /></cfif>
		<cfif fiscalYearResults.other EQ ""><cfset fiscalYearResults.other = 0 /></cfif>		
		<cfset fiscalYearTotal = #fiscalYearResults.undergraduates# + #fiscalYearResults.graduates# + #fiscalYearResults.faculty# + #fiscalYearResults.other# />
		<!--- populate struct with data returned from stored procedure --->
		<cfset fiscalYearRecordSet.fiscalYearResults = #fiscalYearResults# />
		<cfset fiscalYearRecordSet.fiscalYearStart = #fiscalYearStart# />
		<cfset fiscalYearRecordSet.fiscalYearEnd = #fiscalYearEnd# />
		<cfset fiscalYearRecordSet.fiscalYearTotal = #fiscalYearTotal# />
				
	<cfreturn fiscalYearRecordSet />
	</cffunction>
	
	<cffunction name="getFiscalYearTotalsByMonth" access="public" output="false" returntype="struct" hint="gets fiscal year totals by month">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var fiscalYearMonthlyResults = "" />
		<!--- set empty struct --->
		<cfset var fiscalYearByMonthRecordSet = structNew() />
				
		<cfloop from="1" to="#arrayLen(VARIABLES.monthsInArray)#" index="i" step="1">
			<cfquery name="fiscalYearMonthlyResults" datasource="#ARGUMENTS.dsn#">
				SELECT	SUM(undergraduates) AS underGraduates, SUM(graduates) AS graduates, SUM(faculty) AS faculty, SUM(other) AS other
				FROM	tbl_lisd
				WHERE	0=0
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
					<cfset fiscalYearByMonthRecordSet.july = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.julyResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.julyTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="8">
					<cfset fiscalYearByMonthRecordSet.august = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.augustResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.augustTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="9">
					<cfset fiscalYearByMonthRecordSet.september = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.septemberResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.septemberTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="10">
					<cfset fiscalYearByMonthRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.octoberResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.octoberTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="11">
					<cfset fiscalYearByMonthRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.novemberResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.novemberTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="12">
					<cfset fiscalYearByMonthRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.decemberResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.decemberTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="1">
					<cfset fiscalYearByMonthRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.januaryResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.januaryTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="2">
					<cfset fiscalYearByMonthRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.februaryResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.februaryTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="3">
					<cfset fiscalYearByMonthRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset fiscalYearByMonthRecordSet.marchResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.marchTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="4">
					<cfset fiscalYearByMonthRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.aprilResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.aprilTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase>
				<cfcase value="5">
					<cfset fiscalYearByMonthRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.mayResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.mayTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase> 
				<cfcase value="6">
					<cfset fiscalYearByMonthRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset fiscalYearByMonthRecordSet.juneResults = #fiscalYearMonthlyResults# />
					<cfif fiscalYearMonthlyResults.underGraduates EQ ""><cfset fiscalYearMonthlyResults.underGraduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.graduates EQ ""><cfset fiscalYearMonthlyResults.graduates = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.faculty EQ ""><cfset fiscalYearMonthlyResults.faculty = 0 /></cfif>
					<cfif fiscalYearMonthlyResults.other EQ ""><cfset fiscalYearMonthlyResults.other = 0 /></cfif>
					<cfset fiscalYearByMonthRecordSet.juneTotal = #fiscalYearMonthlyResults.underGraduates# + #fiscalYearMonthlyResults.graduates# + #fiscalYearMonthlyResults.faculty# + #fiscalYearMonthlyResults.other# />
				</cfcase> 
			</cfswitch>
		</cfloop>
	<cfreturn fiscalYearByMonthRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByDepartment" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByDepartmentResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByDepartmentRecordSet = structNew() />
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
			<cfquery name="totalClassesByDepartmentResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		department, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdDepartment b
				WHERE 		0=0
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
					<cfset totalClassesByDepartmentRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.julyResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.julyRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByDepartmentRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.augustResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.augustRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByDepartmentRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.septemberResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.septemberRecordCount = #totalClassesByDepartmentResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByDepartmentRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.octoberResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.octoberRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByDepartmentRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.novemberResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.novemberRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByDepartmentRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.decemberResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.decemberRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByDepartmentRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.januaryResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.januaryRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByDepartmentRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.februaryResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.februaryRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByDepartmentRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByDepartmentRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByDepartmentRecordSet.marchResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.marchRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByDepartmentRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.aprilResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.aprilRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByDepartmentRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.mayResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.mayRecordCount = #totalClassesByDepartmentResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByDepartmentRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByDepartmentRecordSet.juneResults = #totalClassesByDepartmentResults# />
					<cfset totalClassesByDepartmentRecordSet.juneRecordCount = #totalClassesByDepartmentResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByDepartmentResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByDepartmentRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByDepartmentRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch> 
		</cfloop>
	<cfset totalClassesByDepartmentRecordSet.yearTotal = #totalClassesByDepartmentRecordSet.julyTotal# + #totalClassesByDepartmentRecordSet.augustTotal# + #totalClassesByDepartmentRecordSet.septemberTotal# + #totalClassesByDepartmentRecordSet.octoberTotal# + #totalClassesByDepartmentRecordSet.novemberTotal# + #totalClassesByDepartmentRecordSet.decemberTotal# + #totalClassesByDepartmentRecordSet.januaryTotal# + #totalClassesByDepartmentRecordSet.februaryTotal# + #totalClassesByDepartmentRecordSet.marchTotal# + #totalClassesByDepartmentRecordSet.aprilTotal# + #totalClassesByDepartmentRecordSet.mayTotal# + #totalClassesByDepartmentRecordSet.juneTotal# />
	<cfreturn totalClassesByDepartmentRecordSet />
	</cffunction>

	<cffunction name="getClassTotals" access="public" output="false" returntype="query">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var classTotalsResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-07-01" />
				
		 <!--- stored procedure used to get class totals   
		<cfstoredproc procedure="spGetClassTotals" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="classTotalsResults">
		</cfstoredproc> --->
		
		<cfquery name="classTotalsResults" datasource="#ARGUMENTS.dsn#">
			SELECT 	COUNT(className) AS classCount
			FROM	tbl_lisd 
			WHERE	classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'	
		</cfquery>

	<cfreturn classTotalsResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByDepartmentYear" access="public" output="false" returntype="query" hint="gets class totals by department for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByDepartmentYearResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-07-01" />
				
		 <!--- stored procedure used to get yearly class totals by department  
		<cfstoredproc procedure="spGetTotalClassesByDepartmentYear" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByDepartmentYearResults">
		</cfstoredproc>  --->

		<cfquery name="totalClassesByDepartmentYearResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		department, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdDepartment b
			WHERE		a.departmentID = b.departmentID
			AND			classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.department	
		</cfquery>
												
	<cfreturn totalClassesByDepartmentYearResults />
	</cffunction>

	<cffunction name="getTotalClassesByLocation" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByLocationResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByLocationRecordSet = structNew() />
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
			<cfquery name="totalClassesByLocationResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		b.location, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdLocation b
				WHERE 		0=0
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
					<cfset totalClassesByLocationRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.julyResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.julyRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByLocationRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByLocationRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByLocationRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.augustResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.augustRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByLocationRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByLocationRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.septemberResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.septemberRecordCount = #totalClassesByLocationResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByLocationRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByLocationRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.octoberResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.octoberRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByLocationRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByLocationRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.novemberResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.novemberRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByLocationRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByLocationRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.decemberResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.decemberRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByLocationRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByLocationRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.januaryResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.januaryRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByLocationRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByLocationRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.februaryResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.februaryRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByLocationRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByLocationRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByLocationRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByLocationRecordSet.marchResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.marchRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByLocationRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByLocationRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.aprilResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.aprilRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByLocationRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByLocationRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.mayResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.mayRecordCount = #totalClassesByLocationResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByLocationRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByLocationRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByLocationRecordSet.juneResults = #totalClassesByLocationResults# />
					<cfset totalClassesByLocationRecordSet.juneRecordCount = #totalClassesByLocationResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByLocationResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByLocationRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByLocationRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch> 
		</cfloop>
	<cfset totalClassesByLocationRecordSet.yearTotal = #totalClassesByLocationRecordSet.julyTotal# + #totalClassesByLocationRecordSet.augustTotal# + #totalClassesByLocationRecordSet.septemberTotal# + #totalClassesByLocationRecordSet.octoberTotal# + #totalClassesByLocationRecordSet.novemberTotal# + #totalClassesByLocationRecordSet.decemberTotal# + #totalClassesByLocationRecordSet.januaryTotal# + #totalClassesByLocationRecordSet.februaryTotal# + #totalClassesByLocationRecordSet.marchTotal# + #totalClassesByLocationRecordSet.aprilTotal# + #totalClassesByLocationRecordSet.mayTotal# + #totalClassesByLocationRecordSet.juneTotal# />
	<cfreturn totalClassesByLocationRecordSet />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassType" access="public" output="false" returntype="struct" hint="gets class totals by department">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var i = "" />
		<cfset var totalClassesByClassTypeResults = "" />
		<!--- set empty struct --->
		<cfset var totalClassesByClassTypeRecordSet = structNew() />
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
			<cfquery name="totalClassesByClassTypeResults" datasource="#ARGUMENTS.dsn#">
				SELECT 		b.classType, COUNT(a.className) AS classCount
				FROM		tbl_lisd a, tbl_lisdClassType b
				WHERE 		0=0
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
					<cfset totalClassesByClassTypeRecordSet.july = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.julyResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.julyRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getJulyTotal" dbtype="query">
						SELECT	SUM(classCount) AS julyTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getJulyTotal.julyTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.julyTotal = 0 />
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.julyTotal = #getJulyTotal.julyTotal# />
					</cfif>
				</cfcase>
				<cfcase value="8">
					<cfset totalClassesByClassTypeRecordSet.august = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.augustResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.augustRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getAugustTotal" dbtype="query">
						SELECT	SUM(classCount) AS augustTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getAugustTotal.augustTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.augustTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.augustTotal = #getAugustTotal.augustTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="9">
					<cfset totalClassesByClassTypeRecordSet.september = #MonthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.septemberResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.septemberRecordCount = #totalClassesByClassTypeResults.recordCount#>
					<cfquery name="getSeptemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS septemberTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getSeptemberTotal.septemberTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.septemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeRecordSet.septemberTotal = #getSeptemberTotal.septemberTotal# /> 
					</cfif>
				</cfcase> 
				<cfcase value="10">
					<cfset totalClassesByClassTypeRecordSet.october = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.octoberResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.octoberRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getOctoberTotal" dbtype="query">
						SELECT	SUM(classCount) AS octoberTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getOctoberTotal.octoberTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.octoberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeRecordSet.octoberTotal = #getOctoberTotal.octoberTotal# />
					</cfif>
				</cfcase>
				<cfcase value="11">
					<cfset totalClassesByClassTypeRecordSet.november = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.novemberResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.novemberRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getNovemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS novemberTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getNovemberTotal.novemberTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.novemberTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeRecordSet.novemberTotal = #getNovemberTotal.novemberTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="12">
					<cfset totalClassesByClassTypeRecordSet.december = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.decemberResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.decemberRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getDecemberTotal" dbtype="query">
						SELECT	SUM(classCount) AS decemberTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getDecemberTotal.decemberTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.decemberTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.decemberTotal = #getDecemberTotal.decemberTotal# />   
					</cfif>
				</cfcase>
				<cfcase value="1">
					<cfset totalClassesByClassTypeRecordSet.january = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.januaryResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.januaryRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getJanuaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS januaryTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getJanuaryTotal.januaryTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.januaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeRecordSet.januaryTotal = #getJanuaryTotal.januaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="2">
					<cfset totalClassesByClassTypeRecordSet.february = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.februaryResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.februaryRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getFebruaryTotal" dbtype="query">
						SELECT	SUM(classCount) AS februaryTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getFebruaryTotal.februaryTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.februaryTotal = 0 /> 
					<cfelse>
						 <cfset totalClassesByClassTypeRecordSet.februaryTotal = #getFebruaryTotal.februaryTotal# />
					</cfif>
				</cfcase>
				<cfcase value="3">
					<cfset totalClassesByClassTypeRecordSet.march = monthAsString(#monthsInArray[i]#) />
					<cfset totalClassesByClassTypeRecordSet.marchResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.marchRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getMarchTotal" dbtype="query">
						SELECT	SUM(classCount) AS marchTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getMarchTotal.marchTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.marchTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.marchTotal = #getMarchTotal.marchTotal# />
					</cfif>
				</cfcase>
				 <cfcase value="4">
					<cfset totalClassesByClassTypeRecordSet.april = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.aprilResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.aprilRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getAprilTotal" dbtype="query">
						SELECT	SUM(classCount) AS aprilTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getAprilTotal.aprilTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.aprilTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.aprilTotal = #getAprilTotal.aprilTotal# /> 
					</cfif>
				</cfcase>
				<cfcase value="5">
					<cfset totalClassesByClassTypeRecordSet.may = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.mayResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.mayRecordCount = #totalClassesByClassTypeResults.recordCount#>
					<cfquery name="getMayTotal" dbtype="query">
						SELECT	SUM(classCount) AS mayTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getMayTotal.mayTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.mayTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.mayTotal = #getMayTotal.mayTotal# />
					</cfif>
				</cfcase> 
				<cfcase value="6">
					<cfset totalClassesByClassTypeRecordSet.june = #monthAsString(monthsInArray[i])# />
					<cfset totalClassesByClassTypeRecordSet.juneResults = #totalClassesByClassTypeResults# />
					<cfset totalClassesByClassTypeRecordSet.juneRecordCount = #totalClassesByClassTypeResults.recordCount# />
					<cfquery name="getJuneTotal" dbtype="query">
						SELECT	SUM(classCount) AS juneTotal
						FROM	totalClassesByClassTypeResults
					</cfquery>
					<cfif getJuneTotal.juneTotal EQ "">
						<cfset totalClassesByClassTypeRecordSet.juneTotal = 0 /> 
					<cfelse>
						<cfset totalClassesByClassTypeRecordSet.juneTotal = #getJuneTotal.juneTotal# />
					</cfif>
				</cfcase> 
			</cfswitch> 
		</cfloop>
		<cfset totalClassesByClassTypeRecordSet.yearTotal = #totalClassesByClassTypeRecordSet.julyTotal# + #totalClassesByClassTypeRecordSet.augustTotal# + #totalClassesByClassTypeRecordSet.septemberTotal# + #totalClassesByClassTypeRecordSet.octoberTotal# + #totalClassesByClassTypeRecordSet.novemberTotal# + #totalClassesByClassTypeRecordSet.decemberTotal# + #totalClassesByClassTypeRecordSet.januaryTotal# + #totalClassesByClassTypeRecordSet.februaryTotal# + #totalClassesByClassTypeRecordSet.marchTotal# + #totalClassesByClassTypeRecordSet.aprilTotal# + #totalClassesByClassTypeRecordSet.mayTotal# + #totalClassesByClassTypeRecordSet.juneTotal# />
	<cfreturn totalClassesByClassTypeRecordSet />
	</cffunction>

	<cffunction name="getTotalStudentsByDepartmentYear" access="public" output="false" returntype="query" hint="gets student totals by department for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalStudentsByDepartmentYearResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />
				
		 <!--- stored procedure used to get yearly student totals by department  
		<cfstoredproc procedure="spGetTotalStudentsByDepartmentYear" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalStudentsByDepartmentYearResults">
		</cfstoredproc>  --->

		<cfquery name="totalStudentsByDepartmentYearResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		department, SUM(a.undergraduates) AS underGraduates, SUM(a.graduates) AS graduates, SUM(a.faculty) AS faculty, SUM(a.other) AS other
			FROM		tbl_lisd a, tbl_lisdDepartment b
			WHERE		a.departmentID = b.departmentID
			AND		classDate BETWEEN '#fiscalYearStart#' AND '#fiscalYearEnd#'
			Group By 	b.department
		</cfquery>
												
	<cfreturn totalStudentsByDepartmentYearResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByLocationYear" access="public" output="false" returntype="query" hint="gets class totals by location for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByLocationYearResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />
				
		 <!--- stored procedure used to get yearly student totals by department  
		<cfstoredproc procedure="spGetTotalClassesByLocationYear" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByLocationYearResults">
		</cfstoredproc>  --->

		<cfquery name="totalClassesByLocationYearResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		location, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdLocation b
			WHERE		a.locationID = b.locationID
			AND		classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.location	
		</cfquery>		
												
	<cfreturn totalClassesByLocationYearResults />
	</cffunction>
	
	<cffunction name="getTotalClassesByClassTypeYear" access="public" output="false" returntype="query" hint="gets class totals by class type for the year">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="selectedDateStart" type="string" required="true" />
		<cfargument name="selectedDateEnd" type="string" required="true" />
		<cfset var totalClassesByClassTypeYearResults = "" />
		<cfset var fiscalYearStart = "#ARGUMENTS.selectedDateStart#-07-01" />
		<cfset var fiscalYearEnd = "#ARGUMENTS.selectedDateEnd#-06-30" />		
				
		 <!--- stored procedure used to get yearly student totals by department --->  
		<!--- <cfstoredproc procedure="spGetTotalClassesByClassTypeYear" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.selectedDateStart#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocparam value="#ARGUMENTS.selectedDateEnd#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="totalClassesByClassTypeYearResults">
		</cfstoredproc> --->

		<cfquery name="totalClassesByClassTypeYearResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		classType, COUNT(a.className) AS classCount
			FROM		tbl_lisd a, tbl_lisdClassType b
			WHERE		a.classTypeID = b.classtypeID
			AND		classDate BETWEEN '#fiscalYearStart#'  AND '#fiscalYearEnd#'
			Group By 	b.classType	
		</cfquery>
												
	<cfreturn totalClassesByClassTypeYearResults />
	</cffunction>
		
</cfcomponent>