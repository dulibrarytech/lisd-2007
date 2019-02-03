<!---
  
	Generates Excel document from queried class data
	Requires "POI" library: http://poi.apache.org/
 
--->

<!--- Create an instance of the POIUtility.cfc. --->
	<cfset objPOI = CreateObject( "component", "POIUtility" ).Init() />

	<cfscript>
		// gets class data based on librarianID
		classDataRecordSet = APPLICATION.obj_lisdClassDataController.getClassData(FORM.librarianID, FORM.selectedDateStart, FORM.selectedDateEnd);
	</cfscript>


<!--- new query --->
	<cfset qClassData = QueryNew( "department, className, classDate, courseNumber, classType, instructor, undergraduates, graduates, faculty, other, location", "VarChar, VarChar, VarChar, VarChar, VarChar, VarChar, Int, Int, Int, Int, VarChar" )>
	
<!--- loop --->
	<cfloop query="classDataRecordSet.classData">
		
		<cfset newRow = QueryAddRow( qClassData )>
		<cfset temp = QuerySetCell( qClassData, "department", #classDataRecordSet.classData.department# ) />
		<cfset temp = QuerySetCell( qClassData, "className", #classDataRecordSet.classData.className# ) />
		<cfset temp = QuerySetCell( qClassData, "classDate", #DateFormat(classDataRecordSet.classData.classDate, "mm/dd/yyyy")# ) />
		<cfset temp = QuerySetCell( qClassData, "courseNumber", #classDataRecordSet.classData.courseNumber# ) />
		<cfset temp = QuerySetCell( qClassData, "classType", #classDataRecordSet.classData.classType# ) />
		<cfset temp = QuerySetCell( qClassData, "instructor",	#classDataRecordSet.classData.instructor# ) />
		<cfset temp = QuerySetCell( qClassData, "undergraduates", #classDataRecordSet.classData.undergraduates# ) />
		<cfset temp = QuerySetCell( qClassData, "graduates", #classDataRecordSet.classData.graduates# ) />
		<cfset temp = QuerySetCell( qClassData, "faculty", #classDataRecordSet.classData.faculty# ) />
		<cfset temp = QuerySetCell( qClassData, "other", #classDataRecordSet.classData.other# ) />
		<cfset temp = QuerySetCell( qClassData, "location", #classDataRecordSet.classData.location# ) />

	</cfloop>

	<!--- <cfdump var="#qClassData#" /> --->

<!--- 
	Create a sheet object for this query. This will 
	return a structure with the following keys:
	- Query
	- ColumnList
	- ColumnNames
	- SheetName
--->
	<cfset objSheet = objPOI.GetNewSheetStruct() />
	
<!--- Set the query into the sheet. --->
	<cfset objSheet.Query = qClassData />
	
<!--- 
	Define the order of the columns (and which 
	columns to include).
--->
	<cfset objSheet.ColumnList = "department,classType,location,classDate,className,courseNumber,instructor,undergraduates,graduates,faculty,other" />
	
<!--- 
	We want to include a header Row in our outputted excel 
	workbook. Therefore, provide header values in the SAME
	order as the column list above.
--->
	<cfset objSheet.ColumnNames = "Department,Class Type,Location,Class Date,Class Name,Course Number,Instructor,Undergraduates,Graduates,Faculty,Other" />
		
<!--- Set the sheet name. --->
	<cfset objSheet.SheetName = "LISD-Class-Data-Export" />
		
<!--- 
	Now, let's write the sheet to a workbook on the file
	sysetm (this will create a NEW file). When doing so, we
	have the option to pass either a single sheet object (as
	we are donig in this example, or an array of sheet 
	objects). We can also define header and row CSS.
--->
	<cfset fileName = "#FORM.librarianID#-#FORM.selectedDateStart#-#FORM.selectedDateEnd#.xls" />
	
	<cfset objPOI.WriteExcel( FilePath = ExpandPath( "./export/#fileName#" ), Sheets = objSheet, HeaderCSS = "border-bottom: 2px solid dark_green ;", RowCSS = "border-bottom: 1px dotted gray ;" ) />

<!--- redirect to download page --->
	<cflocation url="#REQUEST.rootPath#?page=downloadExcel&fileName=#fileName#">