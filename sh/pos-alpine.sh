#!/bin/sh
# vim: noai:ts=4:sw=4:expandtab
#
# pos-alpine: Install and Config AwesomeWM for Alpine Linux
# http://terminalroot.com.br/shell
#
# The MIT License (MIT)
#
# Copyright (c) 2018 Marcos Oliveira
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

usage() {
    cat <<EOF

usage: ${0##*/} [flags]

  Options:

    --install          First step, only root.
    --user             Second step, only normal user.
    --manual           Third and Optional step, only to read.

* Marcos Oliveira - <terminalroot.com.br> - POS-ALPINE 0.1

EOF
}

[[ -z $1 ]] && {
    usage
    exit 1
}

_alp_user(){
    [[ $(id -u) != 1000 ]] && {
        printf "Only for 'root'.\n" "%s"
        exit 1
    }
    wget https://terminalroot.com.br/sh/files/Xresources -O ~/.Xresources
    echo 'xrdb ~/.Xresources' >> /home/$USER/.xinitrc
    echo 'awesome' >> /home/$USER/.xinitrc
    mkdir /home/$USER/.config
    cp -r /etc/xdg/awesome  /home/$USER/.config
    sed -i 's/xterm/urxvt/g' /home/$USER/.config/awesome/rc.lua
    svn export https://github.com/terroo/fonts/trunk/fonts
    mkdir -p ~/.local/share/
    mv fonts ~/.local/share/
    fc-cache -fv
    git clone --recursive https://github.com/lcpz/awesome-copycats.git
    mv awesome-copycats/* ~/.config/awesome && rm -rf awesome-copycats
    cd ~/.config/awesome/
    cp rc.lua bkp.rc.lua
    cp rc.lua.template rc.lua # Super + Ctrl + r
    exit 0
}

_alp_install(){
    [[ $(id -u) != 0 ]] && {
        printf "Only for 'root'.\n" "%s"
        exit 1
    }
    setup-xorg-base
    apk add vim awesome feh rxvt-unicode lua cairo-gobject pango xrandr dbus udev xf86-video-intel xf86-video-vboxvideo subversion virtualbox-guest-additions virtualbox-guest-modules-virt virtualbox-guest-additions-openrc xf86-input-synaptics xf86-video-vesa sudo git firefox lightdm lightdm-gtk-greeter dmenu
    apk upgrade --update-cache --available
    apk add --no-cache shadow
}

_alp_config(){
    [[ $(id -u) != 0 ]] && {
        printf "Only for 'root'.\n" "%s"
        exit 1
    }
    _alp_install
    echo vboxpci >> /etc/modules
    echo vboxdrv >> /etc/modules
    echo vboxnetflt >> /etc/modules
    rc-update add virtualbox-guest-additions default
    rc-update add dbus
    dbus-uuidgen > /var/lib/dbus/machine-id
    rc-update add udev
    mkdir -p /etc/X11/xorg.conf.d
    wget https://terminalroot.com.br/sh/files/10-evdev.conf -O /etc/X11/xorg.conf.d/10-evdev.conf
    adduser "$user"
    usermod -G video,usb "$user"
    exit 0
}

cat <<EOF
┌───────────────────────terminalroot.com.br────────────────────────┐
│                                                                  │
│          █████╗ ██╗     ██████╗ ██╗███╗   ██╗███████╗            │
│         ██╔══██╗██║     ██╔══██╗██║████╗  ██║██╔════╝            │
│         ███████║██║     ██████╔╝██║██╔██╗ ██║█████╗              │
│         ██╔══██║██║     ██╔═══╝ ██║██║╚██╗██║██╔══╝              │
│         ██║  ██║███████╗██║     ██║██║ ╚████║███████╗            │
│         ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝            │
├─────────────────────────pos-alpine-0.1───────────────────────────┤
│                                                                  │
│   █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗  │
│  ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝  │
│  ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗    │
│  ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝    │
│  ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗  │
│  ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝  │
└──────────────────────────────────────────────────────────────────┘
EOF

while [[ "$1" ]]; do
    read -s -n 1 -p "Do you want to start?[y/N]: "
    [[ "$REPLY" == "y" ||  "$REPLY" == "Y" ]] && {
         echo
         case "$1" in
            --install|-i) echo 'alp_config';;
            --user|-u) echo alp_user;;
            --manual|-m) echo alp_manual;;
        esac
        shift   
    } || {
        printf "\nBye\n" "%s" && exit 0
    }
done
