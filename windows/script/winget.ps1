$INSTALLS = (
    "Microsoft.VisualStudio.2022.Community",
    "Microsoft.VisualStudioCode",
    "Microsoft.Office",
    "7zip.7zip",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Automattic.Simplenote",
    "Handbrake.Handbrake"
)

$INSTALLS | ForEach-Object { winget install $_ -s winget }
