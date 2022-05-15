param(
    [string] $serviceName,
    [string] $serverName
)

$srvArr=$serverName.Split(",")
Get-WmiObject win32_service -comp ($srvArr) -filter "Name Like '$serviceName'" | Select-Object SystemName,Name,DisplayName,StartMode,StartName,State,Status,ProcessId,PathName | ConvertTo-Csv -NoTypeInformation | Out-File C:\Temp\op.csv
Copy-Item -Path G:\inetpub\wwwroot\serverAdmin\format.css -Destination C:\Temp\format.css -Force
Import-Csv C:\Temp\ob.csv | ConvertTo-Html -Title "Service Status" -PreContent "<H1>Service Status</H1>" -PostContent "<H5><i>$(get-date)</i></H5>" -CssUri C:\Temp\format.css | Set-Content C:\Temp\op.html
Get-Content C:\Temp\op.html
Remove-Item -Path C:\Temp\format.css -Force
Remove-Item -Path C:\Temp\op.csv -Force
Remove-Item -Path C:\Temp\op.html -Force