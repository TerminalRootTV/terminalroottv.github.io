---
layout: post
title: "Curso Certificação Linux LPI-102: Impressão no Linux"
date: '2013-03-31T14:36:00.000-07:00'
image: '/assets/img/lpi/printer-linux.jpg'
description: "Como configurar e compartilhar impressão no Linux"
main-class: 'linux'
tags:
- Linux
- LPI
---

![Impressão no Linux](/assets/img/lpi/printer-linux.jpg "Impressão no Linux")

> __lp__ - envia requisições à impressora

> Sintaxe: lp [-mw] [-ddest] [-n#] filename...

Opções
* __-w__: escreve mensagem no terminal do usuário
* __-ddest__: impressora destino
  
### Exemplo
{% highlight bash %}
lp -m -dlw rel.ps
{% endhighlight %}

Imprimindo diretamente
{% highlight bash %}
cat texto.txt > /dev/lp0
{% endhighlight %}

Imprimindo indiretamente
{% highlight bash %}
cat texto.txt | lpr
{% endhighlight %}

{% highlight bash %}
lpr texto.txt
{% endhighlight %} 

Monitorar: fila (__queue__) de impressão
{% highlight bash %}
lpq
{% endhighlight %}

Gerenciar: cancelando impressões/jobs
{% highlight bash %}
lprm #cancela a última impressão/job do usuário corrente
{% endhighlight %} 

Gerenciar: controlando o __lpd__ com o __lpc__
{% highlight bash %}
lpc 
{% endhighlight %}

Arquivo de configuração - permissao de acesso
> se esse arquivo existir, os usuarios remotos nao conseguirao imprimir. Para imprimir se deve excluir esse arquivo ou inserir dentro dele os enderecos dos hosts remotos que podem imprimir
{% highlight bash %}
vi /etc/hosts.lpd
{% endhighlight %} 

Arquivo de configuração - geral
{% highlight bash %}
vi /etc/printcap
{% endhighlight %}

## Compartilhando impressoras

O __Cups__, o __servidor de impressão__ padrão no Linux, possui um recurso nativo de compartilhamento de impressoras. Ele permite não apenas compartilhar impressoras com outras máquinas Linux, mas também com máquinas Windows da rede, através de um servidor unificado. Para habilitar o compartilhamento, edite o arquivo "__/etc/cups/cupsd.conf__", deixando-o com o seguinte conteúdo:
{% highlight bash %}
Port 631
Listen 631
Browsing On
BrowseAllow All
BrowseInterval 30
BrowseAddress @LOCAL
BrowseInterval 30
Order allow,deny
Allow all
Order allow,deny
Allow all
Encryption Required
Order allow,deny
Allow localhost
AuthType Basic
Require user @SYSTEM
Order allow,deny
Allow localhost
{% endhighlight %}

Veja que a seção "__/printers__", que contém as impressoras, fica com permissão de acesso para todo mundo, enquanto o utilitário de administração do Cups (seção /admin) continua acessível apenas localmente, através do endereço __http://127.0.0.1:631__.

Até aqui, não estamos impondo nenhum tipo de restrição, por isso contamos com o firewall para bloquear qualquer tentativa de impressão proveniente de micros da Internet. Você pode também fazer o compartilhamento de uma forma mais segura, especificando manualmente a faixa de endereços da rede local, ou mesmo especificando individualmente os endereços IP que poderão imprimir. 

Neste caso, as seções onde vai a configuração que permite aos clientes verem as impressoras disponíveis) e  ficaria
{% highlight bash %}
Order Deny,Allow
Deny From All
Allow From 127.0.0.1
Allow From 192.168.0.*
Order Deny,Allow
Deny From All
Allow From 127.0.0.1
Allow From 192.168.0.*
{% endhighlight %}

Não se esqueça de incluir o endereço "127.0.0.1" na lista. Caso contrário, todo mundo vai imprimir na impressora, menos você mesmo :).
Depois de alterar o arquivo, reinicie o servidor de impressão para que as alterações entrem em vigor

{% highlight bash %}
/etc/init.d/cups restart
{% endhighlight %}

Compartilhar impressoras através do Cups é mais simples do que fazê-lo através do Samba e oferece a vantagem adicional de permitir o uso do recurso de autodiscover do Cups nos clientes Linux. O autodiscover permite que os clientes Linux da rede reconheçam automaticamente a impressora compartilhada e a configurem automaticamente durante o boot, sem necessidade de nenhuma intervenção manual.


Fontes:

www.hardware.com.br

www.hugoazevedo.eti.br

www.openit.com.br 

