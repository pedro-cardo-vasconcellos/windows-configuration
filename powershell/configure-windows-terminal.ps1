$PathOrigin = "~\Repos\windows-configuration\resources\windows-terminal-settings.json"
$PathDestination = Join-Path -Path $Env:LOCALAPPDATA -ChildPath "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Path $PathOrigin -Destination $PathDestination