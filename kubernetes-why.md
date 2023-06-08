# Kubernetes

## What is Kubernetes?

Before services can be run, they need a platform to run on.
Kubernetes is a platform to connect multiple computers together to run applications, services, etc.

## Why Use Kubernetes?

Kubernetes features that make it a superior choice for infrastructure:

- Operates such that services automatically restart upon many types of failures
- Can scale services up or down to match the required load based on usage.
  - Saves on operating cost when demand is low.
  - Able to meet performance requirements during periods of high demand.
- Can run any service on a major cloud Kubernetes service and/or a local machine, meaning you can:
  - Have extremely fast latency when you need it by running services inside your network
  - Leverage the exceptional reliability and performance of the infrastructure of the biggest tech companies.
  - Trivially switch between providers or local service, so there is no platform lock-in.
- Configuration is declarative. Everything running on a Kubernetes cluster is defined in a manifest file, which means:
  - Everything you setup to be handled by Kubernetes will **always** match what is described by the manifest files.
  - There are no extra steps required to re-setup everything inside a Kubernetes cluster once the manifest files exist...just deploy the manifests.
  - An exact description of everything run in Kubernetes exists within the manifest files...so there is one universal source of truth for what services are run and how. This makes onboarding new people to administer the cluster only requires minimal knowledge...just how to deploy Kubernetes manifests
- **Tons** of tooling exists for Kubernetes, so once you can configure a service to run on a Kubernetes cluster, you can leverage the breadth of tools to manage it.
- Kubernetes runs services, applications, etc. in containers.
  - Containers are **far** more efficient on resources than how our current setup runs compartmentalized software...in Virtual Machines (VMs)
  - Containers are also **far** more secure than running all programs within the same environment...prevents one service getting hacked from compromising entire system.
  - Can also run VMs if necessary using KubeVirt, so we can transfer over our existing VMs if we obtain the VM configuration from LEFCON.
- Adding or removing computers from a cluster is trivial once setup. Hardware failures become inconsequential to operations.

