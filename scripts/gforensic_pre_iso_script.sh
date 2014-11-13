#!/bin/bash

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

# Call parent script, generates ISOLINUX and other stuff
"${ARGENT_MOLECULE_HOME}"/scripts/generic_pre_iso_script.sh "Forensic"

GFORENSIC_DIR="${ARGENT_MOLECULE_HOME}/remaster/gforensic"
cp "${GFORENSIC_DIR}"/isolinux/back.jpg "${CDROOT_DIR}/isolinux/back.jpg"
