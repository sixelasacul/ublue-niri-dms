#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Can't use DankInstall from here, so running the installation manually
dnf5 copr enable avengemedia/danklinux -y
# uses danksearch instead of dsearch as it is not found, idky
dnf5 install niri dms dgop danksearch dms-greeter -y

# down to this point it works. no idea why but the systemd stuff aren't set.
# worst case that could be done by the user

ln -s /usr/lib/systemd/system/shell-setup.service /usr/lib/systemd/system/multi-user.target.wants/shell-setup.service

# systemctl --user enable dms
# systemctl --user add-wants niri.service dms
# systemctl --user disable gdm lightdm sddm
# systemctl --user enable greetd

# note: could use this build to install all my stuff across systems
# like zed, zen, bitwarden, localsend, via, etc.
