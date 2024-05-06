@echo off
set parentDir=C:\src\BallerinaProjects\SingleFileProjects\
set TypeDefTests=%parentDir%BuildProjects\TypeDefinitions
set FunctionTests=%parentDir%BuildProjects\Functions
set actualJsonCache=%parentDir%JSONs\ActualBuildProjects
set expectedJsonCache=%parentDir%JSONs\ExpectedBuildProjects
set TEMP_JAR_CACHE=%parentDir%utilScripts\TEMP_JAR_CACHE

del /q /a-d "%actualJsonCache%\*"

for /d %%f in ("%FunctionTests%\*") do (
   call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

for /d %%f in ("%TypeDefTests%\*") do (
   call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

rem echo %TEMP_JAR_CACHE%
rem for /f "tokens=*" %%a in ('dir /b /s /a-d "%TEMP_JAR_CACHE%\*.jar"') do (
rem     echo Deleting: "%%a"
rem     del "%%a"
rem )

rem for %%f in ("%expectedJsonCache%\*json") do (
rem     call compareJsons.bat %%f %actualJsonCache%
rem )