---
layout: post
title: "Curso Certificação Linux LPI-1: Quotas de Disco"
date: '2012-12-14T06:00:00.000-08:00'
image: "/assets/img/lpi/quotas-linux.jpg"
description: "No Linux existe a possibilidade de habilitarmos quotas de disco para gerenciarmos melhor o uso do espaço disponível em disco."
tags:
- linux
- lpi
---

![Curso Certificação Linux LPI-1: Quotas de Disco](/assets/img/lpi/quotas-linux.jpg "Curso Certificação Linux LPI-1: Quotas de Disco")

No [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Linux) existe a possibilidade de habilitarmos __quotas__ de disco para __gerenciarmos__ melhor o uso do __espaço disponível em disco__. Este recurso é especialmente importante em ambientes multi-usuários, servidores de Web, servidores de arquivos, servidores de e-mail, etc.
 
No gerenciamento de cotas é possível definirmos a quantidade de espaço em disco para cada usuário ou grupo de usuários. É preciso habilitar o gerenciamento de quotas antes de utilizarmos este recurso. Também é preciso que o suporte a quotas esteja compilado no __Kernel__. 

* Edite o arquivo __/etc/fstab__ e adicione o gerenciamento de cota para usuário (__usrquota__) e para grupo (__grpquota__) no dispositivo desejado.
 
{% highlight bash %}
vi /etc/fstab
{% endhighlight %}

## Acrescentar "usrquota" e "gprquota":
 
{% highlight bash %}
/dev/hda6 /home ext3 defaults,usrquota,grpquota 1 2
{% endhighlight %}

* Crie o arquivo __quota.user__ e quota.group no diretório __/home__ e __configure as permissões de leitura e escrita__ para o __root__.Estes dois arquivos serão os bancos de dados para quotas de __usuário__ e __grupo__ respectivamente.
 
## Cria os arquivos de quota
 
{% highlight bash %}
touch /home/quota.user
touch /home/quota.group
{% endhighlight %}
 
## Altera as permissões
 
{% highlight bash %}
chmod 600 /home/quota.user
chmod 600 /home/quota.group
{% endhighlight %}
 
* Execute o comando __quota-check__ para iniciar o banco de dados recém criado, e verifique se o banco de dados foi iniciado. Os arquivos __quota.user__ e __quota.group__ __não devem ter tamanho zero__.
 
{% highlight bash %}
ls -lga /home
{% endhighlight %}
 
* Habilite o serviço de quotas:
 
{% highlight bash %}
quotaon -a
{% endhighlight %}
 
* Tenha certeza de que o serviço de quotas é habilitado no __boot__.Se não existir o arquivo __/etc/rc.d/quotas__, crie um arquivo de script
{% highlight bash %}
vi /etc/rc.d/quotas
#!/bin/bash
/sbin/quotaon -avug
{% endhighlight %}
 
## Altere as permissões para 755
 
{% highlight bash %}
chmod 755 /etc/rc.d/quotas
{% endhighlight %}
 
* Crie o __link simbólico__ para o arquivo de __quotas__ para o __runlevel 3__ e __runlevel 5__:
 
{% highlight bash %}
ln -s /etc/rc.d/quotas /etc/rc.d/rc3.d/S20quotas
ln -s /etc/rc.d/quotas /etc/rc.d/rc5.d/S20quotas
{% endhighlight %}
 
* Faça checagem do sistema de quotas uma vez por semana colocando o comando __quotacheck__ no __cron__ do __root__:
 
{% highlight bash %}
crontab -e
0 3 * * 0 /sbin/quotacheck -avug
{% endhighlight %}
 
Uma vez feitos estes passos o sistema de quotas poderá ser utilizado.
 
 - __user hard limit__ (limite físico), é a quantidade total de espaço em disco que um usuário pode ter.
 
 - __user soft limits __(limite leve), funciona como uma área de aviso, quando o usuário alcança este limite o sistema avisa ao usuário que o espaço físico está acabando.
 
 - __group hard limit__ (limite físico por grupo)
 
 - __group soft limit__ , também área de aviso.
 
 - __grace__ período (Período de Graça), pode-se configurar um período para que o usuário ou grupo que tenha atingido o limite leve possa apagar alguns arquivos e ficar dentro do estabelecido.Este limite pode ser em minutos, horas, dias, semanas e até meses. 

## Comandos
 
> quota [opções] usuário/grupo
 
{% highlight bash %}
quota -v marcos
{% endhighlight %}
 
O usuário __marco__s está usando __18320 blocos__.O limite leve são __19000 blocos__ e o __físico 20000 blocos__.

![Blog Linux](/assets/img/lpi/quotas.jpg "Blog Linux")
 
 
> quotaon [opções] [dispositivos]
 
Habilita quotas de usuários e grupos para todos os dispositivos
{% highlight bash %}
quotaon -avug
{% endhighlight %}
 
> quotaoff [opções] [dispositivo]
 
Desabilita o gerenciamento de quotas num determinado dispositivo
{% highlight bash %}
quotaoff -gu /dev/hda6
{% endhighlight %}
 
Faz uma varredura em determinado dispositivo e constrói os arquivos de banco de dados de quotas
> quotacheck [opções] [dispositivo]
 
 
Este comando edita quotas para usuários e grupos
> edquota [opções] usuário/grupo
 
 
Cria um relatório das quotas e utilização do disco dos usuários
> repquota [opções] [dispositivo]

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



