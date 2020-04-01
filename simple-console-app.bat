@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\SimpleConsoleApp

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

call .\multi-file-assembly.bat %OutDir%

%RoslynDir%\csc.exe ^
/t:exe ^
/debug:full ^
/r:%OutDir%\MultiFileAssembly.dll ^
/r:%OutDir%\SimpleLib.dll ^
/out:%OutDir%\SimpleConsoleApp.exe ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\Program.cs ^
%ProjectDir%\SimpleInternalType.cs ^
%ProjectDir%\SimplePublicType.cs

endlocal
