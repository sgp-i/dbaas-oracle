# ansible-dbaas
Ansible Repository for DBaaS playbooks for Oracle servers

## Running the Oracle Playbooks
The Oracle playbooks follow a pattern of using Roles to accomplish the actual tasks while the playbooks themselves simple override certain variables.  

The playbooks all use a variable "host" for the host directive.  Thus, you should use "extra_vars" to pass in the host.  This could be either a group within an inventory (e.g. `--extra-vars "host=oracle"`) or a list of server names, comma-deliminated (e.g. `--extra-vars "host=server1.domain,server2.domain`).

If any other variables need to be passed in, those will be noted in the playbook.  Also, anything in the 'defaults' of a role can be easily overridden by passing in variables as well.
