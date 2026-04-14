@echo off
for /f "tokens=*" %%A in ('dir *.mp3;*.wma /b /on') do (
	C:\subsonic\transcode\ffmpeg64 -i "%%A" 1> out.txt 2> info.txt
	call :filename "%%A"
	del /q out.txt info.txt
)
pause

:filename
	IF [%1] == [] GOTO :end
	SET fn1=%1
	FOR /f "tokens=3" %%D in ('type info.txt ^|findstr "track"') DO (
		IF NOT [%%D] == [gain] ECHO rename %1 "%%D. %fn1:"=%"
		IF NOT [%%D] == [gain] rename %1 "%%D. %fn1:"=%"
	)
