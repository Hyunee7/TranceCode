for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.wma;*.mp2 /b /on') do C:\subsonic\transcode\128k.bat "%%A" "%%~nA_128k.mp3"
