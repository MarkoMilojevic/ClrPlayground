@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\StronglyNamedAssembly\1.0.0.0

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

@echo "Compiling StronglyNamedAssembly.dll 1.0.0.0"

%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/keyfile:.\StronglyNamedAssembly\keyfile\keypair.snk ^
/out:%OutDir%\StronglyNamedAssembly.dll ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\StronglyNamedType.cs

rem install dll into GAC
@echo "Installing StronglyNamedAssembly.dll 1.0.0.0 into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\StronglyNamedAssembly.dll /f

endlocal
