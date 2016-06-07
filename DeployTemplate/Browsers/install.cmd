@echo off
REM Script Details:
REM --------------
REM  This script will:
REM       + silently install or upgrade Firefox WITHOUT Firefox being the default browser
REM       + Disables the 'Automatically check for updates' option
REM       + Disables the 'Always check to see if Firefox is the default browser on startup' option
REM       + Deletes desktop icon
REM       + Disables the Import Wizard
REM .
REM===========================================
REM Install 32-bit customisations
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%~dp0override.ini" "%programfiles%\Mozilla Firefox\browser\"
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%~dp0mozilla.cfg" "%programfiles%\Mozilla Firefox\"
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%~dp0local-settings.js" "%programfiles%\Mozilla Firefox\defaults\pref"
REM Install 64-bit customisations
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0override.ini" "%ProgramFiles(x86)%\Mozilla Firefox\browser\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0mozilla.cfg" "%ProgramFiles(x86)%\Mozilla Firefox\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0local-settings.js" "%ProgramFiles(x86)%\Mozilla Firefox\defaults\pref"
REM Removes Firefox Desktop Icon - Windows XP
if exist "%allusersprofile%\Desktop\Mozilla Firefox.lnk" del "%allusersprofile%\Desktop\Mozilla Firefox.lnk" /S
REM Removes Firefox Desktop Icon
if exist "%public%\Desktop\Mozilla Firefox.lnk" del "%public%\Desktop\Mozilla Firefox.lnk"