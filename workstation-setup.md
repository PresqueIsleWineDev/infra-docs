# LEFCON -> Internal Administration: Workstation Setup

Workstations will need to be re-configured as follows:

- [ ] Retrieve operating system boot images from an iPXE/PXE boot server. When this server is unavailable, the workstation will fallback to the last-used data. This will enable all computers to share configurations, where changes to the configuration applying to that class of machines gets applied to all other machines upon the next reboot.
- [ ] Retrieve user credentials from our ActiveDirectory server running on the Microsoft Azure cloud. This will enable username/passwords to remain in sync between local computers & Microsoft accounts. Access to restricted resources will also be managed by Azure ActiveDirectory.
- [ ] Retrieve Windows provisioning packages from an iSCSPI server. When this server is unavailable, the workstation will fallback to the last-used data. This will provide software, user filesystems, default configurations, browser bookmarks, software license keys, and more.
  - [ ] Upon login, a user's filesystems & files not stored in Microsoft Azure/SharePoint/OneDrive will be fetched from either an NFS server or Samba server.
- [ ] Enable Remote Desktop Protocol for workstations (for taking control of user workstations remotely)
  - [ ] Install desktop package & app
  - [ ] Configure workstation provisioning packages to set setting as enabled.
  - [ ] Configure workstation provisioning packages to allow access from system administrators by adding authentication keys.


Notes:

- This is not a complete list of all configuration changes I plan on making, but the ones that I consider essential & high-priority.

## Microsoft Azure ActiveDirectory

Large portions of configuring workstations is actually just configuring Azure ActiveDirectory, so once AD is setup, I can point the workstations to use it instead of our domain controller.

See: [Azure: ActiveDirectory](./plan_transition_azure-activedirectory.md)


## Workstation Management Services

See: [Services: Workstation Management](./plan_transition_services-list.md#Workstation_Management)

[LEFCON Monthly Invoice](../Financial/invoice-lefcon-monthly-feb23.pdf)
