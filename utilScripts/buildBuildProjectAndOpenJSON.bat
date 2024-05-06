@echo off
set balFileName=%1
set parentDir=C:\src\BallerinaProjects\SingleFileProjects\
set TypeDefTests=%parentDir%BuildProjects\TypeDefinitions
set FunctionTests=%parentDir%BuildProjects\Functions
set ActualJSONsCache=%parentDir%JSONs\ActualBuildProjects
set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat

cd %parentDir%utilScripts\TEMP_JAR_CACHE
for /d %%f in ("%FunctionTests%\*%balFileName%*") do (
    call %BALR% build --optimize %%f
    move /Y %%f\target\codegen_optimization_report.json %ActualJSONsCache%\%%~nf.json
    start firefox %ActualJSONsCache%\%%~nf.json
)

for /d %%f in ("%TypeDefTests%\*%balFileName%*") do (
    call %BALR% build --optimize %%f
    move /Y %%f\target\codegen_optimization_report.json %ActualJSONsCache%\%%~nf.json
    start firefox %ActualJSONsCache%\%%~nf.json
)
