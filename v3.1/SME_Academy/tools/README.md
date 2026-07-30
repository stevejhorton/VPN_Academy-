# SME_Academy Tools

## Launch (Windows + macOS)

Requires PowerShell Core (`pwsh`). On macOS install via `brew install powershell`.

**Windows:**
```powershell
pwsh tools/launch.ps1
```

**macOS:**
```bash
pwsh tools/launch.ps1
```

Both commands:
1. Scan `modules/` and rebuild `generated/content_index.json`
2. Preserve external/binary library entries
3. Open `index.html` in your default browser

## Rebuild Index Only (no browser launch)

```powershell
pwsh tools/rebuild_index.ps1
```

## Notes
- Run from inside `SME_Academy/` or `SME_Academy/tools/` — the scripts detect their own location.
- Use desktop Chrome or Edge for full File System Access API support.
- Do not commit secrets or raw ServiceNow exports.
