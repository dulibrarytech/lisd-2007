<cfhttp url="#CGI.HTTP_HOST#/railo/lisd/export/#URL.fileName#" method="get" getAsBinary="yes" />
<cfheader name="Content-disposition" value="attachment; filename=#URL.fileName#" />
<cfcontent type="application/vnd.ms-excel" variable="#cfhttp.fileContent#" />
