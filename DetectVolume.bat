:: -vn -sn -dn: 분석을 가속화하기 위해 비디오, 자막, 데이터 스트림 처리를 비활성화합니다.

\ffmpeg -i %1 -af "volumedetect" -vn -sn -dn -f null null

