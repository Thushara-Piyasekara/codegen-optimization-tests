@echo off
set parentDir=%~dp0
set TypeDefTests=%parentDir%TypeDefinitions
set FunctionTests=%parentDir%FunctionTests
set actualJsonCache=%parentDir%ActualJSONs
set expectedJsonCache=%parentDir%ExpectedJSONs

del /q /a-d "%actualJsonCache%\*"

for %%f in ("%FunctionTests%\*bal") do (
    call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

for %%f in ("%TypeDefTests%\*bal") do (
    call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

@REM for /f "tokens=*" %%a in ('dir /b /s /a-d "TEMP_JAR_CACHE\*.jar"') do (
@REM     echo Deleting: "%%a"
@REM     del "%%a"
@REM )

for %%f in ("%expectedJsonCache%\*json") do (
    call compareJsons.bat %%f %actualJsonCache%
)