#DEPLOYMENT POWERSHELL SCRIPT


Select-AzureRmSubscription -Subscriptionid $subId
try
{
    New-AzureRmRoleAssignment -ObjectId $objectId -RoleDefinitionName "Reader"
    ResourceGroupName "Manufacturing Demo" -ErrorAction Stop
}
catch{
    if($_.Exception.Message -like "*Access denied to the specified API Version*")
    {
        Write-Output "Done"
    }
    else{
        Write-Output "Error Found!"
        Write-Output $_.Exception.Message
        throw $_.Exception.Message
    }
}


objectId           GET-AZUSER-OBJECTID
subId              GET-SUBSCRIPTION