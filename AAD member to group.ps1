#Add a member to a group

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD
        ![Link1](https://github.com/goutamir007/Powershell/blob/main/Images/PicsArt_12-20-01.37.38.jpg)
        
Step 4: Add-AzureADGroupMember -ObjectId "<ObjectId>" -RefObjectId "<ReferenceId>"

        ![Screenshot](../Images/shas01.png)
