
$json='
{
  "default": [
    "firefox",
    "notepadplusplus",
    "vlc",
    "7zip"
  ],
  "client":[
	"teamviewer",
	"office365business",
	"googlechrome --ignore-checksums",
	"ccleaner",
	"zoom",
	"eset-antivirus",
    "adobereader",
	"xnview"
  ],
  "advenced":[
	"sumatrapdf",
	"libreoffice-fresh",
	"revo-uninstaller",
	"thunderbird",
	"qbittorrent",
	"audacity",
    "keepass",
	"handbrake",
	"winSCP",
	"greenshot",
	"processhacker",
    "microsoft-windows-terminal",
    "reflect-free",
	"vmware-workstation-player"
  ],
  "programation":[
	"java",
	"jdk",
	"python",
	"visualstudio-installer",
	"eclipse",
	"sublimetext3"
	],

"multimedia":[
	"blender",
	"krita",
	"gimp",
	"inkscape"
]
}
'
$liste = ConvertFrom-Json $json

Write-Output "package disponible:"
Write-Output $liste
$userprompt = Read-Host "initial des packages a installer (defaut est toujour installer)"
$userprompt += " default"
Write-Output "les composant suivant seront installer:"

$composant=""
foreach($donut in $userprompt.Split(" ")){
$composant += $liste.($liste.psobject.properties.name -match "^$donut")+" "
}
$composant = $composant.Split(" ")|Sort-Object
Write-Output $composant
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
chocolatey install $composant -y

