# Use abs path, otherwise daily builds automagic won't work
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/spinbase.common
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/amd64.common

# Release Version
# Keep this here, otherwise daily builds automagic won't work
release_version: 2

# Release Version string description
release_desc: amd64 SpinBase

# Source chroot directory, where files are pulled from
%env source_chroot: ${ARGENT_MOLECULE_HOME:-/argent}/sources/amd64_core-2015

%env destination_chroot: ${ARGENT_MOLECULE_HOME:-/argent}/chroots/default
%env inner_chroot_script: ${ARGENT_MOLECULE_HOME:-/argent}/scripts/inner_chroot_script.sh
%env destination_livecd_root: ${ARGENT_MOLECULE_HOME:-/argent}/chroots/default

# Destination ISO image name, call whatever you want.iso, not mandatory
# Keep this here and set, otherwise daily builds automagic won't work
%env destination_iso_image_name: Argent_Linux_2_amd64_SpinBase.iso
