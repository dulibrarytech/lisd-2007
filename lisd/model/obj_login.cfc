<cfcomponent output="false" hint="login">
	<cffunction name="authenticate" access="public" output="false" returntype="void" hint="authenticates user">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="userName" type="string" required="true" />
		<cfargument name="pwd" type="string" required="true" />
			
		<!--- stored procedure used to authenticate user 
		<cfstoredproc procedure="spAuthenticate" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#TRIM(ARGUMENTS.userName)#" cfsqltype="CF_SQL_VARCHAR" type="in">
			<cfprocparam value="#TRIM(ARGUMENTS.pwd)#" cfsqltype="CF_SQL_VARCHAR" type="in">
			<cfprocresult name="authenticateResults">
		</cfstoredproc> 
		--->
		
		
		<cfquery name="authenticateResults" datasource="#ARGUMENTS.dsn#">
			SELECT	userID, role
			FROM	tbl_lisdLogin
			WHERE	0=0
			AND	userName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.userName#" />
			AND	pwd = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#ARGUMENTS.pwd#" />
		</cfquery>
		
		<!---
		<cfldap server="curly.cair.du.edu"
			action="query"
			name="authenticateResults"
			attributes="cn,ou"
			start="DC=cair,DC=du.edu"
			username="#ARGUMENTS.userName#"
			password="#ARGUMENTS.pwd#"
			 /><!--- rebind="Yes" --->
		--->										
		<cfif authenticateResults.recordCount GT 0>
			<cfset SESSION.userID = #authenticateResults.userID# />
			<cfset SESSION.role = #authenticateResults.role# />
			<cfswitch expression="#SESSION.role#">
				<cfcase value="0">
					<cflocation url="#REQUEST.rootPath#?page=admin&action=add" addtoken="true" />
				</cfcase>
				<cfcase value="1">
					<cflocation url="#REQUEST.rootPath#?page=admin&action=frmClassData" addtoken="true" />
				</cfcase>
			</cfswitch>
		<cfelse>
			<cflocation url="#REQUEST.rootPath#?page=login" addtoken="false">
		</cfif>
	</cffunction>
</cfcomponent>
