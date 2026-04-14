for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.aac;*.wma;*.aif /b /on') do C:\subsonic\transcode\320k.bat "%%A" "%%~nA_320k.mp3"
