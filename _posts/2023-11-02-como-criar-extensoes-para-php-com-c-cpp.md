---
layout: post
title: "Como Criar Extensões para PHP com C/C++"
date: 2023-11-02 18:05:17
image: '/assets/img/php/ext-php-cpp-shadow.jpg'
description: 'Aprenda criar extensões para diversas bibliotecas C/C++.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++/PHP'
tags:
- cpp
- linguagemc
- php
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Saber como usar e escrever extensões [PHP](https://terminalroot.com.br/php) é uma habilidade crítica de desenvolvimento de [PHP](https://terminalroot.com.br/tags#php) que pode economizar um tempo significativo e permitir que você adicione rapidamente novos recursos aos seus aplicativos. Nesse vídeo veremos como criar extensões para o [PHP](https://terminalroot.com.br/php) utilizando [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/cpp).

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/1LpR2EYxCMQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  


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

# Códigos criados no vídeo

Dependências:
> Exemplo em Sistemas que usam o APT. 

{% highlight bash %}
sudo apt-get install build-essential php php-dev \
             autoconf automake bison flex re2c gdb \
             libtool make pkgconf valgrind git libxml2-dev libsqlite3-dev
{% endhighlight %}

Arquivo `terminalroot.cpp`:
> Diferentemente do vídeo em ~`ZEND_GET_MODULE(terminalroot_php)`~ tem de ser: `ZEND_GET_MODULE(terminalroot)`.

{% highlight cpp %}
extern "C"{
  #include <php.h>
}

#define PHP_TERMINALROOT_EXTNAME "terminalroot"
#define PHP_TERMINALROOT_VERSION "0.0.1"

PHP_FUNCTION(terminalroot_php);

ZEND_BEGIN_ARG_INFO(arginfo_terminalroot_php, 0)
ZEND_END_ARG_INFO()

zend_function_entry terminalroot_php_functions[] = {
    PHP_FE(terminalroot_php, arginfo_terminalroot_php)
    {NULL, NULL, NULL}
};

zend_module_entry terminalroot_php_module_entry = {
    STANDARD_MODULE_HEADER,
    PHP_TERMINALROOT_EXTNAME,
    terminalroot_php_functions,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    PHP_TERMINALROOT_VERSION,
    STANDARD_MODULE_PROPERTIES
};

ZEND_GET_MODULE(terminalroot)

PHP_FUNCTION(terminalroot_php){
    printf("Minha Primeira Extensão PHP com C++\n");
}
{% endhighlight %}

Arquivo `config.m4`:
{% highlight bash %}
PHP_ARG_ENABLE(terminalroot, Somente um exemplo Básico de Extensão PHP com C++, [ --enable-terminalroot Habilite o Suporte dessa Ext])
if test "$TERMINALROOT" != "no"; then
    PHP_NEW_EXTENSION(terminalroot, terminalroot.cpp, $ext_shared)
    PHP_REQUIRE_CXX() # Se estiver escrevendo em C, ignore essa linha
fi
{% endhighlight %}

Para compilar:
{% highlight bash %}
phpize
./configure --enable-terminalroot
make
sudo make install
{% endhighlight %}

Arquivo `script.php`:
{% highlight php %}
<?php
    terminalroot_php();
{% endhighlight %}

Rodar o arquivo PHP com a extensão:
{% highlight bash %}
php -dextension=terminalroot script.php
{% endhighlight %}

---

# Links úteis
+ <https://terminalroot.com.br/2023/10/crie-jogos-2d-com-php-e-raylib.html>
+ <https://www.zend.com/resources/writing-php-extensions>



