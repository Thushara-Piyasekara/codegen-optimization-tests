@echo off

set balFilePath=%1
set parentDir=%~dp1

set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat
set jsonCache=%2
set source_file=%parentDir%codegen_optimization_report.json
set fileNameWithExtention=%~nx1
set filename=%fileNameWithExtention:~0,-4%

cd TEMP_JAR_CACHE
call %BALR% build --optimize --verbose %balFilePath%
cd ../
echo copying %filename%.json to json cache
move /Y %source_file% %jsonCache%\%filename%.json