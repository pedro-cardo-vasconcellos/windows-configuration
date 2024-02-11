Clear-Host

Import-Module PSReadLine
$PSReadLineOptions = @{
    HistoryNoDuplicates           = $true
    HistorySearchCursorMovesToEnd = $true
    PredictionSource              = "History"
    ShowToolTips                  = $true
}
Set-PSReadLineOption @PSReadLineOptions

function Get-FormatedPath {
    return $env:Path.Split(';')
}
Set-Alias -Name 'path' -Value Get-FormatedPath