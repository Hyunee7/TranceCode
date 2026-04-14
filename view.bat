@echo off
:: old ::
:: chcp 437
chcp 949
:: chcp 65001
::C:\subsonic\transcode\ffmpeg64 -i %1 -f metadata
::pause

:: 2023년 6월 14일 수요일 오전 8:40:52 ::
C:\subsonic\transcode\ffmpeg64 -i %1 -f metadata 1>c:\temp\result.txt 2>c:\temp\lyrics.txt
::notepad c:\temp\lyrics.txt
::exit

:: 2023년 6월 14일 수요일 오전 9:13:17 ::
:: for /f "tokens=*" %%a in ('forfiles /p c:\temp\ /m lyrics.txt /c "cmd /c echo @fsize"') do if %%a GTR 2048 (echo "Y") else (echo "N")
for /f "tokens=*" %%a in ('forfiles /p c:\temp\ /m lyrics.txt /c "cmd /c echo @fsize"') do (
  if %%a GTR 3072 (
    start notepad c:\temp\lyrics.txt
    exit
  ) else (
    C:\subsonic\transcode\ffmpeg64 -i %1 -f metadata
    pause
  )
)

::end
