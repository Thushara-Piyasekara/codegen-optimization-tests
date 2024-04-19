@echo off
set balFileName=%1
set parentDir=C:\src\BallerinaProjects\SingleFileProjects\
set TypeDefTests=%parentDir%TypeDefinitions
set FunctionTests=%parentDir%Functions
set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat

@REM mkdir %parentDir%utilScripts\TEMP_JAR_CACHE
cd %parentDir%utilScripts\TEMP_JAR_CACHE

for %%f in ("%FunctionTests%\*%balFileName%*") do (
    call %BALR% build --optimize %%f
    move /Y %FunctionTests%\codegen_optimization_report.json %CD%\%%~nf.json
    start firefox %CD%\%%~nf.json
)

for %%f in ("%TypeDefTests%\*%balFileName%*") do (
    call %BALR% build --optimize %%f
    move /Y %TypeDefTests%\codegen_optimization_report.json %CD%\%%~nf.json
    start firefox %CD%\%%~nf.json
)

pause
del /q /a-d "%CD%\*"
