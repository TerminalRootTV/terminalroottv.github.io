---
layout: post
title: "Curso Certificação Linux LPI-102: Serviços de Rede no Linux"
date: '2013-03-27T16:49:00.000-07:00'
image: '/assets/img/lpi/services.jpg'
description: "Serviços de rede é o que está disponí­vel para ser acessado pelo usuário."
tags:
- linux
- lpi
---

![Serviços de Rede no Linux](/assets/img/lpi/services.jpg "Serviços de Rede no Linux")

> Serviços de rede é o que está disponí­vel para ser acessado pelo usuário. No TCP/IP, cada serviço é associado a um número chamado porta que é onde o servidor espera pelas conexões dos computadores clientes. Uma porta de rede pode ser referenciada tanto pelo número como pelo nome do serviço.

Abaixo, alguns exemplos de portas padrões usadas em serviços TCP/IP

* __21 - FTP__ (transferência de arquivos)
* __23 - Telnet__ (terminal virtual remoto)
* __25 - Smtp__ (envio de e-mails)
* __53 - DNS__ (resolvedor de nomes)
* __79 - Finger__ (detalhes sobre usuários do sistema)
* __80 - http__ (protocolo www - transferência de páginas Internet)
* __110 - Pop-3__ (recebimento de mensagens)
* __119 - NNTP__ (usado por programas de noticias)

O arquivo padrão responsável pelo __mapeamento do nome dos serviços e das portas__ mais utilizadas é o __/etc/services__

## Para instalá-lo
{% highlight bash %}
apt-get install openbsd-inetd
{% endhighlight %}

## Serviços iniciados como Daemons de rede

Serviços de rede iniciados como daemons ficam residente o tempo todo na memória esperando que alguém se conecte (também chamado de modo standalone). Um exemplo de __daemon__ é o servidor __proxy squid__ e o servidor __web Apache__ operando no modo __daemon__.

Alguns programas servidores oferecem a opção de serem executados como daemons ou através do __inetd__. É recomendável escolher daemon se o serviço for solicitado frequentemente (como é o caso dos servidores web ou proxy).

Para verificar se um programa está rodando como daemon, basta digitar ps ax e procurar o nome do programa, em caso positivo ele é um daemon.
Normalmente os programas que são iniciados como daemons possuem seus próprios recursos de segurança/autenticação para decidir quem tem ou não permissão de se conectar.

## Serviços iniciados através do inetd

Serviços iniciados pelo __inetd__ são carregados para a memória somente quando são solicitados. O controle de quais serviços podem ser carregados e seus parâmetros, são feitos através do arquivo __/etc/inetd.conf__ .

Um __daemon__ chamado __inetd__ lê as configurações deste arquivo e permanece residente na memória, esperando pela conexão dos clientes. Quando uma conexão é solicitada, o daemon inetd verifica as permissões de acesso nos arquivos __/etc/hosts.allow__ e __/etc/hosts.deny__ e carrega o programa servidor correspondente no arquivo __/etc/inetd.conf__ . Um arquivo também importante neste processo é o __/etc/services__ que faz o mapeamento das portas e nomes dos serviços.

Alguns programas servidores oferecem a opção de serem executados como daemons ou através do inetd. É recomendável escolher __inetd__ se o serviço não for solicitado frequentemente (como é o caso de servidores __ftp, telnet, talk, etc__).

## /etc/inetd.conf

O arquivo __/etc/inetd.conf__ é um arquivo de configuração para o __daemon__ servidor __inetd__. Sua função é dizer ao inetd o que fazer quando receber uma requisição de conexão para um serviço em particular. Para cada serviço que deseja aceitar conexões, você precisa dizer ao inetd qual daemon servidor executar e como executa-lo.

Seu formato é também muito simples. É um arquivo texto com cada linha descrevendo um serviço que deseja oferecer. Qualquer texto em uma linha seguindo uma "__#__" é ignorada e considerada um comentário. Cada linha contém sete campos separados por qualquer número de espaços em branco (tab ou espaços). O formato geral é o seguinte

> [serviço] [tipo_soquete] [protocolo] [opções] [usuário] [caminho_serv] [opções_serv].

### serviço

É o serviço relevante a este arquivo de configuração pego do arquivo __/etc/services__.

### tipo_soquete

