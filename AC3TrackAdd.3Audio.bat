\ffmpeg ^
 -i %1 ^
 -map 0:0 ^
 -c:v copy ^
 -map 0:1 ^
 -metadata:s:a:0 title="Stereo" ^
 -disposition:a:0 0 ^
 -c:a copy ^
 -map "[a]" ^
 -ar 48000 ^
 -metadata:s:a:1 title="5.1ch Sound, Difference Mix" ^
 -disposition:a:1 default ^
 -filter_complex "[0:a]pan=5.1(side)|FL=FL|FR=FR|FC=0.2*FR+0.2*FL|LFE<FL+FR|SL=FL-FR|SR=FR-FL[a]" ^
 -c:a ac3 -b:a 320k ^
 -map "[a]" ^
 -ar 48000 ^
 -metadata:s:a:2 title="5.1ch Sound, Direct Mix" ^
 -disposition:a:1 0 ^
 -filter_complex "[0:a]pan=5.1(side)|FL=FL|FR=FR|FC=0.5*FR+0.5*FL|LFE=0.1*FL+0.1*FR|SL=0.5*FL|SR=0.5*FR[a]" ^
 -c:a ac3 -b:a 320k ^
 -map 0:s -c:s copy ^
 -y ^
 "%~n1.3Audio.Hyunee%~x1"
 
::pause