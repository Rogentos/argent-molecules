%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/armv7-base.common
%env %import ${ARGENT_MOLECULE_HOME:-/argent}/molecules/beaglebone.common

# Release desc (the actual release description)
release_desc: armv7l BeagleBone

# Release Version (used to generate release_file)
%env release_version: ${ARGENT_RELEASE:-11}

# Specify image file name (image file name will be automatically
# produced otherwise)
%env image_name: Argent_Linux_${ARGENT_RELEASE:-11}_armv7l_BeagleBone_Base_4GB.img

# Specify the image file size in Megabytes. This is mandatory.
# To avoid runtime failure, make sure the image is large enough to fit your
# chroot data.
image_mb: 3800

# Path to boot partition data (MLO, u-boot.img etc)
%env source_boot_directory: ${ARGENT_MOLECULE_HOME:-/argent}/boot/arm/beaglebone

# External script that will generate the image file.
# The same can be copied onto a MMC by using dd
%env image_generator_script: ${ARGENT_MOLECULE_HOME:-/argent}/scripts/beaglebone_image_generator_script.sh am335x-bone.dtb
