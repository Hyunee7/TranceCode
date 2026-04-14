REM set fn=%1
REM set nfn=%fn:"=%
REM REM E:\Download\ffmpeg.exe -i %1 -ss 10 -vf scale=800:-1 -vframes 1 "%nfn%.jpg"
REM del /q "%nfn%.jpg"
REM set /p ssec="초 입력 : "
REM if "%ssec%"=="" set ssec=6
REM c:\subsonic\transcode\ffmpeg64.exe -i %1 -ss %ssec% -vframes 1 "%nfn%.jpg"

for /f "tokens=*" %%A in ('dir *.mp4;*.pamp /b /o') do (
REM	call :func "%%A" "%%~nA"
REM	c:\subsonic\transcode\ffmpeg64.exe -i "%%A" -ss 16 -vframes 1 "%%~nA.jpg"
	c:\subsonic\transcode\ffmpeg64.exe -i "%%A" -vframes 1 "%%~nA.jpg"
)
REM pause