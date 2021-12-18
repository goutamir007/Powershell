#To create a Storage Account

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: $resourceGroup = "<resource-group>"
        $location = "<location>"
        New-AzResourceGroup -Name $resourceGroup -Location $location -SkuName Standard_RAGRS -Kind StorageV2