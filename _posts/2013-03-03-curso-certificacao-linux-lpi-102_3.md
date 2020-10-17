---
layout: post
title: "Curso Certificação Linux LPI-102: Fundamentos e Serviços de Rede - TCP-IPv4"
date: '2013-03-03T12:54:00.000-08:00'
image: '/assets/img/lpi/rede-de-computadores.jpg'
description: "O TCP/IP é um conjunto de protocolos de comunicação entre computadores em rede (também chamado de pilha de protocolos TCP/IP)."
tags:
- linux
- lpi
- redes
---


![Curso Certificação Linux LPI-102: Fundamentos e Serviços de Rede - TCP-IPv4](/assets/img/lpi/rede-de-computadores.jpg "Curso Certificação Linux LPI-102: Fundamentos e Serviços de Rede - TCP-IPv4")

> O __TCP/IP__ é um conjunto de protocolos de comunicação entre computadores em rede (também chamado de __pilha de protocolos TCP/IP__). Seu nome vem de __dois protocolos__: o __TCP (Transmission Control Protocol - Protocolo de Controle de Transmissão)__ e o __IP (Internet Protocol - Protocolo de Interconexão)__.

O endereço __IP__ é escrito na notação decimal com __4 posições de 8 bits__ cada, totalizando __32 bits__ . Cada parte do endereço pode ir de __0 a 255 na notação decimal__.

> __x.y.z.k__

> __192.168.1.1__

O protocolo permite que uma rede seja dividida em __classes__ e __subclasses__ indicam onde começa e termina uma rede e precisam de dois IPs para marcar o seu início e final. Essa divisão é feita utilizando a máscara de rede.


> IP:    192.168.1.1

> Subrede:  255.255.255.0

Os __bits__ de valor __1__ na __máscara__ indicam quais bits do endereço serão usados como endereçamento de rede.O valor __0__ indica os bits que serão usados como __endereçamento__ de máquinas. Veja o exemplo abaixo(192.168.1.1)

![Blog Linux](/assets/img/lpi/tcp-ip.jpg "Blog Linux")


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


O __modelo TCP/IP__ tem __5 classes de endereços__ definidas pelas letras: __A__, __B__, __C__, __D__ e __E__.

## Classe A

![Blog Linux](/assets/img/lpi/classe-A.jpg "Blog Linux")

## Classe B
![Blog Linux](/assets/img/lpi/classe-B.jpg "Blog Linux")

## Classe C
![Blog Linux](/assets/img/lpi/classe-C.jpg "Blog Linux")

## Classe D e Classe E:
![Blog Linux](/assets/img/lpi/classes-D-E.jpg "Blog Linux")

Existem alguns endereços __IP__ especiais que são reservados para funções específicas que não podem ser utilizados como endereços de uma máquina da rede.A __classe A__ 127.0.0.1 é utilizada como referência a própria máquina.Normalmente o endereço __127.0.0.1__ é associado ao nome localhost.
 
![Blog Linux](/assets/img/lpi/tabela-classes.jpg "Blog Linux")

O modelo inicial do __TCP/IP__ é baseado em __4 níveis__ :
* Host/rede; 
* Inter-rede; 
* Transporte; e Aplicação. 

Surgiu, então, um __modelo híbrido__, com __5 camadas__, que retira o excesso do __modelo OSI__ e melhora o modelo __TCP/IP__ : 
+ Física;
+ Enlace;
+ Rede;
+ Transporte;
+ Aplicação.
 
![Blog Linux](/assets/img/lpi/protocolo-tcp-ip.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/osi-tcp-ip.jpg "Blog Linux")


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


![Blog Linux](/assets/img/lpi/camadas.jpg "Blog Linux")

As aplicações fazem acesso à camada de transporte através de portas. Elas podem ser vistas como canais de comunicações.Cada porta é referênciada como número inteiro, que a identifica e a aplicação que ela dá suporte. Este número é um valo de __16-bit__, que vai do __1__ ao __65535__ em __decimal__ .

Os pacotes __TCP__ e __UDP__ contêm em seu cabeçalho informações como endereço IP do remetente, porta de origem, endereço IP e porta de destino. Cada serviço utiliaz uma única porta.
 
Os números de __1 a 1024__ sõ chamados de __portas privilegiadas__ porque os serviços oferecidos através delas executam com autoridade de __super-usuário__.
 
O arquivo __SERVICES__ definem os serviços e as portas conhecidas pelo sistema [Linux](http://www.terminalroot.com.br/tags#linux)
{% highlight bash %}
cat /etc/services
{% endhighlight %}


## Como fazer o Cálculo de Subrede TCP/Ipv4

<iframe width="1246" height="701" src="https://www.youtube.com/embed/GCU_cndQN1Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

 

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



