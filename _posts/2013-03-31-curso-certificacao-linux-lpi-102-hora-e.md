---
layout: post
title: "Curso Certificação Linux LPI-102: Hora e Internacionalização do Sistema"
date: '2013-03-31T15:45:00.000-07:00'
image: '/assets/img/lpi/date.jpg'
description: "Configurando Hora e Internacionalização do Sistema"
main-class: 'linux'
tags:
- Linux
- LPI
---

![Hora e Internacionalização do Sistema](/assets/img/lpi/date.jpg "Hora e Internacionalização do Sistema")

> O diretório abaixo contém as informações de configuração das zonas de fuso horário
{% highlight bash %}
/usr/share/zoneinfo
{% endhighlight %}

> A zona local do sitema é determinada por um link simbólico de algum arquivo deste diretório para o arquivo
{% highlight bash %}
/etc/localtime
{% endhighlight %}

> Copia a hora corrente no relógio da máquina para o relógio da sistema, durante a carga do sistema. Este comando irá assumir que a hora no hardware é a hora local, a menos que a opção __--utc__ seja utilizada
{% highlight bash %}
/sbin/hwclock
{% endhighlight %}

> O comando __date__ também pode ser utilizado para __configurar a data e hora do sistema__. O formato que a data e hora precisam ser informados segue a notação __MMDDhhmmAAAA__, segue:
 
* __MM__ - mês
* __DD__ - dia
* __hh__ - hora
* __mm__ - minuto
* __AAAA__ - ano 

> Os dias e meses menores que __10__ devem ser escritos com __zero na frente__ e as horas no padrão __24h__.
 
## Exemplo

### Configura a hora e data para Sex 13 Mar 2017 21:34 hs 
 
{% highlight bash %}
date 031321342017
{% endhighlight %}
