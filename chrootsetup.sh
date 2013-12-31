#!/bin/bash

# Mounting Files
printf "\e[01;32mMounting...\n\e[00m"
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
export HOME=/root
export LC_ALL=C

# Update Sources List
printf "\e[01;32mUpdating Current Programs...\n\e[00m"
apt-get update

# Upgrade Programs
printf "\e[01;32mUpgrading Current Packages...\n\e[00m"
apt-get upgrade --yes

# Installing Programs
printf "e[01;32mInstalling Chromium Browser\ne[00m"
apt-get install --yes chromium-browser preload bleachbit


rm /var/lib/dbus/machine-id

rm /sbin/initctl

apt-get autoremove --yes
apt-get clean

rm -rf /tmp/*
rm -rf /root/*

rm /etc/hosts
rm -rf /tmp/* ~/.bash_history
rm /etc/resolv.conf
rm /var/lib/dbus/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl

umount -lf /proc
umount -lf /sys
umount -lf /dev/pts
exit
