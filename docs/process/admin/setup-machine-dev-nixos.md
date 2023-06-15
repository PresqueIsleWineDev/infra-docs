# Process: Setup NixOS-based Machine for System Administration & Development

## About

This document describes how to install our custom NixOS configuration to your machine.

### NixOS image

Note: Using our custom installation image is not required, but recommended to simplify the process.

The custom image pre-loads NixOS with recommended software, settings, and home-manager configurations that get you up-and-running almost immediately.

NixOS is configured to be ready to run Windows 10 / Windows 11 virtual machines *out of the box*.
Any software that you want that doesn't run on Linux and/or NixOS can be run inside a Windows VM or WINE (via Bottles).
All software used by PIWC Windows users is pre-configured to run in our custom NixOS config.
WINE & Bottles are also configured to enable running Windows software with tighter integration with your Linux-based desktop environment.
Everything provided by our infrastructure (i.e. shared drives, accounts, ActiveDirectory, printers, OneDrive, Microsoft Exchange, etc.) is also pre-configured to work from the get-go in our NixOS configuration.
The only software that is not ready to go immediately after OS install is software with paid licenses. Instead, we have libre alternatives pre-installed.

See details of all Windows software used at PIWC & how it can be used from within our NixOS configuration [here](../../about-software/nixos-windows-software.md).
- [ ] TODO: Document all Windows software & how it is setup in our NixOS configuration.

See details of our custom NixOS configuration [here](../../about-software/nixos-custom-config.md)
- [ ] TODO: Document custom NixOS configuration features in separate file

### Using Windows

I **strongly** recommend using our custom NixOS operating system and not using Windows.

If for some reason you really *want* to use Windows,
  you can omit this entire process if you have an existing Windows installation,
  but on Windows, you **must** setup `nix` separately.

You will lose out on *tons* of convenient configuration that facilitates an easy out-of-the-box experience.
  Setting up Windows equivalents to this configuration will not be documented here, and must be done on your own.


## Pre-requisites

Must be completed before you can proceed.

1. Have a computer.

## Process Steps

1. Download the latest NixOS OS image from [GitHub releases](https://github.com/PresqueIsleWineDev/infra-docs/releases/latest).
2. Backup any files on your computer's existing hard drive(s).
3. Backup any files on your USB flash drive.
4. Write the NixOS image `.iso` file to a USB flash drive.
  a. Windows:
  b. Linux:

  - [ ] TODO: Windows 10 / Windows 11 instructions
  - [ ] TODO: NixOS instructions
  - [ ] TODO: Non-NixOS Linux instructions (GUI/CLI)

  - [ ] TODO: Fix command below
  ```bash
    $ sudo dd /run/user/1000/gvfs/<MOUNT_PATH> ~/Downloads/nixos-installer-development-latest.iso
  ```

5. Reboot into UEFI bootloader
  This step is machine-specific.
  You can search the internet for "Reboot into UEFI settings <MACHINE_PRODUCT_NAME>".
  On my Framework Laptop, this is done by holding the key `F2` when booting the machine.

  - [ ] TODO: Make sure using correct key.

6. Temporarily disable Secure Boot in UEFI settings.
7. Temporarily enable booting from USB in UEFI settings.
8. Temporarily make sure USB boot entry is first entry in boot order
9. Plug in your newly-created installation USB drive.
10. Reboot into the installation USB drive.
11. Follow the installer prompts.
12. Reboot into your new NixOS system.
13. (optional) Reboot into UEFI settings again & re-enable Secure Boot. [**Highly recommended**]
14. (optional) Disable booting from USB and/or set the priority of USB boot to be lower than the entry for your new NixOS system.
15. Reboot into your NixOS system

Done!

## Follow-up Processes

1. [Setup administrator environment](./setup-environment-admin.md)
2. All other admin-related processes will depend on having the administrator environment set up.

## To-Dos

- [ ] TODO: Create GitHub action to build NixOS installer & disk images & publish ISOs via GitHub releases

