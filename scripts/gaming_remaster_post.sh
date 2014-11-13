#!/bin/sh

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

# execute parent script
"${ARGENT_MOLECULE_HOME}"/scripts/remaster_post.sh "$@"

# Christmas TIME !
GAMING_XMAS_DIR="${ARGENT_MOLECULE_HOME}/remaster/gaming-xmas"
cp "${GAMING_XMAS_DIR}"/argentlinux.png "${CHROOT_DIR}/usr/share/backgrounds/argentlinux.png"
cp "${GAMING_XMAS_DIR}"/argentlinux.jpg "${CHROOT_DIR}/usr/share/backgrounds/argentlinux.jpg"
cp "${GAMING_XMAS_DIR}"/argentlinux.jpg "${CHROOT_DIR}/usr/share/backgrounds/kgdm.jpg"
