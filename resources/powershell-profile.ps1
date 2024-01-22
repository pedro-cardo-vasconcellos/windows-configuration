Clear-Host

Import-Module PSReadLine

$PSReadLineOptions = @{
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    PredictionSource = "History"
    ShowToolTips = $true
}

Set-PSReadLineOption @PSReadLineOptions
