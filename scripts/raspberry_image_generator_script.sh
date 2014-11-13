#!/bin/sh

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

# sigh vfat
export BOOT_PART_TYPE_INSIDE_ROOT="1"

exec "${ARGENT_MOLECULE_HOME}"/scripts/mkloopcard.sh "${ARGENT_MOLECULE_HOME}"/scripts/mkloopcard_raspberry_chroot_hook.sh "${@}"
