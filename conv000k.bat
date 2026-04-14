set /p bitr="Bitrate? : "
for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.wma;*.swf;*.asf;*.asx /b /on') do C:\subsonic\transcode\000k.bat "%%A" "%%~nA_%bitr%k.mp3" %bitr%
