
# Kubernetes: Server Hardware Setup

## About

I plan on running as much of our infrastructure within Kubernetes as possible (See: [Why Kubernetes](./kubernetes-why.md))
I intend on using Azure Kubernetes Service to run mission-critical services, but almost everything *could* be run there.
However, many intended use cases for some services pretty much demands we have low-latency connections to the service, so we will likely want to run a handful of things in-house.
Regardless, in order to test the services we will run without incurring the high usage cost of rapid iteration & deployment to cloud providers' Kubernetes services, I will need to have a Kubernetes cluster running on-site.
This document describes the process necessary to bootstrap a Kubernetes cluster using any computers we have in our inventory.
I am going to use the graveyard of retired desktop workstations for this purpose.

## Prerequisites

None!

This is the only task that doesn't depend on any others.
This is the only task that is 100% independent of LEFCON or information about our current setup that I expect LEFCON to provide.

## Setup Possibilities

Node Setups:

- **Minimum**: 1 controller nodes, 1  worker nodes (can test pod container behavior only)
- **Better**:  1 controller nodes, 2+ worker nodes (can test pod + pod failover + above)
- **Ideal**:   3 controller nodes, 3+ worker nodes (can test controller consensus failover + above)


Notes:
- Eventually, I will have multiple (3+) controllers and multiple (3+) workers, but I can start with less & scale up later.
- One *controller* node should be in Azure Kubernetes Service for best reliability (i.e. power/internet outage, etc. doesn't make our services inaccessible)
- One node should be hosted on-site for super-fast response times.
- Testing environment should be designed to mirror the production environment as closely as possible.
- Additional nodes can be added later as needed, but expanding production environment may cause breakages & potential downtime.

## Process

- [ ] Provision (*low resource*) Kubernetes node in Microsoft Azure

1. [ ] Backup data on old machines (*Repeat for each machine*)

  a. [ ] Backup all existing data, Windows 7 license keys, account credentials, etc. from all PC hard drives
  b. [ ] Wipe all backed-up PC hard drives.

2. [ ] Catalog all hardware

    a. [ ] Determine number of starting nodes: [1, ~12]    (*we'll refer to this as `N` later*)
    b. [ ] Select the fastest `N` CPUs        available from all old PCs.
    c. [ ] Select the fastest `N` RAM sticks  available from all old PCs.
    d. [ ] Select the fastest `N` hard drives available from all old PCs.
    e. [ ] Select the largest `N` hard drives available from all old PCs.
    f. [ ] Select the largest `N` RAM sticks  available from all old PCs.


3. [ ] Re-organize hardware configuration of old Windows PCs to create a few machines with optimal performance given all old hardware parts.

  a. [ ] Build primary controller node from the fastest hardware.
    - Use **fastest** CPU.
    - Use **fastest** hard drive in   **primary** slot.
    - Use **largest** hard drive in **secondary** slot.
    - Use **fastest** RAM stick by clock speed:
      - if **one** stick  fastest, use    **only one stick**,
      - if **two** sticks fastest, use        **both sticks**,
      - else,                      use **two largest sticks** from those tied for fastest.

  b. [ ] Repeat step `a` with remaining hardware until you have `N` machines.
    - *consider pairing slowest cluster node CPU with largest hard drives remaining to use as storage/backup node*

