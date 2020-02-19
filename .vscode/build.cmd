
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
