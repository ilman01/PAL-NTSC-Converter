@echo off
echo [1] PAL to NTSC
echo [2] NTSC to PAL
set /p mode="Select Mode: "
cls
set /p input="Enter Input Path File: "
cls
set /p container="Enter Input Container (.mp4, .mkv, ...): "
cls
set /p output="Enter Output Path File: "
cls

echo Proceed?
pause
cls


ffmpeg -i %input% -vn -ac 2 -b:a 1M audio.wav


if %mode%==1 ffmpeg -r 24000/1001 -i %input% -b:a 320k video%container%

if %mode%==2 ffmpeg -r 25 -i %input% -b:a 320k video%container%


cd sox-14.4.2

if %mode%==1 sox ../audio.wav ../audio2.wav tempo -s 0.95904095904

if %mode%==2 sox ../audio.wav ../audio2.wav tempo -s 1.042709376


cd ..

ffmpeg -i video%container% -i audio2.wav -c:v copy -map 0:v:0 -map 1:a:0 -b:a 320k %output%


del audio.wav
del audio2.wav
del video%container%

echo Complete!
pause