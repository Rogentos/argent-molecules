#!/bin/bash

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME
export MAKE_TORRENTS="1"

ARGENT_RELEASE="${1}"
if [ -z "${ARGENT_RELEASE}" ]; then
	echo "${0} <release version>" >&2
	exit 1
fi
shift

export ARGENT_RELEASE
exec "${ARGENT_MOLECULE_HOME}"/scripts/iso_build.sh "release" "$@"
