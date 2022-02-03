---
layout: post
title: "Conheça o daedalOS - um Desktop que roda no navegador"
date: 2022-02-03 11:34:55
image: '/assets/img/sistemas/daedalos.jpg'
description: 'Uma mistura de Windows e macOS .'
icon: 'ion:terminal-sharp'
iconname: 'Sistema Operacional'
tags:
- so
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

E a saga dos sistemas operacionais online continua! Depois do [Windows 93](https://terminalroot.com.br/2020/05/utilize-online-o-windows-93-o-sistema-que-a-microsoft-nao-lancou.html) e do [Mikesoft Windows 96](https://windows96.net/) agora chegou a vez do **daedalOS** .

DaedalOS é um ambiente desktop que roda diretamente no seu navegador(prefira o [Google Chrome]() por questões de compatibilidade) .

Para instalar você precisará do [Git](https://terminalroot.com.br/tags#git), [Node.js](https://terminalroot.com.br/tags#nodejs) e do [Yarn](https://yarnpkg.com/).

Depois disso basta clonar, construir e rodar:
{% highlight sh %}
git clone https://github.com/DustinBrett/daedalOS.git
cd daedalOS
yarn
yarn build:fs
yarn dev
{% endhighlight %}

---

# Recursos
O DaedalOS possui diversos aplicativos e games inclusos, tais como:
+ [DOOM](https://terminalroot.com.br/tags#games)
+ [Monaco Editor](https://microsoft.github.io/monaco-editor/) - Um [VSCode](https://terminalroot.com.br/tags#vscode) mais enxuto.
+ [Google Chrome](https://terminalroot.com.br/2021/08/customize-a-pagina-inicial-e-novas-abas-no-google-chrome.html) - chega até ser engraçado porque se você já está no navegador, mas pode ser que você precise de downloads nesse ambiente.
+ [Terminal](https://terminalroot.com.br/tags#terminal)
+ Visualizador de [MarkDown](https://terminalroot.com.br/tags#markdown)
+ Selecionador de Papéis de Parede
+ E um monte de outras coisas.

Você também pode usar ele online sem instalar nada. Para isso acesse o endereço: <https://dustinbrett.com/> .

Para mais informações consulte o [repositório](https://github.com/DustinBrett/daedalOS) do projeto.


