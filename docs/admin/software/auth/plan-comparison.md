# Software & Services: Plan Comparison

Notes:

- All of Azure Active Directory *could* be circumvented & replaced with either:
  - Generic LDAP server (e.g. OpenLDAP, FreeRADIUS, LLDAP)
  - Continue using our internal domain controller. (but with internal management & extended via services we run)
  - Individual features of more expensive plans could be implemented this way too, with less work than replacing AAD in its entirety.

## Service Plans: Microsoft

- Features in *italics* are *desired*
- Features in **bold** are **neeeded** (or where workarounds would be **very** costly in terms of expenses and/or time)


### Microsoft 365: Business Basic

Cost: $6 per user, per month, paid annually.
Features:

### Microsoft 365: Business Premium

Cost: $6 per user, per month, paid annually.
Features:

### Microsoft 365: E1

Cost: $? per user, per month, paid annually.
Features:

### Microsoft 365: E3
Cost: $? per user, per month, paid annually.
Features:

### Microsoft 365: E5
Cost: $? per user, per month, paid annually.
Features:

### Microsoft 365: F1
Cost: $? per user, per month, paid annually.
Features:

### Microsoft 365: F3
Cost: $? per user, per month, paid annually.
Features:


`E` stands for "Enterprise"?

- [Azure Active Directory Plans & Pricing](https://www.microsoft.com/en-us/security/business/identity-access/azure-active-directory-pricing#Footnote3)

### Azure Active Directory: Basic

Included w/ subscription of commercial online service such as Azure, Dynamics 365, Intune, Power Platform, & others.
- **This is what we currently have**

Cost: $0

Features:

- **Cloud Authentication** (Pass-through authentication, password hash synchronization)
- **Federated authentication** (Active Directory Federation Services or federation w/ other identity providers)
- **Single sign-on (SSO) unlimited**
- **Secure hybrid access partnerships** (Kerberos, NTLM, LDAP, RDP, & SSH authentication)
- **Role-based access control (RBAC)**


### Azure Active Directory: Office 365

Additional Azure AD features are included with Office 365 E1, E3, E5, F1, and F3 subscriptions.
- Our Microsoft 365 licenses *should* give us access to this, even if not currently active.

Cost: Included with Microsoft 365 subscription ($6 per user, per month, paid monthly?)

Features:

- All basic features
- *Customizable user sign-in page*
- *Self-service sign-in activity search and reporting*

### Azure Active Directory: Premium P1

Cost: $6 per user, per month, paid monthly?

Features:
- All basic features
- All Office 365 features
- Service-level agreement
- *Group assignment to applications*
- *Cloud app discovery* (Microsoft Defender for Cloud Apps) [Eligable Apps](https://appsource.microsoft.com/en-us/marketplace/partner-dir?filter=sort%3D0%3BpageSize%3D18%3BonlyThisCountry%3Dtrue%3Bcountry%3Dus%3Bradius%3D100%3Blocname%3DUnited%2520States%3BlocationNotRequired%3Dtrue)
- *Application Proxy for on-premises, header-based, and Integrated Windows Authentication* [Details](https://learn.microsoft.com/en-us/azure/active-directory/app-proxy/what-is-application-proxy)
- *Conditional Access*
- SharePoint limited access
- Session lifetime management
- *Advanced group management* (Dynamic groups, naming policies, expiration, default classification)
- Azure AD Connect Health reporting
- *Global password protection and management* (custom banned passwords, users synchronized from on-premises Active Directory)
- Microsoft Identity Manager user client access license (CAL)
- *Cross-tenant user synchronization*
- *Self-service password reset/change/unlock with on-premises write-back*
- *Self-service group management* (My Groups)
- *Automated group provisioning to apps*
- HR-driven provisioning
- Terms of use attestation
- Advanced security and usage reports
- SMS sign-in
- *Shared device sign-out*
- *Delegated user management portal* (My Staff)





### Azure Active Directory: Premium P2

Cost: $9 per user, per month, paid monthly?

Features:
- All basic features
- All Office 365 features
- All Premium P1 features
- Identity Protection (Risky sign-ins, risky users, risk-based conditional access)
- Self-service entitlement management (My Access)
- Access certifications and reviews
- Entitlements management
- Privileged Identity Management (PIM), just-in-time access
- Identity Protection: vulnerabilities and risky accounts
- Identity Protection: risk events investigation, SIEM connectivity

### Azure Active Directory: Excluded from All

Things not included w/ any Azure Active Directory plan.

Features:

- External Identities [Pricing](https://go.microsoft.com/fwlink/p/?linkid=2154455)
- Azure AD Domain Services (Virtualized Active Directory) [Pricing](https://go.microsoft.com/fwlink/p/?linkid=2154322)



