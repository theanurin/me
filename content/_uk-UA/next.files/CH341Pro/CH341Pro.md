# CH341 Pro

https://www.flashrom.org/dev_guide/building_from_source.html

git clone "https://review.coreboot.org/flashrom"
meson setup builddir
meson compile -C builddir
meson test -C builddir

./builddir/flashrom --programmer ch341a_spi --chip "GD25Q128C" --read   ~/device-bak.bin
./builddir/flashrom --programmer ch341a_spi --chip "GD25Q128C" --write  ~/device.bin
./builddir/flashrom --programmer ch341a_spi --chip "GD25Q128C" --verify ~/device.bin
