Invoke-Expression "code ."

$PathDirectory = "~\Repos\windows-configuration\resources\"
$PathFileSettings = Join-Path -Path $PathDirectory -ChildPath "vscode-settings.json"
$PathFileKeybidings = Join-Path -Path $PathDirectory -ChildPath "vscode-keybindings.json"
$PathFileExtensions = Join-Path -Path $PathDirectory -ChildPath "vscode-extensions.txt"

$Version = (Invoke-Expression "code --version").Split("\n")[0]
$PathDestinationDirectoryOption1 = "~\scoop\apps\vscode\$version\data\user-data\User\"
$PathDestinationDirectoryOption2 = "$Env:APPDATA\Code\User\"

if (Test-Path -Path $PathDestinationDirectoryOption1) {
    $PathDestinationDirectory = $PathDestinationDirectoryOption1
}
elseif (Test-Path -Path $PathDestinationDirectoryOption2) {
    $PathDestinationDirectory = $PathDestinationDirectoryOption2
}
else {
    throw "Neither directory option exists"
}

$PathDestinationFileSettings = Join-Path -Path $PathDestinationDirectory -ChildPath "settings.json"
$PathDestinationFileKeybindings = Join-Path -Path $PathDestinationDirectory -ChildPath "keybindings.json"

Copy-Item -Path $PathFileSettings -Destination $PathDestinationFileSettings -Force
Copy-Item -Path $PathFileKeybidings -Destination $PathDestinationFileKeybindings -Force

Get-Content -Path $PathFileExtensions | ForEach-Object { Invoke-Expression "code --install-extension $PSItem --force" }