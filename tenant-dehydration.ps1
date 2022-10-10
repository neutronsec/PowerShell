<#
A brand new Microsoft 365 tenant was set up for a customer. After the basic configuration, it was on to the security configurations. 
Among other things with the setup of a Safe Links policy. However, when setting up this policy, an error message appeared at the very end.

This error message appears when the M365 tenant is dehydrated. What does that even mean and how to check?
#>

# We need ExchangeOnline Module
```
Install-Module -Name ExchangeOnlineManagement -Verbose -AllowClobber -Force
```

```
Connect-ExchangeOnline
```

# Check dehydrate status
```
Get-OrganizationConfig | Format-List Identity,IsDehydrated


Identity     : neutronseclabs.onmicrosoft.com
IsDehydrated : True
```

# If output is True, hydrate the tenant
```
Enable-OrganizationCustomization
```

# Check the Status
```
Get-OrganizationConfig | Format-List Identity,IsDehydrated


Identity     : neutronseclabs.onmicrosoft.com
IsDehydrated : False
```

<#
The tenant is no longer dehydrated and we can create policies such as SafeLinks. But what did we do exactly?

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