@echo off
:: VARIABLES
set cli="patches\cli.jar"
set patches="patches\patches.jar"
set integrations="patches\integrations.apk"
:: INTRO MESSAGE
echo Make sure the apk file is in the same folder as this script along with the && echo integrations.apk, cli.jar, and patches.jar files in the "patches" folder && echo and that there is a "revanced-apk" folder. && echo Type the EXACT name of the apk file without the .apk file extention:
:: USER INPUT VARIABLE
set /p Input=
:: COMMAND TO PATCH APK
:: SOURCE https://sodawithoutsparkles.github.io/revanced-troubleshooting-guide/06-revanced-cli/
java -jar %cli% patch -b %patches% -m %integrations% -o revanced-apk\revanced-"%Input%".apk "%Input%.apk"
:: OUTRO MESSAGE
echo Done. Your ReVanced apk is in the "revanced-apk" folder.
pause