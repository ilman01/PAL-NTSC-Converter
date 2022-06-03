@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls

echo Proceed?
pause
cls

ffmpeg -i %input% -map 0:v:0 -c:v copy -map 0:a:0 -c:a:0 aac -ac 2 -b:a:0 128k -map 0:a:0 -c:a:1 copy -c:s copy %output%