@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\StronglyNamedAssembly\1.0.0.0

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin

@echo "Compiling StronglyNamedAssembly.dll 1.0.0.0"

%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/keyfile:.\StronglyNamedAssembly\keyfile\keypair.snk ^
/out:%OutDir%\StronglyNamedAssembly.dll ^
%ProjectDir%\AssemblyInfo.cs ^
%ProjectDir%\StronglyNamedType.cs

rem install dll into GAC
@echo "Installing StronglyNamedAssembly.dll 1.0.0.0 into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\StronglyNamedAssembly.dll /f

@echo "Compiling Policy.1.0.StronglyNamedAssembly.dll"

copy /Y %ProjectDir%\StronglyNamedAssembly.config %OutDir%

%NetFxToolsDir%\al.exe ^
/out:%OutDir%\Policy.1.0.StronglyNamedAssembly.dll ^
/version:1.0.0.0 ^
/keyfile:.\StronglyNamedAssembly\keyfile\keypair.snk ^
/linkresource:%OutDir%\StronglyNamedAssembly.config

rem install dll into GAC
@echo "Installing Policy.1.0.StronglyNamedAssembly.dll into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\Policy.1.0.StronglyNamedAssembly.dll /f

endlocal
