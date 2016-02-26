ansible-kafka
---------
This Ansible playbook will build a Kafka cluster with Zookeeper.

You can pre-build a Rackspace cloud environment or run the playbook against an existing environment.

---

## [Installation] (id:installation)

See [INSTALL.md](../master/INSTALL.md) for installation and build instructions.


## [Requirements] (id:requirements)

- Ansible >= 2.0.

- Expects RHEL/CentOS 6/7 or Ubuntu 14 hosts.

- Building the Rackspace Cloud environment requires the `pyrax` Python module: [pyrax link](https://github.com/rackspace/pyrax).


## [Features] (id:features)

- It installs Zookeeper for Kafka (Zookeeper is installed on the first 3 nodes only).

- It supports static inventory if the environment is pre-built (`inventory/static` file).

- The `id` is automatically set (on the inventory items in alphabetical order).

- The data drives can be customized and can be put on top of Rackspace Cloud Block Storage.

- It includes init scripts for both Zookeeper and Kafka.


## [Inventory] (id:inventory)

- The cloud environment requires the standard `pyrax` credentials file that looks like this:
  ````
  [rackspace_cloud]
  username = my_username
  api_key = 01234567890abcdef
  ````
  
  This file will be referenced in the `RAX_CREDS_FILE` environment variable.

  By default, the file is expected to be: `~/.raxpub`.

- When provisioning Kafka on existing infrastructure edit `inventory/static` and add the nodes.


## [Configuration] (id:configuration)

To customize, change the variables under `playbooks/group_vars` and `playbooks/roles` folders:

1. **playbooks/group_vars/all**: contains cluster and cloud settings
1. **playbooks/roles/zookeeper/defaults/main.yml**: Zookeeper specific settings
1. **playbooks/roles/kafka/defaults/main.yml**: Kafka specific settings

For a one-node cluster, set `nodes_count` in `playbooks/group_vars/all` to 1.


## [Scripts] (id:scripts)

To provision a Rackspace Cloud environment, run the `provision_rax.sh` script after you've customized the variables:
````
bash provision_rax.sh
````

Similarly, run the one of the `kafka_*.sh` scripts, depending what type of environment you have.

- For a Rackspace Cloud environment:
  ````
  bash kafka_rax.sh
  ````

- For static / prebuilt environments:
  ````
  bash kafka_static.sh
  ````
