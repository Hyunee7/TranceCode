::\ffmpeg -i %1 -af "pan=5.1(side)|FL=FC+0.3*FL+0.3*BL|FR=FC+0.3*FR+0.3*BR|FC=0.5*FL+0.5*FR|LFE<1.0*LFE|BL=0.3*FL+0.3*BL|BR=0.3*FR+0.3*BR" "%~n1_51%~x1"

ffmpeg -i %1 -af "pan=stereo|FL<1.0*FL+0.707*FC+0.707*BL|FR<1.0*FR+0.707*FC+0.707*BR" "%~n1.51ch%~x1"
