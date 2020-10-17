---
layout: post
title: "Curso Certificação Linux LPI-102: Configurando o DHCP"
date: '2013-03-26T17:00:00.000-07:00'
image: '/assets/img/lpi/dhcp.jpg'
description: "Hoje em dia, quase todas as redes utilizam algum tipo de servidor DHCP."
tags:
- linux
- lpi
---
![Curso Certificação Linux LPI-102: Configurando o DHCP](/assets/img/lpi/dhcp.jpg "Curso Certificação Linux LPI-102: Configurando o DHCP")

Hoje em dia, quase todas as redes utilizam algum tipo de servidor __DHCP__. Em geral, eles são ativados automaticamente ao compartilhar a conexão ou junto com algum outro serviço, de forma que você acaba não aprendendo muita coisa sobre a sua configuração.

De um modo geral, o trabalho de um servidor __DHCP__ é bastante simples. Ele responde aos pacotes de __broadcast__ das estações, enviando um pacote com um dos endereços IP disponíveis e os demais dados da rede. Os pacotes de broadcast são endereçados ao endereço "__255.255.255.255__" e são retransmitidos pelo __switch__ da rede para todas as portas, diferente dos pacotes endereçados a um endereço específico, que são transmitidos apenas na porta relacionada a ele.

Periodicamente o servidor __DHCP__ verifica se as estações ainda estão lá, exigindo uma renovação do "__aluguel__" do endereço __IP__ (opção "__lease time__"). Isso permite que os endereços IP sejam gastos apenas com quem realmente estiver online, evitando que os endereços disponíveis se esgotem.

