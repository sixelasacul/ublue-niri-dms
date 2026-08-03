systemctl --user enable dms
systemctl --user add-wants niri.service dms

sudo -v && dms greeter sync -y
systemctl --user disable gdm lightdm sddm plasmalogin
systemctl --user enable greetd

cp -r /usr/lib/default-config/niri ~/.config
