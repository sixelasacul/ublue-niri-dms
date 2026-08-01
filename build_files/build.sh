#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Easy install of dms and niri with DankInstall
curl -fsSL https://install.danklinux.com | sh -s -- -c niri -t ghostty --include-deps dms-greeter -y
