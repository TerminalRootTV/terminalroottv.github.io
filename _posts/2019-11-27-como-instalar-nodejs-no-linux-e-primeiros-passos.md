---
layout: post
title: "Como Instalar Node.js no Linux e Primeiros Passos"
date: 2019-11-27 15:07:26
image: '/assets/img/js/nodejs.jpg'
description: 'Node.js tem o desenvolvimento mantido pela fundação Node.js em parceria com a Linux Foundation.'
tags:
- nodejs
- npm
- javascript
- express
---

![Como Instalar Node.js no Linux e Primeiros Passos](/assets/img/js/nodejs.jpg)

### [Node.js](https://nodejs.org)

[Node.js](https://nodejs.org) é um interpretador de JavaScript assíncrono com código aberto orientado a eventos, criado por Ryan Dahl em 2009, focado em migrar a programação do Javascript do cliente (frontend) para os servidores, criando aplicações de alta escalabilidade (como um servidor web), manipulando milhares de conexões/eventos simultâneas em tempo real numa única máquina física.

O [Node.js](https://nodejs.org) (ambiente de execução Javascript no servidor) foi implementado baseado no interpretador V8 JavaScript Engine (interpretador de JavaScript em C++ com código aberto da Google, utilizado no Chrome), com desenvolvimento mantido pela fundação Node.js em parceria com a Linux Foundation.

Dahl se inspirou para criar Node.js depois de ver barra de progresso de upload de arquivos no Flickr, ele percebeu que o navegador não sabia o quanto do arquivo foi carregado e tinha que consultar o servidor web. 

## [npm](https://www.npmjs.com/)

[npm](https://www.npmjs.com/) (originalmente abreviação de Node Package Manager ) é um gerenciador de pacotes para a linguagem de programação JavaScript . É o gerenciador de pacotes padrão para o ambiente de tempo de execução JavaScript Node.js. Ele consiste em um cliente de linha de comando, também chamado npm, e um banco de dados online de pacotes públicos e privados pagos, chamado registro npm. O registro é acessado pelo cliente e os pacotes disponíveis podem ser pesquisados ​​e pesquisados ​​no site da npm. O gerenciador de pacotes e o registro são gerenciados pela npm, Inc.

O npm é inteiramente escrito em JavaScript e foi desenvolvido por Isaac Z , e é inspirado em outros projetos semelhantes, como PEAR ( PHP ) e CPAN ( Perl ).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Instalação

Para instalar o [Node.js](https://nodejs.org) utilize o gerenciador de pacotes da sua distribuição, exemplos:


> Em algumas distribuições você precisará instalar também o **npm** .

```sh
emerge nodejs # Gentoo, Funtoo,...
sudo apt install nodejs # Debian, Ubuntu, Mint,...
sudo pacman -S nodejs # Arch, Manjaro,...
```

Após instalar verifique se o mesmo já está rodando, por exemplo, verificar a versão do Node.js:

```sh
node --version
npm --version
```

Para atualizar o **npm** use o próprio para atualizar, o comando correto é:

> Em alguns casos não precisará do `sudo` , ou seja, se tiver algum problema, tente sem o *sudo*.
> 
> O parâmetro `-g` serve para o comando ficar *global* , para todos os usuário do seu sistema.

```sh
sudo npm install npm@latest -g
```

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

> Evite o comando ~~`npm i npm`~~ como muitos recomendam porque ele trabalha com um arquivo *.json* no diretório current e a versão indica vai gerar automáticamente esse arquivo, perceba na raíz do seu diretório pessoal que haverá um arquivo de nome *package-lock.json* ou somente *package.json* , [clique aqui para saber mais](https://docs.npmjs.com/about-npm-versions) .

## Utilização

Usar o Node.js do zero gera muito trabalho, mas para isso usa-se um framework para criar as páginas web . Nesse caso vamos instalar o mais utilizado do mundo pelos desenvolvedores Node.js: [Express.js](https://expressjs.com/) .

## [Express.js](https://expressjs.com/)

O [Express.js](https://expressjs.com/), ou simplesmente o **Express**, é uma estrutura de aplicativo da Web para o Node.js, lançada como software livre e de código aberto sob a Licença MIT. Ele foi projetado para criar aplicativos da Web e APIs. Foi chamado de estrutura de servidor padrão de fato para o Node.js .

### Instlando o Express.js

Para instalar o Express vamos utilizar o gerenciador de pacotes `npm` que já está instalado e devidamente atualizado na nossa máquina. Para isso rode o comando:

```sh
sudo npm install -g express-generator
```

Após instalado podemos ver se o mesmo já está funcionando, verificando a versão com o comando: `express --version`

## Criando um 'Olá, mundo!' em Node.js

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

Primeiramente vamos criar um diretório e já entrar no mesmo, para que nossos arquivos não fiquem bagunçados:

```sh
mkdir meu_projeto && cd meu_projeto
```

Agora , dentro do diretório do nosso projeto, vamos rodar o Express com a opção `--git` para fazer deploy na nuvem (se precisar, recomendado!) e a opção `-e` para que ele crie automaticamente sem questionar. 

```sh
express -e --git
```

A saída será algo semelhante à o conteúdo abaixo:

```txt
warning: option `--ejs' has been renamed to `--view=ejs'

create : public/
create : public/javascripts/
create : public/images/
create : public/stylesheets/
create : public/stylesheets/style.css
create : routes/
create : routes/index.js
create : routes/users.js
create : views/
create : views/error.ejs
create : views/index.ejs
create : .gitignore
create : app.js
create : package.json
create : bin/
create : bin/www

install dependencies:
$ npm install

run the app:
$ DEBUG=meu-projeto:* npm start
```

Perceba que ele criou (além do diretório oculto `.git`) 7 diretórios e 8 arquivos:

```sh
meu_projeto/
├── app.js
├── bin
│   └── www
├── package.json
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes
│   ├── index.js
│   └── users.js
└── views
    ├── error.ejs
    └── index.ejs

7 directories, 8 files
```

Perceba que na saída do comando, o próprio Express recomenda nós instalarmos as dependências com o comando:
```sh
npm install
```

Agora vamos ver o conteúdo rodando no navegador, rode o comando abaixo e depois acesse(utilizando qualquer navegador) o link: <http://localhost:3000>
```sh
npm start
```

Você verá o **Olá, mundo!** do Express, algo tipo:

```html
Express

Welcome to Express
```

Para finalizar a conexão, tecle: **Ctrl + c** .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Customizando o template

Se quiser alterar os dados para aparecer o conteúdo que você deseja. Edite o arquivo: `vim routes/index.js` e mude a palavra *Express* pela frase que você deseja, exemplo:
```js
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Terminal Root Node.js' });
});

module.exports = router;
```

Se quiser alterar também o **Welcome** edite o arquivo: `vim views/index.ejs` , exemplo abaixo:

```html
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
    <link rel='stylesheet' href='/stylesheets/style.css' />
  </head>
  <body>
    <h1><%= title %></h1>
    <p>Exemplo de <%= title %></p>
  </body>
</html>
```

Agora é só rodar novamente `npm start` e acessar: <http://localhost:3000> e a saída será algo desse tipo:

![Terminal Root Node.js - Exemplo de Terminal Root Node.js](/assets/img/js/node.js-terminalroot.png)

Pronto! Deu certo aí ?! Comente!

Na próxima parte veremos como instalar o banco [MongoDB](https://www.mongodb.com) e como conectar e fazer consultas à base de dados.

## Links Úteis

+ <https://nodejs.org>
+ <https://www.npmjs.com/>
+ <https://expressjs.com/pt-br/>

Abraços!    
