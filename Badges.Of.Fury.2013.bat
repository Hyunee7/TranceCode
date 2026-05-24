\ffmpeg ^
 -i Badges.Of.Fury.2013.720p.BluRay.x264.AAC-[YTS.MX].mp4 ^
 -i Badges.of.Fury.2013.1080p.BDRip.AV1-DiN.mkv ^
 -map 1:0 ^
 -map 1:2 ^
 -c copy ^
 -map_metadata 0 ^
 -y ^
 Badges.of.Fury.2013.1080p.BDRip.aac.hyunee.mp4

:: -map_metadata 0 : 책갈피(챕터) 정보 복사
