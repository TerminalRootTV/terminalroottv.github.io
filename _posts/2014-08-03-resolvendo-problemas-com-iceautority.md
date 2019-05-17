---
layout: post
title: 'Resolvendo problemas com .ICEautority'
date: '2014-08-02T21:11:00.002-07:00'
image: '/assets/img/linux/ICEautority.jpg'
description: 'Caso você tenha problemas ao iniciar o sistema com a mensagem de problema com o ICEauthority.'
main-class: 'linux'
tags:
- Linux
- GNU
- Imagens
---

![Resolvendo problemas com .ICEautority](/assets/img/linux/ICEautority.jpg "Resolvendo problemas com .ICEautority")

Caso você tenha problemas ao iniciar o sistema com a mensagem de problema com o ICEauthority.
+ 1 - use um cd de boot, ou o modo recovery ou use um outro tty
+ 2 - entre na pasta raíz do usuário como root

{% highlight bash %}
su
cd /home/usuário/
{% endhighlight %}

+ 3 - Mude as permissões do arquivo .ICEauthority
{% highlight bash %}
chown usuário:usuário /home/usuário/.ICEauthority
chmod 644 /home/usuário/.ICEauthority
{% endhighlight %}

Se vc montou não esqueça de desmontar para evitar problemas no seu HD, depois reinicie o sistema

{% highlight bash %}
reboot
{% endhighlight %}

### Pronto!
