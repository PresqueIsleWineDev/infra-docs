# Azure ActiveDirectory

## About

Azure ActiveDirectory (AD) is a directory server hosted in Microsoft's Azure cloud.

ActiveDirectory is a protocol based on LDAP that provides:
- Users & account credentials
- User roles & groups
- User details
- Network drives
- Access control to other entities
- Contact lists

and much more.

AD is what will replace the domain controller managed by LEFCON.
Windows can reach out to an AD server for a bunch of its configuration settings.

Microsoft Azure's AD has nice integration with other Microsoft products, including Microsoft Office 365, Microsoft Teams, Windows, and more.


### Configuration Management Tooling

I am going to use Hashicorp's Terraform tool to configure Microsoft Azure.

For rationale in why I plan on using Terraform, see: [Why Terraform](./terraform-why.md)


## Prerequisites

1. [ ] Configure Terraform
2. [ ] Configure Terranix for Nix integration

## Process

### ActiveDirectory Setup

1. [ ] Obtain ownership of Azure domain from LEFCON
2. [ ] Configure authentication for system administrator (me) to use keys and 2-Factor Authentication (2FA)
3. [ ] Create any missing users in Azure ActiveDirectory (AD)
  - [ ] Attach Microsoft Office 365 license keys to users
  - [ ] Attach QuickBooks Enterprise Desktop license keys to roles

4. [ ] Create user roles for all job titles/positions in Azure ActiveDirectory (AD) (e.g. `islehousemanager`, `islehousestaff`, `inventorymanager`)
  - [ ] Assign proper users to roles

5. [ ] Create user roles for all major job categories in Azure ActiveDirectory (AD) (e.g. `islehouse`, `accounting`, `eventmanagers`, `winemaking`)
  - [ ] Assign proper users to roles

6. [ ] Create entries for all PIWC Windows machines.
  - [ ] Assign device entries to their assigned user.

7. [ ] Create network drives in AD
  - [ ] Create per-user home directories
  - [ ] Create per-role shared directories
  - [ ] Create domain-wide shared directory

8. [ ] Create printer devices in AD

9. [ ] Create Access Control Lists (ACLs) in AD to determine what resources users are permitted to access & what privileges they have on those resources.
  - [ ] Assign ACLs to roles
  - [ ] Assign ACLs to groups
  - [ ] Assign ACLs to users
  - [ ] Assign ACLs to machines
  - [ ] Assign ACLs to network drives

10. [ ] Create user password policies
  - [ ] Remove password expiry date (it creates more security problems than it solves: e.g. writing down passwords, creating passwords like `Summer2023`, etc.)
  - [ ] Enforce password minimum complexity
    - Minimum length
    - Minimum entropy
    - Character requirements? (capital letters, numbers, special characters)

11. [ ] Configure automatic data backups to external source (local network drive, BackBlaze, etc.)
12. [ ] Configure automatic config backups to external source (local network drive, BackBlaze, etc.)


### Azure Kubernetes Service

1. [ ] Configure billing with credit/debit card
2. [ ] Configure billing usage restrictions (to prevent services that are misconfigured to perform excessive computation from running up cost)
3. [ ] Create Kubernetes node(s) in Azure.
4. [ ] Attach new Azure Kubernetes node to our cluster.
5. [ ] Configure Azure Kubernetes node with same configuration as our locally-run Kubernetes controller node.
6. [ ] Set AKS to use same container registry as local cluster.

### Other Microsoft Azure Products

- [ ] TODO: List some useful Azure services
