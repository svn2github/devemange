@echo off
REM delete Delphi temp files
del /S *.~*  > nul
del /S *.ddp > nul
del /S *.bak > nul
del /S *.dcu > nul
del /S *.dsm > nul

REM delete VC temp files
del /S *.ncb > nul
del /S *.ilk > nul
del /S *.exp > nul
del /S *.obj > nul

if EXIST Debug goto DelDebug
goto DoRelease

:DelDebug
cd Debug > nul
del *.* /F /Q > nul
cd .. > nul
rd Debug > nul

:DoRelease
if EXIST Release goto DelRelease
goto END

:DelRelease
cd Release > nul
del *.* /F /Q > nul
cd .. > nul
rd Release > nul
:END
