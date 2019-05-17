---
layout: post
title: "Instale o Free42 - O Emulador Da Hp-42s no Linux"
date: '2016-09-05T17:44:00.001-07:00'
image: '/assets/img/linux/42ck.gif'
description: "Free42 é uma re-implementação da calculadora HP-42S e a impressora HP-82240."
main-class: 'linux'
tags:
- Linux
- Dicas
---
![Instale o Free42 - O Emulador Da Hp-42s no Linux](/assets/img/linux/42ck.gif "Instale o Free42 - O Emulador Da Hp-42s no Linux")

[Free42](http://thomasokken.com/free42/) é uma re-implementação da calculadora __HP-42S__ e a impressora __HP-82240__. É uma reescrita completa, não usa qualquer código __HP__, e não requer uma imagem __ROM HP-42S__ . __Free42__ é um projeto __Open Source__. Os executáveis e código-fonte são liberados sob os termos da __GNU General Public License, versão 2__.

Todo o código de terceiros usados em Free42 seja no domínio público ou licenciado sob termos compatíveis com a GPLv2, ou utilizadas com permissão dos autores. Disponível para Android, Windows, OS X, OS X Dashboard e Linux.

[Download da Calculadora](http://thomasokken.com/free42/download/Free42Linux-32bit.tgz "Instale o Free42 - O Emulador Da Hp-42s no Linux")

[Site e Documentação do Projeto](http://thomasokken.com/free42/ "Instale o Free42 - O Emulador Da Hp-42s no Linux")

### Instalação no GNU/Linux

- Baixe
{% highlight bash %}
wget http://thomasokken.com/free42/download/Free42Linux-32bit.tgz
{% endhighlight %}

- Descompacte
{% highlight bash %}
tar -zxvf Free42Linux-32bit.tgz
{% endhighlight %}

- Acesse o diretório
{% highlight bash %}
cd Free42Linux
{% endhighlight %}

- E rode
{% highlight bash %}
./free42bin
{% endhighlight %}

Vc pode tb mover pro __/usr/bin__ e criar um atalho em __/usr/share/applications/__ e usar com mais praticidade!

Vc tb pode usar __Skins__ para deixá-la como na imagem desse post!

![Instale o Free42 - O Emulador Da Hp-42s no Linux](/assets/img/linux/Free42Linux.jpg "Instale o Free42 - O Emulador Da Hp-42s no Linux")

[Download dos Skins](http://thomasokken.com/free42/download/Free42Skins.zip "Instale o Free42 - O Emulador Da Hp-42s no Linux")

Para alterar o Skin , acesse Skin e depois selecione __Realistic__
