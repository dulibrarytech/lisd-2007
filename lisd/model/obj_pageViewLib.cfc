<cfcomponent output="false">
	<cffunction name="getPageViewLib" access="public" output="false" returntype="struct" hint="gets page librarian views">
		
		<!--- create struct --->
		<cfset var pageViewLib = structNew() />
		
		<!--- populate struct --->
		<cfset pageViewLib.fiscalYearTotalsLib = "../../view/librarianStats/dsp_fiscalYearTotalsLib.cfm" />	
		<cfset pageViewLib.totalStudentsByMonthLib = "../../view/librarianStats/dsp_totalStudentsByMonthLib.cfm" />
		<cfset pageViewLib.totalStudentsByDepartmentLib = "../../view/librarianStats/dsp_totalStudentsByDepartmentLib.cfm" />
		<cfset pageViewLib.totalClassesByDepartmentLib = "../../view/librarianStats/dsp_totalClassesByDepartmentLib.cfm" />
		<cfset pageViewLib.totalClassesByDepartmentYearLib = "../../view/librarianStats/dsp_totalClassesByDepartmentYearLib.cfm" />
		<cfset pageViewLib.totalClassesByLocationLib = "../../view/librarianStats/dsp_totalClassesByLocationLib.cfm" />
		<cfset pageViewLib.totalClassesByClassTypeLib = "../../view/librarianStats/dsp_totalClassesByClassTypeLib.cfm" />
		<cfset pageViewLib.totalStudentsByDepartmentYearLib = "../../view/librarianStats/dsp_totalStudentsByDepartmentYearLib.cfm" />
		<cfset pageViewLib.totalClassesByLocationYearLib = "../../view/librarianStats/dsp_totalClassesByLocationYearLib.cfm" />
		<cfset pageViewLib.totalClassesByClassTypeYearLib = "../../view/librarianStats/dsp_totalClassesByClassTypeYearLib.cfm" />
		
		<!--- EXPORT templates --->
		<cfset pageViewLib.exportTotalStudentsByMonthLib = "../../view/export/libStats/dsp_exportTotalStudentsByMonthView.cfm" />
		<cfset pageViewLib.exportTotalStudentsByDepartmentLib = "../../view/export/libStats/dsp_exportTotalStudentsByDepartmentView.cfm" />
		<cfset pageViewLib.exportTotalClassesByDepartmentLib = "../../view/export/libStats/dsp_exportTotalClassesByDepartmentView.cfm" />
		<cfset pageViewLib.exportTotalClassesByLocationLib = "../../view/export/libStats/dsp_exportTotalClassesByLocationView.cfm" />
		<cfset pageViewLib.exportFiscalYearTotalsLib = "../../view/export/libStats/dsp_exportFiscalYearTotalsLibView.cfm" />
		<cfset pageViewLib.exportTotalStudentsByDepartmentYearLib = "../../view/export/libStats/dsp_exportTotalStudentsByDepartmentYearLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByDepartmentYearLib = "../../view/export/libStats/dsp_exportTotalClassesByDepartmentLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByLocationYearLib = "../../view/export/libStats/dsp_exportTotalClassesByLocationYearLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByClassTypeYearLib = "../../view/export/libStats/dsp_exportTotalClassesByClassTypeYearLibView.cfm" />
		<cfset pageViewLib.exportAllStats = "../../view/export/dsp_exportAllStats.cfm" />
		
		<cfset pageViewLib.exportTotalStudentsByMonthLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalStudentsByMonthView.cfm" />
		<cfset pageViewLib.exportTotalStudentsByDepartmentLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalStudentsByDepartmentView.cfm" />
		<cfset pageViewLib.exportTotalClassesByDepartmentLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalClassesByDepartmentView.cfm" />
		<cfset pageViewLib.exportTotalClassesByLocationLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalClassesByLocationView.cfm" />
		<cfset pageViewLib.exportFiscalYearTotalsLibPdf = "../../view/export/libStatsPdf/dsp_exportFiscalYearTotalsLibView.cfm" />
		<cfset pageViewLib.exportTotalStudentsByDepartmentYearLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalStudentsByDepartmentYearLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByDepartmentYearLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalClassesByDepartmentLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByLocationYearLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalClassesByLocationYearLibView.cfm" />
		<cfset pageViewLib.exportTotalClassesByClassTypeYearLibPdf = "../../view/export/libStatsPdf/dsp_exportTotalClassesByClassTypeYearLibView.cfm" />
		
	<cfreturn pageViewLib />
	</cffunction>
</cfcomponent>