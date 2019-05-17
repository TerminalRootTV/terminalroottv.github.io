---
layout: post
title: "Recuperando e configurando o Grub 2 no Debian"
date: '2015-01-11T04:05:00.005-08:00'
image: '/assets/img/terminal/grub.jpg'
description: "Veja o passo a passo para conseguir tal façanha."
main-class: 'debian'
tags:
- Debian
---
![Recuperando e configurando o Grub 2 no Debian](/assets/img/terminal/grub.jpg "Recuperando e configurando o Grub 2 no Debian")

## Passos

1 - Verifique os números de suas partições(crie uma conta __root__ se não já estiver nela)
{% highlight bash %}
fdisk -l
{% endhighlight %}

2 - Entre com a mídia de qualquer __Distro Linux live__ e __monte a partição de boot__
{% highlight bash %}
mount /dev/sda1 /mnt/
{% endhighlight %} 

3 - Perceba que você montou uma partição,mas o __GRUB__ precisa ser instalado no __HD__ (__sda__ ≠ __sda1__, logo instale em __sda__)
{% highlight bash %}
grub-install --root-directory=/mnt/ /dev/sda
{% endhighlight %}

4 - Se quiser, __atualize o GRUB__
{% highlight bash %}
update-grub 
{% endhighlight %}

__E não esqueça de desmontar a partição__
{% highlight bash %}
umount /mnt/
{% endhighlight %}

## Reinicie e pronto!
