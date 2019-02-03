<cfcomponent output="false">
	<cffunction name="getPageView" access="public" output="false" returntype="struct" hint="gets page views">
		<!--- create struct --->
		<cfset var pageView = structNew() />
		<!--- populate struct --->
		<cfset pageView.fiscalYearTotals = "../../view/allStats/dsp_fiscalYearTotals.cfm" />
		<cfset pageView.totalStudentsByMonth = "../../view/allStats/dsp_totalStudentsByMonth.cfm" />
		<cfset pageView.totalStudentsByDepartment = "../../view/allStats/dsp_totalStudentsByDepartment.cfm" />
		<cfset pageView.totalClassesByDepartment = "../../view/allStats/dsp_totalClassesByDepartment.cfm" />
		<cfset pageView.totalClassesByDepartmentYear = "../../view/allStats/dsp_totalClassesByDepartmentYear.cfm" />
		<cfset pageView.totalClassesByLocation = "../../view/allStats/dsp_totalClassesByLocation.cfm" />
		<cfset pageView.totalClassesByClassType = "../../view/allStats/dsp_totalClassesByClassType.cfm" />
		<cfset pageView.totalStudentsByDepartmentYear = "../../view/allStats/dsp_totalStudentsByDepartmentYear.cfm" />
		<cfset pageView.totalClassesByLocationYear = "../../view/allStats/dsp_totalClassesByLocationYear.cfm" />
		<cfset pageView.totalClassesByClassTypeYear = "../../view/allStats/dsp_totalClassesByClassTypeYear.cfm" />	
		
		<cfset pageView.exportTotalStudentsByMonth = "../../view/export/allStats/dsp_exportTotalStudentsByMonthLibView.cfm" />
		<cfset pageView.exportTotalStudentsByDepartment = "../../view/export/allStats/dsp_exportTotalStudentsByDepartmentView.cfm" />
		<cfset pageView.exportTotalClassesByDepartment = "../../view/export/allStats/dsp_exportTotalClassesByDepartmentView.cfm" />
		<cfset pageView.exportTotalClassesByLocation = "../../view/export/allStats/dsp_exportTotalClassesByLocationView.cfm" />
		<cfset pageView.exportTotalClassesByClassType = "../../view/export/allStats/dsp_exportTotalClassesByClassTypeView.cfm" />
		<cfset pageView.exportFiscalYearTotals = "../../view/export/allStats/dsp_exportFiscalYearTotalsView.cfm" />
		<cfset pageView.exportTotalStudentsByDepartmentYear = "../../view/export/allStats/dsp_exportTotalStudentsByDepartmentYearView.cfm" />
		<cfset pageView.exportTotalClassesByDepartmentYear = "../../view/export/allStats/dsp_exportTotalClassesByDepartmentYearView.cfm" />
		<cfset pageView.exportTotalClassesByLocationYear = "../../view/export/allStats/dsp_exportTotalClassesByLocationYearView.cfm" />
		<cfset pageView.exportTotalClassesByClassTypeYear = "../../view/export/allStats/dsp_exportTotalClassesByClassTypeYearView.cfm" />
						
		<cfset pageView.exportTotalStudentsByMonthPdf = "../../view/export/allStatsPdf/dsp_exportTotalStudentsByMonthLibView.cfm" />
		<cfset pageView.exportTotalStudentsByDepartmentPdf = "../../view/export/allStatsPdf/dsp_exportTotalStudentsByDepartmentView.cfm" />
		<cfset pageView.exportTotalClassesByDepartmentPdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByDepartmentView.cfm" />
		<cfset pageView.exportTotalClassesByLocationPdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByLocationView.cfm" />
		<cfset pageView.exportTotalClassesByClassTypePdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByClassTypeView.cfm" />
		<cfset pageView.exportFiscalYearTotalsPdf = "../../view/export/allStatsPdf/dsp_exportFiscalYearTotalsView.cfm" />
		<cfset pageView.exportTotalStudentsByDepartmentYearPdf = "../../view/export/allStatsPdf/dsp_exportTotalStudentsByDepartmentYearView.cfm" />
		<cfset pageView.exportTotalClassesByDepartmentYearPdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByDepartmentYearView.cfm" />
		<cfset pageView.exportTotalClassesByLocationYearPdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByLocationYearView.cfm" />
		<cfset pageView.exportTotalClassesByClassTypeYearPdf = "../../view/export/allStatsPdf/dsp_exportTotalClassesByClassTypeYearView.cfm" />						
		
						
	<cfreturn pageView />
	</cffunction>
</cfcomponent>