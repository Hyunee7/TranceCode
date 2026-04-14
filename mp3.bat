REM for /f "tokens=*" %%A in ('dir *.flac /s /b') do echo %%A %%~pA%%~nA
REM for /f "tokens=*" %%A in ('dir *.flac;*.ape;*.wav;*.m4a;*.ogg;*.aac;*.wma;*.aif /b /on') do C:\subsonic\transcode\320k.bat "%%A" "%%~nA_320k.mp3"

FOR /f "tokens=*" %%A IN ('dir *.flac;*.ape /s /b') DO (
  c:\subsonic\transcode\320k.bat "%%A" "%%~pA%%~nA_320k.mp3"
  IF EXIST "%%~pA%%~nA_320k.mp3" del /q "%%A"
)