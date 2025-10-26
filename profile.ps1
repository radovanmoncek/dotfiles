$work = "C:\Users\soudr\work"
$school = "$($HOME)\school"
$personal = "$($HOME)\personal\git"
$env:FZF_DEFAULT_OPTS = '--multi --height=69% --margin=5%,2%,2%,5% --layout=reverse-list --border=double --info=inline --prompt="./' + ($pwd -split "\\")[($pwd -split "\\").Length - 1] + ' ? " --pointer="@" --marker="x" --header="CTRL-c or ESC to quit" --color="dark,fg+:cyan,pointer:cyan,fg:yellow"'

Function setDukeAsArt {neofetch --source C:\Users\Admin\scoop\apps\neofetch\neofetch_duke_ascii.txt}

Function clearAndFetch{
	clear
	setDukeAsArt
}

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
	wsl vim (Path-From-NTFS-To-Ext4 $FileNameExt4)
}

Function WiFi-Connect ($NetworkName) {
	netsh.exe wlan connect name=$NetworkName interface=WiFi
}

Function Get-Message-Of-The-Day {
	clear; Write-Host "Those who do not learn from history are destined to repeat it. (George Saytama)"
}

#https://www.windowsdigitals.com/powershell-open-url-in-chrome-edge-or-firefox/
Function FZF-Into-Vim {
	[Microsoft.PowerShell.PSConsoleReadLine]::BackwardKillLine()
	Get-ChildItem . -File -Recurse -Depth 4 | Invoke-Fzf | % {Vim-WSL $_}
	#[System.Diagnostics.Process]::Start("firefox", "https://www.windowsdigitals.com")
}

Function File-WSL ([string]$NTFSPath) {
	wsl file (Path-From-NTFS-To-Ext4 $NTFSPath)
}

Function Ldd-WSL ([string]$NTFSPath) {
	wsl ldd (Path-From-NTFS-To-Ext4 $NTFSPath)
}

Function Start-Discord {
	Start-Process "C:\Users\soudr\scoop\apps\discord\current\discord-portable.exe" -PassThru
}

New-Alias con WiFi-Connect
New-Alias vim Vim-WSL
New-Alias file File-WSL 
New-Alias ldd Ldd-WSL
New-Alias dis Start-Discord
New-Alias discord dis
New-Alias zero "C:\ProgramData\ZeroTier\One\zerotier-one_x64.exe"
New-Alias zerotier-cli zero
New-Alias steam "C:\Program Files (x86)\Steam\steam.exe"
New-Alias opera "C:\Users\Admin\AppData\Local\Programs\Opera GX\opera.exe"
New-Alias league "C:\Users\Admin\Documents\gameLaunch\league.lnk"
New-Alias cmatrix Start-ScreenSaver
New-Alias neo clearAndFetch
New-Alias coder "C:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\Code.exe"
New-Alias fox "C:\Program Files\Mozilla Firefox\firefox.exe"
New-Alias neoduke setDukeAsArt
New-Alias dockerdesktop "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe"
New-Alias idea64 C:\Portable\idea24\app\bin\idea64.exe

Set-PSReadLineKeyHandler -Chord 'Ctrl+o' -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('FZF-Into-Vim')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
} 

Get-Message-Of-The-Day
