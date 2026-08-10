#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf5 copr enable avengemedia/dms -y
dnf5 copr enable scottames/ghostty -y
dnf5 install -y \
    chezmoi \
    ghostty \
    niri \
    dms \
    dms-greeter
dnf remove xwaylandvideobridge -y

# note on packages:
# - xdg-desktop-portal-gnome is needed for screencasting (especially since the base image is KDE plasma)
# - chezmoi for customizing the DE and other apps outside of the image

# this is used to run a bunch of systemctl commands once the user logs in for the first time
ln -s /usr/lib/systemd/system/shell-setup.service /usr/lib/systemd/system/multi-user.target.wants/shell-setup.service
chmod +x /usr/lib/shell-setup.sh
