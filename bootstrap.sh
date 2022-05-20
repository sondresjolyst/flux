#!/bin/bash
#
# Normal usage
# LOCALCLUSTER_ENV=./localcluster.env ./bootstrap.sh
#

##########################################################
### Required inputs
##########################################################

if [[ -z "$LOCALCLUSTER_ENV" ]]; then
    echo "ERROR: Please provide LOCALCLUSTER_ENV" >&2
    exit 1
else
    if [[ ! -f "$LOCALCLUSTER_ENV" ]]; then
        echo "ERROR: LOCALCLUSTER_ENV=$LOCALCLUSTER_ENV is invalid, the file does not exist." >&2
        exit 1
    fi
    source "$LOCALCLUSTER_ENV"
fi

##########################################################
### Installation
##########################################################

echo "Starting installation of Flux..."

flux bootstrap github \
  --owner="$GITHUB_USER" \
  --repository="$GIT_REPO" \
  --branch="$GIT_BRANCH" \
  --path="$GIT_DIR" \
  --version="$FLUX_VERSION" \
  --personal
