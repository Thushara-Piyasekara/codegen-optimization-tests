@echo off
set parentDir=C:\src\BallerinaProjects\SingleFileProjects\
set TypeDefTests=%parentDir%BuildProjects\TypeDefinitions
set FunctionTests=%parentDir%BuildProjects\Functions

for /d %%f in ("%FunctionTests%\*") do (
    rmdir /q /s "%%f\target"
)

for /d %%f in ("%TypeDefTests%\*") do (
    rmdir /q /s "%%f\target"
)
