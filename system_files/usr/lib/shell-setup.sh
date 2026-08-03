#!/bin/bash

systemctl --user enable dms
systemctl --user add-wants niri.service dms
systemctl --user disable gdm
systemctl --user disable lightdm
systemctl --user disable sddm
systemctl --user disable plasmalogin
systemctl --user enable greetd

rm /etc/xdg/autostart/org.kde.xwaylandvideobridge.desktop || echo 'xwaylandvideobridge already removed'

cp -r /usr/lib/default-config/niri ~/.config

# normally this uses sudo, not sure how that'd work in a service
dms greeter sync -y
