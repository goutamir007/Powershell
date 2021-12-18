#To create a virtual network

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: Create resource group
        $rg = @{
           Name = '<resourcegroupname>'
           Location = 'EastUS'
        }
        New-AzResourceGroup @rg
Step 4: To create a virtualNetwork
        $vnet = @{
        Name = 'xxxxx'
        ResourceGroupName = '<resourcegroupname>'
        Location = '<location>'
        AddressPrefix = '<addressprefix>'    
       }
       $virtualNetwork = New-AzVirtualNetwork @vnet      
Step 5: $subnet = @{
           Name = 'yyyyy'
           VirtualNetwork = $virtualNetwork
           AddressPrefix = '<addressprefix>'
        }
        $subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet      
        $virtualNetwork | Set-AzVirtualNetwork