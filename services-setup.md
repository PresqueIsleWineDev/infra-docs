# Services: Setup & Configuration

For a list of services I will need to configure and deploy, see [Services: List](./plan_transition_services-list.md)

## Containerized Services

- Containers are runtime environments where your software runs.
- Kubernetes runs containers.
- Most popular services have pre-built containers available to the public.

- Some services come with super convenient Kubernetes manifest templates called Helm charts.
  - Configuring services packaged this way is very simple, just set the options
  - Most Kubernetes architectural components and very popular services have a Helm chart.

- Other services require creating Kubernetes manifests for running its container, make accessible to the outsite, assigning storage space, keeping secret data & keys private, and more.
  - Plenty of templates exist for doing this.
  - Initial manifests will take longer than ones created after because reusing existing manifests is easier than creating new ones from scratch.
  - This will be the case for most user-facing services.


## Other Services

Very few services that we need to run will not have a pre-built container available.

Some services I expect to have to manually build a container for:

- Infor FACTS server
- Intuit QuickBooks server

I have not verified if every service I intend on running has a container yet.

For any service that does not have a pre-built container publicly available, I must:

1. Create a container manifest for that service
2. Built the container image from the manifest
3. Deploy the built container image to a container registry.


## Service Requirements

Overall requirements:

- [ ] Production environment            - Environment where software services are active & accesible to end users. Services running here must be stable, well-tested, and known to be working. I intend on sending out company-wide emails prior to rolling out any significant changes to the production environment.
- [ ] Testing environment               - Environment where software services go though a period of testing before being pushed out to the production environment. Services running in this environment should mirror the production environment & get pushed to production once all tests are complete & passing.
- [ ] Development environment           - Environment where software services repeatedly get deployed, taken down, iterated upon, and debugged. Services running in this environment will be insecure, and may not integrate with other components yet.

Requirements for **each** component / service: (ordered by priority)

- [ ] Tests: Unit               - Test proper behavior of individual component in isolation.
- [ ] Tests: Integration        - Test proper behavior of multiple components operating in tandem.
- [ ] Documentation: Usage      - Instruction on how end users can perform common tasks, manage their own data, use any piece of software necessary to fulfill their work responsibilities.
- [ ] Documentation: Management - Administrative capabilities provided by our deployed services should be documented such that routine tasks could be quickly completed by anyone with authorization to perform such changes.
- [ ] Documentation: Deployment - Steps necessary to deploy, update, re-deploy, etc. machines, configs, & services should be well-documented, so any future system administrator doesn't need to acquire specialized knowledge to repair anything that may break years from now.


Notes:

- Tests must be created before deployment to production...or at least before the removal of the LEFCON-administered equivalent.
- Documentation can be created whenever. I consider it a hard requirement for transition completion, but there are no components that depend on it, so it can be lowest priority and completed anytime after deployment.


