# Services

### Security

- [ ] SSH Certificate Authority         - Generate SSH access certificates to restrict access to our systems/servers.
- [ ] GPG Key server                    - Generate siging, encryption, & authentication keys for signing software (so that Windows will regard packages I sign as trusted).
- [ ] Headscale Wireguard VPN           - Internal VPN so I can access & administer machines/servers when outside network. Access to remote management will be restricted to connections that are tunneled through this VPN. Eventually, this will become the basis for an employee VPN that enables accessing ShopSite backend & ActiveDirectory server remotely for work outside of office. Can also act as firewall.
  - [ ] Coordinator service             - Manages Wireguard keys on each machine so that a given machine can talk to other machines on the network.
  - [ ] Admin interface                 - Interface to configure/manage/administer Headscale coordinator & access control.
- [ ] Kerberos authentication server    - Authentication protocol that is well-supported and considered standard for enterprise access control.
- [ ] Identity Management server        - Server to unify other authentication backends (Kerberos, ActiveDirectory, LDAP, RADIUS, OIDC, OAuth2, SAML, Access Control Lists (ACL), & user databases) under one frontend to support Single-Sign-On (SSO) functionality.
- [ ] Password Manager server           - Backend service that will allow users to securely create, store, retrieve, & share passwords.

#### Running software services

The following are required to have a pipeline for running the rest of our infrastructure:

- [ ] Container image registry          - Hosting container images of software services to run on servers.
- [ ] Helm chart registry               - Hosting packages of container images to facilitate service deployment.
- [ ] Kubernetes Nodes                  - Running software services
  - [ ] Master nodes (either 1 or 3+)   - Controlling worker Kubernetes nodes. More reliable to have multiple in case of either software/hardware failure. Cannot have 2, must either have one or 3+ to manage consensus.
    - [ ] OpenSSH server                - Configuring server/node
    - [ ] Kubernetes pod runner service - Running software services
    - [ ] Kubernetes controller service - Managing scheduling between Kubernetes notes
    - [ ] Kubernetes admin interface    - Managing Kubernetes manifests/configurations
  - [ ] Worker nodes (at least 1)       - Running software services
    - [ ] OpenSSH server                - Configuring server/node
    - [ ] Kubernetes pod runner service - Running software services

- [ ] Windows VM server                 - Running FACTS server, QuickBooks database server, & other Windows-only services

#### Databases

The following are required to have centralized databases for data belonging to software that fetches data external to the machine it is running on.

- [ ] PostgreSQL database server        - Hosting internal databases in PostgreSQL format
- [ ] MySQL database server             - Hosting internal databases in Microsoft SQL format
- [ ] QuickBooks database server        - Hosting QuickBooks database. Would prefer using PostgreSQL > MySQL > QuickBooks DB, but from what I have seen, QB uses its own proprietary database format)


### Workstation Management

Workstations include both desktop machines & laptops.

The following services will run on a server and are required to manage, update, & configure Windows workstations sharing a centralized configuration:

- [ ] Remote Desktop Protocol portal    - Enables remote access/control of desktop workstations
- [ ] SFTP server                       - Enables securely serving files over the network
- [ ] TFTP server                       - File server required by PXE/iPXE network booting
- [ ] Pixieboot server                  - Implementation of PXE/iPXE boot image server
- [ ] iSCSPI server                     - Required to serve Windows provisioning packages over the network
- [ ] CUPS server                       - Server to manage printers, print queuing, and network printing.
- [ ] Samba server                      - Enables shared drives for Windows workstations. Possible candidate for deprecation once current shared drives are migrated to Microsoft OneDrive.


### Website

The following are required for running aspects of our website:

- [ ] NGINX server                      - Hosting entire website. Everything accessing `piwine.com` goes through `NGINX`.
- [ ] SMTP server                       - Sending automated email upon purchases, etc. (SMTP protocol)
- [ ] IMAP server                       - Sending automated email upon purchases, etc. (IMAP protocol)


### Compatibility Layers

For software that doesn't use any protocols that Azure ActiveDirectory natively supports,
we can run a service that acts as proxy between these services and ActiveDirectory to enable clean integration.

Notes:

- Azure Active Directory should work out of the box with *most* services that work with our domain controller, but there may be some that do not.
  - In which case, we will need to run services/proxies that can translate Azure Active Directory to the protocol that works with a given piece of software.
- While it is a good idea to run some of these prior to switching to the new infrastructure, most of these can be deployed *after* the main portion of the transition is complete.
- Some of these may ultimately be unnecessary.

Proxying Servers:

- [ ] LDAP    - Extend ActiveDirectory functionality to other services that support LDAP, but not ActiveDirectory
- [ ] SAML    - Provide Single Sign-On (SSO) functionality to other services that support    SAML, but not ActiveDirectory/OIDC/OAuth2/SAML
- [ ] OIDC    - Provide Single Sign-On (SSO) functionality to other services that support    OIDC, but not ActiveDirectory or OpenID-Connect (OIDC)
- [ ] OAuth2  - Provide Single Sign-On (SSO) functionality to other services that support  OAuth2, but not ActiveDirectory or OpenID-Connect (OIDC)
- [ ] CalDAV  - Provide calendar & tasks functionality to other services that support  CalDAV, but not ActiveDirectory
- [ ] CardDAV - Provide contact list functionality to other services that support CardDAV, but not ActiveDirectory
- [ ] WebDAV  - Provide shared filesystem functionality to other services that support  WebDAV, but not ActiveDirectory/OneDrive/Samba/NFS
- [ ] NFS     - Provide shared filesystem functionality to other services that support  WebDAV, but not ActiveDirectory/OneDrive/Samba/WebDAV

### Potentially Missing

## Custom Deployments

- [ ] Migrate FACTS server to Kubernetes
  - [ ] Create container for Infor FACTS
  - [ ] Create Kubernetes Deployment manifest using new container
  - [ ] Create Kubernetes PodVolumeClaim manifest
  - [ ] Create Kubernetes Service manifest
  - [ ] Create new Windows desktop shortcuts using the new system


