<cfcomponent displayname="obj_circStatsTotal" output="false" hint="returns total stats for year, month, day, and hour">
	
	<!--- constructor --->
	<cffunction name="init" access="public" output="false" 
		returntype="circStats.pages.circStatsViewForm.obj_circStatsTotal" hint="Constructor for this CFC">
		<!--- take dsn as argument --->
		<cfargument name="dsn" type="string" required="true" />
				
		<!--- set dsn to variables scope so we can use it throughout the CFC --->
		<cfset VARIABLES.dsn = ARGUMENTS.dsn />
				
		<!--- return this CFC --->
		<cfreturn this />
	</cffunction>
	
		
	
	<cffunction name="getCurrentYearTotal" access="public" output="false" returntype="query" hint="gets total click for current year">
	
		<!--- initialize variables --->
		<cfset var getCurrentYearTotal = 0 />
		<cfset VARIABLES.currentYear = year( now() ) />
		
		<cfquery name="getCurrentYearTotal" datasource="#VARIABLES.dsn#">
			SELECT 	COUNT(statTypeID) AS yearTotal
			FROM 	tbl_circStats
			<!---WHERE 	YEAR(dateCreated)= DATEPART(YEAR, #now()#)--->
			WHERE 	EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
		</cfquery>
		
	<cfreturn getCurrentYearTotal />
	</cffunction>
	
		
	<cffunction name="getCurrentMonthTotal" access="public" output="false" returntype="query" hint="gets total click for current month">
	
		<!--- initialize variables --->
		<cfset var getCurrentMonthTotal = 0 />
		<cfset VARIABLES.currentMonth = month( now() ) />
		<cfset VARIABLES.currentYear = year( now() ) />
		
		<cfquery name="getCurrentMonthTotal" datasource="#VARIABLES.dsn#">
			SELECT 	COUNT(statTypeID) AS monthTotal
			FROM 	tbl_circStats
			<!---WHERE 	MONTH( dateCreated )= DATEPART( MONTH, #now()# )
			AND 	YEAR( dateCreated )= DATEPART( YEAR, #now()# ) --->
			
			WHERE	EXTRACT(MONTH FROM dateCreated) = #VARIABLES.currentMonth#
			AND 	EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
		
		</cfquery>
		
	<cfreturn getCurrentMonthTotal />
	</cffunction>
		
		
	<cffunction name="getCurrentDayTotal" access="public" output="false" returntype="query" hint="gets total click for current day">
	
		<!--- initialize variables --->
		<cfset var getCurrentDayTotal = 0 />
		<cfset VARIABLES.currentDay = day( now() ) />
		<cfset VARIABLES.currentMonth = month( now() ) />
		<cfset VARIABLES.currentYear = year( now() ) />
		
		<cfquery name="getCurrentDayTotal" datasource="#VARIABLES.dsn#">
			SELECT 	COUNT(statTypeID) AS dayTotal
			FROM 	tbl_circStats
			<!---WHERE 	DAY(dateCreated)= DATEPART(DAY, #now()#)
			AND		MONTH(dateCreated) = DATEPART(MONTH, #now()#)
			AND		YEAR(dateCreated) = DATEPART(YEAR, #now()#) --->
			
			WHERE 	EXTRACT(DAY FROM dateCreated) = #VARIABLES.currentDay#
			AND		EXTRACT(MONTH FROM dateCreated) = #VARIABLES.currentMonth#
			AND		EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
		</cfquery>
		
	<cfreturn getCurrentDayTotal />
	</cffunction>
	
	
	<cffunction name="getCurrentHourTotal" access="public" output="false" returntype="query" hint="gets total click for current hour">
	
		<!--- initialize variables --->
		<cfset var getCurrentHourTotal = 0 />
		<cfset VARIABLES.currentHour =  hour( now() ) />
		<cfset VARIABLES.currentDay = day( now() ) />
		<cfset VARIABLES.currentMonth = month( now() ) />
		<cfset VARIABLES.currentYear = year( now() ) />
		
		<cfquery name="getCurrentHourTotal" datasource="#VARIABLES.dsn#">
			SELECT 	COUNT(statTypeID) AS hourTotal
			FROM 	tbl_circStats
			<!--- WHERE 	DATEPART(hh, dateCreated) = DATEPART(hh, #now()#)
			AND		DAY(dateCreated)= DATEPART(DAY, #now()#)
			AND		MONTH(dateCreated) = DATEPART(MONTH, #now()#)
			AND		YEAR(dateCreated) = DATEPART(YEAR, #now()#) --->
			
			WHERE	EXTRACT(HOUR FROM dateCreated) = #VARIABLES.currentHour#
			AND 	EXTRACT(DAY FROM dateCreated) = #VARIABLES.currentDay#
			AND		EXTRACT(MONTH FROM dateCreated) = #VARIABLES.currentMonth#
			AND		EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
			
		</cfquery>
		
	<cfreturn getCurrentHourTotal />
	</cffunction>
				
</cfcomponent>