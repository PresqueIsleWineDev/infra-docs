# Process: Mounting the shared drives on Windows

## About

This document describes how you can obtain access to the shared drives on Microsoft Windows.

These drives should be pre-configured at first boot, but this is the process if you need to manually map or re-map a shared drive.

## Pre-requisites

Must be completed before you can proceed.

1. Have a working Windows installation.
2. Have an PIWC user account (through our domain controller's ActiveDirectory server). If you do not yet have one, contact a system administrator to get you one. [File helpdesk ticket](https://github.com/PresqueIsleWineDev/infra-docs/issues/create)
  - [ ] TODO: Edit link to automatically setup GitHub issue requesting new user


## Process Steps

1. Open `File Explorer`
2. Look for `This PC` in the `File Explorer` sidebar & right-click
3. Select `Map a network drive`
4. Type in the location corresponding to the drive you would like to enable access to:
  - Public Share: `\\PIW-DC01\shared`
  - Staff Data:   `\\PIW-DC01\Staff_Data`
  - QuickBooks:   `\\PIW-DC01\QBsCompanyFile`
5. Select a drive letter for the share: (can be anything, but best practice to choose one representative drive name). Default drive letters:
  - Public Share: `P://`
  - Staff Data:   `S://`
  - QuickBooks:   `Q://`
6. Finish the dialog prompt.

Done!

## Follow-up Processes

## Notes

### New Setup

- We will be moving away from our old shared drive setup in favor of a modern setup that requires zero configuration and works out-of-the-box.
- New setup will support automatic backups, file history, and advanced access control policies
- New setup will have additional drives for:
  - Individual users
  - Individual job positions
  - Employee groups

## To-Dos

