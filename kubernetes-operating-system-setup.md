
# Kubernetes: Operating System Configuration

## About

Notes:

- I have done some configuration already, but only for things I knew I would need long ago.
- Existing configurations are currently untested.
- The following remaining tasks will take a substantial amount of time & testing.
- The base configurations involve configuring a lot of components.
  - Can be altered in the future after deployment, but getting things right before building on top of it will save a lot of effort and potential service downtime.

## Prerequisites

1. [ ] Prepare hardware for Kubernetes nodes. See: [Kubernetes: Hardware Setup](./kubernetes-hardware-setup.md)

## Process

1. [ ] Create Kubernetes    generic node base NixOS config. (*Never instantiated, only inherited from*) **Work already in-progress**
2. [ ] Create Kubernetes     worker node base NixOS config. Inherit from generic config. For instantiating     worker nodes.
3. [ ] Create Kubernetes controller node base NixOS config. Inherit from generic config. For instantiating controller nodes.
4. [ ] Configure each node:
  - [ ] Create Disko Nix config to provision, partition, format hard drives according to the type, speed, & size of the node's hard drive(s)
  - [ ] Create NixOS host configs based off the base configs created above, importing:
    - Disko config matching the PC's hard disks.
    - Base NixOS config (if worker node, worker base, else controller base)
    - Host specific overrides (*only necessary attributes* like `networking.hostName`, `networking.connections.ipv4.address`, `swap.swapDevices` etc.)
  - [ ] Add NixOS host to `colmenaConfigurations` to create swarm for easy deployment, update, management, etc.

5. [ ] Install NixOS configured for Kubernetes Nodes
  - [ ] Create NixOS installation USB with Kubernetes node configs (worker, controller)
  - [ ] Boot each machine into `BIOS` / `UEFI` mode and boot into USB installer
  - [ ] Run custom NixOS installer & reboot

7. [ ] Test networking, clustering behavior

8. [ ] Use [`colmena`](https://github.com/zhaofengli/colmena) CLI to deploy subsequent configurations upon changing.
  - Note: *may have to configure routers to give a static IP address if local network doesn't pass internal hostnames to DNS server*


