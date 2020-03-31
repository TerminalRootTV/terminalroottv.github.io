---
layout: post
title: "Como Visualizar Markdown no Gedit"
date: 2020-03-31 11:41:15
image: '/assets/img/gedit/gedit-markdown-preview-menu-min.jpg'
description: 'Se você curte o Gedit e quer dar uma turbinada nele, vem com nós! 👋️'
tags:
- gedit
- markdown
- html
---

![Como Visualizar Markdown no Gedit](/assets/img/gedit/gedit-markdown-preview-menu-min.jpg)

O [Gedit]() é o editor padrão do [GNOME Desktop]() e muita gente começou nele à arriscar suas primeiras linhas de código no [Linux](https://terminalroot.com.br/linux) . Aqui no blog temos mais tutoriais de dicas sobre Gedit, use esse [link](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=gedit) para encontrar as postagens.

Por padrão o Gedit não renderiza seus documentos em [Markdown](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=markdown) , mas é possível conseguir essa façanha com o plugin [Markdown Preview](https://github.com/maoschanz/gedit-plugin-markdown_preview), vamos ver como instalar, configurar e utilizá-lo.

## Instalação
Primeiramente instale as dpendências
```sh
sudo apt install python3-markdown pandoc gir1.2-webkit2-4.0 git # Debian, Ubuntu, Mint, ...
sudo dnf install python3-markdown pandoc webkit2gtk3 git # Fedora
sudo eopkg install python-markdown pandoc libwebkit-gtk git # Solus OS
```

Agora vamos clonar e instalar o plugin
```sh
git clone https://github.com/maoschanz/gedit-plugin-markdown_preview
cd gedit-plugin-markdown_preview
./install.sh
```

Feche e abra o Gedit.

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

## Configuração
Agora vá até as **Preferências** do Gedit e na Aba **Plugins**, selecione o **Markdown Preview** e clique em **Configurações** e deixe à sua maneira, exemplo na imagem abaixo:
![Preferências](/assets/img/gedit/gedit-markdown-enable.jpg)

Feche e abra o Gedit.
## Utilização
Assim que você abre um documento Markdown, o Markdown Preview já surgirá, e você pode ajustá-lo como desejar. Mas para exibir ou esconder basta teclar **F9**.
![Opções](/home/marcos/Documentos/terminalroot/terminalroottv.github.io/assets/img/gedit/gedit-markdown-tags-min.jpg)

## Links úteis
+ [Habilitando Renderização de MarkDown no Apache Web Server](https://terminalroot.com.br/2019/12/habilitando-renderizacao-de-markdown-no-apache-web-server.html)
+ [Como Renderizar Markdown no Linux](https://terminalroot.com.br/2018/09/como-renderizar-markdown-no-linux.html)
+ [Remarkable, Um Ótimo Editor MarkDown para Linux](https://terminalroot.com.br/2017/02/remarkable-editor-markdown-para-linux.html)
+ [HTML é coisa do passado, o negócio agora é MarkDown!](https://terminalroot.com.br/2016/12/markdown.html)
+ [Curso de Desenvolvimento Web do Zero no Linux](https://terminalroot.com.br/2020/01/desenvolvimento-web.html)
+ [How To Add Markdown Support To Gedit Using Markdown Preview Plugin](https://www.linuxuprising.com/2020/02/how-to-add-markdown-support-to-gedit.html)

