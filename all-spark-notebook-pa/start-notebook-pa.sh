#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

if [[ ! -z "${JUPYTERHUB_API_TOKEN}" ]]; then
  # launched by JupyterHub, use single-user entrypoint
  exec /usr/local/bin/start-singleuser.sh $*
else
  #. /usr/local/bin/start.sh jupyter notebook $*
  . /usr/local/bin/start.sh jupyter notebook \
  --port=${JPY_PORT:-8888} \
  --ip=0.0.0.0 \
  --user=$JPY_USER \
  --allow-root \
  --NotebookApp.iopub_data_rate_limit=2147483647 \
  ${notebook_arg} \
  $@
fi
