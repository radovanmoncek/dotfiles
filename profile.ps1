Import-Module -Name Terminal-Icons

# Steam 
New-Alias steam "C:\Program Files (x86)\Steam\steam.exe"

# Opera
New-Alias opera "C:\Users\Admin\AppData\Local\Programs\Opera GX\opera.exe"

# League
New-Alias league "C:\Users\Admin\Documents\gameLaunch\league.lnk"

#cmatrix
New-Alias cmatrix Start-ScreenSaver

#neofetch custom
Function setDukeAsArt {neofetch --source C:\Users\Admin\scoop\apps\neofetch\neofetch_duke_ascii.txt}

#neo
function clearAndFetch{
	clear
	setDukeAsArt
}

New-Alias neo clearAndFetch

#Code
New-Alias coder "C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\Code.exe"

#firefox
New-Alias fox "C:\Program Files\Mozilla Firefox\firefox.exe"

New-Alias neoduke setDukeAsArt

New-Alias dockerdesktop "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe"

New-Alias idea64 C:\Portable\idea24\app\bin\idea64.exe

Function prompt {
	Write-Host "@ " -nonewline -foregroundcolor DarkYellow
	Write-Host "$(Get-Date)" -nonewline -foregroundcolor Cyan
	Write-Host " ./$(($pwd -split "\\")[($pwd -split "\\").Length - 1])" -nonewline -foregroundcolor Cyan
	return " "
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:FZF_DEFAULT_OPTS = '--multi --height=70% --margin=5%,2%,2%,5% --layout=reverse-list --border=double --info=inline --prompt="./' + ($pwd -split "\\")[($pwd -split "\\").Length - 1] + ' ? " --pointer="@" --marker="x" --header="CTRL-c or ESC to quit" --color="dark,fg+:cyan,pointer:cyan,fg:yellow"'
