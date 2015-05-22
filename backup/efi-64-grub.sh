# Notes:
#     The EFI directory needs to be mounted at ~/mnt/esp.
#     The root of the system to be booted needs to be mounted at ~/rootfs.
#     This will only work for 64 bit processors.
#     Available targets are listed in /usr/lib/grub.
#     I think more can be installed.
#     I'm pretty sure I can boot the 32 bit Lubuntu like this but I don't
#     think I can boot both the 64 and 32 bit versions like this.
#     Maybe there is a way.
#
# TODO: Try to boot both 32 bit and 64 bit Lubuntus on 64 and 32 bit machines.
#       Or choose one or the other to boot on efi machines.
#       Or figure out how to chain load a boot loader if necessary to allow th
#       the option of booting either system.
sudo grub-install --efi-directory ~/mnt/esp --boot-directory ~/mnt/rootfs/boot --target x86_64-efi --removable /dev/sdb
