#!/usr/bin/env sh
GRUB_SRC="../include/grub.cfg"
if grub-file --is-x86-multiboot ArtOS.bin; then
  if test -f $GRUB_SRC; then
    echo multiboot confirmed
    mkdir -p isodir/boot/grub
    cp ArtOS.bin isodir/boot/ArtOS.bin
    cp $GRUB_SRC isodir/boot/grub/grub.cfg
    grub-mkrescue -o ArtOS.iso isodir
    rm -rf isodir
  else
    echo could not find grub config
  fi
else
  echo the file is not multiboot
fi
