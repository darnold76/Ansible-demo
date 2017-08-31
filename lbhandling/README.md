# Load Balancer Handling

This is a simple playbook illustrating the ability of Ansible to work with multiple hosts at the same time on the same automation. If a configuration change is detected with Apache, the host is removed from a load balancer before restarting Apache. Afterwards, it is then added back into the load balancer pool.
