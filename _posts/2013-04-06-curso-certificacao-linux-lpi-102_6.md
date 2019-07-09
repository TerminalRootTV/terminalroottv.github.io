---
layout: post
title: "Curso Certificação Linux LPI-102: Segurança"
date: '2013-04-06T16:14:00.000-07:00'
image: '/assets/img/lpi/security.jpg'
description: "Existem várias ferramentas de segurança que podem auxiliar a vida de um administrador de redes e sistemas no Linux. Aqui abordarei duas fundamentais para obter tal segurança."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Curso Certificação Linux LPI-102: Segurança](/assets/img/lpi/security.jpg "Curso Certificação Linux LPI-102: Segurança")

Existem várias ferramentas de segurança que podem auxiliar a vida de um administrador de __redes/sistemas__ no __Linux__. Aqui abordarei duas fundamentais para obter tal segurança

* __IPTABLES__
* __TCPWRAPPER__

> Vale ressaltar que segurança vai mais além, mas esses dois já estarão de bom tamanho para o entendimento de segurança, em diversos outros aplicativos.

## IPTABLES

Para verificar quais regras estão criadas, se existir, o comando é
{% highlight bash %}
iptables -L
{% endhighlight %}

Se não retornar nada é porque o pacote não está instalado, então você pode instalá-lo pelo comando

{% highlight bash %}
apt-get install iptables
{% endhighlight %}

Rejeitar pacotes de uma porta
{% highlight bash %}
iptables -A INPUT -p tcp --dport 445 -j DROP
{% endhighlight %}

Aceitar pacotes de uma porta
{% highlight bash %}
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
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

Desativar o iptables, isso libera todas as portas
{% highlight bash %}
iptables -F
{% endhighlight %}

Essa regra abaixo fecha todas as portas, porém voçê conecta a internet normalmente, mas aplicativos como Apache por exemplo não funcionará no localhost.
{% highlight bash %}
iptables -A INPUT -p tcp --syn -j DROP
{% endhighlight %}

Aqui abaixo a mesma regra, porém para o protocolo UDP.
{% highlight bash %}
iptables -A INPUT -i ppp0 -p udp --dport 0:30000 -j DROP
{% endhighlight %}

Lembrando que as tabelas do IPTABLES são lidas de cima pra baixo, ou seja, se você quiser fechar todas as portas e liberar somente o apache a porta 80, você precisa primeiro criar a regra que libera a porta 80 (ou as portas que você deseja), pra só depois fechar todas as outras, 

{% highlight bash %}
iptables -A INPUT -p tcp --destination-port 80 -j ACCEPT
{% endhighlight %}, depois:{% highlight bash %}
iptables -A INPUT -p tcp --syn -j DROP
{% endhighlight %}

Para acessar pacotes de determinados IPs de uma rede interna, ou de uma determinada rede, você usar os comandos abaixo
{% highlight bash %}
iptables -A INPUT -p tcp --syn -s 192.168.1.107/255.255.255.0 -j ACCEPT
iptables -A INPUT -p tcp --syn -s 192.168.0.0/255.255.255.0 -j ACCEPT
{% endhighlight %}

Aceitar as requisições do IP 192.168..107 e no comando seguinte, aceitará todas as requisições da rede interna, se logo depois vc fechar tudo pra internet, a regra de aceitar será válida, o inverso não.

Para configurações de compartilhamento, seria regras de NAT,assim
Para compartilhar a conexão do modem com a rede local
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
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

Para compartilhar uma conexão via ADSL ou cabo instalada na eth0
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
{% endhighlight %}

Para desativar o compartilhamento, você deve usar o comando 
{% highlight bash %}
iptables -t nat -F.
{% endhighlight %}

> Uma observação é que estas regras não incluem um servidor DHCP, você deve configurar os clientes com endereço IP fixo ou então ativar o serviço DHCPD na sua distribuição.Será necessário também configurar os DNS, se não souber os endereços do seu provedor, você pode usar os DNS públicos do Google 8.8.8.8 e 8.8.4.4 .

