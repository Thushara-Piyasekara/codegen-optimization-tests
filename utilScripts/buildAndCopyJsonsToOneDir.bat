@echo off
cd ..
set parentDir=%cd%\
cd utilScripts
set TypeDefTests=%parentDir%Tests\TypeDefinitions
set FunctionTests=%parentDir%Tests\Functions
set actualJsonCache=%parentDir%JSONs\ActualJSONs
set expectedJsonCache=%parentDir%JSONs\ExpectedJSONs
set TEMP_JAR_CACHE=%parentDir%utilScripts\TEMP_JAR_CACHE


del /q /a-d "%actualJsonCache%\*"

for %%f in ("%FunctionTests%\*bal") do (
    call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

for %%f in ("%TypeDefTests%\*bal") do (
    call buildAndCopySingleJson.bat %%f %actualJsonCache%
)

echo %TEMP_JAR_CACHE%
for /f "tokens=*" %%a in ('dir /b /s /a-d "%TEMP_JAR_CACHE%\*.jar"') do (
    echo Deleting: "%%a"
    del "%%a"
)

for %%f in ("%expectedJsonCache%\*json") do (
    call compareJsons.bat %%f %actualJsonCache%
)