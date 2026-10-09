#!/usr/bin/env bash

set -eoux pipefail

#dnf -y install intel-media-driver

# some bullshit to get nbfc working past 44
#dnf install -y --allowerasing \
#    lua5.4-libs \
#    openssl3-devel \
#    openssl3-libs

#dnf remove -y \
#    dms \
#    niri

# packages
dnf -y install \
    android-tools \
    mangohud \
    intel-lpmd \
    https://github.com/nbfc-linux/nbfc-linux/releases/download/0.5.3/fedora-44-nbfc-linux-0.5.3-1.x86_64.rpm

# copr
dnf copr enable -y bieszczaders/kernel-cachyos-addons
dnf copr enable -y yalter/niri-git
dnf copr enable -y avengemedia/dms-git
dnf copr enable -y avengemedia/danklinux

echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:avengemedia:danklinux.repo

# Adds required package for the scheduler
dnf install -y \
    --enablerepo="copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons" \
    --allowerasing \
    libcap-ng-devel procps-ng-devel scx-scheds-git scx-tools-git scx-manager

#dnf install -y \
#    --enablerepo="copr:copr.fedorainfracloud.org:yalter:niri-git" \
#    --allowerasing \
#    --setopt install_weak_deps=false \
#    niri \
#    swaybg

dnf update -y --refresh --allowerasing

#dnf install -y \
#    --enablerepo="copr:copr.fedorainfracloud.org:avengemedia:dms-git" \
#    --allowerasing \
#    dms

dnf install -y \
    --enablerepo="copr:copr.fedorainfracloud.org:avengemedia:danklinux" \
    --allowerasing \
    dankcalendar-git \
    dms-greeter-git \
    quickshell-git

dnf copr disable -y bieszczaders/kernel-cachyos-addons
dnf copr disable -y yalter/niri-git
dnf copr disable -y avengemedia/dms-git
dnf copr disable -y avengemedia/danklinux
