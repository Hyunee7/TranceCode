for /f "tokens=*" %%A in ('dir *.avi;*.mpg;*.wmv;*.mkv;*.flv;*.asf /b /on') do (
	C:\subsonic\transcode\ffmpeg64 -i "%%A" -preset slow -f mp4 "%%~nA.mp4"
)
