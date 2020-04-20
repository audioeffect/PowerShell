Param (
    #Parameter can be passed with "-Download" switch or hardcoded here:
    [string]$Download = "$env:USERPROFILE\Downloads"
)

#Get all RDP files in Download folder
$rdpAll = Get-ChildItem "$Download\*.rdp" -Recurse

#Get newest RDP file
$rdp = $rdpAll | Sort-Object LastWriteItem | Select-Object -Last 1

#Change multiple displays to false
((Get-Content -Path $rdp -Raw) -replace 'use multimon:i:1', 'use multimon:i:0') | Set-Content -Path $rdp

#Launch RDP
Start-Process -FilePath $rdp

#Pause
Start-Sleep -Seconds 2

#Remove all RDP files in the Download folder
ForEach($file in $rdpAll) {
    Remove-Item -Path $file
}