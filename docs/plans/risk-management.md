# Risk Management

## Downtime

The primary use cases of Kubernetes are:

- Preventing/reducing service downtime
- Scaling running services up or down as necessary to meet demand

Services within Kubernetes are run in units called "Pods".
The main feature of Kubernetes is that when Pods crash or fail,
they are killed off and restarted.
This will result in enhanced resilience to failures that would otherwise go unnoticed,
previously requiring external IT to manually restart.

By duplicating running processes across hardware nodes,
Kubernetes provides redundancy so that malfunctioning Pods that don't explicitly crash or otherwise fail can safely be killed,
allowing for another instance of the service to take over the demand.

Fault tolerance capabilities are the most significant factor on why I chose to design our new architecture around Kubernetes.

Kubernetes also provides excellent logging capabilities so that proximate causes of failure can be determined more easily.

- [ ] TODO: Add Grafana to list of running services.
- [ ] TODO: Add Prometheus to list of running services.

## Preventing Unexpected Costs

Another feature of Kubernetes is that for each node in the cluster,
you can set assertions that cannot be violated.

The primary such assertion is setting computational limits on nodes, Pods, or Deployments.
When the computational demand threshold is being approached,
Kubernetes will offload the demand to other running nodes.
This will be used to prevent running up a bill with cloud providers like Azure Kubernetes Service,
while maintaining operational status of all of our services.


Services can be engineered so that they:

- Prefer to run workloads on local nodes, where response time is fastest, and no cloud computational usage costs are incurred.
- Fallback to cloud replica services when services on local nodes fail, providing resistance to events disrupting normal operational status of the local cluster nodes like power or internet outages.
- Redirect workload back to local cluster nodes when they come back online.
- Offload computation during periods of excess demand to the cloud, so that services are always fast to respond.
- Confine certain processes to local nodes such that service development and testing can take place on a local cluster node where errors in configuration will not incur a cloud usage cost.

This capability is the primary consideration as for why I chose to use this hybrid cluster approach.


## Data Integrity

Kubernetes declares units of storage using a "PersistentVolumeClaim" (or multiple) for services.
This provisions some amount of data storage specifically to the service.

You can configure conditions to apply to PVCs that determine:

- Physical storage location
- Duplication mandates
- Points in time where the state of the data within the PVC can be reverted to called "VolumeSnapshots"

This can be used to guarantee our data is safe from:

- Drive failures
- Natural disasters or other unforseen events that may render hardware inoperable
- Accidental deletion by users or services

Easy restoration of VolumeSnapshots guarantees that we can restore data to a last-known-working state.
It also allows us to spin up a separate environment where we can inspect prior states of data and access data that has since been deleted from the currently active service data.
Example uses:
- If someone accidentally deletes important data, the service can be trivially reverted back to the last VolumeSnapshot prior to the deletion.
- If the above scenario occurs, but data has since been added after the deletion, the intended data can be reconstructed from the VolumeSnapshot without the deletion and a new VolumeSnapshot with the changes that occurred after. This can prevent having to re-do days worth of work if an accidental deletion is discovered long after it occurs.
- If you deliberately delete some item, but later discover that you need to refer back to it without keeping it in the operational data, a new instance of the service can be spun up using a VolumeSnapshot from a time where the appropriate data existed.


## Data Security

Kubernetes has **tons** of features intended to prevent unauthorized access to services & data.

### Pod Behavior


1. Pods are instances of one or more containers running as a unit.

  - Containers initialize from a well-defined state (called an image).
  - Container images are checked for integrity / tampering before start. This means that all Pods will restart at a clean, uncompromised state. Any compromise will have to use sophisticated mechanisms to find an avenue to save itself somewhere configured to persist.
  - Containers execute in complete isolation from other containers. This means that a compromise is confined to the Pod, and cannot arbitrarily spread itself throughout the system.

2. Pods can only communicate with the network or store data in predefined ways.

  - Kubernetes provides object types that are used to define and manage this network and data access.
  - These will be described below.

### Network Access

1. NetworkPolicy object declarations configure the default behavior for allowing/restricting traffic in or out of the cluster. By default, I will configure this to completely disallow any traffic from outside our network in or out of the cluster.
2. Service object declarations control what protocols & ports Pods can be accessed using.
  - By default, this is no communication.
3. Ingress object declarations control what traffic can come in to the cluster and what Service it can access.
  - This means every avenue for external access is *strictly* and *explicitly* defined.
4. Egress object declarations control what network locations the Pods running in the cluster can reach.
  - This means the locations a Pod can send data are *strictly* and *explicitly* defined.
  - This prevents exfiltrating data to undefined locations.

Exposure to the outside world is extremely limited by default, and is difficult to accidentally expose in unintended ways.

### Data Storage

1. PersistentVolume object declarations configure physical storage.
  - Can declare to be encrypted at rest, preventing unauthorized reading of the data in the event of a physical security breach.
2. PersistentVolumeClaim object declarations create individual allocations of some size of storage in a PersistentVolume.
  - Pods attach/mount these to specific locations in their filesystem.
  - Data only persists when written to the location where a PersistentVolumeClaim is mounted. All other state is defined in the container images of a Pod. All other writes are replaced upon Pod restart.
  - Pods cannot access a PVC it is not declared to access.

3. Secret object declarations are used to provide sensitive information to Pods.
  - Data is encrypted on disk and in transit
  - Secrets are provided to running Pods exactly where the data it is needed, but made otherwise inaccessible.
  - Secrets can be easily rotated/replaced in the case of compromise.

### Management & Access

1. Role-based Access Control (RBAC) can be configured to provide granular access to data, services, or administrative actions based on a broad variety of conditions.
  - Most commonly used to define what users can control the cluster.
  - Often used to allow some Service or Pod to control other parts of the cluster.
  - Access will be minimally configured / maximally restricted to fit our needs precisely.

### Breach / Compromise Handling

Compromised systems usually require halting server execution entirely and reinstalling the system from the operating system up.

With our architecture:

- Pods are restricted with what data and network locations they can communicate with, preventing potential compromises from successfully exfiltrating data.
- Pod restarts will naturally occur when adapting to changes in load, service configuration, or power/network availability.
- Most potential compromises will require no more than changing the Secrets a Pod had access to and killing the pod.
- In the unlikely event a Pod is compromised and manages to exfiltrate data before the next Pod restart, all that would typically be required is to rotate any Secrets the Pod had access to, and restart the Pod.

In total, this **greatly** limits:

- The mechanisms available to compromise services.
- The mechanisms available to exfiltrate data after a service is compromised.
- The scope of impact if any data or service is compromised.
- The effort required to mitigate the compromise
- The effort required to restore normal operations

