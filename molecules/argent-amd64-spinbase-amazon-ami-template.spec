# Use abs path, otherwise daily builds automagic won't work
# For further documentation, see the file above:
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/spinbase-amazon-ami-image-template.common

# pre chroot command, example, for 32bit chroots on 64bit system, you always
# have to append "linux32" this is useful for inner_chroot_script
# prechroot:

# Path to source ISO file (MANDATORY)
%env source_iso: ${ARGENT_MOLECULE_HOME:-/argent}/iso/Argent_Linux_${ISO_TAG:-DAILY}_amd64_SpinBase.iso

%env release_version: ${ARGENT_RELEASE:-11}
%env image_name: Argent_Linux_SpinBase_${ARGENT_RELEASE:-11}_amd64_ami.img
