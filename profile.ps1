#oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

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

#clear

#echo ("👺 Welcome back " + $ENV:UserName) 

#setDukeAsArt

New-Alias neoduke setDukeAsArt

Function prompt {
	Write-Host "[" -nonewline -foregroundcolor DarkYellow
	Write-Host "$($ENV:UserName) " -nonewline -foregroundcolor White
	Write-Host "->" -nonewline -foregroundcolor Cyan
	Write-Host " $($PWD)" -nonewline -foregroundcolor White
	Write-Host "]" -nonewline -foregroundcolor DarkYellow
	Write-Host " <-" -nonewline -foregroundcolor Cyan
	return " "
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:FZF_DEFAULT_OPTS = '--multi --height=50% --margin=5%,2%,2%,5% --layout=reverse-list --border=double --info=inline --prompt="['+$($ENV:UserName)+'] <- " --pointer="->" --marker="x" --header="CTRL-c or ESC to quit" --color="dark,fg+:cyan,pointer:cyan,fg:yellow"'
