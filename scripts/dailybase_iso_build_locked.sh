#!/bin/sh

ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"

exec "${ARGENT_MOLECULE_HOME}/scripts/iso_build_locked.sh" "dailybase_iso_build.sh"
