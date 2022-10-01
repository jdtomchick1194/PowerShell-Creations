#Author John Tomchick, created 09/20/2022
# This script is designed to check for and create registry keys and values that the user inputs. It requires the values to be input at time of running the script 
#References: https://adamtheautomator.com/powershell-to-get-a-registry-value/#Getting_Registry_Keys_and_Values_with_Get-ChildItem, https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-itemproperty?view=powershell-7.2
#Prompt user to enter registry path in question
$path = Read-Host -Prompt "Please enter full path to the registry key being created" 
Set-ItemProperty -Path $path

#Test for key folder, create it if missing

$regKey = Test-Path -Path $path
    if ( $regKey -ine "True" ) {
       New-Item -Path $path -Force -ErrorAction Continue
    }
# Create value inside key created / provided 

$regValue = Read-Host -Prompt "Please enter name of registry value being created"
Set-ItemProperty -Path $regValue -ErrorAction Stop


# Note: thinking about this wrong. Set-item property is going to create value inside \Software. Not create key to then create value inside \Software\Test
# Look at pipeline from working inside Win VM then work from that angle. 