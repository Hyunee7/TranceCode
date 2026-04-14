for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.wma /b /on') do C:\subsonic\transcode\192k.bat "%%A" "%%~nA_192k.mp3"
