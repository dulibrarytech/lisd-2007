<cfcomponent output="false">

	<cffunction name="formValidation" output="false" returntype="struct" hint="validates FORM values">
		<cfset var validate = structNew() />
		
		<cfif IsDefined("ARGUMENTS.librarianID") AND ARGUMENTS.librarianID EQ 0><cfset validate.librarianError=true /><cfset validate.error=true><cfset validate.librarianMessage = "Please select a librarian."/></cfif>
		<cfif IsDefined("ARGUMENTS.librarian") AND ARGUMENTS.librarian EQ ""><cfset validate.librarianError=true /><cfset validate.error=true><cfset validate.librarianMessage = "Please enter a librarian."/></cfif>
		<cfif IsDefined("ARGUMENTS.departmentID") AND ARGUMENTS.departmentID EQ 0><cfset validate.departmentError=true /><cfset validate.error=true></cfif>
		<cfif IsDefined("ARGUMENTS.department") AND ARGUMENTS.department EQ ""><cfset validate.departmentError=true /><cfset validate.error=true><cfset validate.departmentMessage = "Please enter a department."/></cfif>
		<cfif IsDefined("ARGUMENTS.classTypeID") AND ARGUMENTS.classTypeID EQ 0><cfset validate.classTypeError=true /><cfset validate.error=true></cfif>
		<cfif IsDefined("ARGUMENTS.classType") AND ARGUMENTS.classType EQ ""><cfset validate.classTypeError=true /><cfset validate.error=true><cfset validate.classTypeMessage = "Please enter a class type."/></cfif>
		<cfif IsDefined("ARGUMENTS.className") AND ARGUMENTS.className EQ ""><cfset validate.classNameError=true /><cfset validate.error=true></cfif>
		<cfif IsDefined("ARGUMENTS.courseNumber") AND ARGUMENTS.courseNumber EQ "" AND NOT IsNumeric("ARGUMENTS.courseNumber")><cfset validate.courseNumberError=true /><cfset validate.error=true></cfif>
		<cfif IsDefined("ARGUMENTS.instructor") AND ARGUMENTS.instructor EQ ""><cfset validate.instructorError=true /><cfset validate.error=true></cfif>
		
		<cfif IsDefined("ARGUMENTS.undergraduates") AND NOT IsNumeric("ARGUMENTS.undergraduates") AND ARGUMENTS.undergraduates EQ 0 AND ARGUMENTS.undergraduates EQ ""><cfset validate.studentError=true /><cfset validate.error=true /></cfif>
		
		 <cfif IsDefined("ARGUMENTS.graduates") AND NOT IsNumeric("ARGUMENTS.graduates") AND ARGUMENTS.graduates EQ 0 AND ARGUMENTS.graduates EQ ""><cfset validate.studentError=true /><cfset validate.error=true /></cfif>
		
		<cfif IsDefined("ARGUMENTS.faculty") AND NOT IsNumeric("ARGUMENTS.faculty") AND ARGUMENTS.faculty EQ 0 AND ARGUMENTS.faculty EQ ""><cfset validate.studentError=true /><cfset validate.error=true /></cfif>
		
		<cfif IsDefined("ARGUMENTS.other") AND NOT IsNumeric("ARGUMENTS.other") AND ARGUMENTS.other EQ 0 AND ARGUMENTS.other EQ ""><cfset validate.studentError=true /><cfset validate.error=true /></cfif>
		
		<cfif IsDefined("ARGUMENTS.selectedDateStart") AND IsDefined("ARGUMENTS.selectedDateEnd") AND (ARGUMENTS.selectedDateEnd - ARGUMENTS.selectedDateStart GT 1)><cfset validate.selectedDateError=true /><cfset validate.error=true><cfset validate.selectedDateMessage = "Please select a date range that is only a year a part."/></cfif>
		<cfif IsDefined("ARGUMENTS.location") AND ARGUMENTS.location EQ ""><cfset validate.locationError=true /><cfset validate.error=true><cfset validate.locationMessage = "Please select a location."/></cfif>
		<cfif IsDefined("ARGUMENTS.locationID") AND ARGUMENTS.locationID EQ ""><cfset validate.locationError=true /><cfset validate.error=true></cfif>
		
	<cfreturn validate />
	</cffunction>

</cfcomponent>