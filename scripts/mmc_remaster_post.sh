#!/bin/sh

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

PKGS_DIR="${ARGENT_MOLECULE_HOME}/pkgcache"
CHROOT_PKGS_DIR="${CHROOT_DIR}/var/lib/entropy/client/packages"

# remove entropy hwash
rm -f "${CHROOT_DIR}"/etc/entropy/.hw.hash
# remove entropy pid file
rm -f "${CHROOT_DIR}"/var/run/entropy/entropy.lock

echo "Umounting bind to ${CHROOT_PKGS_DIR}"
umount "${CHROOT_PKGS_DIR}" || exit 1

exit 0
