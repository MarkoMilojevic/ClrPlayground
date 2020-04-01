@echo off

call .\init-variables.bat

setlocal

set ProjectDir=.\MultiFileAssembly

if not exist %ProjectDir%\bin\Debug md %ProjectDir%\bin\Debug

if not "%1" == "" set OutDir=%1
if "%1" == "" set OutDir=%ProjectDir%\bin\Debug

call .\simple-lib.bat %OutDir%

%RoslynDir%\csc.exe ^
/t:module ^
/debug:full ^
/r:%OutDir%\SimpleLib.dll ^
/out:%OutDir%\PartOne.netmodule ^
%ProjectDir%\PartOne.cs

%RoslynDir%\csc.exe ^
/t:module ^
/debug:full ^
/r:%OutDir%\SimpleLib.dll ^
/out:%OutDir%\PartTwo.netmodule ^
%ProjectDir%\PartTwo.cs

%RoslynDir%\csc.exe ^
/t:module ^
/debug:full ^
/r:%OutDir%\SimpleLib.dll ^
/out:%OutDir%\PartThree.netmodule ^
%ProjectDir%\PartThree.cs

%RoslynDir%\csc.exe ^
/t:library ^
/debug:full ^
/addmodule:%OutDir%\PartOne.netmodule ^
/addmodule:%OutDir%\PartTwo.netmodule ^
/addmodule:%OutDir%\PartThree.netmodule ^
/out:%OutDir%\MultiFileAssembly.dll ^
%ProjectDir%\Properties\AssemblyInfo.cs

endlocal