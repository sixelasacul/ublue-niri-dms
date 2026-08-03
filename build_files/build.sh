#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

# Can't use DankInstall from here, so running the installation manually
dnf5 copr enable avengemedia/danklinux -y
dnf5 copr enable scottames/ghostty -y
dnf5 install -y \
    chezmoi \
    ghostty \
    niri \
    dms \
    dgop \
    danksearch \
    dms-greeter

# note: uses danksearch instead of dsearch as it is not found, idky

# this is used to run a bunch of systemctl commands once the user logs in for the first time
ln -s /usr/lib/systemd/system/shell-setup.service /usr/lib/systemd/system/multi-user.target.wants/shell-setup.service
chmod +x /usr/lib/shell-setup.sh
