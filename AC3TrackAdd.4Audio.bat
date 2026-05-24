::----------------------------------------------------------------------------- 
    echo 검사 중: %1
    \ffprobe -v error -select_streams s -show_entries stream=index,codec_name -of default=noprint_wrappers=1 %1 | findstr "codec_type=subtitle codec_name" > nul
    if not errorlevel 1 (
        echo [자막 있음] - %1
        call :자막있음 %1
    ) else (
        echo [자막 없음] - %1 
        call :자막없음 %1
    )
goto :end



::----------------------------------------------------------------------------- 
:자막있음
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
 -map "[a]" ^
 -ar 48000 ^
 -metadata:s:a:3 title="5.1ch Sound, Sense of Space mix" ^
 -disposition:a:1 0 ^
 -filter_complex "[0:a]channelsplit=channel_layout=stereo[l][r]; [l][r]join=inputs=2:channel_layout=stereo[s]; [s]pan=5.1|FL=c0|FR=c1|FC=0.5*c0+0.5*c1|LFE=0.1*c0+0.1*c1|BL=0.3*c0|BR=0.3*c1[a]" ^
 -c:a ac3 -b:a 320k ^
 -map 0:s -c:s copy ^
 -y ^
 "%~n1.4Audio.Hyunee%~x1"

goto :end
 
 
 
::----------------------------------------------------------------------------- 
:자막없음
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
 -map "[a]" ^
 -ar 48000 ^
 -metadata:s:a:3 title="5.1ch Sound, Sense of Space mix" ^
 -disposition:a:1 0 ^
 -filter_complex "[0:a]channelsplit=channel_layout=stereo[l][r]; [l][r]join=inputs=2:channel_layout=stereo[s]; [s]pan=5.1|FL=c0|FR=c1|FC=0.5*c0+0.5*c1|LFE=0.1*c0+0.1*c1|BL=0.3*c0|BR=0.3*c1[a]" ^
 -c:a ac3 -b:a 640k ^
 -y ^
 "%~n1.4Audio.Hyunee%~x1"
 
goto :end

 
:end
::pause