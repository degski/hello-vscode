
:: create junctions.

md c:/usr

mklink /J "c:/usr/vc" "c:/program files (x86)/microsoft visual studio/2019/community/vc/tools/msvc/14.24.28314"
mklink /J "c:/usr/vc_community" "c:/program files (x86)/microsoft visual studio/2019/community/vc"
mklink /J "c:/usr/build" "c:/program files (x86)/microsoft visual studio/2019/community/vc/auxiliary/build"
mklink /J "c:/usr/clang" "c:/program files/llvm"
mklink /J "c:/usr/netfxsdk" "c:/Program Files (x86)/Windows Kits/NETFXSDK/4.8"
mklink /J "c:/usr/kits" "c:/Program Files (x86)/Windows Kits/10/include/10.0.18362.0"

:: call compiler with arguments.

call c:/usr/build/vcvarsall.bat.cmd x64

:: https://stackoverflow.com/a/20702597/646940

(
  setlocal enabledelayedexpansion
  set skip=1
  set "params=%1"
  for %%i in (%*) do if !skip! leq 0 (
        set "params=!params! %%i"
    ) else set /a skip-=1
)
(
  endlocal
  set "params=%params%"
)

%cmd% %params%

rd /S /Q "c:/usr"
