@echo off
echo Checking file structure...
if exist "patches.jar" (
    if exist "cli.jar" (
        if exist "integrations.apk" (
        goto :delete-update
        ) else goto :download
    )  else goto :download
) else goto :download

:delete-update
echo Removing old files...
del /f /q patches.jar
del /f /q cli.jar
del /f /q integrations.apk
:download
echo Downloading files...
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/revanced/revanced-patches/releases/latest ^| find "browser_download_url"') do (
    curl -kOL %%B
)
for %%f in (revanced-patches*.jar) do rename "%%f" "patches.jar"
del /f /q patches.json
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/revanced/revanced-cli/releases/latest ^| find "browser_download_url"') do (
    curl -kOL %%B
)
for %%f in (revanced-cli*.jar) do rename "%%f" "cli.jar"
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/revanced/revanced-integrations/releases/latest ^| find "browser_download_url"') do (
    curl -kOL %%B
)
for %%f in (revanced-integrations*.apk) do rename "%%f" "integrations.apk"
goto :end
:end
echo Done.
pause