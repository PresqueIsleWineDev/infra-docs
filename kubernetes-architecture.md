# Kubernetes: Base Architecture

## About

Kubernetes expects the presence of services that implement certain required behavior.
Kubernetes is *extremely* compartmentalized.
Even for essential functions, Kubernetes allows using any service that implements the functionality to handle that behavior for the entire cluster.
This means that to get a working setup, you must select which services you want to use for each required function.

This document describes a list of services that implements those requirements...along with a few services that are not *required*, but facilitate processes that are very common and often tedious within a cluster.

Notes:

- Services here may possibly be mutually dependent, where some service requires another service described here before being able to run.
  - To deal with this, I will need to find an initial deployment order to bootstrap the infrastructure, then reconfigure certain components to use the security-related services for all subsequent deployments.
  - This should only be an issue on first deployment. Subsequent deployments will be much simpler.
- This list may not be complete.
- This list may not be ordered precisely or correctly and should be considered *approximate*.

## Prerequisites

1. Prepare hardware for Kubernetes nodes. See: [Kubernetes: Hardware Setup](./kubernetes-hardware-setup.md)
2. Configure & install operating system to run on hardware for Kubernetes nodes. See: [Kubernetes - Operating System Setup](./kubernetes-operating-system-setup.md)

## Process

1. [ ] Determine exact set of services for each required functionality.
2. [ ] Determine exact set of services for all functionality that is "optional-but-extremely-helpful".
3. [ ] Determine bootstrap order that satisfies all dependencies.
4. [ ] Configure each of the services listed below.
5. [ ] Deploy each of the services listed below.

## Components

Operators are Kubernetes services that can dynamically allocate & manage resources used by other Pods / Deployments / Services / etc.
These must necessarily be setup first because all other software will depend on them.

- **Configuration Storage**: Controls Kubernetes resources access to Config / ConfigMap manifests for configuring services running in Kubernetes. **Essential**
  - [ ] `etcd`

- **Storage Provisioning**: Controls allocating storage for Kubernetes Pods / Deployments / DaemonSets / ReplicaSets. **Essential**
  - [ ] Operator: Rook-Ceph (for provisioning block storage)
  - [ ] Operator: Minio     (for provisioning S3 Object Storage buckets that many services use)

- **SSL/TLS Certificate Provisioning**: Controls generation, allocation, renewal of SSL/TLS certificates for Kubernetes Services / Ingress Resources. (this is what browsers use to encrypt traffic to/from servers). Also used to generate SSL/TLS certificates for new subdomains (e.g. `passwords.piwine.com`). **Essential**
  - [ ] ClusterIssuer: `cert-manager`

- **Secret Provisioning**: Controls allocating, generating, encrypting, decrypting of sensitive keys that must be kept private to ensure security of all infrastructure. This will be necessary to provide secret information like administrator credentials & encryption keys to software running inside Kubernetes clusters. **Essential**
  - [ ] Operator: Hashicorp Vault

- **Access Control Management**: Controls what users have what permissions within Kubernetes. Can be unified with other authentication services. ServiceAccount objects will need to use this mechanism. **Essential**
  - [ ] Operator:

- **Ingress Controller**: Controls what services can be accessed by the outside world. Necessary to allow some services to be externally accessible (few), some services to be accessible only to PIWC (some), & some services to only be accessible to other Kubernetes services (most). **Essential**
  6. Operator: (one or more of below)
    - [`ingress-nginx`]()
    - [`traefik`]()
    - [`HAProxy`]()
    - [`Istio`]()
    - [`ngrok`](https://ngrok.com/docs/using-ngrok-with/k8s)
    - [`envoy-proxy`](https://www.envoyproxy.io)

- **Load Balancer**: Controls how Kubernetes Pods are created/destroyed across nodes in response to resource usage, scarcity, & failing replicas. **Essential**
  - [ ] Operator: `metallb`

- Internal Cluster DNS: Controls how services running inside Kubernetes access both the internal & external network. Needed for services to be able to discover one another. **Essential**
  - [ ] Operator: `coredns`
