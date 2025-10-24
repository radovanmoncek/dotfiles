$work = "C:\Users\soudr\work"
$school = "$($HOME)\school"
$personal = "$($HOME)\personal\git"

#Import-Module -Name Terminal-Icons

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

# Inspired by Gruber Darker - tsoding
Function prompt {
	Write-Host "@ " -nonewline -foregroundcolor DarkYellow
	Write-Host "$(Get-Date)" -nonewline -foregroundcolor Blue
	Write-Host " ./$(($pwd -split "\\")[($pwd -split "\\").Length - 1])" -nonewline -foregroundcolor DarkYellow
	return " "
}

Function Path-From-NTFS-To-Ext4 ([string] $FileNameNTFS){
	$FileNameExt4 = $FileNameNTFS -replace '\\', '/'
	$FileNameExt4 = $FileNameExt4 -replace 'C:', '/mnt/c'
	return $FileNameExt4	
}

Function Vim-WSL ([string]$FileNameExt4) {
	#echo $FileNameExt4
	wsl vim (Path-From-NTFS-To-Ext4 $FileNameExt4)
}

Function WiFi-Connect ($NetworkName) {
	netsh.exe wlan connect name=$NetworkName interface=WiFi
}

Function Get-Message-Of-The-Day {
	clear; Write-Host "Those who do not learn from history are destined to repeat it. (George Saytama)"
}

Function FZF-Into-Vim {
	#Write-Host "You just launched vim fzf"
	#$NTFSPath = (fzf)
	#echo $NTFSPath
	#fzf | echo
	#Get-ChildItem . -File -Recurse -Depth 4 | Invoke-Fzf | % {type $_}	
	Get-ChildItem . -File -Recurse -Depth 4 | Invoke-Fzf | % {Vim-WSL $_}
	#return
	#exit
}

Function File-WSL ([string]$NTFSPath) {
	wsl file (Path-From-NTFS-To-Ext4 $NTFSPath)
}

Function Ldd-WSL ([string]$NTFSPath) {
	wsl ldd (Path-From-NTFS-To-Ext4 $NTFSPath)
}

New-Alias con WiFi-Connect
New-Alias vim Vim-WSL
New-Alias file File-WSL 
New-Alias ldd Ldd-WSL

Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -ScriptBlock {
#echo 1
#[Microsoft.PowerShell.PSConsoleReadLine]::AddLine()
#[Microsoft.PowerShell.PSConsoleReadLine]::Insert('echo 1')
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('FZF-Into-Vim')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
#FZF-Into-Vim
#return
#exit
#fzf | echo
#Get-ChildItem . -File -Recurse | Invoke-Fzf | % {Write-Host "\n"; Get-Content -Path $_ | Write-Host; prompt}
#Get-ChildItem . -File -Recurse | Invoke-Fzf | Vim-WSL
#return
#Invoke-Command -ScriptBlock {Write-Host "test"}
#echo test
} 

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:FZF_DEFAULT_OPTS = '--multi --height=69% --margin=5%,2%,2%,5% --layout=reverse-list --border=double --info=inline --prompt="./' + ($pwd -split "\\")[($pwd -split "\\").Length - 1] + ' ? " --pointer="@" --marker="x" --header="CTRL-c or ESC to quit" --color="dark,fg+:cyan,pointer:cyan,fg:yellow"'

Get-Message-Of-The-Day
