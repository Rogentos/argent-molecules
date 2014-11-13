#!/bin/sh

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

PKGS_DIR="${ARGENT_MOLECULE_HOME}/pkgcache"
CHROOT_PKGS_DIR="${CHROOT_DIR}/var/lib/entropy/client/packages"

# load common stuff
. "${ARGENT_MOLECULE_HOME}"/scripts/remaster_post_common.sh

# make sure to not leak /proc
umount "${CHROOT_DIR}/proc" &> /dev/null
umount "${CHROOT_DIR}/proc" &> /dev/null
umount "${CHROOT_DIR}/proc" &> /dev/null

echo "Umounting bind to ${CHROOT_PKGS_DIR}"
umount "${CHROOT_PKGS_DIR}" || exit 1

exit 0
