**Add a member to a group**

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD
Step 4: Add-AzureADGroupMember -ObjectId "<ObjectId>" -RefObjectId "<ReferenceId>"

![](../images.md/PicsArt_12-20-01.37.38.jpg)
