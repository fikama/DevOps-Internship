workflow MyFirstRunbook-Workflow
{
$resourceGroup = "Cap.Filip-Marszalek",
Param(
    [Parameter(Mandatory=$true)]
    [string]
    $AppService,
    
    [Parameter(Mandatory=$true)]
    [string]
    $State
)

# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process

# Connect to Azure with system-assigned managed identity
$AzureContext = (Connect-AzAccount -Identity).context

$CurrentState = $(Get-AzWebApp -n vmControlFun -r Cap.Filip-Marszalek | Select State | Format-table -HideTableHeaders | Out-String).Trim()
$resourceGroup = $(Get-AzWebApp -n vmControlFun -r Cap.Filip-Marszalek | Select ResourceGroup | Format-table -HideTableHeaders | Out-String).Trim()

if(($State -eq "on") -and ($CurrentState -eq "Stopped"))
    {
        Start-AzWebApp -n $AppService -r $resourceGroup
    }
elseif (($State -eq "off") -and ($CurrentState -eq "Running"))
    {
        Stop-AzWebApp -n $AppService -r $resourceGroup
    }
