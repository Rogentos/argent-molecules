#!/bin/sh

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

exec "${ARGENT_MOLECULE_HOME}"/scripts/mkloopcard.sh "${ARGENT_MOLECULE_HOME}"/scripts/mkloopcard_beagleboard_chroot_hook.sh "$@"