@echo off

============================================================================

:: Change value from 1 to 0 to disable KMS Renewal And Activation Task
set Renewal_And_Activation_Task=1

:: Change value from 1 to 0 to disable KMS activation desktop context menu 
set Desktop_context_menu=1

============================================================================

setlocal EnableDelayedExpansion
reg query HKU\S-1-5-19 1>nul 2>nul || (
echo ==== Error ====
echo Right click on this file and select 'Run as administrator'
echo Press any key to exit...
pause >nul
exit /b
)

for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G

::  Check Windows Edition
set osedition=
for /f "tokens=2 delims==" %%a in ('"wmic path SoftwareLicensingProduct where (ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f' and PartialProductKey is not NULL) get LicenseFamily /VALUE" 2^>nul') do if not errorlevel 1 set "osedition=%%a"
if not defined osedition for /f "tokens=3 delims=: " %%a in ('DISM /English /Online /Get-CurrentEdition 2^>nul ^| find /i "Current Edition :"') do set "osedition=%%a"

::  Check Installation type
set instype=
for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v InstallationType 2^>nul') do if not errorlevel 1 set "instype=%%b"

set KMS38=
if "%winbuild%" GEQ "17763" if "%osedition%"=="EnterpriseS" set KMS38=1
if "%winbuild%" GEQ "17763" if "%osedition%"=="EnterpriseSN" set KMS38=1
if "%osedition%"=="EnterpriseG" set KMS38=1
if "%osedition%"=="EnterpriseGN" set KMS38=1
if not "%instype%"=="Client" echo %osedition%| findstr /I /B Server 1>nul && set KMS38=1

if defined KMS38 (
call "%~dp0KMS38_Activation.cmd" /u
) else (
call "%~dp0HWID_Activation.cmd" /u
if defined HWIDAct set SkipWinAct=/swa
)

if %Renewal_And_Activation_Task% EQU 1 call "%~dp0Renewal_Setup.cmd" /rat %SkipWinAct%
if %Desktop_context_menu% EQU 1 call "%~dp0Renewal_Setup.cmd" /dcm %SkipWinAct%

::  Cleanup script
@REM cd /d "%SystemRoot%\Setup\"
@REM if exist "%SystemRoot%\Setup\Scripts\" @RD /S /Q "%SystemRoot%\Setup\Scripts\"
@REM exit /b