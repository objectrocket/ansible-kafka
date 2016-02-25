#!/bin/bash

VARS="${VARS} ANSIBLE_SCP_IF_SSH=y ANSIBLE_HOST_KEY_CHECKING=False"

RAX_CREDS_FILE=${RAX_CREDS_FILE:-"${HOME}/.raxpub"}
RAX_REGION=ALL

if [ -n "${RAX_CREDS_FILE}" ] && [ -f "${RAX_CREDS_FILE}" ]
then
  echo "Rackspace Cloud will be used."
  VARS="${VARS} RAX_CREDS_FILE=${RAX_CREDS_FILE}"
else
  echo "RAX_CREDS_FILE could not be found."
  echo "Exiting..."
  exit 1
fi

export $VARS
ansible-playbook -f 20 -i inventory/rax.py playbooks/kafka.yml
