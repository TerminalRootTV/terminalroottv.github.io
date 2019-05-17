---
layout: post
title: Quebrando a senha de root
date: '2014-12-26T09:10:00.002-08:00'
image: '/assets/img/linux/root.jpg'
description: Quebrando a senha de root
main-class: 'linux'
tags:
- Linux
- GNU
---

### A maneira mais fácil de se quebrar a senha de root no Linux é

- Pegar um __LiveCD__ de qualquer distribuição __Linux__ e dar o __boot__ por ele.
- Abrir o __terminal__ e criar um usuário __root(e criar uma senha)__

{% highlight bash %}
sudo passwd root
{% endhighlight %}

- baixar o usuário __root__
{% highlight bash %}
su
{% endhighlight %}

- Verificar o endereço da partição que o __Linux__ está localizado
{% highlight bash %}
fdisk -l
{% endhighlight %}

- C__riar uma pasta__ dentro de __/mnt__ para poder montar o partição dentro dela
{% highlight bash %}
mkdir /mnt/SUAPASTA
{% endhighlight %}

- __Montar essa partição__ pra poder acessá-la
{% highlight bash %}
mount /dev/sda* /mnt/SUAPASTA
{% endhighlight %}

- Entre na partição já montada, pra não acabar de confundindo e alterando o arquivo do __LiveCD__
{% highlight bash %}
cd /mnt/SUAPASTA
{% endhighlight %}

- abra com seu editor preferido o arquivo __shadow__, nesse caso usei o __nano__
{% highlight bash %}
nano -w /etc/shadow
{% endhighlight %}

- Altere a linha correspondente ao usuário __ROOT__, altere o que está root:__NESTE_ESPAÇO_A_NOVASENHA__:13360:0:99999:7:::, porém será um arquivo tipo o abaixo
{% highlight bash %}
root:$1$CLDZNZCB$PbOINV7W3sMIvlaTsrkLi1:13360:0:99999:7::: 
{% endhighlight %}

- Salve o arquivo, desmonte a partição
{% highlight bash %}
umount /mnt/SUAPASTA
{% endhighlight %}

Depois é só __reiniciar o PC, sem o LiveCD__, lógico, e usuar o __root__, se também tiver perdido a senha de algum usuario, este pode ser o procedimento tambeḿ.
