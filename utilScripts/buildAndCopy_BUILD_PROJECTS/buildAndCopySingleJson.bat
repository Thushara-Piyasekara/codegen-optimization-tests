@echo off

set buildProjectPath=%1
set jsonCache=%2
set filename=%~nx1

set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat
set source_file=%buildProjectPath%\target\codegen_optimization_report.json

call %BALR% build --optimize --verbose %buildProjectPath%
echo copying %source_file% to json cache
move /Y %source_file% %jsonCache%\%filename%.json
call %BALR% clean --target-dir %buildProjectPath%\target
