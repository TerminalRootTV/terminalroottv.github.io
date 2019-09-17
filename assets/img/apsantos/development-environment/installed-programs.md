# Instalação dos programas

O objetivo deste artigo é demonstrar como instalar algumas ferramentas através do [Terminal][terminal-ln].

_Nem todos os programas mencionados aqui requer a utilização do comando [sudo](https://pt.wikipedia.org/wiki/Sudo)._

**_Será demonstrado aqui apenas a instalação das ferramentas._**

> _Os comandos foram realizaodos no [Terminal][terminal-ln] usando o  [Bash][bash]_

---

## Angular CLI

_Instalação_:

```sh
sudo npm install -g @angular/cli
```

_Informações_:

```sh
ng --help
ng --version
```

_[Detalhes neste link](https://angular.io/cli)_

---

## Cordova

_Instalação_:

```sh
sudo npm install -g cordova
```

_Informações_:

```sh
cordova --help
cordova --version
```

_[Detalhes neste link](https://cordova.apache.org/docs/en/latest/)_

---

## Fedy

_Instalação_:

```sh
sudo dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/fedy-release.rpm

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install fedy
```

_Abrir_:

```sh
fedy
```

_Informações_:

```sh
fedy --help
```

_[Detalhes neste link](https://www.folkswithhats.org/)_

---

## Firebase tools

_Instalação_:

```sh
sudo dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/fedy-release.rpm

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install fedy
```

_Informações_:

```sh
firebase --help
firebase --version
```

_[Detalhes neste link](https://firebase.google.com/docs)_

---

## Flameshot

_Instalação_:

```sh
sudo dnf install flameshot -y
```

_Abrir_:

```sh
flameshot gui
```

_Informações_:

```sh
flameshot --help
flameshot --version
```

_[Detalhes neste link](https://flameshot.js.org/#/)_

---

## Flash Player

_Instalação_:

```sh
sudo dnf makecache -y

sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm

sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

sudo dnf install flash-plugin alsa-plugins-pulseaudio libcurl -y
```

_Informações_:

```sh
Firefox: about:plugins
Chrome: chrome://flash
```

_[Detalhes neste link](https://get.adobe.com/br/flashplayer/) ou [Fedora Docs](https://docs.fedoraproject.org/en-US/quick-docs/using-adobe-flash/)_

---

## Gimp

_Instalação_:

```sh
sudo dnf install gimp -y
```

_Abrir_:

```sh
gimp
```

_Informações_:

```sh
gimp --help
gimp --version
```

_[Detalhes neste link](https://www.gimp.org/about/)_

---

## Git

_Instalação_:

```sh
sudo dnf install git
```

_Informações_:

```sh
git --help
git --version
```

_[Detalhes neste link](https://git-scm.com/)_

---

## GNOME Tweaks

_Instalação_:

```sh
sudo dnf install gnome-tweak-tool
```

_Abrir_:

```sh
gnome-tweaks
```

_Informações_:

```sh
gnome-tweaks --help
gnome-tweaks --version
```

_[Detalhes neste link](https://wiki.gnome.org/Apps/Tweaks)_

---

## HTOP

_Instalação_:

```sh
sudo dnf install htop -y
```

_Abrir_:

```sh
htop
```

_Informações_:

```sh
htop --help
htop --version
```

_[Detalhes neste link](https://pt.wikipedia.org/wiki/Htop)_

---

## Ionic

_Instalação_:

```sh
sudo npm install -g ionic
```

_Informações_:

```sh
ionic --help
ionic --version
```

_[Detalhes neste link](https://ionicframework.com/)_

---

## NodeJS and NPM

_Instalação_:

```sh
sudo dnf install gcc-c++ make -y

curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -

sudo dnf install nodejs -y
```

_Informações_:

```sh
node --help
node --version

npm --help
npm --version
```

_[Detalhes neste link](https://nodejs.org/en/about/)_

---

## Skype

_Instalação_:

```sh
cd /tmp

sudo dnf install wget -y

wget --trust-server-names https://go.skype.com/skypeforlinux-64.rpm

sudo dnf install /tmp/skypeforlinux-64.rpm -y
```

Abrir:

```sh
skypeforlinux
```

_[Detalhes neste link](https://www.skype.com/)_

---

## Steam

_Instalação_:

```sh
sudo dnf update --refresh

sudo dnf install steam -y
```

Abrir:

```sh
steam
```

_[Detalhes neste link](https://store.steampowered.com/?l=portuguese)_

---

## Teamview

_Instalação_:

```sh
sudo dnf install wget -y

wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm

sudo dnf install teamviewer.x86_64.rpm -y
```

_Abrir_:

```sh
teamviewer
```

_Informações_:

```sh
teamviewer --help
rpm -qi teamviewer
```

_[Detalhes neste link](https://www.teamviewer.com)_

---

## Typescript

_Instalação_:

```sh
sudo npm i -g typescript
```

_[Detalhes neste link](https://www.typescriptlang.org/)_

---

## Visual Studio Code

_Instalação_:

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update

sudo dnf install code -y
```

_Abrir_:

```sh
code
```

_Informações_:

```sh
code --help
code --version
```

_[Detalhes neste link](https://code.visualstudio.com/)_

---

## VLC

_Instalação_:

```sh
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install vlc -y
```

_Abrir_:

```sh
vlc
```

_Informações_:

```sh
vlc --help
vlc --version
```

_[Detalhes neste link](https://www.videolan.org/vlc/index.pt-BR.html)_

---

<!-- links -->
[terminal-ln]: https://en.wikipedia.org/wiki/Linux_console "Press Ctrl and click this link to open the page in a new tab"
[bash]: https://pt.wikipedia.org/wiki/Bash "Press Ctrl and click this link to open the page in a new tab"
