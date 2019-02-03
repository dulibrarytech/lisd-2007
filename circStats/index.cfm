<cfsilent>
DESCRIPTION: displays circStats pages
ENTERING FROM: self
EXITING TO: self 
DEPENDENCIES: 
EXPECTING: 

******MODIFICATION HISTORY*********
MOD DATE:
MOD DESCRIPTION: 
MODIFIED BY: 
</cfsilent>

<!--- removes borders from check boxes and radio buttons in IE...p-o-s!! --->
<script type="text/javascript">
function addEvent(elm, evType, fn, useCapture)
{
if(elm.addEventListener)
  {
  elm.addEventListener(evType, fn, useCapture);
  return true;
  }
else if (elm.attachEvent)
  {
  var r = elm.attachEvent('on' + evType, fn);
  return r;
  }
else
  {
  elm['on' + evType] = fn;
  }
}
// removes the square border that IE
// insists on adding to checkboxes and radio
function removeCheckBoxBorders()
{
var el = document.getElementsByTagName("input");
for (i=0;i<el.length;i++)
  {
  var type = el[i].getAttribute("type");
  if((type=="checkbox")||(type=="radio"))
    {
   el[i].style.border = "none";
    }
  }
}
addEvent(window, 'load', removeCheckBoxBorders, false);
</script>

<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<cfoutput>
<!--- toggle stylesheet based on URL variable --->
<cfparam name="URL.page" type="string" default="" />
	<cfif IsDefined ("URL.page") AND (URL.page EQ "questionTypeForm") OR (URL.page EQ "interactionTypeForm") OR (URL.page EQ "")>
		<link rel="stylesheet" href="#REQUEST.rootPath#includes/inc_circStatsForms.css" type="text/css" />
			<cfelseIf IsDefined ("URL.page") AND (URL.page EQ "stats")>
				<link rel="stylesheet" href="#REQUEST.rootPath#includes/inc_circStatsCaptureForm.css" type="text/css" />
					<cfelse>
						<link rel="stylesheet" href="#REQUEST.rootPath#includes/inc_circStatsViewForm.css" type="text/css" />
							</cfif>
</cfoutput>

<head>
<title>Circulation Desk Statistics</title>
</head>

<body>
<div id="mainContainer">
<!--- <div id="content"> --->
	<div id="header">
		<h3>Circulation Stats</h3>
	</div>
<div class="outer">
<div class="inner">
<div class="contentWrap"> 

<!--- display page based on value in request scope --->
<cfif URL.page EQ "">
	<!--- public --->
	<cfinclude template="#REQUEST.menuLinks0#" />
<cfelse>
	<cfswitch expression="#URL.page#">
		<!--- public --->
		<cfcase value="stats">
			<cfinclude template="#REQUEST.stats#" />
		</cfcase>
		<cfcase value="viewStatsForm">
			<cfinclude template="#REQUEST.viewStatsForm#" />
		</cfcase>
		<cfcase value="viewStats">
			<cfinclude template="#REQUEST.viewStats#" />
		</cfcase>
		<!--- admin --->
		<cfcase value="questionTypeForm">
			<cfinclude template="#REQUEST.questionTypeForm#" />
		</cfcase>
		<cfcase value="interactionTypeForm">
			<cfinclude template="#REQUEST.interactionTypeForm#" />
		</cfcase>
	</cfswitch>
</cfif>
 
</div> 
</div><!--- class --->
</div><!--- class --->

</div>
<cfoutput>
	<div id="footer">
	<p>University of Denver, Penrose Library &copy;#dateFormat(now(), "yyyy")#</p>
		<!--- <cfset tickEnd = GetTickCount()>
		<cfset executionTime = tickEnd - tickBegin>
		&nbsp;&nbsp;&nbsp;&nbsp;			
		#executionTime# ms --->
	</div>
</cfoutput>
</body>
</html>