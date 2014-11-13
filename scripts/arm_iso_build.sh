#!/bin/bash

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

exec "${ARGENT_MOLECULE_HOME}"/scripts/iso_build.sh "arm" "$@"
