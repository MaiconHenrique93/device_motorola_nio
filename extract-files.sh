#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/com.qti.feature2.gs.so | vendor/lib64/com.qti.feature2.rt.so)
            [ "$2" = "" ] && return 0
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        *)
            blob_fixup_common "$@"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=nio
export DEVICE_COMMON=sm8250-common
export VENDOR=motorola
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
