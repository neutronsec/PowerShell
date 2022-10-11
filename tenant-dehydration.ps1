<#
When setting up a new tenant and we want to setup Policies, such as Threat Policies for ExchangeOnline, errors appear.
This error message appears when the M365 tenant is dehydrated. What does that even mean and how to check?

Link:
https://docs.microsoft.com/en-us/powershell/module/exchange/enable-organizationcustomization?view=exchange-ps

e.g.

- Creating a new role group or creating a new management role assignment.
- Creating a new role assignment policy or modifying a built-in role assignment policy.
- Creating a new Outlook on the web mailbox policy or modifying a built-in Outlook on the web mailbox policy.
- Creating a new sharing policy or modifying a built-in sharing policy.
- Creating a new retention policy or modifying a built-in retention policy.
- Enabling preset security policies in the Microsoft 365 Security Center.
#>

# We need ExchangeOnline Module

Install-Module -Name ExchangeOnlineManagement -Verbose -AllowClobber -Force

Connect-ExchangeOnline

# Check dehydrate status
Get-OrganizationConfig | Format-List Identity,IsDehydrated

# If above output is True, hydrate the tenant
Enable-OrganizationCustomization

# Check the new Status (isdehydrated should be False)
Get-OrganizationConfig | Format-List Identity,IsDehydrated


# The tenant is no longer dehydrated and we can create policies such as SafeLinks. For a in-depth explanation check the link at the top.
