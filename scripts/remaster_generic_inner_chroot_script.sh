#!/bin/sh

/usr/sbin/env-update
. /etc/profile

# make sure there is no stale pid file around that prevents entropy from running
rm -f /var/run/entropy/entropy.lock

# disable all mirrors but GARR
for repo_conf in /etc/entropy/repositories.conf.d/entropy_*; do
	# skip .example files
	if [[ "${repo_conf}" =~ .*\.example$ ]]; then
		echo "skipping ${repo_conf}"
		continue
	fi
	sed -n -e "/^pkg = .*pkg.argent.org/p" -e "/^repo = .*pkg.argent.org/p" \
		-e "/garr.it/p" -e "/^\[.*\]$/p" -i "${repo_conf}"

	# replace pkg.argent.org with pkg.repo.argent.org to improve
	# build server locality
	sed -i "s;http://pkg.argent.org;http://pkg.repo.argent.org;g" "${repo_conf}"
done

export FORCE_EAPI=2
updated=0
for ((i=0; i < 42; i++)); do
	equo update && {
		updated=1;
		break;
	}
	if [ ${i} -gt 6 ]; then
		sleep 3600 || exit 1
	else
		sleep 1200 || exit 1
	fi
done
if [ "${updated}" = "0" ]; then
	exit 1
fi