#!powershell

#Requires -Module Ansible.ModuleUtils.Legacy
#AnsibleRequires -OSVersion 6.2
#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
    options = @{
        vmhostname = @{ type = "list" }
    }
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0


# Result object to be returned
$result = New-Object PSObject;
Set-Attr $result "changed" $false;

$VMEnts = $module.Params.vmhostname 

$result = $true     ## Do something here that will generate the results to be returned

if (!$Result) {
    Fail-Json -obj @{} -message "NO Quickbackup has been created.."
}

Elseif ($Result.Result -eq "Succes" -or $result.Result -eq "Warning") {
    $module.Result.msg = "Succesfully did whatever it was that we had to do"
    $module.Result.changed = $true
}

Elseif ($Result.Result -eq "Failed") {
    Fail-Json -obj @{} -message "somthing along the line failed!"
} Else {##  ??????????????????}

# Return result
$module.ExitJson()
