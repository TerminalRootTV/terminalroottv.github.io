#!/usr/bin/env bash
# vim: noai:ts=4:sw=4:expandtab
#
# pos-arch.in: Pos Arch Install i3 and Apps
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

shopt -s extglob

usage() {
  cat <<EOF

usage: ${0##*/} [flags] [options]

  Options:

    --mirror, -m                         Update mirror (Only for Brazil)
    --sudouser, -su  <user> <password>   Create name to user with privilegies root/sudo
    --install, -i                        Install all packages
    --version, -v                        Show version
    --help, -h                           Show this is message

EOF
}


if [[ -z $1 || $1 = @(-h|--help) ]]; then
  usage
  exit $(( $# ? 0 : 1 ))
fi

version="${0##*/} version 1.0"
_site="https://gitlab.com/terminalroot"
repo="arch/raw/master"

set_configs(){

	systemctl enable lightdm
	sed -i 's/^#greeter-session.*/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf
	sed -i '/^#greeter-hide-user=/s/#//' /etc/lightdm/lightdm.conf
	wget "$_site/$repo/back.jpg" -O /usr/share/pixmaps/back.jpg 2>/dev/null
	wget "$_site/$repo/key" -O /etc/X11/xorg.conf.d/10-evdev.conf 2>/dev/null
	echo -e "[greeter]\nbackground=/usr/share/pixmaps/back.jpg" > /etc/lightdm/lightdm-gtk-greeter.conf

}

set_mirror(){

    [[ ! "$(which wget)" ]] && echo "Need install wget." && exit 1
	wget "$_site/$repo/mirror-br" -O /etc/pacman.d/mirrorlist 2>/dev/null
	
}

set_sudouser(){

    [[ -z "$2" ]] && echo "Set name user." && exit 1
    muser=$(echo "$2" | tr -d ' _-' | tr 'A-Z' 'a-z')
    
    echo "Your user: $muser. Enter and repeat your password:"
	useradd -m -g users -G wheel,storage,power,video,network -s /bin/bash "$muser"    
	passwd "$muser"
	pacman -S sudo --noconfirm
	sed -i "s/^root ALL=(ALL) ALL$/root ALL=(ALL) ALL\n${muser} ALL=(ALL) ALL\n/" /etc/sudoers
	wget "$_site/$repo/xtd" -O /home/${muser}/.Xdefaults 2>/dev/null
	echo "exec i3" > /home/${muser}/.xinitrc && echo "tput bold" >> /home/${muser}/.bashrc
	echo "xrdb .Xdefaults" >> /home/${muser}/.bashrc
	echo "Success: user create and included on group sudo"
    
}

set_install(){

    pacman -S vim xorg-server xf86-input-mouse xf86-input-keyboard xf86-video-vesa xorg-xinit i3-wm i3status i3lock dmenu awesome-terminal-fonts terminus-font ttf-dejavu xterm git lightdm lightdm-gtk-greeter firefox firefox-i18n-pt-br bash-completion --noconfirm
    set_configs
    
}



case "$1" in

    "--mirror"|"-m") set_mirror ;;
    "--sudouser"|"-su") set_sudouser "$@";;
    "--install"|"-i") set_install;;
    "--version"|"-v") echo $version ;;
    "--help"|"-h") usage ;;
    *) echo "Invalid option." && usage ;;

esac

exit 0
