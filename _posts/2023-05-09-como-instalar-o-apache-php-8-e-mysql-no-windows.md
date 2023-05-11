---
layout: post
title: "Como Instalar o Apache, PHP 8 e MySQL no Windows"
date: 2023-05-09 09:42:20
image: '/assets/img/windows/php/apache-php-mysql-windows.jpg'
description: 'Procedimento minimalista e manual e incluso o cliente MySQL WorkBench, além de dica também para MariaDB!'
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- php
- mysql
- apache
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo veremos como instalar do zero e preparar seu ambiente no [Windows](https://terminalroot.com.br/tags#windows) para [desenvolvimento web](https://terminalroot.com.br/tags#desenvolvimentoweb) com [Apache](https://terminalroot.com.br/tags#apache), [PHP](https://terminalroot.com.br/tags#php) e [MySQL](https://terminalroot.com.br/tags#mysql).

Essa forma de instalar manualmente é muito melhor do que soluções prontas como: WAMP, XAMMP e entre outros, pois além de entendermos todo o processo, ainda será minimalista, instalando somente o necessário e tendo assim um ambiente mais *enxuto*.

Vamos ao passo a passo!

---

# 1º - Instale o Apache
Primeiramente vamos instalar e configurar o [Apache](https://terminalroot.com.br/tags#apache).

### 1. Acesse: <https://www.apachelounge.com/>.

### 2. Clique em [Downloads](https://www.apachelounge.com/download/) no canto esquerdo 
Baixe o arquivo: [Apache 2.4.57 Win64 | [Apache VS17 Win64 Binary] httpd-2.4.57-win64-VS17.zip](https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.57-win64-VS17.zip)

<img src="/assets/img/windows/php/apache-download.jpg" loading="lazy" alt="{{ page.title }}">

---

### 3. Descompacte o arquivo: *Extrair para httpd-2.4.57-win64-VS17*

<img src="/assets/img/windows/php/extrair-apache.jpg" loading="lazy" alt="{{ page.title }}">

---

### 4. Mova a pasta descompactada para a raiz da unidade `:C\`

<img src="/assets/img/windows/php/apache-unidade-c.jpg" loading="lazy" alt="{{ page.title }}">


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


### 5. Abra o CMD(Execute como Administrador) e entre na pasta: `cd C:\Apache24\bin\`

<img src="/assets/img/windows/php/abrir-cmd.jpg" loading="lazy" alt="{{ page.title }}">

---


### 6. Rode o comando: `httpd -k install`

<img src="/assets/img/windows/php/httpd-k-install.jpg" loading="lazy" alt="{{ page.title }}">

---


### 7. Agora entre na pasta: *C:\Apache24\conf* e abra o arquivo: `httpd.conf` com Bloco de Notas

<img src="/assets/img/windows/php/httpd-conf.jpg" loading="lazy" alt="{{ page.title }}">

---


### 8. Renomei a linha que tem: 
**#ServerName www.example.com:80** para **ServerName localhost** (lembre-se de remover o tralha(#) do início da linha), salve!

> DE:

<img src="/assets/img/windows/php/example-httpd-conf.jpg" loading="lazy" alt="{{ page.title }}">

---


> PARA:

<img src="/assets/img/windows/php/servername-localhost.jpg" loading="lazy" alt="{{ page.title }}">

---


### 9. Agora no CMD rode o comando: `httpd -k stop` e depois `httpd -k start`

<img src="/assets/img/windows/php/httpd-k-stop-start.jpg" loading="lazy" alt="{{ page.title }}">

---


### 10. Agora abra o navegador e acesse: <http://localhost/> 
Se aparecer a frase: **It works!**, é porque está tudo certo, se não, repita todos os passos, porque esse procedimento deverá funcionar!


<img src="/assets/img/windows/php/apache-it-works.jpg" loading="lazy" alt="{{ page.title }}">


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

# PHP 8
Próximo passo é instalarmos o PHP para também interpretá-lo no Apache.

### 1. Acesse: <https://windows.php.net/download#php-8.0>

### 2. Faça download do arquivo ZIP: [VS16 x64 Thread Safe (2023-Feb-14 12:42:34)](https://windows.php.net/downloads/releases/php-8.0.28-Win32-vs16-x64.zip)

<img src="/assets/img/windows/php/php8-win-down.jpg" loading="lazy" alt="{{ page.title }}">

---


### 3. Descompacte assim: *Extrair para php-8.0.28-Win32-vs16-x64*

<img src="/assets/img/windows/php/extrair-zip-php.jpg" loading="lazy" alt="{{ page.title }}">

---


### 4. Renomei a pasta *php-8.0.28-Win32-vs16-x64* para *php* somente

<img src="/assets/img/windows/php/rename-php-only.jpg" loading="lazy" alt="{{ page.title }}">

---


### 5. Mova a pasta **php** para a unidade `C:\` , clicando e arrastando.

### 6. Agora entre NOVAMENTE na pasta: *C:\Apache24\conf* 
E abra o arquivo: **httpd.conf** com Bloco de Notas e antes da linha: `<IfModule unixd_module>` insira o conteúdo abaixo:
{% highlight ini %}
LoadModule php_module "c:/php/php8apache2_4.dll"
AddType Application/x-httpd-php .php
PHPIniDir "c:/php"
{% endhighlight %}

<img src="/assets/img/windows/php/code-php-httpd-conf.jpg" loading="lazy" alt="{{ page.title }}">

---



### 7. Agora na linha que começa com: `<IfModule dir_module>` adicione `index.php`:
{% highlight ini %}
<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>
{% endhighlight %}

<img src="/assets/img/windows/php/index-php.jpg" loading="lazy" alt="{{ page.title }}">

---

> Salve o arquivo e já pode fechar!

### 8. Teste entrando na pasta: `C:\Apache24\htdocs`
Remova o `index.html` e crie um arquivo `index.php` e insira o conteúdo abaixo:
{% highlight php %}
<?php phpinfo();
{% endhighlight %}

### 9. Agora no CMD dentro da pasta `C:\Apache24\bin\` 
Rode o comando: `httpd -k restart`


<img src="/assets/img/windows/php/httpd-k-restart.jpg" loading="lazy" alt="{{ page.title }}">

---


### 10. Acesse pelo navegador de novo o endereço: <http://localhost/> 
> Ou se estiver aberta pressione `F5`, deverá aparecer isso abaixo:


<img src="/assets/img/windows/php/phpinfo.jpg" loading="lazy" alt="{{ page.title }}">


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

# MySQL
E para finalizar vamos instalar o [MySQL](https://terminalroot.com.br/mysql) e que automaticamente também será instalado um cliente MySQL que é o **MySQL WorkBench**.

### 1. Acesse: <https://dev.mysql.com/downloads/installer/> 
Faça o download do arquivo **Windows (x86, 32-bit), MSI Installer**

<img src="/assets/img/windows/php/mysql-download.jpg" loading="lazy" alt="{{ page.title }}">

---

Na página que abrirá clique em: **No thanks, just start my download.**:


<img src="/assets/img/windows/php/no-thans-only-down.jpg" loading="lazy" alt="{{ page.title }}">

---

### 2. Execute o arquivo(`mysql-installer-web-community-8.0.33.0.msi`) 
Que foi baixado dando duplo clique, perguntará duas vezes para autorizar!


<img src="/assets/img/windows/php/execute-msi.jpg" loading="lazy" alt="{{ page.title }}">

---

### 3. Abrirá o Setup e escolha: *Developer Default* e clique em *Next*

<img src="/assets/img/windows/php/chossing-a-setup-dev-default.jpg" loading="lazy" alt="{{ page.title }}">

---

### 4. Pressione *Next* novamente na próxima tela:

<img src="/assets/img/windows/php/no-python-only-next.jpg" loading="lazy" alt="{{ page.title }}">


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

### 5. Vai abrir essa janela, clique em *Yes*

<img src="/assets/img/windows/php/only-yes.jpg" loading="lazy" alt="{{ page.title }}">

---


### 6. Ele vai listar tudo que  irá fazer o download 
> Inclusive o Connector [C++](https://terminalroot.com.br/cpp), clique em *Execute*

<img src="/assets/img/windows/php/list-all-inc-connector-cpp.jpg" loading="lazy" alt="{{ page.title }}">

---


### 7. Aguarde o download

<img src="/assets/img/windows/php/downloads-pkgs-mysql.jpg" loading="lazy" alt="{{ page.title }}">

---


Quando terminar clique em *Next* e também na próxima janela da configuração

<img src="/assets/img/windows/php/next-pos-downs.jpg" loading="lazy" alt="{{ page.title }}">

---

### 8. Agora ele irá instalar os pacotes que foram baixados

<img src="/assets/img/windows/php/installation.jpg" loading="lazy" alt="{{ page.title }}">

---

Ao final basta clicar em **Next**

<img src="/assets/img/windows/php/pos-install.jpg" loading="lazy" alt="{{ page.title }}">

---


### 9. Nessa próxima janela: *Type and Networking* basta clicar em *Next*

<img src="/assets/img/windows/php/type-and-networking.jpg" loading="lazy" alt="{{ page.title }}">

---

### 10. Agora em *Authentication Method* mantenha o padrão e clique em *Next*

<img src="/assets/img/windows/php/authentication-method.jpg" loading="lazy" alt="{{ page.title }}">

---

### 11. Em *Account and Roles* crie uma senha e repita 
> Exemplo de senha(caracteres *MAIÚSCULOS*, *minúsculos*, *números* e *caracteres especiais*): `MeuBanco90@`

<img src="/assets/img/windows/php/account-and-roles.jpg" loading="lazy" alt="{{ page.title }}">



### 12. Em *Windows Service* basta clicar em *Next*

<img src="/assets/img/windows/php/windows-service.jpg" loading="lazy" alt="{{ page.title }}">

---


Em *Server File Permissions* também clique em *Next*

<img src="/assets/img/windows/php/server-file-permissions.jpg" loading="lazy" alt="{{ page.title }}">

---

### 13. *Apply Configuration*, clique em *Execute* 
> E aguarde ele "*ticar*" as etapas conforme imagem abaixo:

<img src="/assets/img/windows/php/apply-configuration.jpg" loading="lazy" alt="{{ page.title }}">

---

### 14. Finalmente clique em *Finish* 
> E então abrirá **Product Configuration** clique em **Next**.

<img src="/assets/img/windows/php/finish.jpg" loading="lazy" alt="{{ page.title }}">

---

<img src="/assets/img/windows/php/product-configuration.jpg" loading="lazy" alt="{{ page.title }}">

---

<img src="/assets/img/windows/php/pc-2.jpg" loading="lazy" alt="{{ page.title }}">

---

Clicando em *Next* de novo abrirá o **Connect To Server**, informe a senha que você criou e clique **Check** e depois em **Next**:

<img src="/assets/img/windows/php/connect-to-server.jpg" loading="lazy" alt="{{ page.title }}">

---

<img src="/assets/img/windows/php/check.jpg" loading="lazy" alt="{{ page.title }}">

---

<img src="/assets/img/windows/php/pos-check.jpg" loading="lazy" alt="{{ page.title }}">

---

<img src="/assets/img/windows/php/ok.jpg" loading="lazy" alt="{{ page.title }}">

---

E então: **Finish** e depois **Finish** de novo!

Ele abrirá o WorkBech:

<img src="/assets/img/windows/php/workbench-start.jpg" loading="lazy" alt="{{ page.title }}">

---

Informar a senha:

<img src="/assets/img/windows/php/pass-work.jpg" loading="lazy" alt="{{ page.title }}">

---

Daqui pra frente é só saber mexer no WorkBench ou qualquer outro que você desejar para criar e manipular seus: schemas, bancos de dados, tabelas,...

Toda vez que você reiniciar o Windows o WorkBench já estará disponivel, basta pesquisar a palavra `WorkBench` na Barra de Iniciar do Windows e clicar em **Abrir**:

<img src="/assets/img/windows/php/open-workbench.jpg" loading="lazy" alt="{{ page.title }}">

Bem como o Apache, se não estiver, entre na pasta(`C:/Apache24/bin`) e inicie com `httpd -k start` manualmente. Mas, muito provavelmente estará! 

Se quiser tentar o [MariaDB](https://terminalroot.com.br/tags#mariadb) em vez do MySQL, fique a vontade em tentar seguindo [esses passos](https://www.mariadbtutorial.com/getting-started/install-mariadb/).

---

# Usando PHP e MySQL no CMD, PowerShell ou Windows Terminal
Assim como no Ubuntu é possível você usar o PHP e o MySQL rodando comandos, seja no `CMD`, [PowerShell](https://terminalroot.com.br/tags#powershell) ou através do [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html).

Para isso basta você criar VARIÁVEIS DE AMBIENTE para o Windows. faça o seguinte:

## Para usar o comando `php`:

#### 1º - Pesquise a frase: `Variáveis de Ambiente` na Barra de pesquisa do Menu Iniciar do Windows:
<img src="/assets/img/windows/php/varenv/php-var-01.jpg" loading="lazy" alt="{{ page.title }}">

---

#### 2º - Clique no botão `Variáveis de Ambiente`:
<img src="/assets/img/windows/php/varenv/php-var-02.jpg" loading="lazy" alt="{{ page.title }}">

---

### 3º - Selecione a linha com o nome `Path` e em seguida clique em `Editar`:
<img src="/assets/img/windows/php/varenv/php-var-03.jpg" loading="lazy" alt="{{ page.title }}">

---

#### 4º - Agora clique no botão `Novo` no canto superior direito:
<img src="/assets/img/windows/php/varenv/php-var-04.jpg" loading="lazy" alt="{{ page.title }}">

---

#### 5º - Escreva o caminho do PHP: `C:\php` na linha que surgiu:
<img src="/assets/img/windows/php/varenv/php-var-05.jpg" loading="lazy" alt="{{ page.title }}">

---

#### 6º - Clique em `OK` em todas as janelas para salvar e depois abra o `CMD` ou `PowerShell` ou o Windows Terminal e use o comando `php`:
> Nos exemplos abaixo rodei o comando `php --version` e também rodei um arquivo com código PHP(que eu criei) que está no mesmo diretório em que rodei o comando `php .\teste.php`:

<img src="/assets/img/windows/php/varenv/php-var-06.jpg" loading="lazy" alt="{{ page.title }}">

---

## Para usar o comando `mysql`:
#### 1º - Faça os mesmos passos em PHP, mas quando for inserir o caminho use o caminho do MySQL que é essa pasta:
<img src="/assets/img/windows/php/varenv/mysql-var-01.jpg" loading="lazy" alt="{{ page.title }}">

Ou seja, o caminho que deve ser incluído é: `C:\Program Files\MySQL\MySQL Server 8.0\bin`, note a versão(altere se a sua for diferente) e que termina com a pasta `bin`, veja também a imagem abaixo:

<img src="/assets/img/windows/php/varenv/mysql-var-02.jpg" loading="lazy" alt="{{ page.title }}">

---

#### 2º - Teste com os comandos `mysql --version` e para logar use o comando `mysql -u root -p` e depois insira a senha que você criou durante o processo de instalação do MySQL.
Veja abaixo esses comandos, além dos comando do MySQL após logar com sucesso!

<img src="/assets/img/windows/php/varenv/mysql-var-03.jpg" loading="lazy" alt="{{ page.title }}">

<img src="/assets/img/windows/php/varenv/mysql-var-04.jpg" loading="lazy" alt="{{ page.title }}">


---

# Aprenda [PHP & MySQL](https://terminalroot.com.br/tags#php):
## Acesse: <https://terminalroot.com.br/php>



