#Add a member to an Azure Active Directory Role

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD
Step 4: Add-AzureADDirectoryRoleMember -ObjectId <ObjectId> -RefObjectId <RefobjectId> 
        #ObjectId Specifies the ID of a directory role in Azure Active Directory.
        #RefObjectId Specifies the ID of the Azure Active Directory object to assign as owner/manager/member.



        