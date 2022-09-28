#Author John Tomchick 09/20/2022
#References: https://adamtheautomator.com/powershell-to-get-a-registry-value/#Getting_Registry_Keys_and_Values_with_Get-ChildItem, https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-itemproperty?view=powershell-7.2
#Create function to test if reg key and value exist
Function Test-RegistryValue ($regkey, $name) {
    if (Get-ItemProperty -Path $regkey -Name $name -ErrorAction Ignore) {
        $true
    } else {
        $false
    }
}
# Get reg item to delete, example format 'HKLM\Software\Microsoft\blah. If a value inside a key, that will need speicified.
$path = Read-Host -Prompt "Please enter the full path to the registry key to delete"

#Use function to test if key and value exist
Test-RegistryValue $path
#If exists, delete
    if($true -ieq "True"){
        Remove-ItemProperty -Path $path
        }
