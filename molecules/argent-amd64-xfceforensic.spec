# Use abs path, otherwise daily builds automagic won't work
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/forensicxfce.common
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/amd64.common

# Release Version
%env release_version: ${ARGENT_RELEASE:-11}

# Release Version string description
release_desc: amd64 ForensicsXfce

# Path to source ISO file (MANDATORY)
%env source_iso: ${ARGENT_MOLECULE_HOME:-/argent}/iso/Argent_Linux_${ISO_TAG:-DAILY}_amd64_Xfce.iso

destination_iso_image_name: Argent_Linux_DAILY_amd64_ForensicsXfce.iso
