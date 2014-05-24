@echo off

@rem interpret extension of first argument
set extension=%~x1
echo extension is %extension%

goto CHECKARGS


rem ###################
rem # check arguments #
rem ###################
:CHECKARGS
if "%extension%" == ".txt" goto DLTXT

rem else
goto DLURL

rem ###################################
rem # download single file from a URL #
rem ###################################
:DLURL
echo downloading single file from URL
aria2c --on-download-complete=exit --check-integrity=true --file-allocation=falloc --max-concurrent-downloads=5 --continue=true --max-connection-per-server=8 --bt-enable-lpd=true --bt-max-peers=0 "%1"

goto END

rem #####################################
rem # download n file(s) from .txt file #
rem #####################################
:DLTXT
echo downloading file(s) from .txt doc

aria2c --on-download-complete=exit --check-integrity=true --file-allocation=falloc --max-concurrent-downloads=5 --continue=true --max-connection-per-server=8 --bt-enable-lpd=true --bt-max-peers=0 -i%1

goto END

if errorlevel gt 0 goto ERROR

:ERROR
echo an error occured somewhere
goto END

:END