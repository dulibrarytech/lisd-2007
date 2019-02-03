<h3>Add Employee Type</h3>

<cfparam name="employeeType" type="string" default="" />

<cfform name="employeeType" method="post" action="#REQUEST.employeeTypeFormAction#">
	
	Employee Type:<br />
	<cfinput name="employeeType" type="text" value="#TRIM(employeeType)#" size="30" required="true" message="Please Enter an employee type ex. staff, student etc.." />
	<br />
	<input name="isActive" type="hidden" value="1"  />
	<br /><br />
	<input name="submit" type="submit" value="Save" />
	
</cfform>