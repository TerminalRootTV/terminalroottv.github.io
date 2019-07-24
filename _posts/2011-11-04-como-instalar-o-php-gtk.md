---
layout: post
title: 'Como instalar o PHP-GTK'
date: '2011-11-04T18:02:00.000-07:00'
description: 'Caso seu sistema não tenha a biblioteca Gtk2 instalada, você poderá baixar a versão estática, que contém toda a biblioteca Gtk2 compilada'
main-class: 'misc'
tags:
- PHP-GTK
---

Caso seu sistema não tenha a __biblioteca Gtk2__ instalada, você poderá baixar a versão estática, que contém toda a biblioteca Gtk2 compilada, bem como suas dependências, disponível nos pacotes a seguir. Os pacotes acompanham estes componentes

- PHP-5.2.13;
- PHP-GTK-2.0.1 com GtkSourceView;
- GTK-2.18, Cairo-1.8, Pango-1.26;
- GD, libpng, libjpeg, libxml; libglade;
- PDO com MySql, PostgreSql, SQLite.

> Obs: este link é para __32-bits__.

[Clique aqui para fazer download do pacote](http://downloads.sourceforge.net/agata/php-gtk2d2-bin-static.tar.gz)

## Procedimento para Instalação

Para instalação, salve o arquivo no diretório __/usr/local__ do seu sistema e siga as seguintes instruções

Como usuário __root__

{% highlight bash %}
cd /usr/local
tar -xzvf php-gtk2xx.tar.gz
chmod 777 php-gtk2 -Rf
{% endhighlight %}

A partir da versão __PHP-GTK2__, execute o comando abaixo

{% highlight bash %}
cp -R /usr/local/php-gtk2/share/gtksourceview-1.0/ /usr/share/
{% endhighlight %}

Após, vamos construir um link para facilitar a execução

{% highlight bash %}
ln -sf /usr/local/php-gtk2/bin/php /usr/bin/php-gtk2
exit
{% endhighlight %}

## Testando o php-gtk2

escreva o seguinte programa

{% highlight php %}
<?php
$janela = new GtkWindow;
$janela->show_all();
Gtk::Main();
?>
{% endhighlight %}

Vá até a pasta onde vc salvou e digite

{% highlight bash %}
php-gtk2
{% endhighlight %}

> Obs: Se aparecer uma janela na tela, funcionou.


Para Instalar o __Glade__, basta

{% highlight bash %}
emerge glade
{% endhighlight %}


### Pronto!

fonte: PHP-GTK

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

