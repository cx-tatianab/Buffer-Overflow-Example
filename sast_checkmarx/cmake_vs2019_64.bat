@echo off

:: %1 - Output build Folder
:: %2 - Turn On Unit Test
:: %3 - Turn On Coverage

setlocal

set QTDIR=D:\qt\qt-5.15.1-64
set Qt5_DIR=D:\qt\qt-5.15.1-64

set OLDDIR=%CD%
set BUILD_DIR=_BUILD_DIR
set DIR_VS=.

if not exist %BUILD_DIR% (
   echo *** Creating %BUILD_DIR%
   mkdir %BUILD_DIR%
)

cd %BUILD_DIR%
if errorlevel 1 ( goto _erro )

set DIR_VS=VS19_64b

if exist %DIR_VS% (
   echo *** Deleting %BUILD_DIR%\%DIR_VS%
   rmdir /S /Q %DIR_VS%
)

echo *** Creating %BUILD_DIR%\%DIR_VS%
mkdir %DIR_VS%
if errorlevel 1 ( goto _erro )
cd %DIR_VS%
if errorlevel 1 ( goto _erro )

echo *** Checking options
if "%1" == "" goto :NODIR
if not "%1" == "" goto :USEDIR


:NODIR
echo *** Using NODIR option
cmake -G "Visual Studio 16 2019" -A x64 -DCONFIG=totvstecx -DCMAKE_BUILD_TYPE=debug -DBUILD_DIR=${BUILD_DIR}\${DIR_VS} ../..
%OLDDIR%
if errorlevel 1 goto _erro
rem waitfor xxx /t 2 >nul 2>&1
goto :END


:USEDIR
echo *** Using USEDIR option
cmake -G "Visual Studio 16 2019" -A x64 -DCONFIG=totvstecx -DCMAKE_BUILD_TYPE=debug -DUSEBUILDIR:STRING=%1-DBUILD_DIR=${BUILD_DIR}\${DIR_VS} ../..
if errorlevel 1 goto _erro
goto :END

:_erro
echo *** Error in CMAKE %BUILD_DIR%\%DIR_VS%
echo *** errorlevel = %errorlevel%
pause

:END
chdir /d %OLDDIR%
endlocal
