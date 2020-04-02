@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\SimpleConsoleApp

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

call .\multi-file-assembly.bat %OutDir%
call .\strongly-named-assembly.bat

@echo "Compiling SimpleConsoleApp.exe"
%RoslynDir%\csc.exe ^
/t:exe ^
/debug:full ^
/r:%OutDir%\MultiFileAssembly.dll ^
/r:%OutDir%\SimpleLib.dll ^
/r:%ProjectDir%\StronglyNamedAssembly.dll ^
/out:%OutDir%\SimpleConsoleApp.exe ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\Program.cs ^
%ProjectDir%\SimpleInternalType.cs ^
%ProjectDir%\SimplePublicType.cs

endlocal
