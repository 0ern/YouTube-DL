@ECHO OFF 
:: Batch file for download YouTube videos.

TITLE yt-dlp
cd ".\data"

ECHO Welcome to yt-dlp
ECHO.

COLOR 0A
ECHO Updating yt-dlp script...
yt-dlp.exe --no-check-certificates --update
ECHO.

COLOR 07
ECHO Download options: video, audio or notYT
SET /P "OP=Type desired option: "
SET /P "URL=Insert URL: "

ECHO.
ECHO Searching file...

COLOR 0C
ECHO.
ECHO Start download. Please wait.
:: ECHO Start download of %vid%. Please wait.

if "%OP%" equ "video" yt-dlp.exe --no-check-certificates --console-title -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio --merge-output-format mp4 --add-metadata -o "C:%HOMEPATH%\Desktop\%%(title)s.%%(ext)s" %URL%

if "%OP%" equ "audio" yt-dlp.exe --no-check-certificates --console-title --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -o "C:%HOMEPATH%\Desktop\%%(title)s.%%(ext)s" %URL%

if "%OP%" equ "notYT" yt-dlp.exe --no-check-certificates --console-title --add-metadata -o "C:%HOMEPATH%\Desktop\%%(title)s.%%(ext)s" %URL%

ECHO.
ECHO Done.
ECHO.

EXIT