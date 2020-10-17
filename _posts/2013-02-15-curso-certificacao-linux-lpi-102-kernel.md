---
layout: post
title: "Curso Certificação Linux LPI-102: Kernel Linux"
date: '2013-02-15T17:09:00.000-08:00'
image: '/assets/img/lpi/kernel.jpg'
description: "O núcleo do Linux (Linux Kernel) forma a estrutura base do sistema operacional GNU/Linux, que é um sistema operacional tipo unix."
tags:
- linux
- lpi
---
![Kernel Linux](/assets/img/lpi/kernel.jpg "Kernel Linux")

O núcleo do [Linux](https://www.kernel.org/) [(Linux Kernel)](https://www.kernel.org/) forma a estrutura base do sistema operacional [GNU/Linux](http://terminalroot.com.br/2016/05/porque-eu-nao-uso-linux.html), que é um sistema operacional tipo [Unix®](http://www.unix.org/). O núcleo do __Linux__ é um dos exemplos mais proeminentes de [Software Livre](https://www.fsf.org/pt-br), pois pode prover alicerce para o desenvolvimento e execução de outros [softwares livres](http://terminalroot.com.br/tags/#software-livre).

[O núcleo Linux](https://www.kernel.org/) é distribuído sob a licença [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) __versão 2 (GPLv2)__, sendo desenvolvido por colaboradores em todo o mundo. O desenvolvimento ocorre a partir da lista de e-mail do núcleo Linux [Linux kernel mailing list](https://lkml.org/).

O [Linux](https://pt.wikipedia.org/wiki/Linux) foi concebido pelo estudante do Departamento de Ciência da Computação da Universidade de Helsinki na Finlândia, [Linus Torvalds](https://github.com/torvalds) com ajuda de vários programadores voluntários por meio da [Usenet](https://pt.wikipedia.org/wiki/Usenet) (antecessora da Internet) em 1991.


## Suporte aos dispositivos de hardware

* Códigos dos drivers dos dispositivos podem ser carregados no próprio coração do núcleo(monolítico, rápido e flexível)
* Códigos dos drivers dos dispositivos podem ser carregados separadamente(os Módulos)("modulo.o", depende da versão do Kernel)
* O número de versão menor (o segundo componente) par indicavam uma série estável: 1.0.x, 1.2.x, 2.0.x, 2.2.x e 2.4.x;

> Os módulos são dispnibilizados em [/lib/modules/versao-do-kernel](file:///lib/modules/)

## Para visualizar a versão no Kernel, alguns comandos

### Padrão
{% highlight bash %}
uname -r
{% endhighlight %}

### Visualiza com distro
{% highlight bash %}
uname -a
{% endhighlight %}

### Visualização mais completa
{% highlight bash %}
cat /proc/version
{% endhighlight %}

### Outar forma no Debian, por exemplo
{% highlight bash %}
cat /etc/issue
{% endhighlight %}

### Para listar os módulos disponíveis e utilizados
{% highlight bash %}
lsmod
{% endhighlight %}

__ou__

{% highlight bash %}
cat cat /proc/modules
{% endhighlight %}

### Para carregar um módulo para dentro do Kernel, se não for informado o caminho, o mesmo será procurado no arquivo /etc/modules.conf
{% highlight bash %}
insmod [opções] [módulo]
{% endhighlight %}

### Para remover ou descarregar um módulo do Kernel(quando não estiver em uso)
{% highlight bash %}
rmmod [opções] [módulo]
{% endhighlight %}

### Para obter informações sobre determinado módulo
{% highlight bash %}
modinfo [opções] [módulo]
{% endhighlight %}

### O MAIS USADO DE TODOS, usado para carregar e descarregar os módulos de forma inteligente do Kernel
{% highlight bash %}
modprobe [opções] [módulo] [parâmetros do módulo]
{% endhighlight %}

### Cria uma lista de dependências entre módulos
{% highlight bash %}
depmode [opções]
{% endhighlight %}


## Para Instalar um novo Kernel, consulte esse link:
[Como Compilar o Kernel](http://terminalroot.com.br/2012/01/como-compilar-o-kernel-304.html)


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



