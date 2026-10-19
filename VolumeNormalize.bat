::for %%i in (*.mp4) do (
::    for /f "tokens=*" %%a in ('ffmpeg -i "%%i" -af loudnorm^=I^-14:TP^-1.0:print_format^=json -f null - 2^>^&1 ^| findstr /r "{ }"') do ::(
::        ffmpeg -i "%%i" -c:v copy -af loudnorm=I^-14:TP^-1.0:measured_i=%%a:print_format^=summary "normalized_%%i"
::    )
::)

    for /f "tokens=*" %%a in ('\ffmpeg -i %1 -af loudnorm^=I^=^-14:TP^=^-1.0:print_format^=json -f null - 2^>^&1 ^| findstr /r "{ }"') do (
        \ffmpeg -i %1 -c:v copy -af loudnorm^=I^=^-14:TP^=^-1.0:measured_i=%%a:print_format^=summary "%~n1.normalized.Hyunee%~x1"

    )
