# Infrastructure Documentation

![PIWC Logo](./assets/piwine-logo.png?raw=true)

Documentation for our digital infrastructure.

Currently only contains the plan for transitioning from external IT to internal administration and management.

## References

- [Term Glossary](./docs/glossary.md)
- [IT Invoice](./assets/invoice-it-services-feb23.pdf)

## About

This is the overview of my plans to transition our internal systems (and eventually external) away from external IT management to our own infrastructure and management.

This document intends on being as complete as possible.

Document Format: GitHub-flavored `Markdown`.


### Purpose

This document will be updated over time as details unfold and the bulk of the implementation process begins.

This document will (eventually) serve as:

- a progress checklist during the development and rollout of our infrastructure
- documentation of our complete end-to-end system once the initial rollout is complete
- landing for my notes about our existing setup
- changelog to provide to employees after a rollout

### Origin

Repo originated as a collection of private notes to scaffold my plans, but work has been done to make this a more complete reference manual and task list.

To avoid duplicating effort by having to maintain personal notes & to-dos and provide periodic updates about my plans and progress, I decided to merge them.

### Updates

This document itself will be periodically updated as plans, information, and progress changes.

All updates to this project (on the `main` branch) will generate an entry in this repo's [commit history](https://github.com/PresqueIsleWineDev/infra-docs/commits/main)


### Document Flaws

The current state of this document is *certainly* incomplete, and likely will remain incomplete until our external IT service provides more details about our current setup.

Some aspects of this document may be clunky at present time because I didn't initially intend for anyone to read this but me. This will improve over time as I necessarily make changes to my plans & notes.

Immediately below is a list of information I intend on covering, but is suboptimal at present.

- Ordering of tasks is not precise.
- Nesting checkboxes destoys their order.

Missing Details:

- 100% enummeration of **all** required components.
- Exact names of software implementing all of the mentioned components. For some things, I know which implementation I intend on using. For others, I have to weigh the pros/cons to each option. However, I have a set of candidate options in mind for every component.
- Steps that are smaller, but still necessary and possibly lengthy, but not worth giving its own bullet point / checkbox. This list is currently only an *overview*. Some tasks are **far** too complex or uncertain to attempt to pre-emptively document the process.
- Currently only describing details for replacing internal infrastructure. Website is not touched upon much.
- Denotation of which components/services/steps are *required* for the initial rollout.
- Explanations for why I'm including components/services that are not *required* for the initial rollout, but will likely be necessary when implementing future features I intend on implementing.
- Future functionality


## Infrastructure Details

### Design Considerations

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

### Setup Overview

1. Configure hardware of machines to use as servers.   [Servers: Setup Hardware](./docs/plans/kubernetes-hardware-setup.md)
2. Create configurations for server operating systems. [Servers: Setup OS](./docs/plans/kubernetes-operating-system-setup.md)
3. Configure Kubernetes base architecture.             [Servers: Setup Kubernetes](./docs/plans/kubernetes-architecture.md)
4. Configure services.                                 [Services: Setup](./docs/plans/services-setup.md)
5. Deploy services to Kubernetes cluster.              [Services: Deploy](./docs/plans/services-deploy.md)
6. Configure test workstation.                         [Test PC: Setup](./docs/plans/workstation-testing.md)
7. Configure workstations to use our new services.     [Workstations: Setup](./docs/plans/workstation-setup.md)

For a list of services I will need to configure and deploy, see [Services: List](./docs/plans/services-list.md)

## To-Do

*only apply to this document, not our systems*

- [X] Fix broken links to other pages.
- [ ] Reference items from the included IT invoice.
- [ ] Add expected costs for any 3rd-party services.
- [X] Turn the documents in this folder into actual documentation.
  - [X] Host this documentation somewhere accessible to PIWC employees. [PresqueIsleWineDev/infra-docs](https://github.com/PresqueIsleWineDev/infra-docs)
  - [ ] Create administrator usage documentation after rolling out a given piece of software to testing.
  - [ ] Create end-user usage documentation after rolling out a given piece of software to production.
- [ ] Clean up project & integrate with GitHub
  - [ ] Merge this repo with actual infrastructure configuration repo
  - [X] Move Markdown files to `docs` directory
  - [ ] Convert general process to-dos into GitHub project board
  - [ ] Convert specific process to-dos into GitHub issues
  - [ ] Convert documentation into GitHub wiki
  - [ ] Render documentation/wiki as webpage
- [X] Add pretty logo to README.md