O servidor __DHCP__ mais usado no __Linux__ é o __ISC DHCP__, desenvolvido pela __Internet Systems Consortium__, uma organização sem fins lucrativos dedicada a desenvolver serviços de infra-estrutura usados na Internet, incluindo o __Bind__ e o __NTPD__. Caso esteja curioso, a página com o código fonte é a [http://www.isc.org/sw/dhcp/](http://www.isc.org/sw/dhcp/).

Nas distribuições derivadas do [Debian](http://www.debian.org/), o pacote correspondente ao servidor __DHCP__ se chama "__dhcp3-server__" e pode ser instalado via __apt-get__
{% highlight bash %}
apt-get install dhcp3-server
{% endhighlight %}

Com o pacote instalado, você pode ativar e desativar o serviço usando os comandos
{% highlight bash %}
/etc/init.d/dhcp3-server start
{% endhighlight %}

{% highlight bash %}
/etc/init.d/dhcp3-server stop
{% endhighlight %}

Como você pode imaginar, o "__3__" corresponde à __versão do software__. Eventualmente ele será substituído pelo "__dhcp4-server__", o que resultará também na mudança do nome da pasta onde fica o arquivo e do script de inicialização referente ao serviço.

No __Fedora__ e no __CentOS__, o pacote se chama simplesmente "__dhcp__" e pode ser instalado usando o __yum__


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


{% highlight bash %}
yum install dhcp
{% endhighlight %}

Embora o pacote se chame apenas "__dhcp__", o script referente ao serviço se chama "__dhcpd__", de forma que os comandos para iniciar e parar o serviço são
{% highlight bash %}
service dhcpd start
{% endhighlight %}

{% highlight bash %}
service dhcpd stop
{% endhighlight %}

Diferente do __Debian__, o serviço não será configurado para ser inicializado durante o boot depois de instalado. Você precisa ativá-lo manualmente usando o comando "__chkconfig__":
{% highlight bash %}
chkconfig dhcpd on
{% endhighlight %}

O arquivo de configuração é o "__dhcpd.conf__". Nas distribuições derivadas do Debian, o caminho completo para ele é "__/etc/dhcp3/dhcpd.conf__", enquanto no __Fedora__ e no __CentOS__ é apenas "__/etc/dhcpd.conf__", ou seja, um diretório acima.
Apesar dessas diferenças estéticas, o que interessa mesmo é a configuração do arquivo e esta sim é igual, independentemente da distribuição.

Este é um exemplo de arquivo de configuração básico
{% highlight bash %}
/etc/dhcp3/dhcpd.conf
ddns-update-style none;
default-lease-time 600;
max-lease-time 7200;
authoritative;
subnet 192.168.1.0 netmask 255.255.255.0 {
range 192.168.1.100 192.168.1.199;
option routers 192.168.1.1;
option domain-name-servers 208.67.222.222,208.67.220.220;
option broadcast-address 192.168.1.255;
}
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


A opção "__default-lease-time__" controla o tempo de renovação dos endereços __IP__. O "__600__" indica que o servidor verifica a cada dez minutos se as estações ainda estão ativas. Se você tiver mais endereços IP do que máquinas, os endereços IP das estações raramente vão precisar mudar. Mas, no caso de uma rede congestionada, o "__max-lease-time__" determina o tempo máximo que uma estação pode usar um determinado endereço __IP__. 


Isso foi planejado para ambientes onde haja escassez de endereços __IP__, como, por exemplo, em um provedor de acesso, onde sempre existem mais clientes do que endereços __IP__ disponíveis e se trabalha contando que nem todos vão ficar conectados simultaneamente. Em condições normais, essas duas opções não são muito importantes. O que interessa mesmo é o bloco que vai logo abaixo, onde ficam as configurações da rede.
A opção "__range__" determina a faixa de endereços IP que será usada pelo servidor. 


Se você utiliza a faixa de endereços __192.168.1.1__ até __192.168.1.254__, por exemplo, pode reservar os endereços de 192.168.1.1 a 192.168.1.100 para estações configuradas com IP fixo e usar os demais para o __DHCP__, ou então reservar uma faixa específica para ele, de 192.168.1.101 a 192.168.1.201, por exemplo. O importante é usar faixas separadas para o DHCP e os micros configurados com __IP fixo__.


Na "__option routers__" vai o endereço do default gateway da rede, ou seja, o endereço do servidor que está compartilhando a conexão. Não é necessário que o mesmo micro que está compartilhando a conexão rode também o servidor DHCP. Pode ser, por exemplo, que na sua rede o gateway seja o próprio modem ADSL que está compartilhando a conexão e o DHCP seja um dos PCs.


A opção "__option domain-name-servers__" contém os servidores DNS que serão usados pelas estações. Ao usar dois ou mais endereços, eles devem ser separados por vírgula, sem espaços. Em geral, você vai usar os próprios endereços DNS do provedor, a menos que você configure um servidor DNS interno na sua rede (que pode ser instalado no próprio micro que está compartilhando a conexão e rodando o DHCP). Estes serviços consomem poucos recursos da máquina.


__O servidor DNS__ mais usado no __Linux__ é o __Bind__. Nas distribuições derivadas do Debian você pode instalá-lo com um "__apt-get install bind__". O servidor __DNS__ pode ser configurado para implementar um sistema de domínios e subdomínios na sua rede, mas o uso mais comum é simplesmente fazer um "cache", onde o servidor DNS simplesmente repassa as requisições para um dos 13 root servers da internet e vai armazenando os endereços que já foram acessados. Mais adiante teremos um capítulo inteiro dedicado a ele.


Você pode substituir o arquivo de configuração padrão por este modelo, ou editá-lo conforme a necessidade. Ao fazer qualquer alteração no arquivo, você deve reiniciar o servidor DHCP usando o comando
{% highlight bash %}
/etc/init.d/dhcp3-server restart
{% endhighlight %}

ou

{% highlight bash %}
service dhcpd restart
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


Com o servidor DHCP configurado, você pode testar a configuração em um dos clientes Linux, configurando a rede usando o "dhclient", seguido da interface a ser configurada. Ele mostra toda a negociação entre o servidor e o cliente, o que permite que você verifique se o servidor está usando a configuração definida por você
{% highlight bash %}
dhclient eth0
Internet Systems Consortium DHCP Client V3.0.4
Copyright 2004-2006 Internet Systems Consortium.
All rights reserved.
For info, please visit http://www.isc.org/sw/dhcp/
Listening on LPF/eth1/00:15:00:4b:68:db
Sending on LPF/eth1/00:15:00:4b:68:db
Sending on Socket/fallback
DHCPREQUEST on eth1 to 255.255.255.255 port 67
DHCPACK from 192.168.1.1
bound to 192.168.1.199 -- renewal in 245 seconds.
{% endhighlight %}

Como você pode ver, o cliente deve receber a resposta a partir do endereço IP do servidor rodando o servidor DHCP e ser configurado com um endereço dentro da faixa definida por você.


Uma observação importante é que sempre que configurar um servidor com duas placas de rede, você deve configurar o servidor DHCP para escutar apenas na placa da rede local. No Debian, esta configuração vai no arquivo "__/etc/default/dhcp3-server__". Procure pela linha:

> INTERFACES=""

... e adicione a placa que o servidor DHCP deve escutar, como em

> INTERFACES="eth0"


## Para que a configuração entre em vigor, basta reiniciar o serviço novamente

Fonte: www.hardware.com.br

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



