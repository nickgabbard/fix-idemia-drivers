$ConfirmPreference = 'None'

#Thumbprint of certificate to remove
$Thumb = "abcdef444444857694df5e45b68851868"

#Loop through all the certs stores looking for a matching thumbprint and remove if found
Get-ChildItem Cert:/ -Recurse | Where-Object {$_.thumbprint -Contains "$Thumb"} | Remove-Item -Force -WhatIf


Import-Certificate -FilePath "PATH" -CertStoreLocation Cert:\CurrentUser
Import-Certificate -FilePath "PATH" -CertStoreLocation Cert:\LocalMachine
