#Powershell script to add new user

Step 1: Open Azure Portal and open Azure cloud shell
Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"
Step 3: To connect to the Azure Active Directory we need provide the following commands:
        Connect-AzureAD
Step 4:
 
$userName = '<UserName>' # READ FROM FILE
$password = '<Password>' # READ FROM FILE
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $userName, $SecurePassword
Connect-AzAccount -Credential $cred | Out-Null
#$Credential = Get-Credential
Select-AzSubscription -Subscription <SubscriptionID> #add
#Authenticate with Azure
#Connect-AzAccount -Credential $Credential
Connect-AzureAD -Credential $cred
Function CheckandAddtoGroup
{
Select-AzSubscription -Subscription <SubscriptionID> #add
$rgName = <RGName> #add in quotes
$databricksResourceId =
$groupid = <AzureADGroupID> #add in quotes
$usershavingaccess = Get-AzRoleAssignment -ResourceGroupName $rgName -RoleDefinitionName Reader | Where-Object {$_.Scope -eq '<ScopeID>'} #add scopeid of the rg found in properties
#$usershavingaccess.DisplayName
foreach ($user in $usershavingaccess)
{
$userobjectid = $user.ObjectID
$groupmemberlist = (Get-AzureADGroupMember -ObjectId $groupid -All $true).ObjectId
if ($groupmemberlist.contains($userobjectid))
{
Write-Host "Do nothing for object id $userobjectid since it alreay exist" -ForegroundColor Yellow
}
else
{
Write-Host "Adding object id $userobjectid to group" -ForegroundColor Green
Add-AzureADGroupMember -ObjectId $groupid -RefObjectId $userobjectid
}
}
}
CheckandAddtoGroup
while($true)
{
$i++
Write-Host “We have counted up to $i”
CheckandAddtoGroup
}
       