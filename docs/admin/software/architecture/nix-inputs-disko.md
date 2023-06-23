# Nix Flake Inputs: Disko

Repo: [`nix-community/disko`](https://github.com/nix-community/disko)


## Overview

Declares hard disk partition layouts, partition tables, and partition file systems.
Disko configs can be used directly in a NixOS config to configure the system use the described filesystems.
Disko configs can also be used by the CLI tools partition disks with the described layouts.

## Why

### Design

- Integrates with Nix
- Integrates with [`divnix/std`](https://github.com/divnix/std) & [`divnix/hive`](https://github.com/divnix/hive) as a `std.blockType`
- Configure once per unique disk setup instead of having to re-partition every system no matter what.
- No misalignment with disk layout and NixOS config.
- Avoids clunky, failure-prone CLI tools like `nixos-generate-config` during installation.
- Simplifies advanced partition schemas instead of having to learn & memorize 15+ shell commands per partitioning scheme.
- Disk layout is better documented by having configs in repo. More likely to be able to recover from drive failure, wiped partition tables, etc.

### Use Cases for our Infrastructure

- Provision NixOS Kubernetes nodes' hard drives via system config importing disko config.
- Provision NixOS workstations' hard drives via system config importing disko config.
- Provision Windows workstations' hard drives via booting into NixOS live environment, running backup command, & running disko apply command on our config.

## Declaration

Declares:

- Partition Tables
- Logical Volumes
- Logical Volume Groups
- Physical Volumes
- Encrypted LUKS Containers
- Filesystems
  - Mount point
  - Size & location on disk
  - BTRFS subvolume mount point
- Storage Pools
- RAID
- Temporary filesystems (in RAM)
- Multiple disks


## Outputs

Result Outputs:

- NixOS system config to use the disko config's layout.
- Disk image to write partition scheme?


## Examples

Usage: CLI

```nix
```

Usage: NixOS Config

```nix
```


## To-Do

- [ ]

