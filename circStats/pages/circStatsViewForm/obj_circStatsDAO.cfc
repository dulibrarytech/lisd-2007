<cfcomponent displayname="circStatsDAO" output="false">
	
	<cffunction name="createViewStatForm" access="public" output="false" returntype="struct" hint="creates form">
		<cfargument name="dsn" type="string" required="true" />
		<cfset var questionType = "" />
		<cfset var interactionType = "" />
		<cfset var types = structNew() />
		<cftransaction>
			<cfquery name="questionType" datasource="#ARGUMENTS.dsn#">
				SELECT	questionTypeID, questionType
				FROM	tbl_circStatsQuestionType
				WHERE 	isActive = 1 
			</cfquery>
			<cfquery name="interactionType" datasource="#ARGUMENTS.dsn#">
				SELECT  interactionTypeID, interactionType
				FROM	tbl_circStatsInteractionType
			</cfquery>
		</cftransaction>
		<cfset types.questionType = #questionType# />
		<cfset types.interactionType = #interactionType# />
	<cfreturn types />
	</cffunction>
	
	<cffunction name="getCurrentStats" access="public" output="false" returntype="query" hint="gets stats">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfset var currentStats = "" />
		<cfset VARIABLES.currentMonth = month( now() ) />
		<cfset VARIABLES.currentYear = year( now() ) />
		
	
		<cfquery name="currentStats" datasource="#ARGUMENTS.dsn#">
			SELECT	questionTypeID, interactionTypeID, questionTextType, dateCreated	
			FROM 	tbl_circStats
			WHERE	0=0 
			AND		employeeTypeID = #ARGUMENTS.employeeTypeID#
			<!--- AND		MONTH(dateCreated)= DATEPART(MONTH, #now()#)
			AND		YEAR(dateCreated) = DATEPART(YEAR, #now()#) --->
			AND		EXTRACT(MONTH FROM dateCreated) = #VARIABLES.currentMonth#
			AND		EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
			
		</cfquery>
		
	<cfreturn currentStats />
	</cffunction> 
	
	<cffunction name="getTotals" access="public" output="false" returntype="query" hint="gets 2007 totals">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="employeeTypeID" type="numeric" required="true" />
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfset var getTotals = "" />
		<cfset VARIABLES.currentYear = year( now() ) />
		
		<cfquery name="totals" datasource="#ARGUMENTS.dsn#">
			SELECT	COUNT(interactionTypeID) AS interactionTypeTotal
			FROM	tbl_circStats
			WHERE	0=0 
			AND		employeeTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.employeeTypeID#"  />
			AND		interactionTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.interactionTypeID#"  />
					
			<!--- AND		YEAR(dateCreated) = DATEPART(YEAR, #now()#) --->
			AND		EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
		
		</cfquery>
	<cfreturn totals />
	</cffunction>
	
	<cffunction name="getAllTotals" access="public" output="false" returntype="query" hint="gets staff and student totals">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="interactionTypeID" type="numeric" required="true" />
		<cfset var getAllTotals = "" />
		<cfset VARIABLES.currentYear = year( now() ) />
			
		<cfquery name="allTotals" datasource="#ARGUMENTS.dsn#">
			SELECT	COUNT(interactionTypeID) AS allTypeTotals
			FROM	tbl_circStats
			WHERE	0=0 
			AND		interactionTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.interactionTypeID#"  />
			AND		employeeTypeID IN(1,2)<!--- staff = 1, student = 2 --->
			
			<!--- AND		YEAR(dateCreated) = DATEPART(YEAR, #now()#) --->
			AND		EXTRACT(YEAR FROM dateCreated) = #VARIABLES.currentYear#
		
		</cfquery>
	<cfreturn allTotals />
	</cffunction>
	
	<cffunction name="getStats" access="public" output="false" returntype="query" hint="gets stats by specific dates set by user">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="employeetypeID" type="numeric" required="true" /> 
		<cfargument name="dateRange1" type="date" required="true" />
		<cfargument name="dateRange2" type="date" required="true" />
		<cfset var currentStats = "" />
		<cfquery name="currentStats" datasource="#ARGUMENTS.dsn#">
			SELECT	questionTypeID, interactionTypeID, questionTextType, dateCreated	
			FROM 	tbl_circStats
			WHERE	0=0 
			AND		employeeTypeID = <cfqueryparam value="#ARGUMENTS.employeeTypeID#" cfsqltype="cf_sql_integer" /> 
			AND		dateCreated BETWEEN '#ARGUMENTS.dateRange1#' AND '#ARGUMENTS.dateRange2#'  
		</cfquery>
	<cfreturn currentStats />															
	</cffunction> 
		
	<cffunction name="getHourlyStats" access="public" output="false" returntype="array" hint="gets hourly stats">
		<cfargument name="cDate" type="date" required="true"/>
		<cfargument name="dateType" type="string" required="true" />
		<cfargument name="dsn" type="string" required="true" />
		<cfset var arryResults = arrayNew(1) />
		<cfset var arryHours = arrayNew(2) /><!--- set times in array / quick and dirty --->
		
		<cfset arryHours[1][1] = "00:00" /><cfset arryHours[1][2] = "01:00" /> 
		<cfset arryHours[2][1] = "01:00" /><cfset arryHours[2][2] = "02:00" /> 
		<cfset arryHours[3][1] = "02:00" /><cfset arryHours[3][2] = "03:00" /> 
		<cfset arryHours[4][1] = "03:00" /><cfset arryHours[4][2] = "04:00" /> 
		<cfset arryHours[5][1] = "04:00" /><cfset arryHours[5][2] = "05:00" /> 
		<cfset arryHours[6][1] = "05:00" /><cfset arryHours[6][2] = "06:00" />
		<cfset arryHours[7][1] = "06:00" /><cfset arryHours[7][2] = "07:00" />  
		<cfset arryHours[8][1] = "07:00" /><cfset arryHours[8][2] = "08:00" /> 
		<cfset arryHours[9][1] = "08:00" /><cfset arryHours[9][2] = "09:00" /> 
		<cfset arryHours[10][1] = "09:00" /><cfset arryHours[10][2] = "10:00"/> 
		<cfset arryHours[11][1] = "10:00" /><cfset arryHours[11][2] = "11:00" /> 
		<cfset arryHours[12][1] = "11:00" /><cfset arryHours[12][2] = "12:00" />
		<cfset arryHours[13][1] = "12:00" /><cfset arryHours[13][2] = "13:00" />  
		<cfset arryHours[14][1] = "13:00" /><cfset arryHours[14][2] = "14:00" /> 
		<cfset arryHours[15][1] = "14:00" /><cfset arryHours[15][2] = "15:00" /> 
		<cfset arryHours[16][1] = "15:00" /><cfset arryHours[16][2] = "16:00" />
		<cfset arryHours[17][1] = "16:00" /><cfset arryHours[17][2] = "17:00" />
		<cfset arryHours[18][1] = "17:00" /><cfset arryHours[18][2] = "18:00" /> 
		<cfset arryHours[19][1] = "18:00" /><cfset arryHours[19][2] = "19:00" />  
		<cfset arryHours[20][1] = "19:00" /><cfset arryHours[20][2] = "20:00" /> 
		<cfset arryHours[21][1] = "20:00" /><cfset arryHours[21][2] = "21:00" /> 
		<cfset arryHours[22][1] = "21:00" /><cfset arryHours[22][2] = "22:00" /> 
		<cfset arryHours[23][1] = "22:00" /><cfset arryHours[23][2] = "23:00" />
		<cfset arryHours[24][1] = "23:00" /><cfset arryHours[24][2] = "00:00" />
			
		<cfloop from="1" to="#arrayLen(arryHours)#" index="i">
			<cfquery name="hourlyStats" datasource="#ARGUMENTS.dsn#">
				SELECT	COUNT(statTypeID) AS hourlyTotal 
				FROM 	tbl_circStats
				WHERE	0=0 
				<cfif ARGUMENTS.dateType NEQ "cYear">
					AND		MONTH(dateCreated) = #DATEPART("m", ARGUMENTS.cDate)# 
				</cfif>
				<cfif ARGUMENTS.dateType NEQ "NULL" AND ARGUMENTS.dateType EQ "cDay">
					AND 	DAY(dateCreated)= #DATEPART("d", ARGUMENTS.cDate)# 
				</cfif>  
					AND		YEAR(dateCreated) = #DATEPART("yyyy", ARGUMENTS.cDate)# 
					AND CAST(dateCreated AS TIME) BETWEEN '#arryHours[i][1]#' AND '#arryHours[i][2]#' 				
					<!--- MSSQL AND		dateCreated - CAST(FLOOR(CAST(dateCreated AS float)) AS datetime) BETWEEN '#arryHours[i][1]#' AND '#arryHours[i][2]#' --->
			</cfquery>
			<cfset arrayAppend(arryResults, #hourlyStats.hourlyTotal#) />
		</cfloop>
	<cfreturn arryResults />
	</cffunction> 

</cfcomponent>