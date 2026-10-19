@echo off
setlocal enabledelayedexpansion

REM === Loudnorm 타겟 설정 ===
set TARGET_I=-16
set TARGET_TP=-1.5
set TARGET_LRA=11


    echo.
    echo =================================================================
    echo 처리 중: %1
    echo =================================================================

    REM === 첫 번째 패스: 임시 파일에 loudness JSON 캡처 ===
    \ffmpeg -hide_banner -i %1 -af loudnorm=I=%TARGET_I%:TP=%TARGET_TP%:LRA=%TARGET_LRA%:print_format=json -vn -sn -dn -f null NUL 2>"%~n1.txt"

    REM === JSON에서 값 추출 ===
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_i" "%~n1.txt"') do set I=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_tp" "%~n1.txt"') do set TP=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_lra" "%~n1.txt"') do set LRA=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_thresh" "%~n1.txt"') do set THRESH=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"target_offset" "%~n1.txt"') do set OFFSET=%%a

    REM === 공백 및 쉼표 정리 ===
    for %%v in (I TP LRA THRESH OFFSET) do (
        set val=!%%v!
        set val=!val: =!
        set val=!val:,=!
        set val=!val:"=!
        set %%v=!val!
    )

    echo 측정값: I=!I!, TP=!TP!, LRA=!LRA!, THRESH=!THRESH!, OFFSET=!OFFSET!

    REM === 두 번째 패스: 측정된 값으로 loudnorm 적용 ===
    \ffmpeg -hide_banner -i %1 ^
      -af loudnorm=I=%TARGET_I%:TP=%TARGET_TP%:LRA=%TARGET_LRA%:measured_I=!I!:measured_TP=!TP!:measured_LRA=!LRA!:measured_thresh=!THRESH!:offset=!OFFSET!:linear=true:print_format=summary ^
      -c:v copy -c:a aac -b:a 192k -ar 44100 -y ^
      "%~n1.normalized.Hyunee%~x1"

    echo 완료: "%~n1.normalized.Hyunee%~x1"로 저장됨

del "%~n1.txt"
echo.
echo 처리 완료!
