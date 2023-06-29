# Replacement Tentative Plans

All existing hardware will remain in use.

New software infrastructure will be built in parallel to existing and run on hardware dedicated to testing the software.

Existing infrastructure will remain as-is until replacement is configured, tested, and fully capable of handling all aspects covered by current implementation.


When new software component of infrastructure is ready for use,
we can either deploy it on new hardware or deploy after all other components to be run on same hardware are all finalized.

Data backups of all existing infrastructure will be created prior to deployment.

Main server will be most challenging to replace because of the broad scope of software components it is running.
Main server also has unique disk configuration (RAID array).
This configuration will not be able to be replicated on alternative hardware or tested using it,
so extreme care must be taken to guarantee that new configurations will work as intended on that specific setup.
Deployment will **absolutely** require substantial downtime,
so it should begin at the end of the work day on a Friday while no one's work can be disrupted,
and there is significant time to debug any issues during deployment.
I will likely want someone from the office to come in and test their workflow once deployment appears to be working as intended on my end,
so that any kinks in critical workflows can be discovered, if any.

