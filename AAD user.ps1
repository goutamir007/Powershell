#powershell scripts to create new user in aad 

Step 1: Open Azure Portal and open azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell for the use.
       Install-Module Az
       Connect-AzAccount -UseDeviceAuthentication
       Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD      
Step 4: We need to provide a password for the user .
        $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
        $PasswordProfile.Password = "*********"
        $params = @{
        AccountEnabled = $true
        DisplayName = "xxname"
        PasswordProfile = $PasswordProfile
        UserPrincipalName = "xxxxxxxxx.onmicrosoft.com" 
        MailNickName = "xxxx"
        }


