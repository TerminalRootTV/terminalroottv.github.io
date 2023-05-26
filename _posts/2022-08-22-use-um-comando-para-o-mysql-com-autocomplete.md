---
layout: post
title: "Use um Comando para o MySQL com Autocomplete"
date: 2022-08-22 08:31:48
image: '/assets/img/mysql/mycli.jpg'
description: 'Prático e com syntax highlight!'
icon: 'ion:terminal-sharp'
iconname: 'MySQL/MariaDB'
tags:
- mysql
- mariadb
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Quem nunca esqueçou nomes reservados do [MySQL/MariaDB](https://terminalroot.com.br/mysql) ou digitou incorretamente? Para diminuir de forma significativa esses problemas, existe o o comando `mycli` .

**mycli** é um cliente de terminal para [MySQL](https://terminalroot.com.br/tags#mysql) com preenchimento automático e realce de sintaxe.

---

# Instalação
A maneira mais rápido e prática de instalar o MyCLI é usando o [pip](https://pypi.org/project/pip/), lembre-se de antes possuir instalado no seu sistema. Para isso basta instalar da seguinte forma:

{% highlight bash %}
pip3 install --user mycli
{% endhighlight %}
> Isso irá instalar somente para seu usuário, e precisará ter o caminho `${HOME}/.local/bin` na sua `${PATH}` .

Outras formas e para outros sistemas operacionais, seria:

{% highlight bash %}
brew update && brew install mycli  # macOS
sudo apt install mycli # Debian, Ubuntu, Mint e derivados
{% endhighlight %}

---

# Utilização
Após devidamente instalado, você já pode logar no seu servidor MySQL, com o seguinte comando similar ao `mysql`:
{% highlight bash %}
mycli -u SEU_USUARIO -p "SUA_SENHA"
{% endhighlight %}

Se você digitar os comando SQL em maiúsculas ou minúsculas ele irá autocompletar de qualquer forma. Também não precisa de ponto-e-vírgula(`;`) para finalizar os comandos

![MyCLI](https://github.com/dbcli/mycli/raw/main/screenshots/main.gif) 

Para mais informações use o argumento/parâmetro `--help` e consulte o [repositório no GitHub](https://github.com/dbcli/mycli) .

---

# Veja também 
## [20 Livros sobre Linguagem SQL que você deveria ler](https://terminalroot.com.br/2023/05/20-livros-sobre-linguagem-sql-que-voce-deveria-ler.html)

---

