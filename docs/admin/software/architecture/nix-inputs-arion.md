# Nix Flake Inputs: Arion

Repo: [`hercules-ci/arion`](https://github.com/hercules-ci/arion)


## Overview

Declare, build, and deploy multi-container services. Generates `docker-compose` config, but with better templating because using Nix grants dynamic configs trivially by being a full programming language.

## Why

### Design

- Integrates with Nix
- Integrates with [`divnix/std`](https://github.com/divnix/std) & [`divnix/hive`](https://github.com/divnix/hive) as a `std.blockType`
- Kubernetes `blockType` in `std` will likely be based on this. Easy conversion once implemented.
- Helm chart `blockType` in `std` will likely be based on this. Easy conversion once implemented.
- Can run on local development machine, plain servers, docker containers, virtual machines, cloud container runners.

### Use Cases for our Infrastructure

- Fallback for services that don't work with Kubernetes.

## Declaration

Declares:

- https://docs.hercules-ci.com/arion/options


## Outputs

Result Outputs:

-


## Examples

```nix
```


## To-Do

- [ ]
