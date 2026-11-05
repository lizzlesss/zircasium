#!/usr/bin/env bash

set -eoux pipefail

# some bullshit to get nbfc working past 44
dnf install -y --allowerasing \
    lua5.4-libs \
    openssl3-devel \
    openssl3-libs

# packages
dnf -y install \
    android-tools \
    intel-lpmd \
    https://github.com/nbfc-linux/nbfc-linux/releases/download/0.5.4/fedora-44-nbfc-linux-0.5.4-1.x86_64.rpm
