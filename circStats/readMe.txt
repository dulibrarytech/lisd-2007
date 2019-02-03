//////////////////////////////////////////////////////////////////////
\\\ circStats - University of Denver, Penrose Library      ///////////
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Fernando Reyes
freyes@du.edu
May 29, 2007
//////////////////////////////////////////////////////////////////////
 The circStats application consists of three main parts:
 
 1.) The FORMS used to add interaction types (ex. phone, in person etc..) and question types (ex. Reserves, Interlibrary Loan etc..)
 -- http://intrazone.penlib.du.edu/circStats/?page=questionTypeForm
 -- http://intrazone.penlib.du.edu/circStats/?page=interactionTypeForm
 
 2.) The FORM used to capture the statistics.
 -- http://intrazone.penlib.du.edu/circStats/?page=stats
 
 3.) The CircStats Display. Allows user to view statistics 
 -- http://intrazone.penlib.du.edu/circStats/?page=viewStatsForm&activity=staff
 
The interaction and question type FORMS and the capture form can be loaded using the following link:
http://intrazone.penlib.du.edu/circStats/

/////////////////////////////////////////////////////////////////////////

The application is split up into "packages" located under the "pages" folder under circStats....There is no rhyme or reason for putting them there.  
I could have just as easily put them in the circStats root folder.  
Each package contains a set of files containing the:
DISPLAY - user interface (dsp_ prefix)
FORMACTION - processes requests (fa_ prefix)
DAO - Data access object containing queries (obj_ prefix)
INCLUDES - Files that cannot function on their own...they are included in other pages ex. menus (inc_ prefix)
 
The packages are listed below:
captureStats - files used to process and insert data from capture form
circStatsCaptureForm - files used to render capture form
circStatsViewForm -  files used to compile statistics  (these files are the only ones that use the controller api)
employeeType - not used
interactionType - files used to render the FORM to input interaction Types ex. phone, in persion and email 
questionType - files used to render FORM to input question Types ex. reserves, interlibrary loan, lost book etc...
sendMail - files used to send email to developer when an error occurs in the application

////////////////////////////////////////////////////////////////////////

The application uses a "fusebox" like framework.

All of the dsp_ (presentation) files are called by index.cfm based on the URL string
The templates are all tied toghether using the Appication.cfc file (the paths to the templates are placed into REQUEST variables that are then called by index.cfm)

/////////////////////////////////////////////////////////////////////////
 
 
 
 