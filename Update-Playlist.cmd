@echo off
setlocal
cd /d "%~dp0"

REM Generate Videos\videos.json from current video files
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Update-Playlist.ps1"
set ERR=%ERRORLEVEL%
echo.
if not %ERR%==0 (
  echo There was an error updating the playlist. ^(Error %ERR%^
  echo^)
) else (
  echo Playlist updated successfully.
)
echo Press any key to close this window...
pause >nul
exit /b %ERR%

