@echo off
setlocal enabledelayedexpansion

REM === Loudnorm 타겟 설정 ===
set TARGET_I=-16
set TARGET_TP=-1.5
set TARGET_LRA=11

REM === 출력 폴더 ===
set OUTDIR=normalized
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

for %%f in (*.wav *.mp3) do (
    echo.
    echo ================================
    echo 처리 중: %%f
    echo ================================

    REM === 첫 번째 패스: 임시 파일에 loudness JSON 캡처 ===
    ffmpeg -hide_banner -i "%%f" -af loudnorm=I=%TARGET_I%:TP=%TARGET_TP%:LRA=%TARGET_LRA%:print_format=json -f null NUL 2>loudnorm_tmp.txt

    REM === JSON에서 값 추출 ===
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_i" loudnorm_tmp.txt') do set I=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_tp" loudnorm_tmp.txt') do set TP=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_lra" loudnorm_tmp.txt') do set LRA=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"input_thresh" loudnorm_tmp.txt') do set THRESH=%%a
    for /f "tokens=2 delims=:" %%a in ('findstr /C:"target_offset" loudnorm_tmp.txt') do set OFFSET=%%a

    REM === 공백 및 쉼표 정리 ===
    for %%v in (I TP LRA THRESH OFFSET) do (
        set val=!%%v!
        set val=!val: =!
        set val=!val:,=!
        set %%v=!val!
    )

    echo 측정값: I=!I!, TP=!TP!, LRA=!LRA!, THRESH=!THRESH!, OFFSET=!OFFSET!

    REM === 두 번째 패스: 측정된 값으로 loudnorm 적용 ===
    ffmpeg -hide_banner -i "%%f" ^
      -af loudnorm=I=%TARGET_I%:TP=%TARGET_TP%:LRA=%TARGET_LRA%:measured_I=!I!:measured_TP=!TP!:measured_LRA=!LRA!:measured_thresh=!THRESH!:offset=!OFFSET!:linear=true:print_format=summary ^
	  -ar 44100 -sample_fmt s16 ^
      "%OUTDIR%\%%~nf_normalized.wav"

    echo 완료: "%OUTDIR%\%%~nf_normalized.wav"로 저장됨
)

del loudnorm_tmp.txt
echo.
echo 모든 파일 처리 완료! 정규화된 버전은 "%OUTDIR%" 폴더에 있습니다.
