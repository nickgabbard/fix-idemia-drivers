 $DriverTable = Get-WindowsDriver –Online| select Driver, ClassName | Where {($_.ClassName -Match "SmartCard")} | Select-Object Driver
 $RMDriver = $DriverTable.Driver

 ForEach($SCDriver in $RMDriver){
    $DeleteCommand =  "pnputil.exe /delete-driver $($SCDriver) /force"
    Write-Output $DeleteCommand
    Start-Process PNPUtil -ArgumentList "/delete-driver",$($SCDriver),"/force" -WhatIf
}
