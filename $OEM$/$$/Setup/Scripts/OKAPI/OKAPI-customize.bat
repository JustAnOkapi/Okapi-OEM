color 97
mode con cols=140 lines=40
title --^>^>^>^>^> Okapi Customize Script ^<^<^<^<^<--
cls

rem [INFO] set CDROM to usb path
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\post\ set CDROM=%%i:

rem [INFO] c drive label 
label c: "Windows 10"
rem [INFO] windows boot manager name
bcdedit /set description "Windows 10 Enhanced"
rem [INFO] windows boot manager autoselect timeout
bcdedit /timeout 7
rem [INFO] merge custom registry 
regedit /s %cdrom%\post\OKAPI-registry.reg
rem [INFO] install custom cursors
%cdrom%\post\scripts\OKAPI-cursors.bat


PAUSE