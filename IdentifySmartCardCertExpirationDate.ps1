$CurrentCerts = Get-ChildItem Cert:\CurrentUser\My -Recurse | ? {$_.GetType().Name -eq 'X509Certificate2'} |
ForEach-Object {
    $DaysLeft = (New-TimeSpan -Start $StartDate -End $_.NotAfter).Days
    if ($DaysLeft -lt 1) {
        $Under30 = $true
        $Expired = $true
        $Text = "The Certificate is expired"
    } elseif ($DaysLeft -lt 30) {
        $Under30 = $true
        $Expired = $false
        $Text = "The Certificate is but valid about to expire"
    } else {
        $Under30 = $false
        $Expired = $false
        $Text = "The Certificate is still valid and not going soon to expire"
    }
    $FinalDate = Get-Date $_.NotAfter -Format 'dd/MM/yyyy hh:mm'
    $Usages = foreach($key in $_.Extensions){
      if('KeyUsages' -in $key.psobject.Properties.Name ){ $key.KeyUsages}
      if('EnhancedKeyUsages' -in $key.psobject.Properties.Name){
          $key.EnhancedKeyUsages.FriendlyName
      }
    }
    [PSCustomObject]@{
        Text         = $Text
        Subject       = $_.Subject
        ExpireDate    = $FinalDate
        DaysRemaining = $DaysLeft
        Under30Days   = $Under30
        Expired       = $Expired
        Usages        = $Usages-join ';'
    }
} | Where-Object {
    ($_.DaysRemaining -lt 3650 ) -and ($_.Usages -match 'Smart Card Logon') -and ($_.Subject -notmatch 'Admin Accounts')
} 

$CurrentCerts | out-Gridview

 $FinalExpireDate = $CurrentCerts.ExpireDate

Write-Output $FinalExpireDate
