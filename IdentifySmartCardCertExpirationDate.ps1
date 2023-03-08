﻿function Get-SCUserStore {
    [CmdletBinding()]
    param(
          [string]$providerName ="Microsoft Base Smart Card Crypto Provider"
        )
    # import CrytoAPI from advapi32.dll
    $signature = @"
[DllImport("advapi32.dll", CharSet=CharSet.Auto, SetLastError=true)]
[return : MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptGetProvParam(
    IntPtr hProv,
    uint dwParam,
    byte[] pbProvData,
    ref uint pdwProvDataLen, 
    uint dwFlags); 

[DllImport("advapi32.dll", CharSet=CharSet.Auto, SetLastError=true)]
[return : MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptDestroyKey(
    IntPtr hKey);   

[DllImport("advapi32.dll", CharSet=CharSet.Auto, SetLastError=true)]
[return : MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptAcquireContext(
    ref IntPtr hProv,
    string pszContainer,
    string pszProvider,
    uint dwProvType,
    long dwFlags);

[DllImport("advapi32.dll", CharSet=CharSet.Auto)]
[return : MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptGetUserKey(
    IntPtr hProv, 
    uint dwKeySpec,
    ref IntPtr phUserKey);

[DllImport("advapi32.dll", CharSet=CharSet.Auto, SetLastError=true)]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptGetKeyParam(
    IntPtr hKey,
    uint dwParam,
    byte[] pbData,
    ref uint pdwDataLen,
    uint dwFlags);

[DllImport("advapi32.dll", CharSet=CharSet.Auto, SetLastError=true)]
[return : MarshalAs(UnmanagedType.Bool)]
public static extern bool CryptReleaseContext(
    IntPtr hProv,
    uint dwFlags);
"@

    $CryptoAPI = Add-Type -member $signature -name advapiUtils -Namespace CryptoAPI -passthru

    # set some constants for CryptoAPI
    $AT_KEYEXCHANGE = 1
    $AT_SIGNATURE = 2
    $PROV_RSA_FULL = 1
    $KP_CERTIFICATE = 26
    $PP_ENUMCONTAINERS = 2
    $PP_CONTAINER = 6
    $PP_USER_CERTSTORE = 42
    $CRYPT_FIRST = 1
    $CRYPT_NEXT = 2
    $CRYPT_VERIFYCONTEXT = 0xF0000000


    [System.IntPtr]$hProvParent=0

    if([Environment]::Is64BitProcess) {
        [Uint64]$pdwProvDataLen = 0
    } else {
        [Uint32]$pdwProvDataLen = 0    
    }
    $contextRet = $CryptoAPI::CryptAcquireContext([ref]$hprovParent,$null,$providerName,$PROV_RSA_FULL,$CRYPT_VERIFYCONTEXT)

    [byte[]]$pbProvData = $null
    $GetProvParamRet = $CryptoAPI::CryptGetProvParam($hprovParent,$PP_CONTAINER,$pbProvData,[ref]$pdwProvDataLen,0)

    if($pdwProvDataLen -gt 0) 
    {
        $ProvData = new-Object byte[] $pdwProvDataLen
        $GetKeyParamRet = $CryptoAPI::CryptGetProvParam($hprovParent,$PP_CONTAINER,$ProvData,[ref]$pdwProvDataLen,0)
    }

    $enc = new-object System.Text.UTF8Encoding($null)
    $keyContainer = $enc.GetString($ProvData)

    Write-Verbose ("The Default User Key Container:{0}" -f $keyContainer)

    if([Environment]::Is64BitProcess) {
        [Uint64]$pdwProvDataLen = 0
    } else {
        [Uint32]$pdwProvDataLen = 0
    }

    [byte[]]$pbProvData = $null
    $GetProvParamRet = $CryptoAPI::CryptGetProvParam($hprovParent,$PP_USER_CERTSTORE,$pbProvData,[ref]$pdwProvDataLen,0)

    if($pdwProvDataLen -gt 0) 
    {
        $ProvData = new-Object byte[] $pdwProvDataLen
        $GetKeyParamRet = $CryptoAPI::CryptGetProvParam($hprovParent,$PP_USER_CERTSTORE,$ProvData,[ref]$pdwProvDataLen,0)

        if([Environment]::Is64BitProcess) {
            [UInt64]$provdataInt = [System.BitConverter]::ToUInt64($provdata,0)
            [System.IntPtr]$hwStore = [Long]$provdataInt
        } else {
            [UInt32]$provdataInt = [System.BitConverter]::ToUInt32($provdata,0)
            [System.IntPtr]$hwStore = $provdataInt
        }
    }

    $store = new-object System.Security.Cryptography.X509Certificates.X509Store($hwStore)

    # release smart card
    $ReleaseContextRet = $CryptoAPI::CryptReleaseContext($hprovParent,0)

    return $store
}

#write-host ((get-WmiObject win32_PnPSignedDriver|where{$_.deviceID -like "*smartcard*"}).devicename) "reports the following certificates;" 

# returns System.Security.Cryptography.X509Certificates.X509Store object representing PP_USER_CERTSTORE on Smart Card
$SCcertStore = Get-SCuserSTore

# enumerate certificates
$ActiveCardCert = $SCcertStore.certificates  |


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
    ($_.DaysRemaining -lt 3650 ) -and ($_.Usages -match 'Smart Card Logon')
} 

 $FinalExpireDate = $ActiveCardCert.ExpireDate

Write-Output $FinalExpireDate