Este campo descreve o tipo do soquete que este item utilizará, valores permitidos são: __stream__, __dgram__, __raw__, __rdm__, ou __seqpacket__. Isto é um pouco técnico de natureza, mas como uma regra geral, todos os serviços baseados em tcp usam stream e todos os protocolos baseados em udp usam dgram. Somente alguns tipos de daemons especiais de servidores usam os outros valores.

### protocolo

O protocolo é considerado válido para esta item. Isto deve bater com um item apropriado no arquivo __/etc/services__ e tipicamente será __tcp__ ou __udp__. Servidores baseados no __Sun RPC (Remote Procedure Call)__, utilizam __rpc/tcp__ ou __rpc/udp__.

### opções

Existem somente duas configurações para este campo. A configuração deste campo diz ao __inetd__ se o programa servidor de rede libera o soquete após ele ser iniciado e então se __inetd__ pode iniciar outra cópia na próxima requisição de conexão, ou se o inetd deve aguardar e assumir que qualquer servidor já em execução pegará a nova requisição de conexão.

Este é um pequeno truque de trabalho, mas como uma regra, todos os servidores tcp devem ter este parâmetro ajustado para __nowait__ e a maior parte dos servidores udp deve tê-lo ajustado para __wait__. Foi alertado que existem algumas excessões a isto, assim deixo isto como exemplo se não estiver seguro. O número especificado após o "__.__" é opcional e define a quantidade máxima de vezes que o serviço poderá ser executado durante __1 minuto__. Se o serviço for executado mais vezes do que este valor, ele será automaticamente desativado pelo __inetd__ e uma mensagem será mostrada no log do sistema avisando sobre o fato. Para reativar o serviço interrompido, reinicie o inetd com: 
{% highlight bash %}
killall -HUP inetd #O valor padrão é 40.
{% endhighlight %}

### usuário

Este campo descreve que conta de usuário usuário no arquivo __/etc/passwd__ será escolhida como dono do daemon de rede quando este for iniciado. Isto é muito útil se você deseja diminuir os riscos de segurança. Você pode ajustar o usuário de qualquer item para o usuário nobody, assim se a segurança do servidor de redes é quebrada, a possibilidade de problemas é minimizada. Normalmente este campo é ajustado para root, porque muitos servidores requerem privilégios de usuário root para funcionarem corretamente.

### caminho_servidor

Este campo é o caminho para o programa servidor atual que será executado.

## opções_servidor

Este campo inclui o resto da linha e é opcional. Você pode colocar neste campo qualquer argumento da linha de comando que deseje passar para o daemon servidor quando for iniciado.

