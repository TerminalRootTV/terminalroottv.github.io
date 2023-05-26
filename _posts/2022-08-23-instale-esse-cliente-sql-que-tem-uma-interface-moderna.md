---
layout: post
title: "Instale esse Cliente SQL que tem uma Interface Moderna"
date: 2022-08-23 09:38:07
image: '/assets/img/mysql/beetkeeper-studio.jpg'
description: 'Feito com Vue.js e TypeScript, com um AppImage pronto para rodar no seu Desktop.'
icon: 'ion:terminal-sharp'
iconname: 'Banco de Dados'
tags:
- vue
- typescript
- mariadb
- mysql
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Na postagem anterior](https://terminalroot.com.br/2022/08/use-um-comando-para-o-mysql-com-autocomplete.html) nós publicamos sobre um *wrapper* para o comando `mysql` que serve para [MySQL ou MariaDB](https://terminalroot.com.br/tags#mariadb) com auto-complete e realce de sintaxe.

Hoje vamos conhecer uma alternativa gráfica que possui uma interface amigável e moderna, trata-se do **Beekeeper Studio** .

Com o **Beekeeper Studio** você conecta facilmente ao seu banco de dados, editar seus códigos SQL e gerencia seu banco de dados de maneira fácil .

Ele está disponível para diversos bancos de dados de forma gratuita, incluindo: MariaDB e MySQL, e outros através da versão paga.

Também disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [Linux](https://terminalroot.com.br/linux) e feito com [Vue.js](https://terminalroot.com.br/vue) e [TypeScript](https://terminalroot.com.br/tags#typescript) .

# Instalação
Para instalar basta acessar o [site do Beekeeper Studio](https://www.beekeeperstudio.io/), ele irá reconhecer seu sistema operacional e disponibilizar o link para download:
> No meu caso, reconheceu para [Linux](https://terminalroot.com.br/tags#linux) .

Basta clicar em *Download for Linux*

![Download Beekeeper Studio](/assets/img/mysql/download-beetkeeper.png) 

Você será redirecionado à página de download. Você poderá escolher a versão **Ultimate Edition** que possui suporte a mais bancos de dados, ou simplesmente clicar no botão indicado abaixo que é a **Community Edition** que é gratuita e já possui suporte os bancos de dados: MySQL, MariaDB e alguns outros.

![AppImage Beekeeper Studio](/assets/img/mysql/appimage-beetkeeper.png)

Se preferir use o [GNU Wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) via linha de comando:

{% highlight bash %}
wget https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v3.6.2/Beekeeper-Studio-3.6.2.AppImage
{% endhighlight %}
> Lembrando que essa é a versão **3.6.2** para arquitetura *x86_64*, para casos diferentes faça o download manualmente.

Agora é só dar permissão de execução e rodar:

{% highlight bash %}
chmod +x Beekeeper-Studio-3.6.2.AppImage
./Beekeeper-Studio-3.6.2.AppImage
{% endhighlight %}

Informe os dados da sua conexão: **Usuário**, **Senha** e entre outros.

Se quiser adicionar ao seu Dash crie um `.desktop` com o logo do Beekeeper Studio e copie para `/usr/share/applications` e mova o AppImage para `/usr/local/bin` ou localmente como preferir.

Para mais informações acesse o [site oficial](https://www.beekeeperstudio.io/) e o [repositório no GitHub](https://github.com/beekeeper-studio/beekeeper-studio) .

E desfrute dessa maravilha!

---

# Veja também 
## [20 Livros sobre Linguagem SQL que você deveria ler](https://terminalroot.com.br/2023/05/20-livros-sobre-linguagem-sql-que-voce-deveria-ler.html)

---

# [Aprenda Vue.js do ZERO](https://terminalroot.com.br/vue)



