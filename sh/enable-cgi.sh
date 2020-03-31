#!/bin/bash
# author: Marcos Oliveira <terminalroot.com.br>
# license: GNU GPLv3
# How to enable CGI on Apache in distro APT based

_help(){
cat <<EOF
usage: ${0##*/} [flags]
flags:
     --custom  - For change directory to /var/www/html/sh/ (RECOMMENDED)
     --alias   - For sh alias to cgi-bin
     --default - The file test need to make manually: bit.ly/indexsh
[*]  Don't use 'sudo' and 'root'.
[**] Use this script only systems APT-based.
EOF
exit 0
}
[[ `id -u` -eq 0 ]] && _help | tail -n 2 | sed -n 1p && exit 1
[[ -z "$1" ]] && _help
[[ ! `which apt 2>/dev/null` ]] && _help | tail -n 1 && exit 1

enable_cgi(){
    #1. Install Apache
    sudo apt install apache2 -y

    #2. Mods enable, if not exists
    echo 'LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so' | sudo tee /etc/apache2/mods-available/cgi.load

    #3. Enable files .sh (Jump step mods-enable/cgi.load)
    sudo sed -i 's/#AddHandler cgi-script .cgi/AddHandler cgi-script .cgi .sh/' /etc/apache2/mods-enabled/mime.conf

    #4. Enable service cgi
    sudo a2enmod cgi
    sudo systemctl restart apache2

    #5. If you wanna to change /cgi-bin/ to /sh/
    if [[ ! -z "$alias_sh" && -z "$dir_sh" ]]; then
        sudo sed -i '1 i\ScriptAlias /sh/ /usr/lib/cgi-bin/' \
            /etc/apache2/sites-available/000-default.conf
    fi

    #6. If you wanna to change /usr/lib/cgi-bin/ to /var/www/html/sh/
    if [[ ! -z "$dir_sh" ]]; then
        sudo chown -R $USER:$USER /var/www/html
        mkdir -p /var/www/html/sh/
        wget -q bit.ly/indexsh -O /var/www/html/sh/index.sh
        chmod +x /var/www/html/sh/index.sh
    fi

    #7. Add load to index.sh
    sudo sed -i '/DirectoryIndex/s/$/ index.sh/' /etc/apache2/mods-available/dir.conf

    #8. Restart Apache
    sudo sed -i '/ScriptAlias/d' /etc/apache2/conf-available/serve-cgi-bin.conf
    sudo sed -i 's@/usr/lib/cgi-bin@/var/www/html/sh@' /etc/apache2/conf-available/serve-cgi-bin.conf
    sudo systemctl restart apache2
    xdg-open "http://localhost/sh/" &
}

while [[ "$1" ]]; do
    case "$1" in
        --alias) alias_sh=1;enable_cgi;;
        --custom) dir_sh=1;enable_cgi;;
        --default) enable_cgi;;
    esac
    shift
done
