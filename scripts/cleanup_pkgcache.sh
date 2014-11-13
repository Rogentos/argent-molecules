#!/bin/sh
# Remove tarballs not accessed in the last 30 days
# concurrency wrt scripts is handled in crontab

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"

DIR="${ARGENT_MOLECULE_HOME}/pkgcache"
find "${DIR}" -atime +30 -type f -delete
