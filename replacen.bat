@echo off
for /f "delims=" %%x in ('F:\Embedded_Technology\NRF_Series\workspace\NRF52832_ble_demo\incDir.txt')do (
echo %%x&set/a n+=1
(for /f "usebackq delims=" %%i in ("%%x")do (
set "w=%%i"
setlocal enabledelayedexpansion
set "w=!w: =" "!"
for %%j in ("!w!")do echo.%%~j
endlocal
))>temp.yky
move temp.yky "%%x")
echo %n% 个文件处理完毕
ping -n 3 127.1>nul