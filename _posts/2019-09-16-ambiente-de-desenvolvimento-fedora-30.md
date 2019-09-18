---
layout: post
title: "Ambiente de Desenvolvimento - FEDORA 30"
date: 2019-09-16 19:48:10
image: '/assets/img/apsantos/avatar.png'
description: 'Artigo com o objetivo de compartilhar algumas ferramentas de uso diário, para o desenvolvimento de aplicações web e mobile.'
author: 'APSantos Dev'
image_author: '/assets/img/apsantos/avatar.png'
url_author: 'https://github.com/apsantos-dev/'
tags:
- development
- environment
- fedora
---

![Ambiente de Desenvolvimento - FEDORA 30](/assets/img/apsantos/development-environment/fedora.png "Ambiente de Desenvolvimento - FEDORA 30")

Ambiente de Desenvolvimento - FEDORA 30

<!-- Badges section here. -->
[![GitHub stars][github-stars-img]][github-stars-ln] - [![GitHub forks][github-forks-img]][github-forks-ln] - [![Twitter Follow][twitter-follow-img]][twitter-follow-ln]

## Introdução

O principal objetivo deste artigo é compartilhar algumas ferramentas utilizadas em meu dia a dia para o desenvolvimento de aplicações web e mobile.

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Informat -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2838251107855362"
     data-ad-slot="2327980059"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

### Antes de você começar

O desenvolvimento deste artigo foi realizado em ambiente [Linux][linux-ln], utilizando o sistema operacional [Fedora 30][fedora-ln]. Utilizei o [Terminal][terminal-ln] para executar os [commands][commands-ln] descritos aqui.

> _Foi citado o Fedora 30, entretanto, as ferramentas estão disponíveis para outros sistemas também._

{% highlight bash %}
lsb_release -a  # verificar detalhes do sistema
{% endhighlight %}

Quando for necessário executar um comando como [root][root-ln], descreverei o conteúdo da seguinte forma. Exemplo:

{% highlight bash %}
sudo dnf install xyz  # comando de exemplo
{% endhighlight %}

Recomendo que você utilize o sistema operacional de sua escolha, adaptando este artigo de acordo com a necessidade.

### Adicional | Editor:

> [VSCode][vscode-ln]: Visual Studio Code é um editor de código-fonte leve, mas poderoso. \o/

---

### Instalação dos programas

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

> _Fim dos exemplos de instalção._

---

### Visual Studio Code - Extensões

Também separei algumas extensões incríveis que agregam muito ao meu trabaho.

_Instalação_:

```sh
Inicie o VS Code Quick Open (Ctrl + P), cole o seguinte comando e pressione enter.
```

> Para detalhes sobre a instalação da extensão, visite: https://code.visualstudio.com/docs/editor/extension-gallery

---

**_Nome da extensão e comando para instalação_**

> Alignment
>
> ext install annsk.alignment

> Angular 1.x snippets for Visual Studio Code using John Papa AngularJS style guide
>
> ext install lperdomo.angular1-code-snippets-johnpapastyle

> Angular 2, 4 and upcoming latest TypeScript HTML Snippets
>
> ext install UVBrain.Angular2

> Angular v7 Snippets
>
> ext install johnpapa.Angular2

> AngularJS 1.5+ TypeScript Snippets
>
> ext install jimmychandra.angularjs-1-5--typescript-snippets

> AngularJs 1.x Code Snippets
>
> ext install alexandersage.angular1-code-snippets

> AngularJs ngDoc Generator
>
> ext install Luis.angularjs-ngdoc-generator

> Auto Import:
>
> ext install steoates.autoimport

> Bootstrap 4, Font awesome 4, Font Awesome 5 Free & Pro snippets for Visual studio code
>
> ext install thekalinga.bootstrap4-vscode

> Bracket Pair Colorizer
>
> ext install CoenraadS.bracket-pair-colorizer

> Duplicate Action
>
> ext install mrmlnc.vscode-duplicate

> ESLint
>
> ext install dbaeumer.vscode-eslint

> file-icons
>
> ext install file-icons.file-icons

> Git Blame
>
> ext install waderyan.gitblame

> Git Graph
>
> ext install mhutchie.git-graph

> Git History
>
> ext install donjayamanne.githistory

> Git History Diff
>
> ext install huizhou.githd

> GitLens — Git supercharged
>
> ext install eamodio.gitlens

> HTML Snippets
>
> ext install abusaidm.html-snippets

> jQuery Code Snippets
>
> ext install donjayamanne.jquerysnippets

> Markdown Preview Enhanced
>
> ext install shd101wyy.markdown-preview-enhanced

> Markdown Lint
>
> ext install DavidAnson.vscode-markdownlint

> Path Autocomplete
>
> ext install ionutvmi.path-autocomplete

> PHP IntelliSense
>
> ext install felixfbecker.php-intellisense

> Python
>
> https://marketplace.visualstudio.com/items?itemName=ms-python.python

> React-Native/React/Redux snippets for es6/es7
>
> ext install EQuimper.react-native-react-redux

> Todo Tree
>
> ext install Gruntfuggly.todo-tree

> TSLint
>
> ext install ms-vscode.vscode-typescript-tslint-plugin

> vscode-icons
>
> ext install vscode-icons

---

### Conclusão

Podemos observar que com poucos comandos conseguimos instalar facilmente as ferramentas. Isso é muito útil quando por exemplo, formatamos o computador e precisamos instalar tudo novamente.

Há uma forma ainda mais dinâmica de instalar as ferramentas. Para isso, utilizamos [Shell script][shell-ln].

Basicamente, o Shell script é uma linguagem de script usada em vários sistemas operativos (operacionais), com diferentes dialetos, dependendo do interpretador de comandos utilizado. Um exemplo de interpretador de comandos é o bash, usado na grande maioria das distribuições GNU/Linux. [Saiba mais][shell-ln]...

> Muito obrigado por ler este artigo e até breve ...

---

**Assine Nosso Newsletter** e fique por dentro de tudo que acontece por aqui!

<!-- links -->
[extensions-ln]: /assets/img/apsantos/development-environment/extensions.md "Clique aqui para abrir o arquivo"
[installedPrograms]: /assets/img/apsantos/development-environment/installed-programs.md "Clique aqui para abrir o arquivo"
[commands-ln]: https://en.wikipedia.org/wiki/Command_(computing) "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[fedora-ln]: https://getfedora.org/en/ "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[github-stars-img]: https://img.shields.io/github/stars/apsantos-dev/development-environment.svg?style=social&label=Star
[github-stars-ln]: https://github.com/apsantos-dev/development-environment/stargazers "Veja quem gosta deste design = ]"
[github-forks-img]: https://img.shields.io/github/forks/apsantos-dev/tests.svg?style=social&label=Fork
[github-forks-ln]: https://github.com/apsantos-dev/development-environment/fork "Clique para ver os detalhes da estrela deste projeto"
[linux-ln]: https://en.wikipedia.org/wiki/Linux "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[root-ln]: https://en.wikipedia.org/wiki/Sudo "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[shell-ln]: https://pt.wikipedia.org/wiki/Shell_script "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[terminal-ln]: https://en.wikipedia.org/wiki/Linux_console "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
[twitter-follow-img]: https://img.shields.io/twitter/follow/apsantos_dev.svg?label=Follow&style=social
[twitter-follow-ln]: https://twitter.com/intent/follow?screen_name=apsantos_dev "Veja meu perfil no Twitter"
[vscode-ln]: https://code.visualstudio.com/ "Pressione Ctrl e clique neste link para abrir a página em uma nova guia"
