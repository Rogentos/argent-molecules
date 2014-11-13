# Use abs path, otherwise daily builds automagic won't work
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/kde.common
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/amd64.common

# Release Version
%env release_version: ${ARGENT_RELEASE:-11}

# Release Version string description
release_desc: amd64 KDE

# Path to source ISO file (MANDATORY)
%env source_iso: ${ARGENT_MOLECULE_HOME:-/argent}/iso/Argent_Linux_${ISO_TAG:-DAILY}_amd64_SpinBase.iso

# Destination ISO image name, call whatever you want.iso, not mandatory
%env destination_iso_image_name: Argent_Linux_${ARGENT_RELEASE:-11}_amd64_KDE.iso
