###################################
#
# Use the code block below in your 
# script to import this module and 
# elevate your script.
#
###################################
<#

# Import module and run script elevated
if(!$Elevated){
    Import-Module  "\\tsupport\tsupload\Cole\PS\Modules\Restart-Elevated.psm1"
    Restart-Elevated -PassedCommand $PSCommandPath -PassedParam $PSBoundParameters
}

#>
###################################
#    Elevate and Launch Script    #
###################################
function Restart-Elevated([switch]$Elevated, $PassedCommand, $PassedParam){

    $ParamList = ""

    foreach($boundparam in $PassedParam.GetEnumerator()) {
        $ParamList += " -{0} {1}" -f $boundparam.Key,$boundparam.Value
    }

    $MyCommand = $PassedCommand + $ParamList

    $arguments = "-executionpolicy bypass -noprofile -file $MyCommand -elevated"

    function Test-Admin {
      $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
      $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    }

    if ((Test-Admin) -eq $false)  {
        if ($elevated) 
        {
            # tried to elevate, did not work, aborting
        } 
        else {
            Start-Process powershell.exe -Verb RunAs -ArgumentList $arguments
        }

        exit
    }
}

Export-ModuleMember -Function Restart-Elevated