#!/bin/bash
# Expected env variables:
# CHROOT_DIR
# CDROOT_DIR
# Expected argument: <path to grub.cfg>

GRUB_CFG="${1}"
if [ -z "${GRUB_CFG}" ]; then
    echo "Invalid arguments" >&2
    exit 1
elif [ ! -f "${GRUB_CFG}" ]; then
    echo "${GRUB_CFG} does not exist" >&2
    exit 1
fi

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

echo >> "${GRUB_CFG}" || exit 1
"${ARGENT_MOLECULE_HOME}"/scripts/_generate_grub_langs.py >> "${GRUB_CFG}"
