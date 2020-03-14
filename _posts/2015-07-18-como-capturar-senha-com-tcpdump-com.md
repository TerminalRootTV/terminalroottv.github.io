---
layout: post
title: "Como capturar a senha com TCPDump"
date: '2015-07-18T15:37:00.000-07:00'
image: '/assets/img/hacker/tcpdump.jpg'
description: "Isso serve como conhecimento de proteção, ou seja, alguém que está usando sua rede WI-FI por exemplo"
tags:
- linux
- servidores
- gnu
- hacker
- redes
---

![TCPDump Hacker Blog Linux](/assets/img/hacker/tcpdump.jpg)

Se você não possui o TCPDump, use o gerenciador de pacotes correspondente da sua distro para instalá-lo, ou [baixe aqui](http://www.tcpdump.org/) e compile-o.

Instalação num máquina com [GNU/Linux](http://terminalroot.com.br/tags#linux) [Debian](http://terminalroot.com.br/tags#debian):

{% highlight bash %}
su
apt-get install tcpdump
{% endhighlight %}

Aqui eu fiz um teste utilizando a seguinte estrutura:

![Blog Linux](/assets/img/hacker/capturando.gif "Capturando TCPDump")
    

O __Notebook__ que possui o endereço __192.168.1.3__ acessará o __PC 192.168.1.2__ que possui o formulário, o mesmo formulário criado nesse post. A "ponte"(__Gateway__) para essa comunicação é um __Modem/Roteador 192.168.1.1__ , mesmo sem internet, ele iria permitir essa comunicação (lógico :P).

No PC vou setar o comando do TCPDump para capturar o pacote e salvar os dados num arquivo que eu chamei de __pegandoasenha-tcpdump.txt__ (já deixei até o arquivo aberto, e só cliquei em recarregar para mostrar os dados do arquivo modificado). Então já rodei o comando e o TCPDump ficou aguardando os pacotes que o Notebook(192.168.1.3) estava enviando para o PC(192.168.1.2).

Se o PC fosse o Gateway, também dava pra pegar os dados que estava sendo enviado, pois estaria passando pelo PC, ou seja, pra você pegar os dados que estão passado pelo seu Roteador, você precisa configurá-lo com o TCPDump, blz?! O proxy também faz isso, mas isso aqui é só um teste pra saber a utulização do TCPDump! :)

No PC o comando utilizado pra isso foi:

{% highlight bash %}
 tcpdump -nAs0 -i eth0 'port 80' >> pegandoasenha-tcpdump.txt 
{% endhighlight %}

* -n Não converter endereços (ou seja, endereços de hosts, números de portas, etc.) para nomes.
* -A Imprimir cada pacote (menos seu cabeçalho ) em ASCII. Para a captura de páginas da web.
* -s Ver todos os dados da captura
* -i Interface de rede, no meu caso é a eth0'port 80' 
* HTTPpegandoasenha-tcpdump.txt Arquivo que eu quero salvar os dados, mas se eu não utilizasse redirecionador(>>) , ele mostraria na tela!

Após eu dar enter nesse comando, o TCPDump capturará todas as requisições que passem pelo meu IP. Então fui lá no Notebook e enviei os dados para o formulário. Utilizei: 

> Nome de usuário: pegar a senha

> Senha: facil ok

Depois fui ver o arquivo e estava lá a senha.

O arquivo possui vários dados (Navegador, IP, hora, data,...) ex.:

{% highlight bash %}
17:40:37.142723 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [S], seq 881644111, win 29200, options [mss 1460,sackOK,TS val 662693 ecr 0,nop,wscale 7], length 0
E..<..@.@..{...........P4..O......r.V..........
.
..........
17:40:37.142778 IP 192.168.1.2.80 > 192.168.1.3.55480: Flags [S.], seq 3895379345, ack 881644112, win 28960, options [mss 1460,sackOK,TS val 1618431 ecr 662693,nop,wscale 7], length 0
E..<..@.@..f.........P......4..P..q ...........
.....
......
17:40:37.167604 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 662694 ecr 1618431], length 0
E..4..@.@..............P4..P...............
.
......
17:40:37.167833 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [P.], seq 1:499, ack 1, win 229, options [nop,nop,TS val 662694 ecr 1618431], length 498
E..&..@.@..............P4..P...............
.
......POST /formulario.php HTTP/1.1
Host: 192.168.1.2
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.7.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Referer: http://192.168.1.2/formulario.php
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 53

nome=pegar+a+senha&senha=facil+ok&enviar=Enviar+dados
17:40:37.167879 IP 192.168.1.2.80 > 192.168.1.3.55480: Flags [.], ack 499, win 235, options [nop,nop,TS val 1618437 ecr 662694], length 0
E..4w.@.@.?..........P......4..B...........
.....
..
17:40:37.170762 IP 192.168.1.2.80 > 192.168.1.3.55480: Flags [P.], seq 1:230, ack 499, win 235, options [nop,nop,TS val 1618438 ecr 662694], length 229
E...w.@.@.>..........P......4..B...........
.....
..HTTP/1.1 200 OK
Date: Sat, 18 Jul 2015 20:40:37 GMT
Server: Apache/2.4.10 (Debian)
Content-Length: 25
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

Dados salvos com sucesso!
17:40:37.171716 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [.], ack 230, win 237, options [nop,nop,TS val 662701 ecr 1618438], length 0
E..4..@.@..............P4..B...w.....&.....
.
......
17:40:42.173212 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [F.], seq 499, ack 230, win 237, options [nop,nop,TS val 663951 ecr 1618438], length 0
E..4..@.@..............P4..B...w.....C.....
.
!.....
17:40:42.173326 IP 192.168.1.2.80 > 192.168.1.3.55480: Flags [F.], seq 230, ack 500, win 235, options [nop,nop,TS val 1619689 ecr 663951], length 0
E..4w.@.@.?..........P.....w4..C.....a.....
.....
!.
17:40:42.174337 IP 192.168.1.3.55480 > 192.168.1.2.80: Flags [.], ack 231, win 237, options [nop,nop,TS val 663951 ecr 1619689], length 0
E..4..@.@..~...........P4..C...x....._.....
.
!.....
{% endhighlight %}

A linha correspondente que mostra os dados que possui a senha é:    

{% highlight bash %}
nome=pegar+a+senha&senha=facil+ok&enviar=Enviar+dados
{% endhighlight %}
 

Você pode aumentar sua produtividade utilizando mais informações, existe várias opções para o TCPDump:

Exemplo de comando tcpdump para mostrar quais as ligações de um determinado endereço tcp-ip à porta 80 do seu servidor: 

> tcpdump -ni eth0 src "numero ip" and dst port 80

{% highlight bash %}
tcpdump -i eth0
{% endhighlight %}

Conexões de origem podem ser monitoradas utilizando o parâmetro src host, um exemplo simples seria monitorarmos o tráfego que vem de 192.168.1.9 para nosso computador, com o ip 192.168.1.2. A linha de comando ficaria da seguinte forma:

{% highlight bash %}
tcpdump -i eth0 src host 192.168.1.9
{% endhighlight %}

Se quisermos monitorar as conexões especificando um host de destino, poderíamos fazê-lo com o parâmetro dst host, o exemplo abaixo mostra todo o tráfego do host 192.168.1.2 com 192.168.1.1, no caso, 192.168.1.1 é nosso gateway.

{% highlight bash %}
tcpdump -i eth0 dst host 192.168.1.1
{% endhighlight %}

Mais:

http://www.tcpdump.org/

https://pt.wikipedia.org/wiki/Tcpdump

http://www.imartins.com.br/informix/artigos/capturando-senha-usuarios




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

