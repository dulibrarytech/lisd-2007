<cfsilent>
<cfif IsDefined("FORM.submit")>
	<cfscript>
		// pass FORM values to authentication component
		APPLICATION.obj_lisdFormController.authenticate(FORM.userName, FORM.pwd);
	</cfscript> 
</cfif>
</cfsilent>

<h2>Admin</h2>

<cfoutput>
<div class="forms">
<cfif IsDefined("validate.error") AND validate.userNameError>#validate.userNameMessage#</cfif>
<form name="login" method="post" action="#REQUEST.rootPath#?#cgi.QUERY_STRING#">
<table cellpadding="5" cellspacing="5" width="100%">
	<tr>
		<td align="right">Username:</td><td><input name="userName" type="text" size="25" /></td>
	</tr>
	<tr>
		<td align="right" >Password:</td><td><input name="pwd" type="password" size="25" /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td><input name="submit" type="submit" value="login"  /></td>
	</tr>
</table>
</form>
</div>
</cfoutput>