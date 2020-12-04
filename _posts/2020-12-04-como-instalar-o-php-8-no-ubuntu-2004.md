---
layout: post
title: "Como Instalar o PHP 8 no Ubuntu 20.04"
date: 2020-12-04 14:52:57
image: '/assets/img/php/php-8.jpg'
description: 'Este artigo mostrará como instalar o PHP 8 no Ubuntu 20.04 e integrá-lo ao Apache.'
icon: 'cib:php'
iconname: 'php'
tags:
- php
- apache
---

![Como Instalar o PHP 8 no Ubuntu 20.04](/assets/img/php/php-8.jpg)

**PHP 8.0** é a mais recente versão do [PHP](https://terminalroot.com.br/tags#php). Ele [trouxe diversas novidades](https://terminalroot.com.br/2020/08/conheca-as-novidades-do-php-8.html), melhorias de desempenho e muitos recursos novos , como argumentos nomeados, compilador JIT, tipos de união, expressão de correspondência e muito mais.

Este artigo mostrará como instalar o PHP 8 no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) 20.04 e integrá-lo ao [Apache](https://terminalroot.com.br/tags#apache).

No momento em que este artigo foi escrito, os repositórios padrão do Ubuntu 20.04 incluem a versão PHP 7.4. Vamos instalar o PHP do repositório `ondrej/php` via PPA.

Antes de atualizar ou instalar o PHP 8, certifique-se de que seus aplicativos sejam compatíveis.

As mesmas etapas se aplicam ao Ubuntu 18.04 e a todas as distribuições baseadas no Ubuntu, incluindo Kubuntu, [Linux Mint](https://terminalroot.com.br/tags#linuxmint) e Elementary OS.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Habilitando Repositório PHP
*Ondřej Surý*, um desenvolvedor [Debian](https://terminalroot.com.br/tags#debian), mantém um repositório que inclui várias versões do PHP. Para habilitar o repositório , rode:
```sh
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
```
Assim que o PPA estiver habilitado, você pode instalar o PHP 8.

# Instale PHP como Módulo Apache
Instalar o PHP como um módulo Apache é uma tarefa simples:
```sh
sudo apt update
sudo apt install php8.0 libapache2-mod-php8.0
```
Depois que os pacotes forem instalados, reinicie o Apache para que o módulo PHP seja carregado:
```sh
sudo systemctl restart apache2
```

# Configure o Apache com PHP-FPM
Php-FPM é um gerenciador de processos FastCGI para PHP. Execute o seguinte comando para instalar os pacotes necessários:
```sh
sudo apt update
sudo apt install php8.0-fpm libapache2-mod-fcgid
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

Por padrão, o PHP-FPM não está habilitado no Apache. Para habilitá-lo, execute:
```sh
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php8.0-fpm
```

Para ativar as mudanças, reinicie o Apache:
```sh
systemctl restart apache2
```

# Instalando extensões PHP
Extensões PHP são bibliotecas compiladas que estendem a funcionalidade central do PHP. As extensões estão disponíveis como pacotes e podem ser facilmente instaladas com apt:
```sh
sudo apt install php8.0-[extname]
```

Por exemplo, para instalar extensões [MySQL](https://terminalroot.com.br/mysql/) e GD, você executaria o seguinte comando:
```sh
sudo apt install php8.0-mysql php8.0-gd
```

Depois de instalar uma nova extensão PHP, não se esqueça de reiniciar o Apache ou o serviço PHP FPM, dependendo de sua configuração.

#Testando o funcionamento de PHP
Para testar se o servidor da web está configurado corretamente para processamento de PHP, crie um novo arquivo denominado `info.php` dentro do `/var/www/html` diretório com o seguinte código:
```php
<?php
  phpinfo();
```

![PHP 8 Apache Ubuntu](/assets/img/php/php8-apache.jpg)

# Conclusão
Instalar o PHP 8 no servidor Ubuntu 20.04 é uma tarefa simples. Tudo que você precisa fazer é habilitar o repositório "`ondrej/php`" e instalar o **PHP 8** com `apt`.

Se você ainda não sabe, ou se sente inseguro em [MySQL/MariaDB](https://terminalroot.com.br/mysql/) sugiro você fazer nosso [Curso de Desenvolvimento Web do Zero - PHP & MySQL](https://terminalroot.com.br/php/) que além de MySQL/MariaDB você vai aprender [PHP](https://terminalroot.com.br/php/) do jeito certo! Além de:
+ Programação Orientada a Objetos;
+ Wordpress;
+ Laravel;
+ Composer;
+ Psy Shell;
+ PHP-GTK;
+ Redirecionamento sem alterar a URL;
+ PHPMailer;
+ Deploy de PHP puro e de Laravel na Heroku;
+ E muito mais!

É recomendado também pra quem não sabe nada, pois o curso inclui: [HTML e CSS](https://www.youtube.com/watch?v=SGA6nQqYH7A), [Javascript](https://www.youtube.com/watch?v=HI6YZJxoaIQ), [Bootstrap](https://www.youtube.com/watch?v=mRlkt7P2gZI), [Jekyll](https://www.youtube.com/watch?v=7lI5BfHK-kA), [GitHub](https://terminalroot.com.br/git), [Gitlab e Netlify](https://www.youtube.com/watch?v=ahkpilbOtpE).

Corre que ainda dá tempo! [Clique aqui para saber mais sobre o curso](https://terminalroot.com.br/php/).


<!-- RETANGULO LARGO -->
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

Via: [Linuxize](https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/)


