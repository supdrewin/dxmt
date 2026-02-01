#!/bin/zsh

set -x

cp .local/x86_64-unix/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/x86_64-unix
cp .local/x86_64-windows/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/x86_64-windows
cp .local/i386-windows/* $CROSSOVER_APP/Contents/SharedSupport/CrossOver/lib/wine/i386-windows

find /Volumes/Data/Bottles -type d -d 1 -print0 | while read -d '' bottle
do
    cp .local/x86_64-windows/* $bottle/drive_c/windows/system32
    cp .local/system32/* $bottle/drive_c/windows/system32
    cp .local/i386-windows/* $bottle/drive_c/windows/syswow64
    cp .local/syswow64/* $bottle/drive_c/windows/syswow64
done
