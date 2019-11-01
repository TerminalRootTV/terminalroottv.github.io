---
layout: post
title: "Conheça e Instale o Veonim - Um editor baseado no Vim e NeoVim"
date: 2019-11-01 17:54:07
image: '/assets/img/vim/veonim.png'
description: 'Veonim é um IDE modal simples, construído com extensões Neovim e VSCode.'
tags:
- veonim
- vim
- neovim
- editores
- javascript
- electronjs
---

![Veonim](/assets/vim/veonim.png)
![Veonim](/assets/vim/header.png)

Veonim é um IDE modal simples, construído com extensões Neovim e VSCode. O objetivo é criar meu ambiente de programação ideal.

Recursos:

- • Suporte a extensões VSCode (trabalho em andamento, mas pode ser testado hoje em 0.22.0+)
- • Visa ser 100% compatível com o Neovim
- • Toda a configuração feita via vimrc com plugins vimscript/Lua/remote
- • Todos os recursos da Veonim são aceitos. Use o máximo ou o mínimo de recursos de IDE que desejar e personalize seu fluxo de trabalho
- • Arquivos de pesquisa difusa, buffers, texto de buffer, pesquisa de texto de projeto (desenvolvido por ripgrep)
- • Várias instâncias simultâneas do Neovim (como sessões tmux)
- • Totalmente acionado por teclado (sem suporte para mouse)
- • Mas espere, tem mais! Consulte o Guia do Usuário

## Colocando o Veonim pra funfar

Primeiramente você vai precisar possuir o [nodejs](https://nodejs.org), [npm](https://www.npmjs.com) e o [Git](https://terminalroot.com.br/git) instalados no seu sistema, exemplos:
{% highlight bash %}
emerge nodejs git # Gentoo, Funtoo, ...
sudo apt install nodejs npm git # Ubuntu, Debian, Mint, ...
sudo pacman -S nodejs npm git # Arch, Manjaro, ...
sudo dnf install nodejs npm git # Fedora
{% endhighlight %}

Após isso é necessário clonar o [Veonim](https://github.com/veonim/veonim/)
{% highlight bash %}
git clone https://github.com/veonim/veonim
{% endhighlight %}

Próximo passo é entrar no diretório e instalar as dependências via [npm](https://www.npmjs.com)
{% highlight bash %}
cd veonim/
npm i
{% endhighlight %}

Pronto, agora você já consegue rodar o [Veonim](https://github.com/veonim/veonim/) , mas essa não é a forma mais recomendada de usar, além de ficar lento demais, as configurações que você definir serão perdidas. Esse procedimento serve só pra ver se está tudo certo.
{% highlight bash %}
npm start
{% endhighlight %}

## Instalando no seu sistema

Ainda dentro do diretório do Veonim , rode o comando:
{% highlight bash %}
npm run build
{% endhighlight %}

Agora vamos contruir o binário dele:
> Se quiser antes teste com o comando: `npm run start:release`
{% highlight bash %}
npm run package
{% endhighlight %}

O binário ficará pronto no diretório: `./dist/`

Então vamos instalá-lo em um diretório do sistema:
{% highlight bash %}
sudo install dist/*veonim*.AppImage /usr/local/bin/veonim
{% endhighlight %}

Agora vamos torná-lo visível ao Dashboard e Laucher, rode os comandos:
> Definindo o ícone padrão do software
{% highlight bash %}
sudo cp art/icon.png /usr/share/pixmaps/veonim.png
{% endhighlight %}

E criamos o arquivo de chamada:
{% highlight bash %}
echo -e "[Desktop Entry]\nType=Application\nEncoding=UTF-8\nName=VeoNim\nIcon=veonim\nTerminal=false\nExec=veonim\nCategories=Development;" | sudo tee -a /usr/share/applications/veonim.desktop
{% endhighlight %}

Agora é só procurar procurar Veonim no Dash, Laucher, ou rodar via terminal para abrí-lo:
{% highlight bash %}
veonim
{% endhighlight %}

![Veonim](/assets/vim/veonim2.png)

## Usando o Veonim

+ Definir fonte tamanho (Exemplo de for Fantasque): `set guifont=SF\ FantasqueSansMono-Regular:h16`
+ Usar o explorador de arquivo: `:Veonim explorer`
+ Usar o Fuzzer file finder: `:Veonim files` 

E muito mais comandos e dicas que você pode encontrar na página inicial do Veonim no GitHub:
### <https://github.com/veonim/veonim/>

Consulte também o guia do usuário para usar suas configurações pessoais:
### <https://github.com/veonim/veonim/blob/master/docs/readme.md>

Valeu!
