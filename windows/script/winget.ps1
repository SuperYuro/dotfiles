$INSTALLS = (
    "Microsoft.VisualStudio.2022.Community",
    "Microsoft.VisualStudioCode",
    "Microsoft.Office",
    "7zip.7zip",
    "GitHub.GitHubDesktop",
    "Mozilla.Firefox",
    "Google.Chrome",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Automattic.Simplenote",
    "Rustlang.Rustup"
)

$INSTALLS | ForEach-Object { winget install $_ -s winget }
