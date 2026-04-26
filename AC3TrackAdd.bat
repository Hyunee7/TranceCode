call MP3toAC3 %1

\ffmpeg ^
 -i %1 ^
 -i "%~n1.ac3" ^
 -map 0:0 ^
 -map 0:1 ^
 -metadata:s:a:0 language=kor -metadata:s:a:0 title="Stereo" ^
 -disposition:a:0 default ^
 -map 1:0 ^
 -metadata:s:a:1 language=kor -metadata:s:a:1 title="ac3 5.1ch Test Sound" ^
 -disposition:a:1 0 ^
 -c copy ^
 -y ^
 "%~n1.ac3.Hyunee.mp4" 
