#Author John Tomchick, created 09/20/2022
#Edited September 27 2022
#References: https://adamtheautomator.com/powershell-to-get-a-registry-value/#Getting_Registry_Keys_and_Values_with_Get-ChildItem, https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-itemproperty?view=powershell-7.2
#Prompt user to enter registry path in question
$path = Read-Host -Prompt "Please enter full path to the registry key being created" 

#Test for key folder, create it if missing

$regKey = Test-Path -Path $path
    if ( $regKey -ine "True" ) {
       New-Item -Path $path -Force -ErrorAction Continue
    }
# Create value inside key created / provided 

$regValue = Read-Host -Prompt "Please enter name of registry value being created"
New-ItemProperty -Path $path -Name $regValue -Force -ErrorAction Continue