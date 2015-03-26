kafka-poc - deploys a Kafka cluster with a Rackspace Cloud Big Data Spark cluster
---------

This is an example of how a Kafka cluster can be built and configured.
It also builds a Rackspace Cloud Big Data Spark cluster and configures iptables to allow the two to communicate.

As a prerequisite, the python-lavaclient module for Cloud Big Data has to be installed: http://docs.rackspace.com/cbd/api/v1.0/cbd-getting-started/content/installing_Client.html

It uses the standard pyrax credentials file that looks like:
````
[rackspace_cloud]
username = my_username
api_key = 01234567890abcdef
````

Customization can be done by changing the variables in the inventory file.

#### Example run:
````
ansible-playbook -i inventory site.yml
````

#### The Cloud Big Data build can be skipped if only a Kafka cluster is required:

````
ansible-playbook -i inventory site.yml  --skip-tags "cbd"
````