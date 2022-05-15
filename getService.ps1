param(
    [string] $serviceName,
    [string] $serverName
)

$srvArr=$serverName.Split(",")
Get-WmiObject win32_service -comp ($srvArr) -filter "Name Like '$serviceName'" | Select SystemName,Name,DisplayName,StartMode,StartName,State,Status,ProcessId,PathName | ConvertTo-Csv -NoTypeInformation | Out-File C:\Temp\op.csv
Copy-Item 