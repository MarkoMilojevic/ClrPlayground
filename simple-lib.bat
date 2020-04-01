@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\SimpleLib

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/out:%OutDir%\SimpleLib.dll ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\SimpleType.cs

endlocal
