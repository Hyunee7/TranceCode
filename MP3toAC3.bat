\ffmpeg ^
 -i %1 ^
 -ar 48000 ^
 -filter_complex "[0:a]pan=5.1(side)|FL=FL|FR=FR|FC=0.2*FR+0.2*FL|LFE<FL+FR|SL=FL-FR|SR=FR-FL[a]" ^
 -map "[a]" -c:a ac3 -b:a 320k -y "%~n1.ac3"
::pause