@echo off
:: SET WORKING DIRECTORY
pushd %~dp0
:: VARIABLES
set cli="%~dp0%patches\cli.jar"
set patches="%~dp0%patches\patches.jar"
set integrations="%~dp0%patches\integrations.apk"
set file_path=%1
set file_name=%~n1
:: COMMAND TO PATCH APK
:: SOURCE https://sodawithoutsparkles.github.io/revanced-troubleshooting-guide/06-revanced-cli/
@echo ReVancing apk...
java -jar %cli% patch -b %patches% -m %integrations% -o revanced-apk\revanced-"%file_name%".apk "%file_path%"
:: REMOVE THE TEMPORARY FILES
echo Cleaning up temp files...
rmdir /s /q revanced-resource-cache
del /f /q options.json
:: OPEN THE FOLDER WHERE THE REVANCED APK IS LOCATED
%SystemRoot%\explorer.exe "revanced-apk\"
echo Done.
pause