color 02
@echo off
mode con cols=80 lines=45
title 					Cursor Install @ IM 2017
cls

@echo.
@echo 	* EZLAUNCH Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\EZLAUNCH\install.inf"
@echo  Done.

@echo.
@echo 	* Hardwired Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\Hardwired\install.inf"
@echo  Done.

@echo.
@echo   	* Polar Red Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\polar\Polar Red.inf"
@echo  Done.

@echo.
@echo   	* Polar Blue Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\polar\Polar Blue.inf"
@echo  Done.

@echo.
@echo   	* Polar Green Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\polar\Polar Green.inf"
@echo  Done.

@echo.
@echo 	* Silver Cursors 3D Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\Silver Cursors 3D\install.inf"
@echo  Done.

@echo.
@echo 	* TheHeavy Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\TheHeavy\install.inf"
@echo  Done.

@echo.
@echo 	* Glass Maxx Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\Glass Maxx\install.inf"
@echo  Done.

@echo.
@echo 	* HUD-Evolution-Turquoise-EZEvolution Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\HUD-Evolution-Turquoise-EZEvolution\install.inf"
@echo  Done.

@echo.
@echo 	* Mac Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\Mac\install.inf"
@echo  Done.