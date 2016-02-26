#!/bin/bash

RAX_CREDS_FILE=${RAX_CREDS_FILE:-"${HOME}/.raxpub"}
RAX_REGION=ALL

if [ -n "${RAX_CREDS_FILE}" ] && [ -f "${RAX_CREDS_FILE}" ]
then
  echo "Rackspace Cloud will be used."
  EXTRA_VARS="${EXTRA_VARS} credentials_file=$RAX_CREDS_FILE"
else
  echo "RAX_CREDS_FILE could not be found."
  echo "Exiting..."
  exit 1
fi

ansible-playbook -i inventory/localhost -e "$EXTRA_VARS" playbooks/provision_rax.yml
