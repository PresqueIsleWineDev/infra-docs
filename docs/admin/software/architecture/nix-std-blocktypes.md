# Nix `std` BlockTypes

BlockTypes define generalized types for `std` / `hive` cells.
BlockTypes have `actions` which can be run from the `paisano` TUI.

## BlockTypes: `std`

### Documentation

- [std docs: Builtin BlockTypes](https://std.divnix.com/reference/blocktypes.html)

### BlockTypes

- type: `arion`
  desc: NixOS modules to build & run docker images. Built on top of `docker-compose`
  links:
  - [Arion Docs](https://docs.hercules-ci.com/arion)

- type: `runnables`
  desc: Targets that you want to make accessible with a `run` action on the TUI

- type: `installables`
  desc: Targets that you want to make available for installation into the user's Nix profile.
  cmds:
  - install
  - upgrade
  - remove
  - build
  - bundle
  - bundleImage
  - bundleAppImage

- type: `pkgs`
  desc: Use the Pkgs Blocktype if you need to construct your custom variant of nixpkgs with overlays. Targets will be excluded from the CLI / TUI  and thus not slow them down.


- type: `devshells`
  desc: Development shells & other environments for working with parts of a repo. e.g. Shells to administer cluster, Windows, Azure.
  cmds:
  - build
  - enter

- type: `nixago`
  desc: Nixago pebbles to ensure files are present or symlinked into your repository.
  cmds:
  - ensure
  - explore

- type: `containers`
  desc: OCI-images built with `nix2container`
  cmds:
  - print-image
  - publish
  - load


- type: `data`
  desc: JSON-serializable data.
  cmds:
  - write
  - explore

- type: `functions`
  desc: Reusable Nix functions that you would call elsewhere in the code. No actions.

- type: `anything`
  desc: Generic BlockType. Implementation same as `functions`, but semantics are different. Implementations may diverge in future.


## BlockTypes: `hive`

### Documentation

### BlockTypes

- type: `colmenaConfiguration`
  desc:
  cmds: None
  - TODO: deploy
  - TODO: bootstrap
  - TODO: upgrade
  - TODO: info
  - TODO: status

- type: `darwinConfiguration`
  desc: MacOS system configuration.
  cmds:
  - switch
  - build
  - exec

- type: `diskoConfiguration`
  desc: MacOS system configuration.
  cmds: None
  - TODO: build-disk-image
  - TODO: format-disk
  - TODO: format-disk-remote
  - TODO: test

- type: `homeConfiguration`
  desc: MacOS system configuration.
  cmds: None
  - TODO: switch
  - TODO: build
  - TODO: exec

- type: `nixosConfiguration`
  desc: MacOS system configuration.
  cmds: None
  - TODO: switch
  - TODO: switch-after-boot
  - TODO: build
  - TODO: build-vm
  - TODO: build-installer-image
  - TODO: dry-build
  - TODO: dry-activate
  - TODO: activate
  - TODO: exec
  - TODO: exec-vm
  - TODO: other nixosGenerator actions

- type: `terra`
  desc: Terraform via Terranix
  link:
  - [Terranix Options](https://terranix.org/options/core-options/)
  - [Pull Request](https://github.com/divnix/std/pull/303/files)
  cmds:
  - init
  - plan
  - apply
  - state
  - refresh
  - destroy
  note:
  - Not live yet, still pull request

## BlockTypes: 3rd-Party Repos

### Documentation

### BlockTypes


## BlockTypes: Custom

### Documentation

### BlockTypes

#### Packages

- type: package-remote
  cmds:
  - update-source
  - build
  - test

- type: overlay
  cmds:
  - build-packages

- type: `nur-registry`
  cmds:
  - push-update
  - update-sources

#### Systems

- type: `homeModule`
- type: `homeProfile`
- type: `homeSuite`

- type: `nixosModule`
- type: `nixosProfile`
- type: `nixosSuite`

- type: `darwinModule`
- type: `darwinProfile`
- type: `darwinSuite`

- type: `robotnixModule`
- type: `robotnixProfile`
- type: `robotnixSuite`

- type: `diskoModule`
- type: `diskoProfile`
- type: `diskoSuite`

- type: `systemManagerConfiguration`
- type: `systemManagerModule`
- type: `systemManagerProfile`
- type: `systemManagerSuite`

- type: `wslConfiguration`
- type: `wslModule`
- type: `wslProfile`
- type: `wslSuite`

- type: `windowsConfiguration`
- type: `windowsModule`
- type: `windowsProfile`
- type: `windowsSuite`
