color 97
mode con cols=140 lines=40
title --^>^>^>^>^> Okapi Optimize Script ^<^<^<^<^<--
cls

rem [INFO] set CDROM to usb path
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\post\ set CDROM=%%i:

rem [INFO] run Windows10Debloater
powershell.exe -ExecutionPolicy Unrestricted -Command ". '%cdrom%\post\scripts\Windows10SysPrepDebloater.ps1' -Debloat -SysPrep"
rem [INFO] install all latest Microsoft Visual C++ Redistributable Runtimes
%cdrom%\post\dependencies\VisualCppRedist_AIO_x86_x64.exe /aiA /gm2
rem [INFO] install latest Java 8 update 281 for 32 and 64 bit
start /wait %cdrom%\post\jre-8u281-windows-i586.exe /s AUTO_UPDATE=0 REBOOT=Suppress REMOVEOUTOFDATEJRES=1
start /wait %cdrom%\post\jre-8u281-windows-x64.exe /s AUTO_UPDATE=0 REBOOT=Suppress REMOVEOUTOFDATEJRES=1


PAUSE