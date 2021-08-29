#!/usr/bin/env bash
# Copyright 2021 Dokyung Song. All rights reserved.
# Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.


QEMU=./build/qemu/install/bin/qemu-system-x86_64
KERNEL=./build/linux/csi2115_f21/arch/x86_64/boot/bzImage
IMAGE=./stretch.img

set -eux

$QEMU -smp 2 -m 256 \
	-kernel $KERNEL \
	-hda $IMAGE \
	-net nic -net user,hostfwd=tcp::10022-:22 \
	-append "root=/dev/sda console=ttyS0 earlyprintk=serial oops=panic panic_on_warn=1 panic=86400" \
	-nographic \
	-pidfile vm.pid \
	2>&1 | tee vm.log
