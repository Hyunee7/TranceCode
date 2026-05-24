\ffmpeg64.exe -i "Zootopia.2016.1080p.BluRay.x264-[YTS.AG].mp4" -i "주토피아 - 완벽 우리말더빙 (초고화질).avi" -map 0:0 -map 0:1 -map 1:1 -c copy -metadata:s:a:0 language=eng -metadata:s:a:0 title="English" -metadata:s:a:1 language=kor -metadata:s:a:1 title="Korean" "Zootopia.2016.1080p.BluRay.x264.eng.kor.Hyunee.mkv"

::안됨
\ffmpeg64.exe -i "Zootopia.2016.2160p.4K.BluRay.x265.10bit.AAC5.1-[YTS.MX].mkv" -i "주토피아 - 완벽 우리말더빙 (초고화질).avi" -i "주토피아.2016\주토피아.2016.smi"  -map 0:0 -c:v copy -map 0:1 -c:a copy -map 1:1 -c:a copy  -metadata:s:a:1 language=kor -metadata:s:a:1 title="Korean" -map 0:2 -c:s copy -metadata:s:s:0 title="English" -map 2:0 -c:s srt -metadata:s:s:1 language=kor -metadata:s:s:1 title="Korean" -flags global_header -y "Zootopia.2016.2160p.4K.BluRay.x265.10bit.AAC5.1-Hyunee.mkv"

::자막안됨,영문소리 타이틀 없음
\ffmpeg64.exe -i "Zootopia.2016.2160p.4K.BluRay.x265.10bit.AAC5.1-[YTS.MX].mkv" -i "주토피아 - 완벽 우리말더빙 (초고화질).avi" -i "주토피아.2016\주토피아.2016.smi"  -map 0:0 -c:v copy -map 0:1 -c:a copy -map 1:1 -c:a copy  -metadata:s:a:1 language=kor -metadata:s:a:1 title="Korean" -map 2:0 -c:s srt -metadata:s:s:0 language=kor -metadata:s:s:0 title="Korean" -flags global_header -y "Zootopia.2016.2160p.4K.BluRay.x265.10bit.AAC5.1-Hyunee.mkv"
