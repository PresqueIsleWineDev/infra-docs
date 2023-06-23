# Nix Flake Inputs: nix2container (n2c)

Repo: [`nlewo/nix2container`](https://github.com/nlewo/nix2container)


## Overview

Declare container manifests and builds container images in Nix.

## Why


### Design

- Integrates with Nix
- Integrates with [`divnix/std`](https://github.com/divnix/std) & [`divnix/hive`](https://github.com/divnix/hive) as a `std.blockType`
- Easily dockerize/containerize software without existing images.

### Use Cases for our Infrastructure

- Tons. I plan on containerizing as much as possible. Necessary to run on Kubernetes.

## Declaration

Declares:

-


## Library Functions

- `nix2container.pullImage`
- `nix2container.buildImage`
- `nix2container.buildLayer`

## Outputs

Result Outputs:

- OCI container image


## Examples

```nix
```


## To-Do

- [ ] Finish me!
