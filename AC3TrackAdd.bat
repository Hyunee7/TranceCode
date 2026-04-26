\ffmpeg ^
 -i %1 ^
 -i %1 ^
 -map 0:0 ^
 -c:v copy ^
 -map 0:1 ^
 -metadata:s:a:0 language=chi -metadata:s:a:0 title="Stereo" ^
 -disposition:a:0 default ^
 -c:a copy ^
 -map "[a]" ^
 -ar 48000 ^
 -metadata:s:a:1 language=chi -metadata:s:a:1 title="ac3 5.1ch Sound" ^
 -disposition:a:1 0 ^
 -filter_complex "[1:a]pan=5.1(side)|FL=FL|FR=FR|FC=0.2*FR+0.2*FL|LFE<FL+FR|SL=FL-FR|SR=FR-FL[a]" ^
 -c:a ac3 -b:a 320k ^
 -y ^
 "%~n1.AC3.Hyunee%~x1"
 
::pause