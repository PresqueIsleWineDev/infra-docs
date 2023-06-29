# Transferring Azure Active Directory Control

Plan for gaining administrative control of Azure Active Directory.

See also:

- [Objectives](./use-cases.md#Goals)
- [New Capabilities](./use-cases.md#Additional)
- [Plan Comparison & Pricing](./azure-plan-comparison.md)

## Reference

Users in Azure Active Directory: **47**
Users w/ Microsoft 365 license:  **10**  ??
Costs:
  - Per License: $6 per month
  - Total: $60 per month ??

## Context

External IT owns, manages, & controls all resources on Microsoft Azure for our domain/tenant, which includes Azure Active Directory that provides Microsoft 365 licenses that are necessary for:

- Microsoft Exchange email accounts
- Microsoft OneDrive/SharePoint
- Microsoft Teams
- TODO: Anything else?

Microsoft 365 licenses are purchased monthly with year-long commitment from Microsoft by external IT, and purchased monthly by PIWC from external IT. From Microsoft's standpoint, external IT owns our licenses, but given details of our contract with external IT, we likely have basis to claim rights to the licenses.

Microsoft 365 licenses are tied to users in Azure Active Directory.

## Current Issue

In order to delegate access to Azure resources (such as Azure Active Directory),
our external IT provider must enable role-based access controls (RBAC) on our Azure Active Directory tenant.
RBAC is a feature restricted to Azure Active Directory Premium P1 plans.
This plan has a cost of $6 per month per user. Our current plan is free with our Microsoft 365 plan.

If we were to upgrade to the `Premium P1` plan,
it would incur a much greater cost than necessary to meet our needs,
because of the large number of users we currently have in AAD (**47**).

Most of these users are completely unnecessary,
and we can likely delete them with no consequences,
but we should backup any data associated with their account regardless.
Many users can be better implemented as user roles,
which don't require an AAD user that increases our costs.
We should backup the data for these users as well,
then delete the user after creating a proper AAD role and assigning the appropriate user(s).
Keeping the emails associated with these users active is necessary to ensure uninterrupted access to email inboxes, data, & 3rd-party accounts.

This leaves us with a number of paths to select from when proceeding.


## Options

1. Transfer all PIWC resources on Azure from external IT account to PIWC-owned account.
  Pros:
  Cons:
  Process:

2. Pay for AAD Premium P1 plan.
  Pros:
  - Least effort
  Cons:
  - Requires external IT to perform a *lot* of extra steps to reduce user count before becoming reasonably expensive.
  - Cost from external IT work to facilitate this may be more than months of paying for AAD Premium P1 plan.
  Process:

3. Grant access to *only* PIWC system administrator & remove access for external IT contractor on existing tenant.
  Pros:
  Cons:
  Process:

