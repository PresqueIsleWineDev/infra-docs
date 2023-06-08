# LEFCON -> Internal Administration: Kubernetes Setup Process


## Kubernetes Setup Process

### Process Overview

1. Configure hardware of machines for use within Kubernetes
2. Configure base operating system for Kubernetes to run on. (NixOS)
3. Configure architectural components of Kubernetes.
4. Deploy services to Kubernetes.


### 3. Kubernetes Architecture Configuration

9.  [ ] Create administrator user `sam` / `slehman`
10. [ ] Create namespaces for each environment: `production`, `testing`, `development`
    Notes:
    - Services below can start to be deployed as ready to the `development` & `testing` environments
    - Once testing in `testing` environment yields success & stability, move service & its dependencies to the `production` environment.
    - Many services will need an instance running for each environment if other services depend on their presence.
11. [ ] Create Kubernetes ServiceAccount objects for required components that administer the cluster.
    - [ ] `kube-apiserver`
    - [ ] `kube-registry`
    - [ ] `kube-controller-manager`
    - [ ] `kube-proxy`
    - [ ] `kube-scheduler`
    - [ ] `kube-admin-ui`

### 4. Service Deployment

This section will list software services to be run inside Kubernetes.

For a list of services I will need to deploy, see: [plan_transition_services.md](./plan_transition_services.md)

Notes:

- Services cannot be deployed until there is an available cluster to deploy to.
- Deployment can be to local Kubernetes nodes or on Microsoft Azure's Kubernetes service, or a hybrid of both (ideally).
- Most of the cluster setup section above should occur before doing any of the below.


## Implementation Ideas / Help

- [ ] **TODO**: Look at [Ammar's config](https://git.617a.net/617A/ansible/src/branch/main/roles/kubernetes) for implementation best practices & sensible default choices for services.
  - `coredns`
  - `calico` / `calicoctl`
  - `kube-apiserver`
  - `kube-controller-manager`
  - `kube-proxy`
  - `kube-scheduler`
  - `kubectl`
  - `kubelet`


