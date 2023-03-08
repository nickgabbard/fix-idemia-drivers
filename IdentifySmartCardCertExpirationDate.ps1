$CurrentCerts = Get-ChildItem Cert:\CurrentUser\My -Recurse | ? {$_.GetType().Name -eq 'X509Certificate2'} |
ForEach-Object {
 $FinalDate = Get-Date $_.NotAfter -Format 'dd/MM/yyyy hh:mm'
    $Usages = foreach($key in $_.Extensions){
      if('KeyUsages' -in $key.psobject.Properties.Name ){ $key.KeyUsages}
      if('EnhancedKeyUsages' -in $key.psobject.Properties.Name){
          $key.EnhancedKeyUsages.FriendlyName
      }
    }
    [PSCustomObject]@{
        Subject       = $_.Subject
        ExpireDate    = $FinalDate
        Usages        = $Usages-join ';'
    }
} | Where-Object {
    ($_.DaysRemaining -lt 3650 ) -and ($_.Usages -match 'Smart Card Logon') -and ($_.Subject -notmatch 'Admin Accounts')
} 
$FinalExpireDate = $CurrentCerts.ExpireDate
Write-Output $FinalExpireDate
