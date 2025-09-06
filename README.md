Reception TV — Easy Video Management

How it works
- The player reads `Videos/videos.json` to know which files to play and in what order.
- Video files live in the `Videos/` folder next to `index.html`.

Fast, non‑technical workflow (Windows)
1) Add videos: Copy your `.mp4` files into `Videos/`.
   - Recommended: H.264 video + AAC audio in an `.mp4` container for best compatibility.
   - Also supported by the playlist script: `.m4v`, `.mov`, `.webm`.
2) Set order: Rename files alphabetically (e.g., `01 - Welcome.mp4`, `02 - News.mp4`).
3) Update playlist: Double‑click `Update-Playlist.cmd`.
   - This regenerates `Videos/videos.json` to match the files in `Videos/`.
   - Removing a video = delete the file and run the script.
   - Replacing a video = overwrite the file with the same name (run the script if you changed the name).

Notes
- The player starts muted and loops through the list with a short splash between items.
- If a file does not play, re‑encode with HandBrake (H.264/AAC, MP4) and try again.
- If Windows blocks the script, right‑click `Update-Playlist.cmd` and choose "Run anyway" or open PowerShell and run:
  `powershell -NoProfile -ExecutionPolicy Bypass -File ./Update-Playlist.ps1`

Mac/Linux
- You can run the PowerShell script with PowerShell 7 (`pwsh`) if installed:
  `pwsh ./Update-Playlist.ps1`

Alternatives (optional)
- YouTube playlist: Manage videos in a YouTube playlist and embed it here—no files to edit. Ask if you want this wired up.
- In‑browser admin: Build a small page that lets you pick the `Videos/` folder and drag‑drop order, then writes `videos.json`. Happy to add this if you prefer a UI.

