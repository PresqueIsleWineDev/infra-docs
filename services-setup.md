# Services: Setup & Configuration

For a list of services I will need to configure and deploy, see [Services: List](./plan_transition_services-list.md)

## About

### Environments

I plan on separating services into distinct, isolated environments. This enables creating multiple similar setups that do not interfere with one another.

The environments I intend on using:

- [ ] Production
  - End-users will only ever interact with services running in this environment.
  - Services running here should be stable, well-tested, and known to be working.
  - After making *any* changes that can negatively impact users, I will send out emails to those affected describing:
    - What changes were made
    - Any changes to users' workflows
- [ ] Testing
  - Live environment for testing after initial development is complete.
  - Purpose is to discover bugs & misconfiguration in a setting mimicking the production environment, but without damaging the systems everyone depends upon.
  - After a service's initial deployment, all non-trivial changes (except bug fixes) will require a brief period in the testing environment before being eligible to roll out to the production environment.
  - Automated tests should run upon deployment to this environment.
  - Changes will be marked as production-ready if all automated tests are passing & service uptime exceeds some threshold.
  - Test machines will be pointed at this environment instead of production.
  - May make option for users to use testing environment for when I need confirmation that a change works properly before rolling out company-wide.
- [ ] Development
  - Only accessible to system admins & developers.
  - Services will be repeatedly and rapidly deployed, debugged, destroyed, and iterated upon in this environment,
  - Services running in this environment will likely be insecure, prone to deletion and failure, untested, and may not integrate with other components yet.
  - This environment will likely be entirely inside our cluster and on my laptop to avoid incurring excessive charges by cloud providers due to misconfiguration.

### Containerized Services

- Containers are runtime environments where your software runs.
- Kubernetes runs containers.
- Most popular services have pre-built containers available to the public.

#### Kubernetes-ready Services
- Some services come with super convenient Kubernetes manifest templates called Helm charts.
  - Include container with Kubernetes manifests or templates to quickly deploy a service
  - Configuring services packaged this way is very simple, just set the options

- Other services require creating Kubernetes manifests for running its container, make accessible to the outsite, assigning storage space, keeping secret data & keys private, and more.
  - Plenty of templates exist for doing this.
  - Initial manifests will take longer than ones created after because reusing existing manifests is easier than creating new ones from scratch.
  - This will be the case for most user-facing services.

#### Helm Charts

- Helm is more-or-less a packaged unit of templated Kubernetes manifests.
- Most Kubernetes architectural components and very popular services have a Helm chart. - Helm charts are extremely convenient and by far the easiest way to get services running.
- When available, I will usually opt to use Helm via `nix-helm`

### Other Services

Very few services that we need to run will not have a pre-built container available.

Some services I expect to have to manually build a container for:

- Infor FACTS server
- Intuit QuickBooks server

I have not verified if every service I intend on running has a container yet.

For any service that does not have a pre-built container publicly available, I must:

1. Create a container manifest for that service
2. Built the container image from the manifest
3. Deploy the built container image to a container registry.


## Requirements

Requirements for **each** component / service: (ordered by priority)

- [ ] Unit tests - Test proper behavior of individual component in isolation.
- [ ] Integration tests - Test proper behavior of multiple components operating in tandem.
- [ ] Documentation: Usage - Instruction on how end users can perform common tasks, manage their own data, use any piece of software necessary to fulfill their work responsibilities.
- [ ] Documentation: Management - Administrative capabilities provided by our deployed services should be documented such that routine tasks could be quickly completed by anyone with authorization to perform such changes.
- [ ] Documentation: Deployment - Steps necessary to deploy, update, re-deploy, etc. machines, configs, & services should be well-documented, so any future system administrator doesn't need to acquire specialized knowledge to repair anything that may break years from now.


Notes:

- Tests must be created before deployment to production...or at least before the removal of the LEFCON-administered equivalent.
- Documentation can be created whenever. I consider it a hard requirement for transition completion, but there are no components that depend on it, so it can be lowest priority and completed anytime after deployment.


