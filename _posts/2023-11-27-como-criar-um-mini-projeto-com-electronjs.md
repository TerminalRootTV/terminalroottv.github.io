---
layout: post
title: "Como Criar um Mini Projeto com Electron.js"
date: 2023-11-27 10:49:50
image: '/assets/img/js/electronjs.jpg'
description: 'Crie aplicativos gráficos para Desktop!'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
- desktop
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Electron** (anteriormente conhecido como **Atom Shell**) é uma estrutura de software gratuita e de código aberto desenvolvida e mantida pela [OpenJS Foundation](https://openjsf.org/). 

O framework é projetado para criar aplicações desktop usando tecnologias web (principalmente [HTML](https://terminalroot.com.br/tags#html), [CSS](https://terminalroot.com.br/tags#css) e [JavaScript](https://terminalroot.com.br/tags#javascript) ,embora outras tecnologias como frameworks front-end e [WebAssembly](https://terminalroot.com.br/2023/02/como-transformar-seus-jogos-c-cpp-para-web-com-emscripten-sdl2.html) sejam possíveis) que são renderizadas usando uma versão do motor do navegador [Chromium](https://terminalroot.com.br/2023/09/top-10-extensoes-do-chrome-para-programadores.html) e um back terminar usando o ambiente de execução Node.js. 

Ele também usa várias APIs para habilitar funcionalidades como integração nativa com serviços [Node.js](https://terminalroot.com.br/tags#nodejs) e um módulo de comunicação entre processos .

Electron foi originalmente construído para Atom e é a principal estrutura [GUI](https://terminalroot.com.br/tags#gui) por trás de vários projetos de código aberto, incluindo [Atom](https://terminalroot.com.br/2023/03/conheca-o-pulsar-o-retorno-de-jedi-do-atom.html), [GitHub Desktop](https://desktop.github.com/), [Light Table](https://github.com/LightTable/LightTable), [Visual Studio Code](https://terminalroot.com.br/tags#vscode), [WordPress Desktop](https://apps.wordpress.com/desktop/) e [Eclipse Theia](https://theia-ide.org/).


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Dependências
Faça download direto do site dos links abaixo ou use o gerenciador de pacotes do seu sistema operacional.

+ [Node.js](https://nodejs.org/)
+ [NPM](https://www.npmjs.com/)

Exemplo de instalação das dependências no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install nodejs npm
{% endhighlight %}

---

# Criando uma Janela básica
Vamos criar um exemplo mais básico possível!

### 01. Crie uma pasta e entre na mesma:
{% highlight bash %}
mkdir myapp
cd myapp
{% endhighlight %}

---

### 02. Crie um arquivo de nome: `package.json`:
E insira o conteúdo abaixo:
{% highlight json %}
{
  "name": "Meu Primeiro Projeto Electron",
  "version": "1.0.0",
  "description": "Um exemplo básico de uso!",
  "main": "main.js",
  "scripts": {
    "start": "electron ."
  },
  "author": "Marcos Oliveira",
  "license": "GNU GPLv3"
}
{% endhighlight %}
> Essa etapa pode ser substituída pelo comando: `npm init` com edições conforme você desejar!

---

### 03. Instale o Electron para ser adicionado ao seu projeto:
{% highlight bash %}
npm install --save-dev electron
{% endhighlight %}
> Note que seu `package.json` foi alterado e adicionado suporte ao Electron!


<!-- RECTANGLE LARGE -->
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

### 04. Crie um arquivo de nome: `index.html`
E insira o conteúdo abaixo dentro do arquivo:

{% highlight html %}
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Meu Primeiro Projeto com Electron</title>
  </head>
  <body>
    <h1>Meu Primeiro Projeto com Electron</h1>
    <h2>Nós estamos usando as tecnologias(e versões):</h2>
    <ul>
      <li>Node.js: <span id="node-version"></span></li>
      <li>Chromium: <span id="chrome-version"></span></li>
      <li>Electron: <span id="electron-version"></span></li>
    </ul>
  </body>
</html>
{% endhighlight %}

---

### 05. Crie um arquivo de nome: `main.js`
E insira o conteúdo abaixo dentro do arquivo:
> No exemplo abaixo é criada uma janela com resolução de 1280x720.

{% highlight js %}
const { app, BrowserWindow } = require('electron')
const path = require('node:path')

function createWindow () {
  const win = new BrowserWindow({
    width: 1280,
    height: 720,
    autoHideMenuBar: true, // Esconde a Barra de Menu: File, ...
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  win.loadFile('index.html')
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
{% endhighlight %}

---

### 06. Crie o arquivo `preload.js`
E insira o conteúdo abaixo dentro do arquivo:

{% highlight js %}
window.addEventListener('DOMContentLoaded', () => {
  const replaceText = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerText = text
  }

  for (const type of ['chrome', 'node', 'electron']) {
    replaceText(`${type}-version`, process.versions[type])
  }
})
{% endhighlight %}

---

### 07. Agora é só rodar o projeto
Quando abrir a janela você pode até acessar o console com: `Ctrl + Shift + i`.
{% highlight bash %}
npm start
{% endhighlight %}
> Exemplo do App que criamos rodando na imagem abaixo:

[![My App Electron](/assets/img/js/myapp-electron.jpg)](/assets/img/js/myapp-electron.jpg)
> Clique na imagem para ver em uma resolução maior!


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

Para mais informações acesse:
+ <https://github.com/electron/electron>
+ <https://www.electronjs.org/>

<!--
+ <https://en.wikipedia.org/wiki/Electron_(software_framework)>
+ <https://www.electronjs.org/docs/latest/tutorial/quick-start>
+ <https://stackoverflow.com/questions/39091964/remove-menubar-from-electron-app>
-->

