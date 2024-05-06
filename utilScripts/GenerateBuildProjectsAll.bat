@echo off

set SINGLE_FILE_PROJECT_DIR_PATH=C:\src\BallerinaProjects\SingleFileProjects\Tests\TypeDefinitions
set BUILD_PROJECT_PARENT_DIR_PATH=C:\src\BallerinaProjects\SingleFileProjects\BuildProjects\TypeDefinitions
set UTIL_DIR= C:\src\BallerinaProjects\SingleFileProjects\utilScripts

for %%T in ("%SINGLE_FILE_PROJECT_DIR_PATH%\*bal") do (
    cd %UTIL_DIR%
    call GenerateNewBuildProjectFromSingleFileProject.bat %%T
)

