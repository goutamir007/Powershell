#IMPORTANT COMMANDS

#1) To Get AzureActive Directory Tenant Details
   Get-AzureADTenantDetail
#2) To Get signin User Details
    Get-AzADUser -SignedIn  
#3) List users
     Get-AzADUser -First 10 -Select 'City' -AppendSelected
#4) Get user by display name
    Get-AzADUser -DisplayName $name
#5) Add members to group
    $groupid=(Get-AzADGroup -DisplayName $gname).Id
    $members=@()
    $members+=(Get-AzADUser -DisplayName $uname).Id
    $members+=(Get-AzADServicePrincipal -ApplicationId $appid).Id
    Add-AzADGroupMember -TargetGroupObjectId $groupid MemberObjectId $members
#6) List members by group display name
    Get-AzADGroupMember -GroupDisplayName $name
#7) Get service principal by display name
    Get-AzADServicePrincipal -DisplayName $name
#8) Get an App Service plan from a resource group
    Get-AzAppServicePlan -ResourceGroupName "ffffff" -Name "ggggg"
#9) Get a specified Storage account
    Get-AzStorageAccount -ResourceGroupName "RG01" -Name "mystorageaccount"
#10)Get all Storage accounts in the subscription
    Get-AzStorageAccount
#11)To get the details of the environment we are in
    Get-AzContext
#12)To get list of resource groups
    Get-AzResourceGroup
#13)To set password expiration policy
    Set-AzureADUser -ObjectId <user ID> -PasswordPolicies DisablePasswordExpiration