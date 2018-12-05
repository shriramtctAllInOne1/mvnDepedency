#!/bin/sh
    if test "$1" = "" -o "$2" = "" -o "$3" = "" -o "$4" = "" 
     then
		echo "Enter the Project Directory Path where pom file exist:"
		echo "Enter the settings.xml file path: $2"
		echo "Enter the online or offline Mode"
		echo "Enter OutputDirPath file path"
    else
	    echo "Pom.xml file Path: $1";
		echo "Settings.xml FilePath:$2";
		echo "Mode online of Offline:$3"
		echo "OutputDirPath : $4"

		cd $1
		if test "$3" = "OFFLINE" 
		then
			mvn -o -s $2 license:add-third-party -Dlicense.fileTemplate=$4/thirdPartytemplate.ftl -Dlicense.excludedGroups="com.spartasystems.*|crystal.reports.2016.*|com.isnetworks.*|com.opentext.*|com.ricebridge.*|com.wintertree.*" -Dlicense.thirdPartyFilename=ThirdPartyDependency.html -DincludeTransitiveDependencies=true -DsortArtifactByName=truecleare -Dlicense.outputDirectory=$4
		else	
		mvn -s $2 license:add-third-party -Dlicense.fileTemplate=$4/thirdPartytemplate.ftl -Dlicense.excludedGroups="com.spartasystems.*|crystal.reports.2016.*|com.isnetworks.*|com.opentext.*|com.ricebridge.*|com.wintertree.*" -Dlicense.thirdPartyFilename=ThirdPartyDependency.html -DincludeTransitiveDependencies=true -DsortArtifactByName=truecleare -Dlicense.outputDirectory=$4
		
	fi
		if test "$5" != ""
			then
			cd $5
			license-checker --csv --out $4/JavaScriptNPMDependency.csv
		fi

    fi
	
	