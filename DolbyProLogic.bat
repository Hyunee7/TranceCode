::\ffmpeg -i %1 -af "surround=level=1:delay=20" "%~n1.DolbyProLogic%~x1"

:: level: 효과의 강도 (0~100, 기본값 0)
:: delay: 서라운드 지연 시간 (5~40ms)

::\ffmpeg -i %1 -af "surround=delay=20" "%~n1.DolbyProLogic%~x1"
\ffmpeg -i %1 -af "surround,adelay=delays=20|20" -y "%~n1.DolbyProLogic%~x1"