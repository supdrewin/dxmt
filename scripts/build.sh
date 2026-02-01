#!/bin/zsh

meson setup build/win64 --cross-file build-win64.txt --buildtype release --prefix $(pwd)/.local --strip -Dwine_install_path=wine -Dwine_builtin_dll=false -Dcpp_args='-pipe -march=native'
meson setup build/win32 --cross-file build-win32.txt --buildtype release --prefix $(pwd)/.local --strip -Dwine_install_path=wine -Dwine_builtin_dll=false -Dcpp_args=-pipe

meson compile -C build/win64 -j$(sysctl -n hw.ncpu 2>/dev/null)
meson compile -C build/win32 -j$(sysctl -n hw.ncpu 2>/dev/null)

meson install -C build/win64 --tags runtime --no-rebuild
meson install -C build/win32 --tags runtime --no-rebuild
