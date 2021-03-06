#!/bin/bash

# Being at xenorasp dir...
cd xenorasp/patches

# Apply the patches
# Apply pre-patch to the arm patch... this is not very clean I've read, but works!
patch -Np1 ipipe-core-3.10.18-arm-1.patch rpi-ipipe-core-3.10.34-arm-1.patch

cd ..
# Apply xenomai ipipe core patch
xenomai-head/scripts/prepare-kernel.sh --arch=arm --linux=linux-rpi-3.10.y --adeos=patches/ipipe-core-3.10.18-arm-1.patch

# Apply post-patch
cd linux-rpi-3.10.y; patch -Np1 < ../patches/ipipe-core-3.10.34-arm-raspberry-post-1.patch
