#TO ASSIGN A ROLE TO THE USER FOR A RESOURCE LEVEL

Step 1: Open Azure Portal and open azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
       Install-Module Az
       Connect-AzAccount -UseDeviceAuthentication
       Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD           
Step 4: New-AzRoleAssignment -ObjectId "xxxxxx"
       -RoleDefinitionName "<rolename>"
       -Scope "<Scopeid>"
  
       