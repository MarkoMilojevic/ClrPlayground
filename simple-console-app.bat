@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\SimpleConsoleApp

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

call .\multi-file-assembly.bat %OutDir%
call .\strongly-named-assembly.bat %OutDir%

@echo "Compiling SimpleConsoleApp.exe"
%RoslynDir%\csc.exe ^
/t:exe ^
/debug:full ^
/r:%OutDir%\MultiFileAssembly.dll ^
/r:%OutDir%\SimpleLib.dll ^
/r:%OutDir%\StronglyNamedAssembly.dll ^
/out:%OutDir%\SimpleConsoleApp.exe ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\Program.cs ^
%ProjectDir%\SimpleInternalType.cs ^
%ProjectDir%\SimplePublicType.cs

rem install dll into GAC and delete local file
@echo "Installing StronglyNamedAssembly.dll into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\StronglyNamedAssembly.dll /f
del /f /q /s %OutDir%\StronglyNamedAssembly.dll
del /f /q /s %OutDir%\StronglyNamedAssembly.pdb

endlocal
