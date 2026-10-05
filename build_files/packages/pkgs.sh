#!/usr/bin/env bash

set -eoux pipefail

#dnf -y install intel-media-driver

# some bullshit to get nbfc working past 44
#dnf install -y --allowerasing \
#    lua5.4-libs \
#    openssl3-devel \
#    openssl3-libs

# packages
dnf -y install \
    android-tools \
    intel-lpmd \
    https://github.com/nbfc-linux/nbfc-linux/releases/download/0.5.3/fedora-44-nbfc-linux-0.5.3-1.x86_64.rpm
    #mangohud \

# copr
dnf copr enable -y bieszczaders/kernel-cachyos-addons

# Adds required package for the scheduler
dnf install -y \
    --enablerepo="copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons" \
    --allowerasing \
    libcap-ng-devel procps-ng-devel scx-scheds-git scx-tools-git scx-manager

dnf -y copr disable bieszczaders/kernel-cachyos-addons
