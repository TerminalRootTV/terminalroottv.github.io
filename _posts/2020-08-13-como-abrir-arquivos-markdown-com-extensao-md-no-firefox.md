---
layout: post
title: "Como abrir arquivos Markdown com extensão md no Firefox"
date: 2020-08-13 09:52:23
image: '/assets/img/firefox/markdown-firefox.jpg'
description: 'Já li essa pergunta em vários lugares, resolvi fazer um artigo para mostrar como.'
icon: 'cib:markdown'
iconname: 'markdown/firefox'
tags:
- firefox
- markdown
- html
---

![Como abrir arquivos Markdown com extensão md no Firefox](/assets/img/firefox/markdown-firefox.jpg)

Antigamente você instalava um plugin tipo o [Markdown Viewer](https://addons.mozilla.org/pt-BR/firefox/addon/markdown-viewer-chrome/) no [Firefox](https://www.mozilla.org/firefox/) e conseguia abrir arquivos **.md** que são do tipo [Markdown](https://daringfireball.net/projects/markdown/) . Mas depois da versão **57** do Firefox, isso não é mais possível, toda vez que você tenta abrir arquivo com `Ctrl + o` aparece essa caixa com essa informação:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Abrir arquivo md no Firefox](/assets/img/firefox/open-test-file-md.png)

Ou seja, o navegador pergunta se você deseja abrir com um editor de texto ou fazer download do arquivo que já está na sua máquina.

Se você só instalar plugins não vai resolver, você precisa seguir os seguintes passos:

1. Acessar as configurações do Firefox digitando no endereço de url: `about:config`

![about config](/assets/img/firefox/about-config.png)

1. No campo de pesquisa, procurar a configuração de nome: `helpers.private_mime_types_file`

![helpers.private_mime_types_file](/assets/img/firefox/helpers.private_mime_types_file.png)

Perceba que ele mostra um arquivo para *mime-types* que deve ser gravado no seu computador, justamente no caminho informado: `~/.mime.types` . É possível até editar o caminho pelo próprio browser clicando no ícone de edição, mas vamos tomar esse caminho e nome de arquivo como padrão, até porque é padrão mesmo! ☺

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

1. Vamos criar o arquivo:
```sh
vim ~/.mime.types
```
E dentro dele vamos inserir o seguinte conteúdo:
```sh
text/plain     md txt
```

Como isso informamos quais tipos de arquivo queremos que o Firefox abra diretamente no navegador, se quiser mais arquivos fique à vontade para informar. Sei que o txt já abre por padrão, mas não haverá problema reinformar.

1. Agora se voçe tentar abrir o arquivo .md , perceba que já é aberto:

![Arquivo md](/assets/img/firefox/file-md.png)

Mas perceba que o Markdown não é renderizado e sim exibido o código como arquivo de texto. No próximo passo vamos alterar isso!

1. Agora sim entra o papel da [extensão/addon/plugin](https://addons.mozilla.org/firefox/extensions/) do Firefox . Para isso vamos usar o [Markdown Viewer Webext](https://addons.mozilla.org/pt-BR/firefox/addon/markdown-viewer-webext/), existem outros, mas vamos utilizar esse, após instalar, tcharaaamm!!!

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Renderização de markdown no Firefox](/assets/img/firefox/tcharaaamm.png)

Você ainda pode customizar o CSS para deixá-lo do jeito como deseja, centralizado, por exemplo como eu fiz e está na imagem, indo em:

**☰  → Extensões → ... (do plugin) → Preferências → Preferências(do plugin)**

E abaixo à o campo de inserir seu CSS , no meu caso eu inseri: `body { max-width: 1000px; margin: auto; }` como na imagem abaixo:

![tres pontinhos](/assets/img/firefox/tres-pontinhos.png)
![css](/assets/img/firefox/css.png)

Fácião, neh?! ☺

Antes de ir, veja também:
+ [Limpe suas URLs dos Parâmetros das Redes Sociais e Outros](https://terminalroot.com.br/2019/09/limpe-sua-url.html)
+ [Descubra quais tecnologias os sites usam](https://terminalroot.com.br/2020/06/descubra-quais-tecnologias-os-sites-usam.html)
+ [Como Desabilitar as Solicitações de Notificações de Sites no Firefox](https://terminalroot.com.br/2020/04/como-desabilitar-as-solicitacoes-de-notificacoes-de-sites-no-firefox.html)
+ [IceCat - Um navegador minimalista baseado em Firefox](https://terminalroot.com.br/2020/02/icecat-um-navegador-minimalista-baseado-em-firefox.html)
+ [qutebrowser - Um Navegador estilo Vim , Muito Veloz!](https://terminalroot.com.br/2019/06/qutebrowser-um-navegador-estilo-vim-muito-veloz.html)
+ [16 Complementos úteis para Firefox](https://terminalroot.com.br/2014/09/complementos-uteis-para-firefox.html)
+ [Lista com 28 Navegadores para Linux](https://terminalroot.com.br/2016/04/lista-com-28-navegadores-para-linux.html)

# Fui!


