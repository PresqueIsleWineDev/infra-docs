# Expected Costs

Recurring costs are expected to be reduced significantly through this transition,
as many tasks will be taken away from external IT to be handled internally.

Expected savings will be piecemeal as externally provided services is reduced.

## Azure Kubernetes Service

Main cost is determined by computational usage.
Secondary cost is determined by data storage usage.
Neither can be fully determined until we have software running on it and data stored on it.

Intentions are to use this as an always-on replica for services running locally.
This will minimize computational costs while leaving us with a reliable backup when internally running processes have downtime.

## External IT

Some cost may be incurred by asking external IT to make changes I cannot complete during the transitional period.
I would like to handle most responsibilities in this transition,
and will take on as much of the load as possible,
but some tasks will require changes to setups I don't yet control.

- [ ] TODO: Find out how this billing is determined.

## Azure Active Directory

We may determine we would like to jump from the free tier of AAD to the `Premium P1` plan,
which costs $6 per user monthly.

We have 47 current users, most unnecessary, so we will absolutely want to reduce them if we go this route.

- [ ] TODO: Link other document here.

## Microsoft 365 licensing

We may determine that the best route forward is to migrate our existing Azure resources from external IT ownership to an acccount owned by PIWC.

Licenses are paid monthly, but require a year of commitment upon purchase.
We pay for licenses to External IT, and they pay Microsoft, so that commitment shouldn't apply to our existing licenses.

Unknown if External IT owned licenses will cleanly transfer to new account.

Expect to incur one additional month's worth of license subscription.

