# ublue-niri-dms

> This repo is using the [ublue-os/image-template](https://github.com/ublue-os/image-template) to easily build it and maintain it.

Custom images based on [Universal Blue](https://github.com/ublue-os) images, that adds [Niri](https://github.com/niri-wm/niri) as the compositor, for scrollable window manager, and [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) as the desktop shell, for great defaults, UI and UX.

Right now, this repo builds [Bazzite](https://github.com/ublue-os/bazzite), for easy gaming setup and capabilities, and [Aurora](https://github.com/ublue-os/aurora), for productivity setup. It doesn't actually build ISO files to be installed directly. First install the OS image that you want with specific configuration, then you can `bootc switch` to the ones built here.

Images also comes with `chezmoi` so that you can easily bring you own configs, dotfiles, and apps to be shared across devices or reinstalls.
