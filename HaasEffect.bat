\ffmpeg -i %1 -af "aphaser=in_gain=0.4:out_gain=1:delay=2:decay=0.5:speed=0.5" "%~n1_3d%~x1"
