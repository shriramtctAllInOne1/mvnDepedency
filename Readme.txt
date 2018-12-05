-------------------------------------------------------------------------------------------------
Technology:

	1. Maven licence plugin to get all project dependency
		http://www.mojohaus.org/license-maven-plugin/aggregate-add-third-party-mojo.html
   
	2. Freemarker Templatet to generate html file

	3. JQuery Plugin to export html to Ms wordDocument

	4 Install NPM License checker plugin if not installed in trackwise-ui

		https://www.npmjs.com/package/license-checker
  
		npm install -g license-checker 
		npm install yui-lint
		license-checker

------------------------------------------------------------------------------------------
Environment Setup:	

	1. Download the mvnDepedency.zip.
	
	2. Unzip the mvnDepedency.zip

	3. Windows machine :

		- In windows machine install the git bash terminal which support shell script form below link:
			https://gitforwindows.org/
			
		- Open the 'Git Bash' terminal from AllPrograms.
		
		-  Go to the 'mvnDepedency' folder
		
	4. In Linux or Unix 
	
		- Go to the 'mvnDepedency' folder. 
---------------------------------------------------------------------------------------------------------------
Execution Instruction to run Script:

	- Go the the mvnDepedency folder where mvh.sh file exist.

	- run below command passing parameter in same order.

		sh mvn.sh PATH_OF_POM_FILE PATH_OF_SETTINGS.XML OFFLINE/ONLINE OUT_PUT_DIR_PATH PATH_OF_TRACKIWSE-UI
	
		Mandatory Parameter :
			- PATH_OF_POM_FILE 
			- PATH_OF_SETTINGS.XML 
			- OFFLINE/ONLINE 
			- OUT_PUT_DIR_PATH 
 
		Optional Parameter (Mandatory only for Trackwise and optional for WebAdmin and others Application):
		- PATH_OF_TRACKIWSE-UI 
	
	
		- 'ThirdPartyDependency.html' file will be generated inside OUT_PUT_DIR_PATH folder

		- Open the 'ThirdPartyDependency.html' in browser.

		- Click on 'Download ThirdParty Depedency As Doc' link.

		- 'ThirdPartyDependency.docx' and JavaScriptNPMDependency.csv will be generated in the current directory from where the script executed.

		- Import the 'ThirdPartyDependency.docx' to confluence.

		- Manual modify the JavaScriptNPMDependency.csv in correct format as per the confluence Page format.


----------------------------------------------------------------------------------------------------------------------------
 
	
	