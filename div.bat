@echo off

for /f "tokens=*" %%A in ('dir *.wma;*.wav;*.asx /b /o') do (
	C:\subsonic\transcode\ffmpeg64 -i "%%A" 1> "%%~nA.out" 2> "%%~nA.info"
	call :filename "%%A" "%%~nA.out" "%%~nA.info"
	del /q "%%~nA.out" "%%~nA.info"
)

pause

:filename
	if [%1] == [] goto :end
	set fn1=%1
	for /f "tokens=13" %%D in ('type %3 ^|findstr "channels"') do (
		echo %1 %%D
		IF NOT EXIST %%D mkdir %%D
		move %1 "%%D\%fn1:"=%""
	)
REM	for /f "tokens=9,13,12" %%D in ('type %3 ^|findstr "Audio"') do (
REM		echo %1 %%D %%E
REM		if [%%E] EQU [] (
REM			mkdir %%D
REM			move %1 "%%D\%fn1:"=%""
REM		)
REM		if [%%E] NEQ [kb] (
REM			mkdir %%E
REM			move %1 "%%E\%fn1:"=%""
REM		)
REM	)
