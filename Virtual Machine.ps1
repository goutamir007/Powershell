#To create a virtual machine

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: Create resource group
        New-AzResourceGroup -Name <name> -Location <Location>
Step 4:  New-AzVm `
         -ResourceGroupName "<resourcegroupname>" `
         -Name "xxxx" `
         -Location "<location>" `
         -VirtualNetworkName "*****" `
         -SubnetName "xxxxxx" `
         -SecurityGroupName "xxxxxx" `
         -PublicIpAddressName "yyyyyy" `
         -OpenPorts 80,3389
Step 5: Connect to virtual machine
        Get-AzPublicIpAddress -ResourceGroupName "<ResourceGroupname>" | Select "<IpAddress>"
Step 6: To Install web server    
        Install-WindowsFeature -name Web-Server -IncludeManagementTools          