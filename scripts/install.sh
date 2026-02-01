#!/bin/bash

set -x

cp .local/x86_64-unix/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/x86_64-unix
cp .local/x86_64-windows/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/x86_64-windows
cp .local/i386-windows/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/i386-windows

for bottle in $(find /Volumes/Data/Bottles -type d -d 1)
do
    cp .local/x86_64-windows/* $bottle/drive_c/windows/system32
    cp .local/system32/* $bottle/drive_c/windows/system32
    cp .local/i386-windows/* $bottle/drive_c/windows/syswow64
    cp .local/syswow64/* $bottle/drive_c/windows/syswow64
done
