To use this script:
Run a Powershell Terminal as an Administrator.
1. Click Start
2. Type "Powershell"
3. Click "Run As Administrator" in the pane that appears to the right of the search results.
4. Click "Yes" to allow User Account Control to make changes.
5. Copy and paste the following command to the prompt and press enter.

`iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/nickgabbard/fix-idemia-drivers/main/DeleteOldIdemiaDriver.ps1'))`
