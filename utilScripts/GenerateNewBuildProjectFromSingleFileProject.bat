@echo off
set BUILD_PROJECT_PARENT_DIR_PATH=C:\src\BallerinaProjects\SingleFileProjects\BuildProjects\TypeDefinitions
set BALR=C:\Users\Ballerina_CodeBase\ballerina-lang\distribution\zip\jballerina-tools\build\extracted-distributions\jballerina-tools-2201.9.0-SNAPSHOT\bin\bal.bat


cd %BUILD_PROJECT_PARENT_DIR_PATH%
set SINGLE_FILE_PROJECT_NAME_WITH_EXTENTION=%~nx1
set SINGLE_FILE_PROJECT_NAME=%SINGLE_FILE_PROJECT_NAME_WITH_EXTENTION:~0,-4%

echo Generating : %SINGLE_FILE_PROJECT_NAME%
call %BALR% new %SINGLE_FILE_PROJECT_NAME%
echo Copying : %SINGLE_FILE_PROJECT_NAME%
xcopy /Y %1 %BUILD_PROJECT_PARENT_DIR_PATH%\%SINGLE_FILE_PROJECT_NAME%\main.bal