# Infrastructure Transition Plan: LEFCON -> Internal Administration

## References

- [Term Glossary](./glossary.md)
- [LEFCON Monthly Invoice](./invoice-lefcon-monthly-feb23.pdf)

## About

This is the overview of my plans to transition our internal systems (and eventually external) away from LEFCON to our own infrastructure and management.

This document intends on being as complete as possible.
The current state of this document is certainly incomplete, and likely will remain incomplete until LEFCON provides more details about our current setup.

### Purposes

This document will be updated over time as details unfold and the bulk of the implementation process begins.

This document will (eventually) serve as:

- a progress checklist during the development and rollout of our infrastructure
- documentation of our complete end-to-end system once the initial rollout is complete
- landing for my notes about our existing setup
- changelog to provide to employees after a rollout

### Considerations

- Modern architecture, development, and deployment practices
- Security
- Requirements to migrate from existing setup
- Cost
- Resistance to platform lock-in
- Ease of implementation
- Ease of maintenance & management
- Ease of onboarding any future successors
- Fault tolerance / failure recovery
- Future proofing
- Future extensions & functionality

### Document Faults

- Ordering of tasks is not precise.

Missing Details:

- 100% enummeration of **all** required components.
- Exact names of software implementing all of the mentioned components. For some things, I know which implementation I intend on using. For others, I have to weigh the pros/cons to each option. However, I have a set of candidate options in mind for every component.
- Steps that are smaller, but still necessary and possibly lengthy, but not worth giving its own bullet point / checkbox. This list is currently only an *overview*. Some tasks are **far** too complex or uncertain to attempt to pre-emptively document the process.
- Currently only describing details for replacing internal infrastructure. Website is not touched upon much.
- Denotation of which components/services/steps are *required* for the initial rollout.
- Explanations for why I'm including components/services that are not *required* for the initial rollout, but will likely be necessary when implementing future features I intend on implementing.
- Future functionality



## Setup Overview

1. Configure hardware of machines to use as servers.   [Servers: Setup Hardware](./kubernetes-hardware-setup.md)
2. Create configurations for server operating systems. [Servers: Setup OS](./kubernetes-operating-system-setup.md)
3. Configure Kubernetes base architecture.             [Servers: Setup Kubernetes](./kubernetes-architecture.md)
4. Configure services.                                 [Services: Setup](./services-setup.md)
5. Deploy services to Kubernetes cluster.              [Services: Deploy](./services-deploy.md)
6. Configure test workstation.                         [Test PC: Setup](./workstation-testing.md)
7. Configure workstations to use our new services.     [Workstations: Setup](./workstation-setup.md)

For a list of services I will need to configure and deploy, see [Services: List](./services-list.md)

## To-Dos

*only apply to this document, not our systems*

- [ ] Fix broken links to other pages.
- [ ] Reference items from the included LEFCON invoice.
- [ ] Add expected costs for any 3rd-party services.
- [ ] Turn the documents in this folder into actual documentation.
- [ ] Host this documentation somewhere accessible to PIWC employees.
- [ ] Create administrator usage documentation after rolling out a given piece of software to testing.
- [ ] Create end-user usage documentation after rolling out a given piece of software to production.