Mais uma linha interessante de se adicionar, que protege contra pacotes danificados (usados em ataques DoS por exemplo) é
{% highlight bash %}
iptables -A FORWARD -m unclean -j DROP
{% endhighlight %}

Esta linha deve ser adicionada antes das demais).
Depois de todas as regras criadas, voçê criar um script em Shell e gravar na pasta /usr/bin/ com o nome que você deseja e poderá executar esse nome no terminal que automaticamente, será criadas as regras, lembrando que para isso tem de estar com permissão de execução e deve ser o usuário root.Você também pode torná-lo inicializável, em Debian e Debian-Likes(Ubuntu, Linux Mint,...) com o comando:

{% highlight bash %}
update-rc.d nome_do_script defaults
{% endhighlight %}

Para excluir basta trocar o defaults por remove. Para fazer um forward(Redirecionamento, exemplo: uma solicitação de jogo na porta 27020, você quer que seja direcionada ao PC 192.168.1.107 da sua rede)com Iptables.
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A PREROUTING -i etho -p tcp --dport 22 -j DNAT --to-dest 192.168.1.107
iptables -A FORWARD -p tcp -i eth0 --dport 22 -d 192.168.1.107 -j ACCEPT
{% endhighlight %}

Você pode repetir o comando várias vezes para direcionar varias portas diferentes para várias máquinas. Naturalmente uma mesma porta não pode ser fowardada duas vezes.Para um range de portas, o Counter Strike pode usar mesmo da 27015 até 27030, se você não qual porta dessa range do seu colega está aberta, então você pode abrir esta faixa de portas assim
{% highlight bash %}
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 27015:27030 -j DNAT --to-dest 192.168.1.107
iptables -A FORWARD -p tcp -i eth0 --dport 27015:27030 -d 192.168.1.107 -j ACCEPT
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

Mas você pode utilizar o Nmap para verificar quais portas estão abertas no seu micro, para instalá-lo no __Debian__ e __Debian-Likes__, basta
{% highlight bash %}
apt-get install nmap
{% endhighlight %}

Para analisar em rede interna use o IP interno, para análise à internet use seu IP externo, para __loopback__ use
{% highlight bash %}
nmap 127.0.0.1
{% endhighlight %}

Há também um serviço online que tem como você efetuar __testes de portas e de invasões__, eu uso muito ele, é o __http://www.grc.com/__

* -clique em Services
* -depois clique em ShieldsUP
* -depois clique em proceed
* -clique em "Proceed"
* -e inicie o teste clicando em "All Service Ports".


## TCPWRAPPER

> O TCP Wrappers são usados para aplicar regras de acesso aos servidores utilizados em sistema, podendo permitir ou negar as conexões a eles. Eles são controlados por dois arquivos: __/etc/hosts.allow__ (configuração de acessos permitidos para determinados IPs) e __/etc/hosts.deny__ (configuração de acesso negados para determinados IPs) __TCP__. Sigla para “__Transmission Control Protocol__”.
{% highlight bash %}
/etc/hosts.allow
{% endhighlight %} 

> – Se uma regra deste arquivo for atendida, o acesso ao serviço pe permitido

{% highlight bash %}
/etc/hosts.deny
{% endhighlight %} 

> - Se uma regra deste arquivo for atendida, o acesso ao serviço é negado

As regras destes arquivos podem ser contruída de forma a corresponder a todos os serviços ou, alternativamente, a determinados serviços específicos. Se não houver nenhuma correspondência nos dois arquivos, o acesso ao serviço é permitido. É comum se especificar regras particulares no arquivo hosts.allow e específicar uma negativa geral no arquivo hosts.deny, limitando assim o acesso aos clientes que você especificamente permitir. A linguagem dos arquivos de controle consiste de uma lista de serviços, seguida por dois-pontos, seguida por uma lista de hosts. Os hosts podem ser específicados por nome ou por endereço IP.

