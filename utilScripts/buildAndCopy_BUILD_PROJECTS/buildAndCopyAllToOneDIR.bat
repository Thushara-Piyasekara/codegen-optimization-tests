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
