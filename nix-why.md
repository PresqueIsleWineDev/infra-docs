# Nix / NixOS

## What is Nix?

Nix is (at its core) a programming language that is often used to write configurations for various platforms.
NixOS is a Linux-based operating system that is entirely configured using Nix.

## Why Use Nix / NixOS?

- Declarative configuration
  - Allows for the entire state of any config managed by Nix to be represented as files.
  - Allows knowing the exact state of our systems. It will always match the config files.
  - Allows using Version Control Systems (VCS) to manage configs...which means rolling back a breaking change is super easy.
  - Self-descriptive...so learning how our system works only requires looking at our configs when eventually onboarding my future successor
  - Management consists of editing existing config files and running a deploy command.

- Nix can be used to configure a multitude of things
  - My work computer's desktop configuration
  - Servers' system configuration
  - Anything that Terraform can configure (via Terranix) [See: Why Terraform](./terraform-why.md)
  - Container manifests
  - Kubernetes manifests (via KubeNix & nix-helm) [See: Why Kubernetes](./kubernetes-why.md)
  - Some networking equipment (via Liminix)
  - Passwords & secret keys (via agenix or sops-nix)
  - Virtual Machines (VMs) ... (our current servers are running VMs)

- Nix can easily integrate **tons** of different resources:
  - Existing configuration files of *almost any* format

- Nix can easily create/build **tons** of different resources from its configs:
  - Container images
  - Software packages
  - Entire websites
  - Asset caches

- Nix makes it trivially simple to test things:
  - Can automatically install all software needed to manage infrastructure (via devShells)
  - Can create Virtual Machines (VMs) from any NixOS system configuration (useful for testing our servers)
  - Can create containers from any NixOS system configuration (useful for testing our servers)

- Nix has a massive community to reach out to for support
  - Extensive documentation
  - Wiki
  - Lots of configuration examples on GitHub/GitLab
  - Chat rooms
  - Forums

- Nix lets you have one single ground source of truth for everything you manage with it.
  - Everything can be placed into a single folder.
  - Onboarding a new system administrator only requires giving them access to the Git repository I use to host this folder.
  - Project management, planning, issue tracking can occur on any Git host (I'm hosting this project on GitHub). I will setup the project management tools and give you access shortly.

## Limitations

The *only* things I *won't* be able to configure with Nix (or tools that integrate with Nix) are:

- Windows OS images
- Windows Provisioning Packages
- Some of our router configurations

I may write integrations for these things eventually.
