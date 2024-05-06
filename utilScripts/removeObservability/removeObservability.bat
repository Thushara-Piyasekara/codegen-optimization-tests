@echo off

set "target_file=C:\src\BallerinaProjects\SingleFileProjects\BuildProjects\Functions\arrow_functions_1\Ballerina.toml"
set search_text_1="observabilityIncluded"
set search_text_2="[build-options]"
set "new_file=temp_file.txt"

rem set BUILD_PROJECT_PARENT_DIR_PATH=C:\src\BallerinaProjects\SingleFileProjects\BuildProjects\Functions

rem for /d %%T in (%BUILD_PROJECT_PARENT_DIR_PATH%\*) do (
rem     echo %%T\Ballerina.toml

rem     findstr /v /c:"%search_text_1%" "%%T\Ballerina.toml" > "%new_file%"
rem     findstr /v /c:"%search_text_2%" "%new_file%" > "%%T\Ballerina.toml"
rem )


rem findstr /v /c: "\n" "%target_file%" > "%new_file%"

rem findstr /v "^$" < %target_file% > temp_file.txt
rem type temp_file.txt > %target_file%
rem del temp_file.txt

rem echo Empty lines removed from %target_file%