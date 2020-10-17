---
layout: post
title: "18 Comandos para Monitorar a Largura de Banda da Rede no Linux"
date: 2020-09-09 13:50:40
image: '/assets/img/rede/network-bandwidth-linux.png'
description: 'Algumas ferramentas de linha de comando do Linux que podem ser usadas para monitorar o uso da rede.'
icon: 'carbon:network-2'
iconname: 'network'
tags:
- redes
- comandos
- unix
---

![Comandos para Monitorar a Largura de Banda da Rede no Linux](/assets/img/rede/network-bandwidth-linux.png)

Algumas ferramentas de linha de comando do Linux que podem ser usadas para monitorar o uso da rede.

Essas ferramentas monitoram o tráfego que flui pelas interfaces de rede e medem a velocidade com que os dados estão sendo transferidos. O tráfego de entrada e saída é mostrado separadamente.

Alguns dos comandos mostram a largura de banda usada por processos individuais. Isso facilita a detecção de um processo que está usando demais a largura de banda da rede.

As ferramentas possuem diferentes mecanismos de geração do relatório de tráfego. Aqui está uma lista dos comandos, classificados por seus recursos.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 1. [Nload](https://github.com/rolandriegel/nload)
Nload é uma ferramenta de linha de comando que permite aos usuários monitorar o tráfego de entrada e saída separadamente.

Também desenha um gráfico para indicar o mesmo, cuja escala pode ser ajustada. Fácil e simples de usar e não suporta muitas opções.

Portanto, se você só precisa dar uma rápida olhada no uso total da largura de banda sem detalhes de processos individuais, o nload será útil.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge nload # Gentoo, Funtoo, ...
sudo apt install nload # Debian, Ubuntu, Mint, ...
sudo pacman -S nload # Arch, Manjaro, ...
sudo dnf install nload # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![nload](/assets/img/rede/nload.png)

Exemplo de uso:
{% highlight bash %}
nload
{% endhighlight %}

---

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# 2. [iftop](https://github.com/soarpenguin/iftop)
Iftop mede os dados que fluem por meio de conexões de soquete individuais e funciona de uma maneira diferente do Nload.

Iftop usa a biblioteca pcap para capturar os pacotes que entram e saem do adaptador de rede e, em seguida, soma o tamanho e a contagem para encontrar a largura de banda total em uso.

Embora o iftop relate a largura de banda usada por conexões individuais, ele não pode relatar o nome/id do processo envolvido na conexão de soquete específica.

Mas, sendo baseado na biblioteca pcap, o iftop é capaz de filtrar o tráfego e relatar o uso de largura de banda nas conexões de host selecionadas, conforme especificado pelo filtro.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge iftop # Gentoo, Funtoo, ...
sudo apt install iftop # Debian, Ubuntu, Mint, ...
sudo pacman -S iftop # Arch, Manjaro, ...
sudo dnf install iftop # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![iftop](/assets/img/rede/iftop.png)

Exemplo de uso:
{% highlight bash %}
iftop -n
{% endhighlight %}

---

# 3. [iptraf](https://github.com/josarlo84/iptraf)
Iptraf é um monitor IP Lan interativo e colorido. Ele mostra as conexões individuais e a quantidade de dados fluindo entre os hosts.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge iptraf # Gentoo, Funtoo, ...
sudo apt install iptraf # Debian, Ubuntu, Mint, ...
sudo pacman -S iptraf # Arch, Manjaro, ...
sudo dnf install iptraf # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![iptraf](/assets/img/rede/iptraf.png)

Exemplo de uso:
{% highlight bash %}
iptraf
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

---

# 4. [nethogs](https://github.com/raboof/nethogs)
Nethogs é uma pequena ferramenta 'net top' que mostra a largura de banda usada por processos individuais e classifica a lista colocando os processos mais intensos no topo.

No caso de um aumento repentino da largura de banda, abra rapidamente os nethogs e descubra o responsável pelo processo. O Nethogs informa o PID, o usuário e o caminho do programa.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge nethogs # Gentoo, Funtoo, ...
sudo apt install nethogs # Debian, Ubuntu, Mint, ...
sudo pacman -S nethogs # Arch, Manjaro, ...
sudo dnf install nethogs # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![nethogs](/assets/img/rede/nethogs.png)

Exemplo de uso:
{% highlight bash %}
nethogs
{% endhighlight %}

---

# 5. [bmon](https://github.com/tgraf/bmon)
Bmon (Bandwidth Monitor) é uma ferramenta semelhante ao nload que mostra a carga de tráfego em todas as interfaces de rede no sistema. A saída também consiste em um gráfico e uma seção com detalhes no nível do pacote.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge bmon # Gentoo, Funtoo, ...
sudo apt install bmon # Debian, Ubuntu, Mint, ...
sudo pacman -S bmon # Arch, Manjaro, ...
sudo dnf install bmon # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![bmon](/assets/img/rede/bmon.png)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Exemplo de uso:
{% highlight bash %}
bmon
{% endhighlight %}

---

# 6. [slurm](https://github.com/mattthias/slurm)
Slurm é "mais" outro monitor de carga de rede que mostra estatísticas de dispositivos junto com um gráfico ASCII. Ele suporta 3 estilos diferentes de gráficos, cada um dos quais pode ser ativado usando as teclas c, se l. Simples em recursos, slurm não exibe mais detalhes sobre a carga da rede.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge slurm # Gentoo, Funtoo, ...
sudo apt install slurm # Debian, Ubuntu, Mint, ...
sudo pacman -S slurm # Arch, Manjaro, ...
sudo dnf install slurm # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![slurm](/assets/img/rede/slurm.png)

Exemplo de uso:
{% highlight bash %}
slurm -s -i eth0
{% endhighlight %}

---

# 7. [tcptrack](https://github.com/bchretien/tcptrack)
Tcptrack é semelhante ao iftop e usa a biblioteca pcap para capturar pacotes e calcular várias estatísticas, como a largura de banda usada em cada conexão.

Ele também suporta os filtros pcap padrão que podem ser usados para monitorar conexões específicas.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge tcptrack # Gentoo, Funtoo, ...
sudo apt install tcptrack # Debian, Ubuntu, Mint, ...
sudo pacman -S tcptrack # Arch, Manjaro, ...
sudo dnf install tcptrack # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![tcptrack](/assets/img/rede/tcptrack.png)

Exemplo de uso:
{% highlight bash %}
tcptrack
{% endhighlight %}

---

# 8. [Vnstat](https://github.com/vergoh/vnstat)
Vnstat é um pouco diferente da maioria das outras ferramentas. Na verdade, ele executa um serviço/daemon em segundo plano e fica gravando o tamanho da transferência de dados o tempo todo.

Em seguida, ele pode ser usado para gerar um relatório do histórico de uso da rede.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge vnstat # Gentoo, Funtoo, ...
sudo apt install vnstat # Debian, Ubuntu, Mint, ...
sudo pacman -S vnstat # Arch, Manjaro, ...
sudo dnf install vnstat # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Executar o vnstat sem nenhuma opção simplesmente mostraria a quantidade total de transferência de dados que ocorreu desde a data em que o daemon está em execução.
{% highlight bash %}
$ vnstat
Database updated: Mon Mar 17 15:26:59 2014
   eth0 since 06/12/13
          rx:  135.14 GiB      tx:  35.76 GiB      total:  170.90 GiB
   monthly
                     rx      |     tx      |    total    |   avg. rate
     ------------------------+-------------+-------------+---------------
       Feb '14      8.19 GiB |    2.08 GiB |   10.27 GiB |   35.60 kbit/s
       Mar '14      4.98 GiB |    1.52 GiB |    6.50 GiB |   37.93 kbit/s
     ------------------------+-------------+-------------+---------------
     estimated      9.28 GiB |    2.83 GiB |   12.11 GiB |
   daily
                     rx      |     tx      |    total    |   avg. rate
     ------------------------+-------------+-------------+---------------
     yesterday    236.11 MiB |   98.61 MiB |  334.72 MiB |   31.74 kbit/s
         today    128.55 MiB |   41.00 MiB |  169.56 MiB |   24.97 kbit/s
     ------------------------+-------------+-------------+---------------
     estimated       199 MiB |      63 MiB |     262 MiB |
{% endhighlight %}

Para monitorar o uso da largura de banda em tempo real, use a opção '-l' (modo live). Em seguida, mostraria a largura de banda total usada pelos dados de entrada e saída, mas de uma maneira muito precisa, sem quaisquer detalhes internos sobre conexões de host ou processos.

Exemplo de uso:
{% highlight bash %}
$ vnstat -l -i eth0
Monitoring eth0...    (press CTRL-C to stop)
   rx:       12 kbit/s    10 p/s          tx:       12 kbit/s    11 p/s
{% endhighlight %}

---

# 9. [bwm-ng](https://github.com/Jerga99/bwm-ng)
Bwm-ng (Bandwidth Monitor Next Generation) é outro monitor de carga de rede em tempo real muito simples que relata um resumo da velocidade na qual os dados estão sendo transferidos para dentro e para fora de todas as interfaces de rede disponíveis no sistema.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge bwm-ng # Gentoo, Funtoo, ...
sudo apt install bwm-ng # Debian, Ubuntu, Mint, ...
sudo pacman -S bwm-ng # Arch, Manjaro, ...
sudo dnf install bwm-ng # Red Hat, CentOS, Fedora, ...
{% endhighlight %}
Se o tamanho do console for suficientemente grande, bwm-ng também pode desenhar gráficos de barras para o tráfego usando o modo de saída curses2.

Exemplo de uso:
{% highlight bash %}
bwm-ng -o curses2
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 10. [cbm - Medidor de largura de banda colorida](https://github.com/resurrecting-open-source-projects/cbm)
Um pequeno monitor de largura de banda simples que exibe o volume de tráfego por meio de interfaces de rede. Não há mais opções, apenas as estatísticas de tráfego são exibidas e atualizadas em tempo real.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge cbm # Gentoo, Funtoo, ...
sudo apt install cbm # Debian, Ubuntu, Mint, ...
sudo pacman -S cbm # Arch, Manjaro, ...
sudo dnf install cbm # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![cbm](/assets/img/rede/cbm.png)

Exemplo de uso:
{% highlight bash %}
cbm
{% endhighlight %}

---

# 11. [speedometer](https://github.com/sanderjo/speedometer)
Outra ferramenta pequena e simples que apenas desenha gráficos bonitos do tráfego de entrada e saída por meio de uma determinada interface.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge speedometer # Gentoo, Funtoo, ...
sudo apt install speedometer # Debian, Ubuntu, Mint, ...
sudo pacman -S speedometer # Arch, Manjaro, ...
sudo dnf install speedometer # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![speedometer](/assets/img/rede/speedometer.png)

Exemplo de uso:
{% highlight bash %}
speedometer
{% endhighlight %}

---

# 12. [Pktstat](https://github.com/dleonard0/pktstat)
O Pktstat exibe todas as conexões ativas em tempo real e a velocidade com que os dados estão sendo transferidos por meio delas.

Ele também exibe o tipo de conexão, ou seja, tcp ou udp e também detalhes sobre solicitações HTTP, se envolvidas.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge pkstat # Gentoo, Funtoo, ...
sudo apt install pkstat # Debian, Ubuntu, Mint, ...
sudo pacman -S pkstat # Arch, Manjaro, ...
sudo dnf install pkstat # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![pkstat](/assets/img/rede/pkstat.png)

Exemplo de uso:
{% highlight bash %}
pktstat -i eth0 -nt
{% endhighlight %}

---

# 13. [Netwatch](https://github.com/johnscillieri/netwatch)
O Netwatch faz parte da coleção de ferramentas netdiag e também exibe as conexões entre o host local e outros hosts remotos e a velocidade com que os dados são transferidos em cada conexão.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge netwatch # Gentoo, Funtoo, ...
sudo apt install netwatch # Debian, Ubuntu, Mint, ...
sudo pacman -S netwatch # Arch, Manjaro, ...
sudo dnf install netwatch # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![netwatch](/assets/img/rede/netwatch.png)

Exemplo de uso:
{% highlight bash %}
netwatch -e eth0 -nt
{% endhighlight %}

---

# 14. [Trafshow](https://github.com/mattetambu/Trafshow)
Como o netwatch e o pktstat, o trafshow relata as conexões ativas atuais, seu protocolo e a velocidade de transferência de dados em cada conexão. Ele pode filtrar conexões usando filtros do tipo pcap. Monitore apenas conexões tcp.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge trafshow # Gentoo, Funtoo, ...
sudo apt install trafshow # Debian, Ubuntu, Mint, ...
sudo pacman -S trafshow # Arch, Manjaro, ...
sudo dnf install trafshow # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

<!-- RETANGULO LARGO -->
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

![trafshow](/assets/img/rede/trafshow.png)

Exemplo de uso:
{% highlight bash %}
trafshow -i eth0 tcp
{% endhighlight %}

---

# 15. [Netload](https://github.com/anothernode/netload)
netload é um visualizador de tráfego de rede muito simples para o terminal. Ele mostra um gráfico de barras móvel que representa o tráfego de rede de entrada e uma pequena caixa com o tráfego RX e TX em kilobytes.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge netload # Gentoo, Funtoo, ...
sudo apt install netload # Debian, Ubuntu, Mint, ...
sudo pacman -S netload # Arch, Manjaro, ...
sudo dnf install netload # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

![netload](/assets/img/rede/netload.png)

Exemplo de uso:
{% highlight bash %}
netload eth0
{% endhighlight %}

---

# 16. [ifstat](https://github.com/Yamagi/ifstat)
O ifstat relata a largura de banda da rede em um modo de estilo em lote. A saída está em um formato fácil de registrar e analisar usando outros programas ou utilitários.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge ifstat # Gentoo, Funtoo, ...
sudo apt install ifstat # Debian, Ubuntu, Mint, ...
sudo pacman -S ifstat # Arch, Manjaro, ...
sudo dnf install ifstat # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Exemplo de uso:
{% highlight bash %}
ifstat -t -i eth0 0.5
  Time           eth0
HH:MM:SS   KB/s in  KB/s out
09:59:21      2.62      2.80
09:59:22      2.10      1.78
09:59:22      2.67      1.84
09:59:23      2.06      1.98
09:59:23      1.73      1.79
{% endhighlight %}

---

# 17. [dstat](http://dag.wiee.rs/home-made/dstat/)
Dstat é uma ferramenta versátil (escrita em python) que pode monitorar diferentes estatísticas do sistema e relatá-las em um modo de lote ou registrar os dados em um csv ou arquivo semelhante. Este exemplo mostra como usar dstat para relatar a largura de banda da rede.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge dstat # Gentoo, Funtoo, ...
sudo apt install dstat # Debian, Ubuntu, Mint, ...
sudo pacman -S dstat # Arch, Manjaro, ...
sudo dnf install dstat # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

Exemplo de uso:
{% highlight bash %}
dstat -nt
-net/total- ----system----
 recv  send|     time
   0     0 |23-03 10:27:13
1738B 1810B|23-03 10:27:14
2937B 2610B|23-03 10:27:15
2319B 2232B|23-03 10:27:16
2738B 2508B|23-03 10:27:17
{% endhighlight %}

---

# 18. [collectl](http://collectl.sourceforge.net/)
O Collectl relata as estatísticas do sistema em um estilo semelhante ao dstat e, como o dstat, reúne estatísticas sobre vários recursos do sistema diferentes, como CPU, memória, rede, etc.

Aqui está um exemplo simples de como usá-lo para relatar o uso/largura de banda da rede.

Exemplo de instalação em uma distro Linux:
{% highlight bash %}
emerge collectl # Gentoo, Funtoo, ...
sudo apt install collectl # Debian, Ubuntu, Mint, ...
sudo pacman -S collectl # Arch, Manjaro, ...
sudo dnf install collectl # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

Exemplo de uso:
{% highlight bash %}
collectl -sn -oT -i0.5
waiting for 0.5 second sample...
#         <----------Network---------->
#Time       KBIn  PktIn  KBOut  PktOut
10:32:01      40     58     43      66
10:32:01      27     58      3      32
10:32:02       3     28      9      44
10:32:02       5     42     96      96
10:32:03       5     48      3      28
{% endhighlight %}

---

# Resumo
Esses foram alguns comandos úteis para verificar rapidamente a largura de banda da rede em seu servidor Linux. No entanto, eles precisam que o usuário efetue login no servidor remoto por meio de ssh.

Alternativamente, ferramentas de monitoramento baseadas na web também podem ser usadas para a mesma tarefa.

Além disso, estão as ferramentas de monitoramento de nível empresarial, como o Nagios, que fornecem uma série de recursos para monitorar não apenas um servidor, mas toda a infraestrutura.

Se você quiser criar sua própria solução é muito simples, para mais detalhes [assista a esse vídeo](https://www.youtube.com/watch?v=QtMMFH1j8xA)

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Referências
+ [Bandwidth](https://en.wikipedia.org/wiki/Bandwidth_(computing))
+ [binarytides](https://www.binarytides.com/linux-commands-monitor-network/)
+ [Network Bandwidth](https://pt.wikipedia.org/wiki/Largura_de_barramento)




