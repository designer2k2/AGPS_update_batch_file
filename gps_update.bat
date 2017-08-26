::Downloads the latest assist.me file to the right place
::
::Locate this file in the root from the SD card, then run it!
::
::Downloads and makes the MD5 check without any other programm to install.
::
::http://www.designer2k2.at Stephan Martin 13.08.2017
::
::This is provided under the GNU AGPLv3 

@echo off
TITLE = Sony AGPS updater

::Generate the folder if it does not exist
if not exist "%~dp0\PRIVATE\SONY\GPS" mkdir %~dp0\PRIVATE\SONY\GPS

::Download both files:
bitsadmin.exe /transfer "Sony AGPS assistme.dat Update" http://control.d-imaging.sony.co.jp/GPS/assistme.dat "%cd%\PRIVATE\SONY\GPS\assistme.dat"
bitsadmin.exe /transfer "Sony AGPS assistme.md5 Update" http://control.d-imaging.sony.co.jp/GPS/assistme.md5 "%cd%\PRIVATE\SONY\GPS\assistme.md5"

::MD5 check:
certUtil -hashfile %~dp0\PRIVATE\SONY\GPS\assistme.dat MD5 | find /i /v "md5" | find /i /v "certutil" > download.md5
set /p MD5fromLocal=<download.md5
set /p MD5fromHost=<%cd%\PRIVATE\SONY\GPS\assistme.md5
cls
if "%MD5fromLocal:~0,32%" == "%MD5fromHost:~0,32%" (
	del download.md5
	echo Download is ok!
	TITLE = Sony AGPS updater finished successfully
) else (
	del PRIVATE\SONY\GPS\assistme.dat
	del download.md5
	echo Checksum failed, file deleted, please try again!
	TITLE = Sony AGPS updater failed, please run again
)
pause