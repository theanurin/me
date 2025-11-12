# Cubietruck powered by Gentoo



```shell
cd
git clone --depth 1 --branch v2023.04 https://source.denx.de/u-boot/u-boot.git
cd ~/u-boot

make Cubietruck_defconfig
make menuconfig
make "-j$(nproc)"
...
```

```shell
docker run \
  --rm \
  --interactive \
  --tty \
  --platform=linux/arm/v7 \
  --volume $PWD/.uboot-build:/build \
  --entrypoint /bin/bash \
  ghcr.io/osfordev/preboot/toolchain/arm32v7:5.15.147

cd /opt/u-boot/
# See list of defconfig in /opt/u-boot/configs
make O=/build Cubietruck_defconfig

#
# Set CONFIG_DEFAULT_FDT_FILE=sun7i-a20-cubietruck.dtb
#
# Enable CONFIG_CMD_DATE (not working on v2023.04 via image 5.15.147)
#  /opt/u-boot/cmd/date.c:57:21: error: 'CFG_SYS_RTC_BUS_NUM' undeclared (first use in this function); did you mean 'CONFIG_SYS_SPD_BUS_NUM'?
#
# Enable CONFIG_CMD_SLEEP, CONFIG_CMD_PAUSE
#
# Enable CONFIG_CMD_SOUND
#   Unfortunately, Cubietruck does not have beeper
#
# CONFIG_BOOTDELAY=5
# Enable CONFIG_BOOT_RETRY
# Set CONFIG_BOOT_RETRY_TIME=30
# Set CONFIG_BOOT_RETRY_MIN=3
# Enable CONFIG_RESET_TO_RETRY
#
./scripts/config --file /build/.config --set-str DEFAULT_FDT_FILE sun7i-a20-cubietruck.dtb
./scripts/config --file /build/.config --enable "CMD_PAUSE"
./scripts/config --file /build/.config --enable "CMD_SLEEP"
./scripts/config --file /build/.config --set-val BOOTDELAY 5
./scripts/config --file /build/.config --enable "BOOT_RETRY"
./scripts/config --file /build/.config --set-val BOOT_RETRY_TIME 30
./scripts/config --file /build/.config --set-val BOOT_RETRY_MIN 5
./scripts/config --file /build/.config --enable "RESET_TO_RETRY"


make O=/build menuconfig
make "-j$(nproc)" O=/build

cat <<'EOF' > /build/boot.cmd
# перетворюється в boot.scr через mkimage
#   /build/tools/mkimage -A arm -T script -d /build/boot.cmd /build/boot.scr
#

printenv -a
sleep 10
#pause 'Prompt for pause...'

setenv bootargs console=ttyS0,115200 console=tty0 panic=10 rootfstype=ext4 rootflags=discard root=/dev/sda1 rootwait
load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} /uImage
bootm ${kernel_addr_r}
EOF

cat <<'EOF' > /build/boot.cmd
setenv bootargs console=ttyS0,115200 console=tty0 panic=10 rootfstype=ext4 rootflags=discard root=/dev/sda1 rootwait ${extra}
setenv bootargs console=ttyS0,115200 console=tty0 hdmi.audio=EDID:0 disp.screen0_output_mode=EDID:1920x1080p60 panic=10 rootfstype=ext4 rootflags=discard root=/dev/sda1 rootwait
load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} /uImage
bootm ${kernel_addr_r}
EOF
/build/tools/mkimage -A arm -T script -d /build/boot.cmd /build/boot.scr
dd if=/tmp/u-boot-sunxi-with-spl.bin of=/dev/sdb bs=1k seek=8 conv=notrunc


make "-j$(nproc)" O=/build
[  ! -d /build ] && mkdir /build
cp /cache/u-boot/u-boot-sunxi-with-spl.bin /build/u-boot-sunxi-with-spl.bin

cat <<'EOF' > /build/boot.cmd
setenv bootargs console=ttyS0,115200 console=tty0 earlyprintk panic=10 ${extra}
load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} /${fdtfile}
load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} /zImage
load ${devtype} ${devnum}:${distro_bootpart} ${ramdisk_addr_r} /initramfs.cpio.gz
bootz ${kernel_addr_r} ${ramdisk_addr_r}:${filesize} ${fdt_addr_r}
EOF
/build/tools/mkimage -A arm -T script -d /build/boot.cmd /build/boot.scr


SD_CARD_DEV=/dev/sdb
dd if=/build/u-boot-sunxi-with-spl.bin of="${SD_CARD_DEV}" bs=1024 seek=8 conv=notrunc

uboot.env
```

- https://archlinuxarm.org/platforms/armv7/allwinner/cubietruck
- https://linux-sunxi.org/U-Boot
- https://linux-sunxi.org/Cubieboard/Installing_on_NAND
- https://guillaumeplayground.net/mele-a2000-headless-debian-wheezy-armhf-with-nand-install-v1/
- https://code.google.com/archive/p/cubieboard/downloads
- http://blog.anurin.name/2015/03/cubietruck-gentoo-installation.html