> Para negar acesso a todos os serviços, exceto ao ftp no domínio local, poderiam ser usados estes dois arquivos simples
{% highlight bash %}
hosts.allow
{% endhighlight %} 


Existem dezenas de possibilidades de configuração para o __tcp_wrappers__ e é possível estudá-las em extensão através das páginas de manual __hosts_access__ e __hosts_options__. Portanto, serão ilustrados apenas alguns casos interessantes do uso desta ferramenta. As regras de controle de acesso, existentes nestes dois arquivos, têm o seguinte formato

> [lista_de_daemons] [: lista_de_clientes] [: comando]

> __lista_de_daemons__: Lista de um ou mais nomes de daemons (como especificados no /etc/inetd.conf), ou curingas. 

> __lista_de_clientes__: Lista de um ou mais endereços ou nomes de máquinas, padrões ou curingas utilizados para especificar quais clientes podem e quais não podem acessar o serviço.

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

> __comando (opcional)__: É possível executar um comando sempre que uma regra casa com um padrão e é utilizada. Veja exemplos a seguir. Como citado anteriormente, curingas podem ser utilizados tanto na lista de daemons quanto na lista de clientes. Entre os existentes, pode-se destacar os seguintes

* __ALL__ Significa todos os serviços ou todos os clientes, dependendo apenas do campo em que se encontra.
* __LOCAL__ Este curinga casa com qualquer nome de máquina que não contenha um caractere ponto “.”, isto é, uma máquina local.
* __PARANOID__ Casa com qualquer nome de máquina que não case com seu endereço. Isto geralmente ocorre quando algum servidor DNS está mal configurado ou quando alguma máquina está tentando se passar por outra.
{% highlight bash %}
/etc/hosts.allow
{% endhighlight %}

O arquivo __/etc/hosts.allow__ é um arquivo de configuração do programa __/usr/sbin/tcpd__. O arquivo __hosts.allow__ contém regras descrevendo que hosts tem permissão de acessar um serviço em sua máquina.

O formato do arquivo é muito simples

{% highlight bash %}
/etc/hosts.allow
# lista de serviços: lista de hosts : comando
{% endhighlight %}

* __lista de serviços__ É uma lista de nomes de serviços separados por vírgula que esta regra se aplica. Exemplos de nomes de serviços são: ftpd, telnetd e fingerd.

* __lista de hosts__ É uma lista de nomes de hosts separada por vírgula. Você também pode usar endereços IP’s aqui. Adicionalmente, você pode especificar nomes de computadores ou endereço IP usando caracteres coringas para atingir grupos de hosts.

Exemplos incluem: __gw.vk2ktj.ampr.org__ para conferir com um endereço de computador específico, __.uts.edu.au__ para atingir qualquer endereço de computador finalizando com aquele string. Use __200.200.200.__ para conferir com qualquer endereço __IP__ iniciando com estes dígitos. Existem alguns parâmetros especiais para simplificar a configuração, alguns destes são: __ALL__ atinge todos endereços, __LOCAL__ atinge qualquer computador que não contém um “__.__” (ie. está no mesmo domínio de sua máquina) e __PARANOI__D atinge qualquer computador que o nome não confere com seu endereço (__falsificação de nome__). 

Existe também um último parâmetro que é também útil: o parâmetro __EXCEPT__ lhe permite fazer uma lista de exceções. Isto será coberto em um exemplo adiante.

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

* __comando__ É um parâmetro opcional. Este parâmetro é o caminho completo de um comando que deverá ser executado toda a vez que esta regra conferir. Ele pode executar um comando para tentar identificar quem esta conectado pelo host remoto, ou gerar uma mensagem via E-Mail ou algum outro alerta para um administrador de rede que alguém está tentando se conectar.

Existem um número de expansões que podem ser incluídas, alguns exemplos comuns são: __%h__ expande o endereço do computador que está conectado ou endereço se ele não possuir um nome, __%d__ o nome do daemon sendo chamado.

