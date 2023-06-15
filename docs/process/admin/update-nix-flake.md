# Process: Update Nix Flake Dependencies

## About

Our environments are configured via `Nix`.

- [About: Nix](../../about-software/nix.md)

Our system uses Nix Flakes.

Nix flakes are:

- a modern packaging format for Nix expressions/configurations. (think `package.json` or `Cargo.toml`, but for *anything* that can be configured or built with Nix)
- standardized & compartmentalized input/output interface for any set of Nix expressions. (can be a Nix package, devshell, NixOS config/module, home-manager config/module, etc.)
- mechanism for locking dependencies to known-working versions & building reproducible output artifacts

This document describes how to update Nix flake dependencies.
Dependencies & their versions are stored in a file named `flake.lock`, whose function is analogous to `package.lock` for `npm` packages or `Cargo.lock` in Rust `cargo` crates.

## Pre-requisites

Must be completed before you can proceed.

1. [Setup development machine](setup-machine-dev-nixos.md)
  - [NixOS machine](./setup-machine-dev-nixos.md)  [**recommended**]
  - [Windows machine](./setup-machine-dev-windows.md)

2. [Setup administrator environment](setup-environment-admin.md).

## Process Steps

1. Clone Git repository to a directory on your machine.

  ```bash
    $ git clone https://github.com/PresqueIsleWineDev/infra-docs.git <YOUR_DESTINATION_DIRECTORY>
  ```

2. Change directories to your newly-created Git repo.

  ```bash
    $ cd <YOUR_DESTINATION_DIRECTORY>
  ```
  - [ ] TODO: Instruct to enable nix-direnv & activate devshell

3. Update the dependencies in `flake.lock` using the Nix command-line interface

  ```bash
    $ nix flake update --commit-lock-file
  ```

  The last argument commits the changes to the `flake.lock` file to the Git repo.
  If builds fail after updating versions of dependencies, you will need to revert this commit to get back to the last-known working set of dependency versions.
  You can also omit this flag and commit the changes manually after successfully building using the command: `$ git add flake.lock && git commit`

## Follow-up Processes

- [Build Nix flake outputs](./build-nix-flake-outputs.nix)
- [Update NixOS-based development machine](./update-machine-dev-nixos.md)
- [Update NixOS-based cluster machines](./update-machine-cluster-node.md)

## To-Dos

- [ ] TODO: Finish enumerating all pre-requisite processes
- [ ] TODO: Create documentation for all pre-requisite processes

- [ ] TODO: Finish enumerating all follow-up processes
- [ ] TODO: Create documentation for all follow-up processes

- [ ] TODO: Create documentation for Windows systems.

- [ ] TODO: Build NixOS installer images that get published to GitHub releases

