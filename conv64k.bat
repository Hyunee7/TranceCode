for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.wma /b /on') do C:\subsonic\transcode\128k.bat "%%A" "%%~nA_128k.mp3"
