#Script for creating environment

Step 1: Open Azure Portal and open Azure cloud shell

Step 2: Select Powershell and type the following commands to set the cloud shell to use.
        Install-Module Az
        Connect-AzAccount -UseDeviceAuthentication
        Select-AzSubscription -Subscription "xxxxxxxname"

Step 3: Install-Module -Name Az.ADDomainServices -Force
        Install-Module -Name Az -Force
        Install-Module -Name AzureAD

Step 4:  $AzureUserName = 'odl_user_495113@azurehol3232.onmicrosoft.com' #replace it with user name
$password = "wxuq07DBP*uP" #replace it with user Password

$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $AzureUserName, $SecurePassword

Connect-AzAccount -UseDeviceAuthentication
Connect-AzureAD -Credential $cred | Out-Null

#Install-Module -Name Az.ADDomainServices -Force
$domainName = $AzureUserName.Split("@")[1]

$Sub = Get-AzSubscription
$SubId = $Sub.Id
# Enable Azure AD Domain Services for the directory.
$replicaSetParams = @{
Location = 'eastus'
SubnetId = "/subscriptions/$SubId/resourceGroups/AVD-RG/providers/Microsoft.Network/virtualNetworks/aadds-vnet/subnets/aadds-subnet"
}
$replicaSet = New-AzADDomainServiceReplicaSet @replicaSetParams

$domainServiceParams = @{
Name = $domainName
ResourceGroupName = "AVD-RG"
DomainName = $domainName
ReplicaSet = $replicaSet
}
$notificationSettings = @{
notifyGlobalAdmins = "Disabled"
notifyDcAdmins = "Disabled"
additionalRecipients = ''
}

New-AzADDomainService @domainServiceParams -FilteredSync Disabled -Sku Standard -DomainConfigurationType FullySynced -NotificationSettingNotifyDcAdmin Disabled -NotificationSettingNotifyGlobalAdmin Disabled #-NotificationSettingAdditionalRecipient ''

Start-Sleep 1200

#run it from here if it got failed
$Inputstring = $AzureUserName
$CharArray =$InputString.Split("@")
$CharArray[1]
$tenantName = $CharArray[1]

$Token = ('Bearer {0}' -f ((Get-AzAccessToken -TenantId $TenantID).Token))
$RESTAPIHeaders = @{'Authorization'=$Token;'Accept'='application/json'}
#$URI = "https://management.azure.com/subscriptions/$subscriptionId/resourceGroups?api-version=2014-04-01"
$URI = "https://management.azure.com/subscriptions/${SubId}/resourceGroups/AVD-RG/providers/Microsoft.AAD/DomainServices/${tenantName}?api-version=2021-05-01&healthdata=true"
$GetResourceGroupsRequest = Invoke-WebRequest -UseBasicParsing -Uri $URI -Method GET -Headers $RESTAPIHeaders
$ResourceGroups = ($GetResourceGroupsRequest.Content | ConvertFrom-Json).value
$ResourceGroups

$JsonValue= $GetResourceGroupsRequest | ConvertFrom-Json
$Status = $JsonValue.properties.replicaSets[0].serviceStatus
$status #it should be runnning


       