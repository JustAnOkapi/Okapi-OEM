color 97
mode con cols=140 lines=40
title --^>^>^>^>^> Okapi Cleanup Script ^<^<^<^<^<--
cls

rem [INFO] set cdrom to usb path
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%i:\post\OKAPI\OKAPI* set cdrom=%%i:

rem [INFO] delete all scripts from setup folder
cd /d "%SystemRoot%\Setup\"
if exist "%SystemRoot%\Setup\Scripts\" @RD /S /Q "%SystemRoot%\Setup\Scripts\"


PAUSE