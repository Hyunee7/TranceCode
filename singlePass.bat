:: loudnorm 필터를 사용해 single-pass 모드로 인코딩


:: I=-15: 평균 볼륨을 -15LUFS로 변경한다.
:: TP=-2: 음원의 볼륨이 항상 -2dBFS를 넘지 않게 한다. 클리핑이 일어나지 않게 방지하는 옵션이다.
:: LRA=11: 볼륨의 범위가 11LU(Loudness Unit)가 되게 한다.

:: -vn -sn -dn: 분석을 가속화하기 위해 비디오, 자막, 데이터 스트림 처리를 비활성화합니다.

IF "%2"=="" (
    \ffmpeg -i %1 -af "loudnorm=I=-15:TP=-2:LRA=11:print_format=json" -vn -sn -dn -f null - 2>"%~n1.log"
) ELSE (
    :: DO NOT do this for VOD: it applies dynamic compression and pumps
    \ffmpeg -i %1 -af loudnorm=I=-16:TP=-1.5:LRA=11 -c:v copy -c:a aac -b:a 192k -ar 48000 "%~n1.singlePass.Hyunee%~x1"
)