
rem [INFO] set cdrom to usb path
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\post\OKAPI\OKAPI* set cdrom=%%i:

rem [INFO] set OS description
bcdedit /set description "Windows 10 Enhanced"
rem [INFO] set boot 
bcdedit /timeout 7
rem [INFO] change C drive label
Label c: Windows


rem [INFO] set key to RunOnceEx registry path
set key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
rem [INFO] set RunOnce windows title
reg add %key% /V TITLE /D "Windows 10 OKAPI RunOnce" /f

rem [INFO] add windows cleaning script Windows10SysPrepDebloater
set w10d=powershell.exe -ExecutionPolicy Unrestricted -Command ". '%cdrom%\post\scripts\Windows10SysPrepDebloater.ps1' -Debloat -SysPrep"
reg add %key%\100 /VE /D "Windows10Debloater" /f
reg add %key%\100 /V 1 /D "%w10d%" /f 

rem [INFO] add 7-Zip
reg add %key%\110 /VE /D "7-Zip" /f
reg add %key%\110 /V 1 /D "%cdrom%\post\dependencies\7z1900-x64.msi /q" /f 

rem [INFO] add Notepad++
reg add %key%\120 /VE /D "Notepad++" /f
reg add %key%\120 /V 1 /D "%cdrom%\post\dependencies\npp.7.9.3.Installer.x64.exe /S" /f 

rem [INFO] install dependencies
reg add %key%\130 /VE /D "C++ and Java" /f
reg add %key%\130 /V 1 /D "%cdrom%\post\OKAPI\OKAPI-dependencies.cmd" /f 

rem [INFO] install cursors
reg add %key%\140 /VE /D "Custom Cursors" /f
reg add %key%\140 /V 1 /D "%cdrom%\post\OKAPI\OKAPI-dependencies.cmd" /f 

rem [INFO] merge custom registry
reg add %key%\150 /VE /D "Custom Registry" /f
reg add %key%\150 /V 1 /D "regedit /s %cdrom%\post\OKAPI\OKAPI-registry.reg" /f 

rem [INFO] add system cleaning script
reg add %key%\700 /VE /D "Clean Syetem" /f
reg add %key%\700 /V 1 /D "%cdrom%\post\OKAPI\OKAPI-clean.cmd" /f 

rem [INFO] add reboot system
reg add %key%\800 /VE /D "Finish Setup" /f
reg add %key%\800 /V 99 /D "shutdown /r /t 5 /c \"Setup is complete! REBOOTING in 3 seconds\"" /f

shutdown /r /t 5 /c "RunOnce has been added to registry! REBOOTING in 3 seconds"