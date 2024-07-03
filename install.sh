#!/bin/bash

pwd=$(pwd)

GitRepos="$HOME/GitRepos"
Suckless="$HOME/Suckless"

pkglist="pkg/pkglist"
aurlist="pkg/aurlist"

yaylink="https://aur.archlinux.org/yay.git"
sldwm="https://git.suckless.org/dwm"
sldmenu="https://git.suckless.org/dmenu"
mydwm="https://github.com/nguyenletientrien/dwm"

createDir() {
    [[ ! -d "$GitRepos" ]] && mkdir -p "$GitRepos"
    [[ ! -d "$Suckless" ]] && mkdir -p "$Suckless"
}

install_pacpack(){
    # shellcheck disable=SC2046
    sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort $pkglist))
}
install_yaypack() {
    yay -S --needed - < "$aurlist"
}
install_yay() {
    cd "$GitRepos" || exit
    git clone "$yaylink" && cd yay && makepkg -si
    cd "$pwd" || exit
}
install_sl() {
    cd "$Suckless" || exit
    git clone "$sldmenu" && cd dmenu && sudo make clean install
    cd "$Suckless" || exit
    git clone "$sldwm" && cd dwm && \
        git branch mydwm && \
        git checkout mydwm && \
        git pull "$mydwm" master && \
        sudo make clean install
    cd "$pwd" || exit
}

createDir
install_pacpack
install_yay
install_yaypack
install_sl