 $DriverTable = Get-WindowsDriver –Online| select Driver, ClassName, BootCritical, ProviderName, Date, Version, OriginalFileName| Where {($_.ClassName -Match "SmartCard") -and ($_.ProviderName -Match "IDEMIA") -and ($_.Version -Match "1.0.0.902")} 
 $DeleteCommand =  "pnputil.exe /delete-driver $($DriverTable.Driver) /force"
 Write-Output $DeleteCommand
 Start-Process PNPUtil -ArgumentList "/delete-driver",$($DriverTable.Driver),"/force"