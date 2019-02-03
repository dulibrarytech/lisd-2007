<cfset tickBegin = GetTickCount()>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<cfoutput>
<!--- css --->
<link rel="stylesheet" href="#REQUEST.assetPath#view/includes/inc_lisd.css" type="text/css" /> 
<link rel="stylesheet" media="screen" href="#REQUEST.assetPath#view/js/superfish-1.4.8/css/superfish.css" /> 
<!--- <link rel="stylesheet" href="#REQUEST.assetPath#view/includes/screen.css" type="text/css" /> --->
<!-- javascript -->
<script type="text/javascript" src="#REQUEST.assetPath#view/js/calendarDateInput.js"></script>
<script type="text/javascript" src="#REQUEST.assetPath#view/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="#REQUEST.assetPath#view/js/jquery.validate.pack.js"></script>
<script type="text/javascript" src="#REQUEST.assetPath#view/js/animatedcollapse.js"></script>
<script src="#REQUEST.assetPath#view/js/superfish-1.4.8/js/hoverIntent.js"></script> 
<script src="#REQUEST.assetPath#view/js/superfish-1.4.8/js/superfish.js"></script>
<script>
	$(document).ready(function() { 
        $('ul.sf-menu').superfish(); 
    }); 
</script>

<cfparam name="URL.page" default="index" />

<cfscript>
	// the event controller pulls a desired page based on the URL the user selects
	event = APPLICATION.obj_lisdEventController.getPage(URL.page);
</cfscript>

<head>
<title>Library Instruction Statistics Database</title>
</head>

<body>
<div id="topbar">
	&nbsp;&nbsp;Library Instruction Statistics Database 
</div>

<div id="main">

<ul class="sf-menu menu">
	<li class="current">
		<a href="#REQUEST.rootPath#">Entry Form</a>	
	</li>
	<li>
		<a href="#REQUEST.rootPath#?page=stats">All Statistics</a>
	</li>
	<li>
		<a href="#REQUEST.rootPath#?page=librarianStats">Librarian Statistics</a>
	</li>
	<li>
		<a href="#REQUEST.rootPath#?page=frmClassData">Class Data</a>
	</li>
	<li>
		<a href="##">Export</a>
		<ul>
			<li>
				<a href="#REQUEST.rootPath#?page=frmExportClassData">Export Class Data (Excel)</a>
			</li>
			<li>
				<a href="#REQUEST.rootPath#?page=frmExportLibrarianStats">Export Librarian Stats (Excel)</a>
			</li>
			<li>
				<a href="#REQUEST.rootPath#?page=frmExportAllStats">Export All Stats (Excel)</a>
			</li>
			<li>
				<a href="#REQUEST.rootPath#?page=frmExportLibrarianStatsPdf">Export Librarian Stats (PDF)</a>
			</li>
			<li>
				<a href="#REQUEST.rootPath#?page=frmExportAllStatsPdf">Export All Stats (PDF)</a>
			</li>
		</ul>
	</li>
	<li>
		<a href="#REQUEST.rootPath#?page=admin&action=add">Admin</a>	
	</li>
	
	<cfif IsDefined("URL.page") AND URL.page EQ "admin">
		<cfif IsDefined("SESSION.role") AND SESSION.role EQ 0>
			<li><a href="#REQUEST.rootPath#?page=admin&action=add">Add</a></li>
			<li><a href="#REQUEST.rootPath#?page=admin&action=edit">Edit</a></li>
		</cfif>
	
		<li><a href="#REQUEST.rootPath#?page=admin&action=frmClassData"> Edit Class Data</a></li>
		<li><a href="#REQUEST.rootPath#?logout">Logout</a></li>
	
	</cfif>

</ul>

<!---
<div class="menu">		

	<a href="#REQUEST.rootPath#">Entry Form</a><span class="hideme"> | </span>
	<a href="#REQUEST.rootPath#?page=stats">All Statistics</a><span class="hideme"> | </span>
	<a href="#REQUEST.rootPath#?page=librarianStats">Librarian Statistics</a><span class="hideme"> | </span>
	<a href="#REQUEST.rootPath#?page=frmClassData">Class Data</a><span class="hideme"> | </span>
	<!--- <a href="#REQUEST.rootPath#?page=frmExportExcel">Export Statistics</a><span class="hideme"> | </span> --->
	
	<a href="#REQUEST.rootPath#?page=frmExportClassData">Export</a><span class="hideme"> | </span>
	
	
	<!--- <li><a href="#REQUEST.rootPath#?page=printStats">Print Statistics</a><span class="hideme"> | </span> --->
	<a href="#REQUEST.rootPath#?page=admin&action=add">Admin</a><span class="hideme"> | </span>
	<cfif IsDefined("URL.page") AND URL.page EQ "admin">
		<br /><br />
		<cfif IsDefined("SESSION.role") AND SESSION.role EQ 0>
			<a href="#REQUEST.rootPath#?page=admin&action=add">Add</a><span class="hideme"> | </span>
			<a href="#REQUEST.rootPath#?page=admin&action=edit">Edit</a><span class="hideme"> | </span>
		</cfif>
		<a href="#REQUEST.rootPath#?page=admin&action=frmClassData"> Edit Class Data</a><span class="hideme"> | </span>
		<a href="#REQUEST.rootPath#?logout">Logout</a><span class="hideme"> | </span>
	</cfif>

</div>

--->

<br /><br />

<div id="content"> 
	<cfinclude template="#event#" /> 
</div>

<div id="footer">	
		<p>University of Denver, Penrose Library &copy;#dateFormat(now(), "yyyy")#</p>
		<cfset tickEnd = GetTickCount()>
		<cfset executionTime = tickEnd - tickBegin>
		<p>#executionTime# ms</p>
</div>

<!--- javascript --->
<script type="text/javascript" src="#REQUEST.assetPath#view/js/fixRadioButtons.js"></script>
<script type="text/javascript" src="#REQUEST.assetPath#view/js/ajaxTooltips.js"></script>
</cfoutput>

<!--- validation for main data entry form --->
<script type="text/javascript">
	$("#classEntryForm").validate({
		rules: {
			className: "required",
			courseNumber: "required",
			instructor: "required",
			undergraduates: "required",
			graduates: "required",
			faculty: "required",
			other: "required"
			},
			messages: {
			className: "**Please enter a class name**",
			courseNumber: "**Please enter a course number**",
			instructor: "**Please enter an instructor name**",
			undergraduates: "**Please enter a number**",
			graduates: "**Please enter a number**",	
			faculty: "**Please enter a number**",
			other: "**Please enter a number**"
			}
	});
</script>

</body>
</html>
