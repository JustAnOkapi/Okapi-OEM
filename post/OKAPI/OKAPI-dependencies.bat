color 97
mode con cols=140 lines=40
title --^>^>^>^>^> Okapi Optimize Script ^<^<^<^<^<--
cls

rem [INFO] set cdrom to usb path
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\post\OKAPI\OKAPI* set cdrom=%%i:


rem [INFO] install all latest Microsoft Visual C++ Redistributable Runtimes
%cdrom%\post\dependencies\VisualCppRedist_AIO_x86_x64.exe /aiA /gm2
rem [INFO] install latest Java 8 update 281 for 32 and 64 bit
If %PROCESSOR_ARCHITECTURE%==x86 start /wait %cdrom%\post\dependencies\jre-8u281-windows-i586.exe /s AUTO_UPDATE=0 REBOOT=Suppress REMOVEOUTOFDATEJRES=1
If %PROCESSOR_ARCHITECTURE%==IA64 start /wait %cdrom%\post\dependencies\jre-8u281-windows-x64.exe /s AUTO_UPDATE=0 REBOOT=Suppress REMOVEOUTOFDATEJRES=1
If %PROCESSOR_ARCHITECTURE%==AMD64 start /wait %cdrom%\post\dependencies\jre-8u281-windows-x64.exe /s AUTO_UPDATE=0 REBOOT=Suppress REMOVEOUTOFDATEJRES=1


PAUSE