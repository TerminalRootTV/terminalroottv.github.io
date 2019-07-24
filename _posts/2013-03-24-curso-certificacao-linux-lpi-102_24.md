---
layout: post
title: "Curso Certificação Linux LPI-102: Configurando a Rede"
date: '2013-03-24T14:49:00.000-07:00'
image: '/assets/img/lpi/rede-config.jpg'
description: "Várias distribuições oferecem ferramentas próprias para a configuração e carga dos recursos de rede."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Configurando a Rede](/assets/img/lpi/rede-config.jpg "Configurando a Rede")

Várias distribuições oferecem ferramentas próprias para a configuração e carga dos recursos de rede. Entretanto alguns comandos, arquivos e conceitos são aplicáveis a todas elas.Neste tópico será abordado a configuração de uma rede TCP/IP em dispositivos ethernet. O primeiro passo é conhecer os arquivos de configuração de rede comuns a todas as distribuições.

## 1-Ver o nome do sistema:
{% highlight bash %}
cat /etc/hostname
{% endhighlight %}

## 2-Este arquivo faz o mapeamento entre endereços IP e nomes de máquinas de rede e é utilizado para resolução de nomes durante o processo de boot enquanto nenhum servidor de DNS entrou em ação.
{% highlight bash %}
cat /etc/hosts
{% endhighlight %}

## 3-Este arquivo especifica o endereço IP de um ou mais servidores de DNS para resolução de nomes.
{% highlight bash %}
cat /etc/resolv.conf
{% endhighlight %}

## 4-Este arquivo especifica a ordem de procura para a resolução de nomes.O sistema pode procurar os endereços IPs no arquivo /etc/hosts (hosts) e pelo serviço de DNS (bind).A opção multi on habilita mais de um IP para determinada máquina.
{% highlight bash %}
cat /etc/host.conf
{% endhighlight %}


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


## 5-Este arquivo é a evolução do /etc/host.conf e possibilita que a ordem de procura para resolução de nomes seja customizada para cada serviço.Ele é utilizado nas últimas distribuições por diversas bibliotecas ao invés do /etc/host.conf.
{% highlight bash %}
cat /etc/nsswitch.conf
{% endhighlight %}

## 6-Descrever endereçamentos de rede, e portanto os endereços deve terminar com .0.
{% highlight bash %}
cat /etc/networks
{% endhighlight %}

## 7- Este comando mostra o nome local da máquina.Também pode ser utilizado para trocar o nome da máquina se um novo nome for fornecido como argumento.

> Ele suporta a opção __--fdqn__ ( __Fully Qualified Domain Name__ ), que retorna o nome do sistema mais o domínio

{% highlight bash %}
hostname --fqdn
{% endhighlight %}

## 8-Retorna ou configura o domínio Internet da máquina.
{% highlight bash %}
dnsdomainname
{% endhighlight %}

## 9- ifconfig cria e/ou configura as interfaces de rede e seus parâmetros.Esta operação é geralmente feita durante o processo de carga do sistema.

> Se não for passado nenhum parâmetro, ele exibe as configurações das interfaces ativas.

### Os parâmetros podem ser
 
   
![Blog Linux](http://1.bp.blogspot.com/-A5vbwfxBa88/UU9dhmk6pQI/AAAAAAAABOM/1tu5LMxtxBs/s320/IMG-1.jpg "Blog Linux")
    
Como configurar o __IP__, __máscara__ e __broadcast__ dde uma placa de rede
 
{% highlight bash %}
ifconfig eth0 10.1.1.2 netmask 255.255.0.0 brocast 10.0.0.255
ifconfig eth0 up
ifconfig eth0 down
{% endhighlight %}
 
## 10- O comando netstat exibe as conexões de rede, tabela de rotas, estatíticas das interfaces, etc.
{% highlight bash %}
netstat [opções]
{% endhighlight %}


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


## 11-O comando route manipula a tabela de rotas do Kernel.Seu uso primário é para adicionar ou apagar rotas estáticas para máquinas ou redes específicas.

> Se o route for utilizado sem nenhuma opção, exibe a tabela de rotas.Para adicionar uma nova rota utilizamos o parâmetro add.O parâmetro del apaga uma rota.

As opções para os parâmetros add e del são

+ -netmask máscara >> especifica a máscara de subrede para um determinado destino.
+ -gw endereço >> especifica o gateway que será utilizado para alcançar uma determinada máquina ou rede.
 
{% highlight bash %}
route
{% endhighlight %}

## 12-tcpdump é uma ferramenta utilizada para monitorar os pacotes trafegados numa rede de computadores. Ela mostra os cabeçalhos dos pacotes que passam pela interface de rede.

Exemplo de comando tcpdump para mostrar quais as ligações de um determinado endereço tcp-ip à __porta 80__ do seu servidor: 

> tcpdump -ni eth0 src "numero ip" and dst port 80

{% highlight bash %}
tcpdump -i eth0
{% endhighlight %}

Conexões de origem podem ser monitoradas utilizando o parâmetro src host, um exemplo simples seria monitorarmos o tráfego que vem de 192.168.0.9 para nosso computador, com o ip 192.168.0.2. A linha de comando ficaria da seguinte forma

{% highlight bash %}
tcpdump -i eth0 src host 192.168.0.9
{% endhighlight %}


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


Se quisermos monitorar as conexões especificando um host de destino, poderíamos fazê-lo com o parâmetro __dst host__, o exemplo abaixo mostra todo o tráfego do host 192.168.0.2 com 192.168.0.1, no caso, 192.168.0.1 é nosso gateway.
 {% highlight bash %}
tcpdump -i eth0 dst host 192.168.0.1
{% endhighlight %}

Com __tcpdump__ também podemos especificar exceções com o parâmetro not host, por exemplo, em nosso servidor queremos ver todo o tráfego que se passa em sua interface, exceto o de 192.168.0.8, faríamos da seguinte forma:
 {% highlight bash %}
tcpdump -i eth0 not host 192.168.0.9
{% endhighlight %}

No tcpdump podemos também especificar portas de origem e destino com os comandos src port e dst port, um exemplo seria monitorarmos o tráfego destinado à porta __80 (http)__, para isso utilizaríamos a linha de comandos abaixo e navegaríamos em um site qualquer:
 {% highlight bash %}
tcpdump -i eth0 dst port 80
{% endhighlight %}

Para verificarmos o tráfego da porta de origem __32881__ por exemplo, faríamos da seguinte forma:
{% highlight bash %}
tcpdump -i eth0 src port 32881
{% endhighlight %}

Muitas opções avançadas podem ser obtidas com o __tcpdump__, essas são algumas opções básicas, porém fundamentais para quem quer aprender sobre __sniffers__.
 

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

