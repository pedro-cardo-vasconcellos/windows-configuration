$PathDirectoryShortcuts = "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scoop Apps\"
$PathDirectoryShortcutsDestination = "~\Desktop\"

$ShortcutsToCopy = @(
    "Visual Studio Code.lnk"
)

ForEach ($Shortcut in $ShortcutsToCopy) {
    $PathOrigin = Join-Path -Path $PathDirectoryShortcuts -ChildPath $Shortcut
    $PathDestination = Join-Path -Path $PathDirectoryShortcutsDestination -ChildPath $Shortcut
    Copy-Item -Path $PathOrigin -Destination $PathDestination -Force
}