#!/bin/bash

systemctl --user enable dms
systemctl --user add-wants niri.service dms
systemctl --user disable gdm lightdm sddm plasmalogin
systemctl --user enable greetd

cp -r /usr/lib/default-config/niri ~/.config

# normally this uses sudo, not sure how that'd work in a service
dms greeter sync -y