Se o computador tiver permissão de acessar um serviço através do __/etc/hosts.allow__, então o __/etc/hosts.deny__ não será consultado e o acesso será permitido.

Como exemplo
{% highlight bash %}
/etc/hosts.allow
# Permite que qualquer um envie e-mails
in.smtpd: ALL
# Permitir telnet e ftp somente para hosts locais e myhost.gnulinuxbr.com
in.telnetd, in.ftpd: LOCAL, myhost.gnulinuxbr.com
{% endhighlight %}

Qualquer modificação no arquivo __/etc/hosts.allow__ entrará em ação após reiniciar o daemon inetd. Isto pode ser feito com o comando kill -HUP [pid do inetd], o pid do inetd pode ser obtido com o comando 

> ps ax | grep inetd.

{% highlight bash %}
/etc/hosts.deny
{% endhighlight %}

O arquivo __/etc/hosts.deny__ é um arquivo de configuração das regras descrevendo quais computadores não tem a permissão de acessar um serviço em sua máquina.

Um modelo simples deste arquivo se parece com isto
{% highlight bash %}
/etc/hosts.deny
# Bloquear o acsso SSH para todos, exceto para a rede 10.0.0.0
sshd: ALL EXCEPT 10.0.0.0/24
{% endhighlight %}

Tendo um padrão __ALL: ALL__ no arquivo __/etc/hosts.deny__ e então ativando especificamente os serviços e permitindo computadores que você deseja no arquivo __/etc/hosts.allow__ é a configuração mais segura.

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

Qualquer modificação no arquivo __/etc/hosts.deny__ entrará em ação após reiniciar o __daemon inetd__. Isto pode ser feito com o comando __kill -HUP [pid do inetd]__, o pid do inetd pode ser obtido com o comando __ps ax|grep inetd__.
Importante saber
O arquivo hosts.deny é consultado depois de hosts.allow, permitindo ao administrador definir regras específicas de permissão, que serão aplicadas antes das regras de proibição ou de uma negativa geral. 

## Exemplo de Configuração do tcp_wrappers

> Exemplos dos arquivos /etc/hosts.allow e /etc/hosts.deny

{% highlight bash %}
Arquivo /etc/hosts.deny
ALL:ALL
Arquivo /etc/hosts.allow
ALL: localhost
in.ftpd: .minhaorganizacao
ipop3d: ALL
{% endhighlight %}

> Configuração do tcp_wrappers menos restritiva, considere o mesmo arquivo /etc/hosts.deny do exemplo anterior
## Configuração do tcp_wrappers menos restritiva

> Arquivo /etc/hosts.allow
> ALL: localhost
> in.ftpd: .minhaorganizacao 10.0.0.0/255.255.255.0 192.168
> ipop3d: ALL EXCEPT gnulinuxbr.com

Neste último caso, máquinas da rede “__10.0.0.0/255.255.255.0__” e máquinas em que o endereço __IP__ inicie por “__192.168.__” também podem acessar o serviço __FTP__. Note que foi utilizado um operador novo para o serviço ipop3d: EXCEPT. Isto permitiu que o acesso a este serviço fosse liberado para todos, exceto para máquinas da rede “__gnulinuxbr.com__”. O operador __EXCEPT__ pode ser utilizado tanto na lista de clientes quanto na lista de serviços. Por exemplo, a linha

>  __ALL EXCEPT in.ftpd: ALL__

no arquivo __/etc/hosts.allow__ permite o acesso a todos os serviços, exceto o __FTP__, para qualquer máquina.
Todos os acessos, bem-sucedidos ou não, são registrados através do syslog, em __/var/log/secure__. É recomendado que este arquivo seja periodicamente __analisado à procura de tentativas de invasão__. Testando a Configuração Negue certos serviços para uma máquina de sua rede (como por exemplo o serviço telnet) e após reinicializar o __xinetd__, procure fazer acessos da máquina onde o serviço foi negado.
