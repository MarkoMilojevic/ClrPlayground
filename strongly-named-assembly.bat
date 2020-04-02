@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\StronglyNamedAssembly

if not exist %ProjectDir%\keyfile md %ProjectDir%\keyfile
if not exist %ProjectDir%\keyfile\keypair.snk %NetFxToolsDir%\SN.exe -k %ProjectDir%\keyfile\keypair.snk

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

@echo "Compiling StronglyNamedAssembly.dll"
%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/keyfile:%ProjectDir%\keyfile\keypair.snk ^
/out:%OutDir%\StronglyNamedAssembly.dll ^
%ProjectDir%\Properties\AssemblyInfo.cs ^
%ProjectDir%\StronglyNamedType.cs

endlocal
