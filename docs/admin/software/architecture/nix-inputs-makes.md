# Nix Flake Inputs: Makes

Repo: [`fluidattacks/makes`](https://github.com/fluidattacks/makes)


## Overview

Software supply chain framework in Nix.

## Why

### Design

- Integrates with Nix
- Integrates with [`divnix/std`](https://github.com/divnix/std) & [`divnix/hive`](https://github.com/divnix/hive) as `std.blockType.makes`
- Integrates with [`direnv`]() & [`nix-direnv`]() to automatically source development environments.
- Deploy our Terraform configs generated via Terranix, all using the same format.
- Deploy our container images to a container registry.
- Deploy our Action Runners in the same format as we use to configure local devshells, which means the config can be re-used & the local dev machine will always match the CI/CD environment.
- Setup GitHub, GitLab, etc. CI/CD with the same config used to create the local dev environment.
- Library functions to create and convert between tons of environments, configuration files, & artifacts for various languages, runtimes, and package formats.
- Provision secrets from other resources in environment variables, Kubernetes Secrets, Terraform Secrets, etc.
- Automatically monitor repo for best practices & vulnerabilities.
- Automatically apply stricter & more secure access control policies when non-breaking & available.
- Automatically run tests for PyTest, Terraform plans, licensing issues, and create test pull requests to check for workflow errors.
- Automatically generate encrypted `sops` files for storing secrets in-repo.
- Automatically generate lockfiles for Python, Node.js, Ruby
- Automatically check code for errors in many languages & config formats.
- Automatically format bash, Markdown, Nix, Terraform, & YAML files with popular style conventions.
- Can be used to create packages for 3rd-party (and even closed source) projects
- Extensible w/ 3rd-party extensions for functions not builtin.
- Helps defend against security vulnerabilities in both our code and our software supply chain.
  - Also has tool to detect files in repo that are more likely to contain security vulnerabilities using Azure AI



### Use Cases for our Infrastructure

- Declare & deploy our Terraform config.
- Declare & push our custom container images a container registry.
- Declare & run Nomad tasks.
-

## Declaration

Declares:

-


## Outputs

Result Outputs:

-


## Examples

```nix
```


## To-Do

- [ ] Finish this document
