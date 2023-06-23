# Nix Flake Inputs: microvm

Repo: [`astro/microvm.nix`](https://github.com/astro/microvm.nix)


## Overview

Declare virtual machines in Nix.
Module One config configures both:
- the host machine:  `inputs.microvm.nixosModules.host`
- the guest machine: `inputs.microvm.nixosModules.guest`

## Why microvm

### Design

- Integrates with Nix
- Integrates with [divnix/std](https://github.com/divnix/std) & [divnix/hive](https://github.com/divnix/hive) as `std.blockType`
- Allows simulating different network setups.
- Easier than manually configuring `libvirt` `XML` files via `VirtManager`

### Usage in our infrastructure

- Testing configurations of NixOS workstations, Kubernetes nodes
- Running test Kubernetes nodes in VM to test NixOS config's Kubernetes setup
- Running test Kubernetes nodes in VM to test Kubernetes manifests & helm charts
- Rapid development environment for NixOS systems.
- Running Windows desktop software on a Linux development machine.
- Running Windows server software that isn't Linux container-ready.
- Porting Windows server software to OCI containers.
- Testing Windows configurations / provisioning packages before deployment.

### Declaration

Declare:

- Virtual Machines
  - vCPU cores
  - RAM
  - Shared volumes
  - Storage volumes
  - Disk images
  - Passthrough USB/PCI devices

- Host machine:
  - Virtual Networks
  - Network Devices
  - Port forwards


### Outputs

Result output:

- Can be exported and used as a package.
- Can be run on a hypervisor
- Can be run in a systemd service
- Can be deployed declaratively via Nix config
- Can be deployed imperatively via `microvm` CLI or `systemctl`

##
