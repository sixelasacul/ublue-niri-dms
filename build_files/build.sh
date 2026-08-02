#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Can't use DankInstall from here, so running the installation manually
dnf5 copr enable avengemedia/danklinux -y
# uses danksearch instead of dsearch as it is not found, idky
dnf5 install niri dms dgop danksearch dms-greeter -y

systemctl enable dms
systemctl add-wants niri.service dms
systemctl disable gdm lightdm sddm
systemctl enable greetd

# note: could use this build to install all my stuff across systems
# like zed, zen, bitwarden, localsend, via, etc.
