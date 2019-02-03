<cfcomponent output="false">
	<cffunction name="getPage" access="public" output="false" returntype="string" hint="gets requested page">
		<cfargument name="page" type="string" required="true" />
		<cfset var event = "" />
		<!--- create struct --->
		<cfset var view = structNew() />
		<!--- populate struct --->
		<cfset view.classEntryForm = "view/frm_classPublic.cfm" />
		<cfset view.login = "view/frm_login.cfm" />
		<cfset view.stats = "view/frm_getStats.cfm" />
		<cfset view.librarianStats = "view/frm_getStatsLibrarians.cfm" />
		<cfset view.viewStats = "view/allStats/dsp_stats.cfm" />
		<cfset view.frmClassData = "view/frm_classData.cfm" />
		<cfset view.classData = "view/librarianStats/dsp_classData.cfm" />
		<cfset view.viewLibrarianStats = "view/librarianStats/dsp_librarianStats.cfm" />
		<cfset view.admin = "view/frm_classAdmin.cfm" />
		<cfset view.printStats = "view/frm_printStats.cfm" />
		<cfset view.viewPrintStats = "view/printStats/dsp_printStats.cfm" />
		
		<cfset view.frmExportClassData = "view/export/frm_exportClassData.cfm" />
		<cfset view.exportClassData = "view/export/dsp_exportLibrarianClassData.cfm" />
		<cfset view.frmExportLibrarianStats = "view/export/frm_exportLibrarianStats.cfm" />
		<cfset view.exportLibrarianStats = "view/export/dsp_exportLibrarianStats.cfm" />
		<cfset view.frmExportAllStats = "view/export/frm_exportAllStatistics.cfm" />
		<cfset view.exportAllStats = "view/export/dsp_exportAllStats.cfm" />
		
		<cfset view.frmExportLibrarianStatsPdf = "view/export/frm_exportLibrarianStatsPdf.cfm" />
		<cfset view.exportLibrarianStatsPdf = "view/export/dsp_exportLibrarianStatsPdf.cfm" />
		
		<cfset view.frmExportAllStatsPdf = "view/export/frm_exportAllStatisticsPdf.cfm" />
		<cfset view.exportAllStatsPdf = "view/export/dsp_exportAllStatsPdf.cfm" />
		
		
		<cfset view.downloadExcel = "view/export/dsp_download.cfm" />
											
		<cfswitch expression="#ARGUMENTS.page#">
			<cfcase value="index">
				<cfset event = "#view.classEntryForm#" />
			</cfcase>
			<cfcase value="stats">
				<cfset event = "#view.stats#" />
			</cfcase>
			<cfcase value="librarianStats">
				<cfset event = "#view.librarianStats#" />
			</cfcase>
			<cfcase value="viewStats">
				<cfset event = "#view.viewStats#" />
			</cfcase>
			<cfcase value="frmClassData">
				<cfset event = "#view.frmClassData#" />
			</cfcase>
			<cfcase value="classData">
				<cfset event = "#view.classData#" />
			</cfcase>
			<cfcase value="viewLibrarianStats">
				<cfset event = "#view.viewLibrarianStats#" />
			</cfcase>
			<cfcase value="login">
				<cfset event = "#view.login#" />
			</cfcase>
			<cfcase value="admin">
				<cfset event = "#view.admin#" />
			</cfcase>
			<cfcase value="printStats">
				<cfset event = "#view.printStats#" />
			</cfcase>
			<cfcase value="viewPrintStats">
				<cfset event = "#view.viewPrintStats#" />
			</cfcase>
			<cfcase value="frmExportClassData">
				<cfset event = "#view.frmExportClassData#" />
			</cfcase>
			<cfcase value="exportClassData">
				<cfset event = "#view.exportClassData#" />
			</cfcase>
			<cfcase value="frmExportLibrarianStats">
				<cfset event = "#view.frmExportLibrarianStats#" />
			</cfcase>
			<cfcase value="exportLibrarianStats">
				<cfset event = "#view.exportLibrarianStats#" />
			</cfcase>
			<cfcase value="frmExportAllStats">
				<cfset event = "#view.frmExportAllStats#" />
			</cfcase>
			<cfcase value="exportAllStats">
				<cfset event = "#view.exportAllStats#" />
			</cfcase>
			<cfcase value="frmExportAllStatsPdf">
				<cfset event = "#view.frmExportAllStatsPdf#" />
			</cfcase>
			<cfcase value="exportAllStatsPdf">
				<cfset event = "#view.exportAllStatsPdf#" />
			</cfcase>
			<cfcase value="frmExportLibrarianStatsPdf">
				<cfset event = "#view.frmExportLibrarianStatsPdf#" />
			</cfcase>
			<cfcase value="exportLibrarianStatsPdf">
				<cfset event = "#view.exportLibrarianStatsPdf#" />
			</cfcase>
		</cfswitch>
	<cfreturn event />
	</cffunction>
</cfcomponent>