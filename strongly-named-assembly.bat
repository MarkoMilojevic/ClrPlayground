@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\StronglyNamedAssembly

if not exist %ProjectDir%\keyfile md %ProjectDir%\keyfile
if not exist %ProjectDir%\keyfile\keypair.snk %NetFxToolsDir%\SN.exe -k %ProjectDir%\keyfile\keypair.snk

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

set OutDir=%ProjectDir%\bin\Debug

call .\strongly-named-type-new-host.bat %OutDir%

@echo "Compiling StronglyNamedAssembly.dll"
%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/keyfile:%ProjectDir%\keyfile\keypair.snk ^
/r:%OutDir%\StronglyNamedTypeNewHost.dll ^
/out:%OutDir%\StronglyNamedAssembly.dll ^
%ProjectDir%\Properties\AssemblyInfo.cs

rem install dll into GAC and delete local file
@echo "Installing StronglyNamedTypeNewHost.dll into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\StronglyNamedTypeNewHost.dll /f

rem install dll into GAC
@echo "Installing StronglyNamedAssembly.dll into GAC"
call %NetFxToolsDir%\gacutil /i %OutDir%\StronglyNamedAssembly.dll /f

endlocal
