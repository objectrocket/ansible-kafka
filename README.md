ansible-kafka
---------
This is an Ansible module that deploys a Kafka cluster with Zookeeper.

### Requirements
- Requires Ansible 1.8 or newer

- Expects CentOS/RHEL 6.x hosts

- Building the cloud environment requires the `pyrax` Python module: https://github.com/rackspace/pyrax

  Also recommended is to run `pip install oslo.config netifaces`.

- The cloud environment requires the standard pyrax credentials file that looks like this:
  ````
  [rackspace_cloud]
  username = my_username
  api_key = 01234567890abcdef
  ````
  
  This file will be referenced in `playbooks/group_vars/all` (the `rax_credentials_file` variable).

  By default, the file is expected to be: `~/.raxpub`

### Configuration files

To customize, change the variables under `playbooks/group_vars` and `playbooks/roles` folders:

1. **playbooks/group_vars/all**: contains global cluster and cloud settings
1. **playbooks/group_vars/kafka-nodes**: kafka-nodes general configuration settings
1. **playbooks/roles/zookeeper/defaults/main.yml**: Zookeeper specific settings
1. **playbooks/roles/kafka/defaults/main.yml**: Kafka specific settings

For a one-node cluster, set `cloud_nodes_count` in `playbooks/group_vars/kafka-nodes` to 1.

## Scripts

To provision a cloud environment, run the `provision_rax.sh` script after you've customized the variables under group_vars:
````
bash provision_rax.sh
````
Similarly, run the one of the `kafka_*.sh` scripts, depending what type of environment you have.

Example for a cloud environment:
````
bash kafka_rax.sh
````
For dedicated / prebuilt environments, you'll need to manually add the nodes in the `inventory/static` file.

