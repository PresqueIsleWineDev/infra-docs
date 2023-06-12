# Workstation Setup

## About

Notes:

- This is not a complete list of all configuration changes I plan on making, but the ones that I consider essential & high-priority.

### Microsoft Azure ActiveDirectory

Large portions of configuring workstations is actually just configuring Azure ActiveDirectory, so once AD is setup, I can point the workstations to use it instead of our domain controller.

The biggest challenges here are:
- Getting the infrastructure to serve OS boot images running properly.
- Getting workstations to boot from an operating system image that is configured to use AD.

See: [Azure: ActiveDirectory](./azure-activedirectory.md)

## Prerequisites

This is essentially the **final** required step until the main component of the transition is complete. Most requirements in other pages must also be satisfied

- [ ] Configure Kubernetes node hardware
- [ ] Configure Kubernetes node operating systems
- [ ] Deploy basic Kubernetes config
- [ ] Setup Kubernetes architectural services
- [ ] Setup services that are essential to the operation of workstations
- [ ] Configure Azure ActiveDirectory
- [ ] Configure Windows provisioning package to use new ActiveDirectory setup
- [ ] Deploy services to first testing environment
- [ ] Testing successfully completed for all services
- [ ] Deploy first production environment

## Process

- [ ] Configure Windows provisioning package to use our services & install all required software
- [ ] Build OS image that boots into Windows with our provisioning package applied
- [ ] Serve built OS image over netboot
- [ ] Enable iPXE boot over network in BIOS/UEFI settings for each machine
  - May have to manually flash OS image for the first installation on each machine.

### Configuration Changes

Workstations will need to be re-configured as follows:

- [ ] Retrieve operating system boot images from an iPXE/PXE boot server. When this server is unavailable, the workstation will fallback to the last-used data. This will enable all computers to share configurations, where changes to the configuration applying to that class of machines gets applied to all other machines upon the next reboot.
- [ ] Retrieve user credentials from our ActiveDirectory server running on the Microsoft Azure cloud. This will enable username/passwords to remain in sync between local computers & Microsoft accounts. Access to restricted resources will also be managed by Azure ActiveDirectory.
- [ ] Retrieve Windows provisioning packages from an iSCSPI server. When this server is unavailable, the workstation will fallback to the last-used data. This will provide software, user filesystems, default configurations, browser bookmarks, software license keys, and more.
  - [ ] Upon login, a user's filesystems & files not stored in Microsoft Azure/SharePoint/OneDrive will be fetched from either an NFS server or Samba server.
- [ ] Enable Remote Desktop Protocol for workstations (for taking control of user workstations remotely)
  - [ ] Install desktop package & app
  - [ ] Configure workstation provisioning packages to set setting as enabled.
  - [ ] Configure workstation provisioning packages to allow access from system administrators by adding authentication keys.



### Workstation Management Services

See: [Services List: Workstation Management](./services-list.md#Workstation_Management)

