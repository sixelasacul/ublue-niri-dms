#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Can't use DankInstall from here, so running the installation manually
dnf5 copr enable avengemedia/danklinux
# uses danksearch instead of dsearch as it is not found, idky
dnf5 install niri dms dgop danksearch -y

systemctl --user enable dms
systemctl --user add-wants niri.service dms

# should handle all the things needed without needing more setup
dms greeter install
# not sure that's needed but we'll see
dms greeter sync

# note: could use this build to install all my stuff across systems
# like zed, zen, bitwarden, localsend, via, etc.
