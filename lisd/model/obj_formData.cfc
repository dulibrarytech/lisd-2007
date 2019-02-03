<cfcomponent hint="gets FORM data" output="false">
	
	<cffunction name="getFormData" access="public" output="false" returntype="struct" hint="gets data to populate drop downs in FORM">
		<cfargument name="dsn" type="string" required="true" />
		<cfset var recordSet = structNew() />
		
		<!--- stored procedure used to get librarians 
		<cfstoredproc procedure="spGetLibrarianData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="librarianResults">
		</cfstoredproc> --->
		
		<cfquery name="librarianResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		librarianID, librarian
			FROM    	tbl_lisdLibrarian
			WHERE		isActive = 0
			ORDER BY 	librarian
		</cfquery>
		
		<!--- stored procedure used to get departments 
		<cfstoredproc procedure="spGetDepartmentData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="departmentResults">
		</cfstoredproc> --->
		
		<cfquery name="departmentResults" datasource="#ARGUMENTS.dsn#">
			SELECT 		departmentID, department
			FROM    	tbl_lisdDepartment
			WHERE		isActive = 0
			ORDER BY	department		
		</cfquery>
	
		<!--- stored procedure used to get class types 
		<cfstoredproc procedure="spGetClassTypeData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="classTypeResults">
		</cfstoredproc> --->

		<cfquery name="classTypeResults" datasource="#ARGUMENTS.dsn#">
			SELECT classTypeID, classType
			FROM    tbl_lisdClassType
			WHERE	isActive = 0
		</cfquery>
		
		<!--- stored procedure used to locations 
		<cfstoredproc procedure="spGetLocationData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="locationResults">
		</cfstoredproc> --->

		<cfquery name="locationResults" datasource="#ARGUMENTS.dsn#">
			SELECT locationID, location
			FROM    tbl_lisdLocation
			WHERE	isActive = 0
		</cfquery>

		
	<!--- place query results in struct --->
	<cfset recordSet.librarianResults = #librarianResults# />
	<cfset recordSet.departmentResults = #departmentResults# />
	<cfset recordSet.classTypeResults = #classTypeResults# />
	<cfset recordSet.locationResults = #locationResults# />
	
	<cfreturn recordSet />
	</cffunction>
	
	<cffunction name="getAdminFormData" access="public" output="false" returntype="struct" hint="gets data to populate drop downs in Admin edit FORM">
		<cfargument name="dsn" type="string" required="true" />
		<cfset var recordSet = structNew() />
		
		<!--- stored procedure used to get librarians --->
		<!---<cfstoredproc procedure="spGetLibrarianData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="librarianResults">
		</cfstoredproc> --->
		
		<cfquery name="librarianResults" datasource="#ARGUMENTS.dsn#">
				SELECT 	librarianID, librarian, isActive
				FROM	tbl_lisdLibrarian
				ORDER BY	librarian
		</cfquery>
		
		<!--- stored procedure used to get departments --->
		<!--- <cfstoredproc procedure="spGetAdminDepartmentData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="departmentResults">
		</cfstoredproc> --->
		
		<cfquery name="departmentResults" datasource="#ARGUMENTS.dsn#">
				SELECT	departmentID, department, isActive
				FROM	tbl_lisdDepartment
				ORDER BY	department
		</cfquery>
		
		<!--- stored procedure used to get class types 
		<cfstoredproc procedure="spGetClassTypeData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="classTypeResults">
		</cfstoredproc> --->
		
		<cfquery name="classTypeResults" datasource="#ARGUMENTS.dsn#">
				SELECT	classTypeID, classType, isActive
				FROM	tbl_lisdClassType
		</cfquery>
		
		<!--- stored procedure used to locations 
		<cfstoredproc procedure="spGetLocationData" datasource="#ARGUMENTS.dsn#">
			<cfprocresult name="locationResults">
		</cfstoredproc> --->
		
	
		<cfquery name="locationResults" datasource="#ARGUMENTS.dsn#">
				SELECT	locationID, location, isActive
				FROM	tbl_lisdLocation
		</cfquery>
		
		
	<!--- place query results in struct --->
	<cfset recordSet.librarianResults = #librarianResults# />
	<cfset recordSet.departmentResults = #departmentResults# />
	<cfset recordSet.classTypeResults = #classTypeResults# />
	<cfset recordSet.locationResults = #locationResults# />
	
	<cfreturn recordSet />
	</cffunction>
	
	<cffunction name="captureFormData" access="public" output="false" returntype="string" hint="inserts form data into db">
		<cfargument name="librarianID" type="numeric" required="true" />
		<cfargument name="departmentID" type="numeric" required="true" />
		<cfargument name="classTypeID" type="numeric" required="true" />
		<cfargument name="classDate" type="Date" required="true" />
		<cfargument name="className" type="String" required="true" />
		<cfargument name="courseNumber" type="String" required="true" />
		<cfargument name="instructor" type="String" required="true" />
		<cfargument name="undergraduates" type="numeric" required="true" />
		<cfargument name="graduates" type="numeric" required="true" />
		<cfargument name="faculty" type="numeric" required="true" />
		<cfargument name="other" type="numeric" required="true" />
		<cfargument name="locationID" type="numeric" required="true" />
		<cfset var message = "" />	
						
		<!--- stored procedure used to capture form data 
		<cfstoredproc procedure="spCaptureFormData" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.departmentID#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.classTypeID#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.classDate#" cfsqltype="CF_SQL_DATE" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.className#" cfsqltype="CF_SQL_CHAR" maxlength="255" type="in">
			<cfprocparam value="#ARGUMENTS.courseNumber#" cfsqltype="CF_SQL_CHAR" maxlength="255" type="in">
			<cfprocparam value="#ARGUMENTS.instructor#" cfsqltype="CF_SQL_CHAR" maxlength="255" type="in">
			<cfprocparam value="#ARGUMENTS.undergraduates#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.graduates#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.faculty#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.other#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
			<cfprocparam value="#ARGUMENTS.locationID#" cfsqltype="CF_SQL_INTEGER" maxlength="10" type="in">
		</cfstoredproc>  --->
				
		<cfquery name="saveFormData" datasource="#ARGUMENTS.dsn#">
				INSERT INTO tbl_lisd (librarianID, departmentID, classTypeID, classDate, className, courseNumber, instructor, undergraduates, graduates, faculty, other, locationID)
					VALUES(#ARGUMENTS.librarianID#,
							#ARGUMENTS.departmentID#,
							#ARGUMENTS.classTypeID#,
							'#ARGUMENTS.classDate#',
							'#ARGUMENTS.className#',
							'#ARGUMENTS.courseNumber#',
							'#ARGUMENTS.instructor#',
							#ARGUMENTS.undergraduates#,
							#ARGUMENTS.graduates#,
							#ARGUMENTS.faculty#,
							#ARGUMENTS.other#,
							#ARGUMENTS.locationID# )
		</cfquery>
		
		
					
	<cfset message = "Saving Data..." />
	
	<cfreturn message />
	</cffunction>
	
	<cffunction name="captureAdminFormData" access="public" output="false" returntype="string" hint="captures admin FORM input data">
		<cfargument name="librarian" type="string" required="false" />
		<cfargument name="department" type="string" required="false" />
		<cfargument name="classType" type="string" required="false" />
		<cfargument name="location" type="string" required="false" />
		<cfset var message = "" />	
		
		<!--- stored procedures used to capture admin form data --->
		<cfif IsDefined("ARGUMENTS.librarian")>
			
			<!--- <cfstoredproc procedure="spCaptureAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.librarian#" cfsqltype="CF_SQL_VARCHAR" type="in">
			</cfstoredproc> --->
			
				<cfquery name="saveAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
						INSERT INTO tbl_lisdLibrarian (librarian)
							VALUES('#ARGUMENTS.librarian#')
				</cfquery>
					
		</cfif>
		
		
		<cfif IsDefined("ARGUMENTS.department")>
			
			<!---
			<cfstoredproc procedure="spCaptureAdminFormDepartmentData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.department#" cfsqltype="CF_SQL_VARCHAR" type="in">
			</cfstoredproc> --->
			
			
			<cfquery name="saveAdminFormDepartmentData" datasource="#ARGUMENTS.dsn#">
					INSERT INTO tbl_lisdDepartment (department)
						VALUES('#ARGUMENTS.department#')
			</cfquery>
		
		
		</cfif>
		
		
		<cfif IsDefined("ARGUMENTS.classType")>
		
			<!--- <cfstoredproc procedure="spCaptureAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.classType#" cfsqltype="CF_SQL_VARCHAR" type="in">
			</cfstoredproc> --->
			
			
				<cfquery name="saveAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">
						INSERT INTO tbl_lisdClassType (classType)
							VALUES('#ARGUMENTS.classType#')
				</cfquery>
		
		
		</cfif>
		
		
		<cfif IsDefined("ARGUMENTS.location")>
			
			<!--- <cfstoredproc procedure="spCaptureAdminFormLocationData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.location#" cfsqltype="CF_SQL_VARCHAR" type="in">			
			</cfstoredproc> --->
		
				<cfquery name="saveAdminFormLocationData" datasource="#ARGUMENTS.dsn#">
						INSERT INTO tbl_lisdLocation (location)
							VALUES('#ARGUMENTS.location#')
				</cfquery>
			
		</cfif>

	<cfset message = "Saving Data..." />
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="updateAdminFormData" access="public" output="false" returntype="string" hint="updates admin FORM input data">
		<cfargument name="librarianID" type="numeric" required="false" />
		<cfargument name="librarian" type="string" required="false" />
		<cfargument name="departmentID" type="numeric" required="false" />
		<cfargument name="department" type="string" required="false" />
		<cfargument name="classTypeID" type="numeric" required="false" />
		<cfargument name="classType" type="string" required="false" />
		<cfargument name="locationID" type="numeric" required="false" />
		<cfargument name="location" type="string" required="false" />
		<cfargument name="isActive" type="numeric" required="false" />
		<cfset var message = "" />	
		
		<!--- stored procedures used to capture admin form data --->
		<cfif IsDefined("ARGUMENTS.librarianID")>
			
			<!--- <cfstoredproc procedure="spUpdateAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
				<cfprocparam value="#ARGUMENTS.librarian#" cfsqltype="CF_SQL_VARCHAR" type="in">
			</cfstoredproc> --->
			
			
			<cfquery name="updateAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
					UPDATE tbl_lisdLibrarian
					SET
						librarian = '#ARGUMENTS.librarian#',
						isActive = #ARGUMENTS.isActive#
					WHERE librarianID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.librarianID#" />
			</cfquery>
			
			
		</cfif>
		<cfif IsDefined("ARGUMENTS.departmentID")>
			
			<!--- <cfstoredproc procedure="spUpdateAdminFormDepartmentData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.departmentID#" cfsqltype="CF_SQL_INTEGER" type="in">
				<cfprocparam value="#ARGUMENTS.department#" cfsqltype="CF_SQL_VARCHAR" type="in">
				<cfprocparam value="#ARGUMENTS.isActive#" cfsqltype="CF_SQL_INTEGER" type="in">
			</cfstoredproc> --->
			
			<cfquery name="updateAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
					UPDATE	tbl_lisdDepartment 
					SET
						department = '#ARGUMENTS.department#',
						isActive = #ARGUMENTS.isActive#
					WHERE departmentID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.departmentID#" />
			</cfquery>
			
		</cfif>
		<cfif IsDefined("ARGUMENTS.classTypeID")>
			
			<!--- <cfstoredproc procedure="spUpdateAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.classTypeID#" cfsqltype="CF_SQL_INTEGER" type="in">
				<cfprocparam value="#ARGUMENTS.classType#" cfsqltype="CF_SQL_VARCHAR" type="in">
			</cfstoredproc> --->
		
			<cfquery name="updateAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">
					UPDATE	tbl_lisdClassType	
					SET
						classType = '#ARGUMENTS.classType#',
						isActive = #ARGUMENTS.isActive#
					WHERE classTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.classTypeID#" />
			</cfquery>
		
		</cfif>
		
		<cfif IsDefined("ARGUMENTS.locationID")>
			
			<!--- <cfstoredproc procedure="spUpdateAdminFormLocationData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.locationID#" cfsqltype="CF_SQL_INTEGER" type="in">
				<cfprocparam value="#ARGUMENTS.location#" cfsqltype="CF_SQL_VARCHAR" type="in">			
			</cfstoredproc> --->
		
				<cfquery name="updateAdminFormLocationData" datasource="#ARGUMENTS.dsn#">
						UPDATE	tbl_lisdLocation	
						SET
							location = '#ARGUMENTS.location#',
							isActive = #ARGUMENTS.isActive#
						WHERE locationID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.locationID#" />
				</cfquery>
		
		
		</cfif>

	<cfset message = "Updating Data..." />
	<cfreturn message />	
	</cffunction>
	
	<cffunction name="editAdminFormData" access="public" output="false" returntype="query" hint="pulls admin FORM input data for update">
		<cfargument name="librarianID" type="numeric" required="false" />
		<cfargument name="departmentID" type="numeric" required="false" />
		<cfargument name="classTypeID" type="numeric" required="false" />
		<cfargument name="locationID" type="numeric" required="false" />
		
		<cfset var editResults = "" />	
		
		<!--- stored procedures used to edit admin form data --->
		<cfif IsDefined("ARGUMENTS.librarianID")>
		<!---	<cfstoredproc procedure="spGetLibrarianName" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="editResults">
			</cfstoredproc> --->
			
			<cfquery name="editResults" datasource="#ARGUMENTS.dsn#">
					SELECT	librarian, isActive
					FROM	tbl_lisdLibrarian
					WHERE	librarianID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.librarianID#" />
			</cfquery>
			
		</cfif>
		<cfif IsDefined("ARGUMENTS.departmentID")>
			
			<!--- <cfstoredproc procedure="spGetDepartmentName" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.departmentID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="editResults">	
			</cfstoredproc> --->
		
			<cfquery name="editResults" datasource="#ARGUMENTS.dsn#">
					SELECT	department, isActive	
					FROM	tbl_lisdDepartment
					WHERE	departmentID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.departmentID#" />
			</cfquery>
			
		</cfif>
		<cfif IsDefined("ARGUMENTS.classTypeID")>
			
			<!---<cfstoredproc procedure="spGetClassTypeName" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.classTypeID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="editResults">
			</cfstoredproc> --->
		
		
			<cfquery name="editResults" datasource="#ARGUMENTS.dsn#">
					SELECT	classType, isActive			
					FROM	tbl_lisdClassType
					WHERE	classTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.classTypeID#" />
			</cfquery>
			
		
		</cfif>
		<cfif IsDefined("ARGUMENTS.locationID")>
			
			<!--- <cfstoredproc procedure="spGetLocationName" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.locationID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="editResults">				
			</cfstoredproc> --->
		
			
				<cfquery name="editResults" datasource="#ARGUMENTS.dsn#">
						SELECT	location, isActive				
						FROM	tbl_lisdLocation
						WHERE	locationID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.locationID#" />
				</cfquery>
		
		</cfif>
	
	<cfreturn editResults />	
	</cffunction>
	
	<cffunction name="editClassData" access="public" output="false" returntype="query" hint="pulls admin FORM input data for update">
		<cfargument name="lisdID" type="numeric" required="true" />
		<cfset var classDataRecordSet = "" />	
		<cfset var message = "" />
		
		<!--- stored procedures used to edit admin form data --->
		<!---<cfstoredproc procedure="spGetClassDataEdit" datasource="#ARGUMENTS.dsn#">
			<cfprocparam value="#ARGUMENTS.lisdID#" cfsqltype="CF_SQL_INTEGER" type="in">
			<cfprocresult name="classDataRecordSet">
		</cfstoredproc>--->
		
		
		<cfquery name="classDataRecordSet" datasource="#ARGUMENTS.dsn#">
				SELECT	*					
				FROM	tbl_lisd a, tbl_lisdLibrarian b, tbl_lisdDepartment c, tbl_lisdClassType d, tbl_lisdLocation e	
				WHERE	a.lisdID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.lisdID#" />
				AND		a.librarianID = b.librarianID
				AND		a.departmentID = c.departmentID
				AND		a.classTypeID = d.classTypeID
				AND		a.locationID = e.locationID	
		</cfquery>
		
		
	<cfset message = "Updating Data..." />				
	<cfreturn classDataRecordSet />	
	</cffunction>
	
	<cffunction name="updateClassData" access="public" output="false" returntype="string" hint="udates class data">
		<!--- <cfargument name="lisdID" type="numeric" required="true" /> --->
		<cfset var message = "" />	
		<cfset var updateClassData = "" />
		<cfquery name="updateClassData" datasource="#ARGUMENTS.dsn#">
			UPDATE tbl_lisd
				SET
					librarianID = <cfif IsDefined("ARGUMENTS.librarianID")>#ARGUMENTS.librarianID#</cfif>,
					departmentID = <cfif IsDefined("ARGUMENTS.departmentID")>#ARGUMENTS.departmentID#</cfif>,
					locationID = <cfif IsDefined("ARGUMENTS.locationID")>#ARGUMENTS.locationID#</cfif>,
					classtypeID = <cfif IsDefined("ARGUMENTS.classTypeID")>#ARGUMENTS.classTypeID#</cfif>,
					className = <cfif IsDefined("ARGUMENTS.className") AND className NEQ "">'#ARGUMENTS.className#'<cfelse>NULL</cfif>,
					classDate = <cfif IsDefined("ARGUMENTS.classDate") AND classDate NEQ "">'#ARGUMENTS.classDate#'<cfelse>NULL</cfif>,
					courseNumber = <cfif IsDefined("ARGUMENTS.courseNumber") AND courseNumber NEQ "">'#ARGUMENTS.courseNumber#'<cfelse>NULL</cfif>,
					instructor = <cfif IsDefined("ARGUMENTS.instructor") AND instructor NEQ "">'#ARGUMENTS.instructor#'<cfelse>NULL</cfif>,
					undergraduates = <cfif IsDefined("ARGUMENTS.undergraduates") AND undergraduates NEQ "">#ARGUMENTS.undergraduates#<cfelse>NULL</cfif>,
					graduates = <cfif IsDefined("ARGUMENTS.graduates") AND graduates NEQ "">#ARGUMENTS.graduates#<cfelse>NULL</cfif>,
					faculty = <cfif IsDefined("ARGUMENTS.faculty") AND faculty NEQ "">#ARGUMENTS.faculty#<cfelse>NULL</cfif>,
					other = <cfif IsDefined("ARGUMENTS.other") AND other NEQ "">#ARGUMENTS.other#<cfelse>NULL</cfif>
					
			WHERE lisdID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.lisdID#">
		</cfquery>
			
	<cfset message = "Updating Data..." />					
	<cfreturn message />	
	</cffunction>
		
	<cffunction name="deleteAdminFormData" access="public" output="false" returntype="string" hint="updates admin FORM input data">
		<cfargument name="librarianID" type="numeric" required="false" />
		<cfargument name="departmentID" type="numeric" required="false" />
		<cfargument name="classTypeID" type="numeric" required="false" />
		<cfargument name="locationID" type="numeric" required="false" />
		<cfset var message = "" />	
		
		<!--- stored procedures used to capture admin form data --->
		<cfif IsDefined("ARGUMENTS.librarianID")>
			
			<!---<cfstoredproc procedure="spDeleteAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.librarianID#" cfsqltype="CF_SQL_INTEGER" type="in">
			</cfstoredproc>--->
		
		<cfquery name="deleteAdminFormLibrarianData" datasource="#ARGUMENTS.dsn#">
			DELETE
			FROM	tbl_lisdLibrarian
			WHERE	librarianID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.librarianID#" />
		</cfquery>
		
		</cfif>
		<cfif IsDefined("ARGUMENTS.departmentID")>
			
			<!---<cfstoredproc procedure="spDeleteAdminFormDepartmentData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.departmentID#" cfsqltype="CF_SQL_INTEGER" type="in">
			</cfstoredproc> --->
		
			<cfquery name="deleteAdminFormDepartmentData" datasource="#ARGUMENTS.dsn#">	
			DELETE
			FROM	tbl_lisdDepartment
			WHERE	departmentID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.departmentID#" />
			</cfquery>
		
		</cfif>
		<cfif IsDefined("ARGUMENTS.classTypeID")>
			
			<!--- <cfstoredproc procedure="spDeleteAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.classTypeID#" cfsqltype="CF_SQL_INTEGER" type="in">
			</cfstoredproc> --->
			
		<cfquery name="deleteAdminFormClassTypeData" datasource="#ARGUMENTS.dsn#">	
			DELETE
			FROM	tbl_lisdClassType
			WHERE	classTypeID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.classTypeID#" />
		</cfquery>	
		
		</cfif>
		<cfif IsDefined("ARGUMENTS.locationID")>
		
		
		<!---	<cfstoredproc procedure="spDeleteAdminFormLocationData" datasource="#ARGUMENTS.dsn#">
				<cfprocparam value="#ARGUMENTS.locationID#" cfsqltype="CF_SQL_INTEGER" type="in">
			</cfstoredproc>	--->
		
			<cfquery name="deleteAdminFormLocationData" datasource="#ARGUMENTS.dsn#">	
				DELETE
				FROM	tbl_lisdLocation	
				WHERE	locationID = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.locationID#" />
			</cfquery>	
		
		
		</cfif>

	<cfset message = "Deleting Data..." />
	<cfreturn message />	
	</cffunction>
		
	<cffunction name="deleteClassData" access="public" output="false" returntype="string" hint="deletes data">
		<cfargument name="lisdID" type="numeric" required="false" />
		
		<cfset var message = "" />	
		
		<cfquery name="deleteClassData" datasource="#ARGUMENTS.dsn#">
			DELETE
			FROM		tbl_lisd
			WHERE 		lisdID=<cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#ARGUMENTS.lisdID#" />
		</cfquery>
		
	<cfset message = "Deleting Data..." />
	<cfreturn message />	
	</cffunction>
	
	
	
	<cffunction name="createDropDown" access="public" output="false" returntype="struct" hint="generates fiscal years for FORM drop down">
		<cfset var i = 10 /><!--- change this value to increase date range --->
		<cfset var j = 1 />
		<cfset var n = 1 />
		<cfset var startYear = "" />
		<cfset var endYear = "" />
		<cfset var array1 = "" />
		<cfset var array2 = "" />
		<cfset var startYearCount = "" />
		<cfset var endYearCount = "" />
		<cfset var yearStruct = structNew() />
		<cfset var startYearArray = arrayNew(1) />
		<cfset var endYearArray = arrayNew(1) />
		
		<cfloop index="startYearCount" from="1" to="#i#">
			<cfset startYear = DateAdd("yyyy", j, "2006-07-01") />
			<cfset array1 = arrayAppend(startYearArray, DateFormat(startYear, "yyyy")) />
			<cfset j = j + 1 />
		</cfloop> 
				
		<cfloop index="endYearCount" from="1" to="#i#">
			<cfset endYear = DateAdd("yyyy", n, "2007-06-30") />
			<cfset array2 = arrayAppend(endYearArray, DateFormat(endYear, "yyyy")) />	
			<cfset n = n + 1 />
		</cfloop> 
	
		<cfset yearStruct.startYear = #startYearArray# />
		<cfset yearStruct.endYear = #endYearArray# />
				
	<cfreturn yearStruct />	
	</cffunction>
	
</cfcomponent>