Uma dica que pode aumentar significativamente a segurança de seu sistema é comentar (colocar uma __#__ no inicio da linha) os serviços que não serão utilizados.

Abaixo um modelo de arquivo __/etc/inetd.conf__ usado em sistemas __Debian__:
{% highlight bash %}
 # /etc/inetd.conf: veja inetd(8) para mais detalhes.
 #
 # Banco de Dados de configurações do servidor Internet
 #
 #
 # Linhas iniciando com "#:LABEL:" ou "#<off>#" não devem
 # ser alteradas a não ser que saiba o que está fazendo!
 #
 #
 # Os pacotes devem modificar este arquivo usando update-inetd(8)
 #
 # <nome_serviço> <tipo_soquete> <proto> <opções> <usuário> <caminho_servidor> <args>
 #
 #:INTERNO: Serviços internos
 #echo stream tcp nowait root internal
 #echo dgram udp wait root internal
 #chargen stream tcp nowait root internal
 #chargen dgram udp wait root internal
 #discard stream tcp nowait root internal
 #discard dgram udp wait root internal
 #daytime stream tcp nowait root internal
 #daytime dgram udp wait root internal
 time stream tcp nowait root internal
 #time dgram udp wait root internal
 #:PADRÕES: Estes são serviços padrões.
 #:BSD: Shell, login, exec e talk são protocolos BSD.
 #shell stream tcp nowait root /usr/sbin/tcpd /usr/sbin/in.rshd
 #login stream tcp nowait root /usr/sbin/tcpd /usr/sbin/in.rlogind
 #exec stream tcp nowait root /usr/sbin/tcpd /usr/sbin/in.rexecd
 talk dgram udp wait.10 nobody.tty /usr/sbin/tcpd /usr/sbin/in.talkd
 ntalk dgram udp wait.10 nobody.tty /usr/sbin/tcpd /usr/sbin/in.ntalkd
 #:MAIL: Mail, news e serviços uucp.
 smtp stream tcp nowait.60 mail /usr/sbin/exim exim -bs
 #:INFO: Serviços informativos
 #:BOOT: O serviço Tftp é oferecido primariamente para a inicialização. Alguns sites
 # o executam somente em máquinas atuando como "servidores de inicialização".
 #:RPC: Serviços baseados em RPC
 #:HAM-RADIO: serviços de rádio amador
 #:OTHER: Outros serviços
{% endhighlight %}
Para saber como configurar o inetd.conf para habilitar uma porta, acesse esse LINK(Como configurar o inetd.conf para habilitar uma porta).
Utilizando TCPWRAPPERS para segurança do inetd
 O tcpwrapper regula o acesso aos serviços oferecidos pelo inetd.O processo utilizado é o /usr/sbin/tcpd.Ele consulta dois arquivos que definem o acesso: 
{% highlight bash %}
/etc/hosts.allow
/etc/hosts.deny
{% endhighlight %}

As regras contidas no primeiro arquivo liberam o acesso aos serviços.O segundo arquivo proíbe o acesso.

Basicamente as regras destes arquivos seguem o padrão.
 
{% highlight bash %}
nome_do_serviço : endereços
{% endhighlight %}

As palavras __LOCAL__ e __ALL__ podem ser utilizadas para identificar todos os clientes que são do mesmo domínio que o servidor e todas as máquinas.
 
Veja o exemplo de /etc/hosts.allow:
 
{% highlight bash %}
cat /etc/hosts.allow
in.telnetd : LOCAL
rsyncd : 172.20.0.0/255.255.255.0
in.ftpd : ALL
{% endhighlight %}

Se neste arquivos de controle não existir uma regra para um determinado serviço habilitado no inetd, o acesso será liberado.
 
## Serviços de rede com xinetd

Uma rede de computadores serve basicamente, para possibilitar o compartilhamento de recursos, como arquivos e impressoras. É possível dizer que o compartilhamento de arquivos e impressoras é um Serviço de Rede.


Outros serviços de rede tornaram-se muito populares com a expansão da Internet nos últimos anos. Tais serviços, como o __WWW__ e __FTP__, requerem que um computador execute algum processo que atenda pelas requisições dos clientes que desejam acessá-los. Isto implica em um modelo cliente-servidor, onde normalmente a máquina do usuário solicita alguma coisa, através de um programa cliente como o browser, por exemplo, e o processo servidor (que implementa o serviço da rede) responde.


O sistema operacional __UNIX__, e, portanto o __Linux__, sempre foi muito conhecido por oferecer diversos serviços de rede tradicionais. Tais serviços vão desde a possibilidade de saber quem está usando uma máquina, até o próprio serviço de transferência de arquivos.
Muitos serviços de rede são implementados através de processos dedicados que esperam por requisições que chegam da rede. Mas dada a razoável quantidade de serviços, um esquema interessante foi implantado. Neste esquema, um único processo, chamado __xinetd (Extend Internet Super Server)__, rodando na máquina que está oferecendo os serviços de rede, é responsável por escutar as requisições que chegam, e conforme a porta por onde chega à requisição, disparar e executar o processo correspondente àquele serviço.


Assim, da mesma forma que um endereço IP identifica uma máquina em uma rede, uma porta identifica um serviço de rede rodando dentro de determinada máquina. Alguns serviços funcionam sobre o protocolo de transporte TCP, outros sobre o protocolo UDP, e ainda outros funcionam sobre os dois.


> O __xinetd__ é responsável por vários serviços básicos de um sistema disponibilizados em uma rede. Entre os serviços que ele gerencia estão os serviços Telnet e POP.


Esses serviços são executados por programas denominados servidores, que nada mais são do que programas que abrem uma determinada porta e ficam aguardando por solicitações de conexão.


Na maioria dos casos, quando uma solicitação é recebida o servidor cria um processo filho para tratar dessa conexão específica, enquanto o processo pai continua a escutar na porta aguardando novas solicitações. Desta forma existirão vários processos alocados na memória.
O __xinetd__ carrega seu arquivo de configuração e passa a “__ouvir__” por conexões em portas específicas. Quando uma conexão é solicitada, o xinetd executa o programa servidor correspondente para manipular o serviço solicitado. Então, desta forma, existirá apenas um servidor em memória esperando por uma solicitação.


O superservidor ou xinetd é configurado para iniciar a sua execução quando o sistema é inicializado, recebendo a lista de serviços a serem monitorados a partir de um arquivo denominado /__etc/xinetd.conf__.

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

