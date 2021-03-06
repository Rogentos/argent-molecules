#!/bin/sh

if [ -z "${1}" ]; then
    echo "${0} <build script name>" >&2
    exit 1
fi

BUILD_SCRIPT_NAME="${1}"
shift

ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
. "${ARGENT_MOLECULE_HOME}/scripts/iso_build.include"

# Pull new data from Git
(
    flock --timeout ${LOCK_TIMEOUT} -x 9
    if [ "${?}" != "0" ]; then
        echo "[git pull] cannot acquire lock, stale process holding it?" >&2
    fi
    cd /argent && git pull --quiet
) 9> "/tmp/.iso_build_locked.sh.git-pull.lock"

# Execute build
(
    flock --timeout ${LOCK_TIMEOUT} -x 9
    if [ "${?}" != "0" ]; then
        echo "[build] cannot acquire lock, stale process holding it?" >&2
    fi

    "${ARGENT_MOLECULE_HOME}/scripts/${BUILD_SCRIPT_NAME}" "${@}"

) 9> "/tmp/.iso_build_locked.sh.${BUILD_SCRIPT_NAME}.lock"

exit ${?}
