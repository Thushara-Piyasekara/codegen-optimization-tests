@echo off
set balFileName=%1
set parentDir=C:\src\BallerinaProjects\SingleFileProjects\
set TypeDefTests=%parentDir%Tests\TypeDefinitions
set FunctionTests=%parentDir%Tests\Functions
set ExpectedJSONsCache=%parentDir%JSONs\ExpectedJSONs
set ActualJSONsCache=%parentDir%JSONs\ActualJSONs
set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat

cd %parentDir%utilScripts\TEMP_JAR_CACHE

for %%f in ("%FunctionTests%\*%balFileName%*") do (
    call %BALR% build --optimize --verbose %%f
    move /Y %FunctionTests%\codegen_optimization_report.json %ActualJSONsCache%\%%~nf.json
    del /q /a-d %FunctionTests%\native_dependency_optimization_report.json
    start firefox %ActualJSONsCache%\%%~nf.json
)

for %%f in ("%TypeDefTests%\*%balFileName%*") do (
    call %BALR% build --optimize --verbose %%f
    move /Y %TypeDefTests%\codegen_optimization_report.json %ActualJSONsCache%\%%~nf.json
    del /q /a-d %TypeDefTests%\native_dependency_optimization_report.json
    start firefox %ActualJSONsCache%\%%~nf.json
)

pause
del /q /a-d "%CD%\*.jar"
