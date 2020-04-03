@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\SimpleLib

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin

@echo "Compiling SimpleLib.dll"

%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/out:%OutDir%\SimpleLib.dll ^
%ProjectDir%\AssemblyInfo.cs ^
%ProjectDir%\SimpleType.cs

endlocal
