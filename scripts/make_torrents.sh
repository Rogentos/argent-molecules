#!/bin/bash

/usr/sbin/env-update
. /etc/profile

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

announce_url="http://torrents.argent.org:8082/announce"
iso_dirs=(
	"${ARGENT_MOLECULE_HOME}/iso"
	"${ARGENT_MOLECULE_HOME}/images"
)

for iso_dir in "${iso_dirs[@]}"; do
	cd "${iso_dir}" || exit 1

	for iso_file in "${iso_dir}"/*.{iso,tar.gz,tar.xz}; do
		iso_name="${iso_file/.iso}"
		iso_name="${iso_name/.tar.gz}"
		iso_name="${iso_name/.tar.xz}"

		# do not make torrents for DAILY iso images
		is_daily=$(echo ${iso_name} | grep DAILY)
		if [ -n "${is_daily}" ]; then
			continue
		fi

		torrent_file="${iso_file}.torrent"
		[[ -f "${torrent_file}" ]] && rm "${torrent_file}"
		iso_file_name="$(basename ${iso_file})"
		echo "Cooking ${iso_file_name}"
		mktorrent-borg -pub -nd -a "${announce_url}" -n "${iso_name}" -o "${torrent_file}" "${iso_file_name}" || exit 1
	done
done
