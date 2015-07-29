#!/bin/bash

/usr/sbin/env-update
. /etc/profile

# Path to molecules.git dir
ARGENT_MOLECULE_HOME="${ARGENT_MOLECULE_HOME:-/argent}"
export ARGENT_MOLECULE_HOME

boot_dir="${CHROOT_DIR}/boot"
cdroot_boot_dir="${CDROOT_DIR}/boot"

kernels=( "${boot_dir}"/kernel-* )
# get the first one and see if it exists
kernel="${kernels[0]}"
#if [ ! -f "${kernel}" ]; then
#	echo "No kernels in ${boot_dir}" >&2
#	exit 1
#fi

initramfss=( "${boot_dir}"/initramfs-genkernel-* )
# get the first one and see if it exists
initramfs="${initramfss[0]}"
#if [ ! -f "${initramfs}" ]; then
#	echo "No initramfs in ${boot_dir}" >&2
#	exit 1
#fi

if [ $(uname -m) = "x86_64" ]; then
        cp "${ARGENT_MOLECULE_HOME}"/boot/argent_kernel/live-brrc "${cdroot_boot_dir}"/argent || exit 1
        cp "${ARGENT_MOLECULE_HOME}"/boot/argent_kernel/live-brrc.igz "${cdroot_boot_dir}"/argent.igz || exit 1
elif [ $(uname -m) = "i686" ]; then
        cp "${ARGENT_MOLECULE_HOME}"/boot/argent_kernel/live-brrc_x86 "${cdroot_boot_dir}"/argent || exit 1
        cp "${ARGENT_MOLECULE_HOME}"/boot/argent_kernel/live-brrc_x86.igz "${cdroot_boot_dir}"/argent.igz || exit 1
fi

# Write build info
build_date=$(date)
build_file="${CDROOT_DIR}"/BUILD_INFO
echo "Argent ISO image build information" > "${build_file}" || exit 1
echo "Built on: ${build_date}" >> "${build_file}" || exit 1

ver="${RELEASE_VERSION}"
isolinux_dest="${CDROOT_DIR}/isolinux/txt.cfg"
syslinux_dest="${CDROOT_DIR}/syslinux/txt.cfg"
isolinux_dest_txt="${CDROOT_DIR}/isolinux/isolinux.txt"
syslinux_dest_txt="${CDROOT_DIR}/syslinux/syslinux.txt"
grub_dest="${CDROOT_DIR}/boot/grub/grub.cfg"

for path in "${isolinux_dest}" "${isolinux_dest_txt}" "${syslinux_dest}" "${syslinux_dest_txt}" "${grub_dest}"; do
	sed -i "s/__VERSION__/${ver}/g" "${path}" || exit 1
	sed -i "s/__FLAVOUR__/${remaster_type}/g" "${path}" || exit 1
done

# Generate Language and Keyboard menus for GRUB-2
"${ARGENT_MOLECULE_HOME}"/scripts/make_grub_langs.sh "${grub_dest}" \
	|| exit 1

# generate EFI GRUB
"${ARGENT_MOLECULE_HOME}"/scripts/make_grub_efi.sh || exit 1

argent_pkgs_file="${CHROOT_DIR}/etc/argent-pkglist"
if [ -f "${argent_pkgs_file}" ]; then
	cp "${argent_pkgs_file}" "${CDROOT_DIR}/pkglist"
	if [ -n "${ISO_PATH}" ]; then # molecule 0.9.6 required
		# copy pkglist over to ISO path + pkglist
		cp "${argent_pkgs_file}" "${ISO_PATH}".pkglist
	fi
fi

# copy back.jpg to proper location
isolinux_img="${CHROOT_DIR}/usr/share/backgrounds/isolinux/back.jpg"
if [ -f "${isolinux_img}" ]; then
	cp "${isolinux_img}" "${CDROOT_DIR}/isolinux/" || exit 1
	cp "${isolinux_img}" "${CDROOT_DIR}/syslinux/"
fi

# Generate livecd.squashfs.md5
"${ARGENT_MOLECULE_HOME}"/scripts/pre_iso_script_livecd_hash.sh
