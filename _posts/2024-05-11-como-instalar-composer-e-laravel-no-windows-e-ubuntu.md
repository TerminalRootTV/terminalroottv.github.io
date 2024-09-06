---
layout: post
title: "Como Instalar Composer e Laravel no Windows e Ubuntu"
date: 2024-05-11 19:24:40
image: '/assets/img/laravel/install/install-composer-laravel-win-ubu.jpg'
description: 'Procedimento sem uso de nenhum software de terceiros!'
icon: 'ion:terminal-sharp'
iconname: 'Laravel'
tags:
- laravel
- php
- windows
- ubuntu
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo veremos passo à passo de como instalar o [Composer](https://getcomposer.org/) e o [Laravel](https://laravel.com/) tanto no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) quanto no [Windows](https://terminalroot.com.br/tags#windows) diretamente sem usar nenhuma ferramenta adicional.

Mas, antes precisaremos das dependências citadas logo abaixo!

---

# Dependências
Em ambos os casos, tanto para o Ubuntu quanto para o Windows é necessário possuir, lógico, o PHP instalado, incluindo o [MySQL](https://terminalroot.com.br/tags#mysql) e se quiser ainda o [Apache](https://terminalroot.com.br/tags#apache):
+ Veja como [Como Instalar o Apache, PHP 8 e MySQL no Windows](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html)
+ Veja como instalar o PHP no Ubuntu:
```bash
sudo apt update
sudo apt install php php-cli php-curl php-xml php-mbstring
```

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

# Ubuntu
No caso do Ubuntu além do PHP também é necessário possuir também o `php-curl` como citado no comando acima.

## Primeiro instale o [Composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos)
#### 1. Baixe o instalador para o composer:
```bash
wget https://getcomposer.org/installer
```

#### 2. Rode o instalador:
```bash
php installer
```

#### 3. Instale globalmente(RECOMENDADO)
```bash
sudo mv composer.phar /usr/local/bin/composer
```
> E remova o instalador: `rm installer`

#### 4. Teste pra ver se está tudo certo:
```bash
composer --version
```
> A saída será similar abaixo, mas com as versões de acordo com a data que você instalou:
```bash
Composer version 2.7.6 2024-05-04 23:03:15
PHP version 8.1.12-1ubuntu4.3 (/usr/bin/php8.1)
Run the "diagnose" command to get more detailed diagnostics output.
```

> Mas se aparecer algo assim é porque sua instalação não está certa:
```bash
Comando 'composer' não encontrado, você quis dizer:
  comando 'composer' do deb composer (2.5.4-1)
Experimente: sudo apt install <deb name>
``` 

Você nem precisa instalar o Laravel para criar projetos com Laravel, apenas usando o Composer já funciona:
```bash
composer create-project laravel/laravel example-app
```

E para ver seu projeto rodando no navegador, rode:
```bash
cd example-app
php artisan serve
```

Agora acesse a url: <http://localhost:8000> e verá p projeto rodando!

Se quiser instalar o comando `laravel` para criar seus projetos, use o procedimento alternativo abaixo:

## Alternativamente: instale o [Laravel](https://laravel.com/docs/11.x#creating-a-laravel-project) com o [Composer](https://getcomposer.org/download/)

#### 1. Adquira o Laravel:
```bash
composer global require laravel/installer
```

#### 2. Adicione o caminho do Laravel à sua `$PATH`:
```bash
echo 'export PATH="${PATH}:${HOME}/.config/composer/vendor/bin"' >> ~/.bashrc
exec $SHELL
``` 

#### 3. Teste o Laravel:
```bash
laravel --version
```
> A saída será similar a essa, mas com a versão de acordo com a data que você instalou:
```bash
Laravel Installer 5.2.1
```
> Lembrando que essa é a versão do comando `laravel`, a versão do Framework é adquirida dentro de um projeto Laravel com o comando: `php artisan --version`, e isso pode depender também da versão do seu [PHP](https://terminalroot.com.br/tags#php), versões iguais ou menores ao `PHP 8.2` só é possível usar no máximo o `Laravel v10.3.3`.

Para criar um novo projeto com Laravel use o comando:
```bash
laravel new example-app
```

---

# Windows
Também como dito no início desse artigo, é necessário possui o [PHP](https://terminalroot.com.br/php) instalado:
### [Como Instalar o Apache, PHP 8 e MySQL no Windows](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html)
> E, lógico, se quiser criar projetos com banco de dados [MySQL](https://terminalroot.com.br/tags#mysql), instale-o também. Já o Apache é caso você queira, se instalar ou não, não haverá nenhum problema.


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

#### 01. Abra o [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html) com [PowerShell](https://terminalroot.com.br/tags#powershell) ou somente o [PowerShell](https://terminalroot.com.br/tags#powershell) diretamente.
> Se quiser crie uma pasta para fazer download do instalador e entre na mesma:
```bash
mkdir Composer
cd Composer
```

#### 02. Faça o [download](https://getcomposer.org/Composer-Setup.exe) do instalador: [Composer-Setup.exe](https://getcomposer.org/Composer-Setup.exe):
> Via comando abaixo ou clicando diretamente no link da página, ou nos links citados acima:
```bash
Invoke-WebRequest https://getcomposer.org/Composer-Setup.exe -O Composer-Setup.exe
```

#### 03. E execute o instalador com um duplo clique sobre o instalador ou somente invocando-o via linha de comando:
```bash
.\Composer-Setup.exe
```

#### 04. O Wizard do Setup será iniciado, selecione a primeira opção: `Install for all users(recommended)`
![Composer Install for all users(recommended)](/assets/img/laravel/install/01.jpg) 
> Após isso você precisará atribuir **Permissão** de instalação na tela que irá se abrir!

#### 05. Deixe desmarcada a opção `[ ] Developer mode` e somente clique em `Next`:
![Composer Next](/assets/img/laravel/install/02-apos-permissoes-de-execucao.jpg) 

#### 06. O instalador irá detectar automaticamente o caminho onde está instalado o seu PHP, caso esteja errado corrija, mas geralmente essa parte é *sem erro*, basta clicar novamente em `Next`:
![Next de novo](/assets/img/laravel/install/03.jpg) 

#### 07. Se seu computador estiver passando por um **Proxy** informe no campo, se não estiver deixe em branco, no meu caso, talvez similar ao seu, como é um PC de casa, deixe em branco e só clique em `Next`:
![Proxy?](/assets/img/laravel/install/04.jpg) 

#### 08. Finalmente clique em `Install`:
![Install Composer](/assets/img/laravel/install/05.jpg) 

![Running installer](/assets/img/laravel/install/06.jpg) 

#### 09. Após finalizado, basta clicar em `Next`(pode ser que para você essa tela não apareça) e/ou em seguinda `Finish`:
![Dont need restart](/assets/img/laravel/install/07.jpg) 

![Finish](/assets/img/laravel/install/08.jpg) 


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

#### 10. Se você criou a pasta para instalação já pode removê-la, ou remova somente o instalador se não criou a pasta:
```bash
cd ..
rm .\Composer\
# Ou
rm .\Composer-Setup.exe
```
![rm Composer-Setup.exe](/assets/img/laravel/install/09.jpg) 

Após instalado, feche o Windows Terminal ou PowerShell e abra novamente e rode o comando abaixo para ver se está tudo funcionando normalmente:
```bash
composer --version
# Ou
composer.bat --version
```
> A provável e similar saída será como abaixo:
```bash
Composer version 2.7.6 2024-05-04 23:03:15
PHP version 8.0.28 (C:\php\php.exe)
Run the "diagnose" command to get more detailed diagnostics output.
```

#### 11. Assim como no Ubuntu você pode usar somente o Composer para criar seus projetos em Laravel:
> Se houver problema adicione o parâmetro ` --ignore-platform-req=ext-fileinfo` ao comando:
```bash
composer create-project laravel/laravel example-app --ignore-platform-req=ext-fileinfo
```
![Laravel create-project start](/assets/img/laravel/install/10-laravel-01.jpg) 
![Laravel create-project final](/assets/img/laravel/install/10-laravel-02.jpg) 


#### 12. Agora entre na pasta que foi criada e rode o comando abaixo para seu projeto rodar na Web:
```bash
cd example-app
php artisan serve
```
![php artisan serve](/assets/img/laravel/install/11-laravel-run.jpg) 

#### 13. E acesse o navegador no endereço: <http://localhost:8000>
![localhost 8000](/assets/img/laravel/install/12.jpg) 

> Você pode instalar o comando `laravel` assim como descrito no procedimento do Ubuntu e adicionar às *Variáveis de Ambiente do Windows*(`PATH`) o caminho que geralmente que lá mesmo já haverá o caminho para o Composer. Mas, caso tenha problema, pode ser por conta do arquivo `php.ini`, então revise-o!

Para finalizar o `serve` basta teclar `Ctrl + C` como descrito na saída do comando!

---

Para dicas de como usar o Laravel veja os links abaixo, inclusive nós possuímos um [Curso de PHP & MySQL](https://terminalroot.com.br/php) que há uma iniciação para o Laravel também, além de muitas outras coisas:
+ [Curso de PHP & MySQL](https://terminalroot.com.br/php)
+ [Como Criar uma API com Laravel 8 (CRUD)](https://terminalroot.com.br/2021/04/como-criar-uma-api-com-laravel-8.html)
+ [20 Extensões Essenciais para Desenvolvimento Laravel e PHP no VSCode](https://terminalroot.com.br/2023/11/20-extensoes-essenciais-para-desenvolvimento-laravel-e-php-no-vscode.html)
+ [Como Criar um CRUD com LARAVEL](https://terminalroot.com.br/2020/09/como-criar-um-crud-com-laravel.html)
+ E mais sobre Laravel na nossas [#hashtags](https://terminalroot.com.br/tags#laravel): <https://terminalroot.com.br/tags#laravel> e também sobre [#php](https://terminalroot.com.br/tags#php).



