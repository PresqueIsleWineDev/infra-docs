# Terraform

## What is Terraform?

Terraform is a platform for declaratively configuring a huge collection of services.

Terraform supports both:
- External 3rd-party services
- Internal services


## Why Use Terraform?

- Declarative configuration
  - Allows for the entire state of our Azure config to be represented as files.
  - Allows knowing the exact state of our 3rd-party services (like Azure ActiveDirectory)
  - Allows using Version Control Systems (VCS) to manage configs...which means rolling back a breaking change is super easy.
  - Self-descriptive...so learning how our system works only requires looking at our configs when eventually onboarding my future successor
  - Management consists of editing existing config files and running a deploy command.

- Terraform can be used to configure a multitude of other platforms we already or will likely use.
  - Microsoft Azure Kubernetes Service (AKS)
  - Microsoft Azure ActiveDirectory (AD/AAD)
  - GitHub
  - Google (Google Business, Google Cloud APIs, user accounts)
  - Many different container registries (Azure Container Registry, GitHub Container Registry, DockerHub, Google Cloud Container Registry, our locally-run container registry, & more)

- Terraform can be easily integrated with the other configurations & deployment tools that use Nix/NixOS via Terranix.
  - Server configuration
  - Kubernetes configuration
  - Kubernetes service manifests
  - Helm charts
  - My work computer's configuration
  - (eventually) Our network equipment's configuration

- Hashicorp tools are:
  - Engineered with security in mind.
  - Extremely user friendly
  - Well-supported & well-documented
  - Well-integrated with each other (I also plan to use Hashicorp Vault for storing our infrastructure's sensitive information, keys, passwords, etc.)
  - Well-integrated with external tools. (e.g. Kubernetes, Nix)
  - Free with no licensing requirements if you run it yourself
  - Open source, so security vulnerabilities are patched extremely quickly.

