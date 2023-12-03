---
layout: post
title: "Como utilizar o Iptables (Netfilter)"
date: '2014-11-11T17:39:00.003-08:00'
image: '/assets/img/servidor/firewall.jpg'
description: "Eu estava configurando meu Firewall hoje e decidi escrever um Post sobre Iptables pra documentar algumas informações."
tags:
- gnulinux
- servidores
- redes
---

![Blog Linux](/assets/img/servidor/firewall.jpg "Iptables Netfilter")

E aê galera!?Eu estava configurando meu Firewall hoje e decidi escrever um Post sobre Iptables pra documentar algumas informações.
Iptables é o nome da ferramenta do espaço do usuário que permite a criação de regras de firewall e NATs. Apesar de, tecnicamente, o iptables ser apenas uma ferramenta que controla o módulo netfilter(O netfilter é um módulo que fornece ao sistema operacional [Linux](http://www.terminalroot.com.br/tags#linux) as funções de firewall, NAT e log dos dados que trafegam por rede de computadores.), o nome "iptables" é frequentemente utilizado como referência ao conjunto completo de funcionalidades do netfilter. O iptables é parte de todas as distribuições modernas do Linux.

Ao reiniciar o computador as Regras de Firewall são perdidas, para isso é preciso criar um script para executar sempre que o computador for iniciado.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para verificar quais regras estão criadas, se existir, o comando é:
{% highlight bash %}
iptables -L
{% endhighlight %}

se não retornar nada é porque o pacote não está instalado, então você pode instalá-lo pelo comando:
{% highlight bash %}
apt-get install iptables
{% endhighlight %}


Rejeitar pacotes de uma porta:
{% highlight bash %}
iptables -A INPUT -p tcp --dport 445 -j DROP
{% endhighlight %}

Aceitar pacotes de uma porta:
{% highlight bash %}
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
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

Desativar o iptables, isso libera todas as portas:
{% highlight bash %}
iptables -F
{% endhighlight %}

Essa regra abaixo fecha todas as portas, porém voçê conecta a internet normalmente, mas aplicativos como Apache por exemplo não funcionará no localhost.
{% highlight bash %}
iptables -A INPUT -p tcp --syn -j DROP
{% endhighlight %}

aqui abaixo a mesma regra, porém para o protocolo UDP.
{% highlight bash %}
iptables -A INPUT -i ppp0 -p udp --dport 0:30000 -j DROP
{% endhighlight %}

Lembrando que as tabelas do IPTABLES são lidas de cima pra baixo, ou seja, se você quiser fechar todas as portas e liberar somente o apache a porta 80, você precisa primeiro criar a regra que libera a porta 80 (ou as portas que você deseja), pra só depois fechar todas as outras
{% highlight bash %}
iptables -A INPUT -p tcp --destination-port 80 -j ACCEPT
{% endhighlight %}, depois:{% highlight bash %}
iptables -A INPUT -p tcp --syn -j DROP
{% endhighlight %}

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Para acessar pacotes de determinados IPs de uma rede interna, ou de uma determinada rede, você usar os comandos abaixo
{% highlight bash %}
iptables -A INPUT -p tcp --syn -s 192.168.1.107/255.255.255.0 -j ACCEPT
iptables -A INPUT -p tcp --syn -s 192.168.0.0/255.255.255.0 -j ACCEPT
{% endhighlight %}, aceitar as requisições do IP 192.168..107 e no comando seguinte, aceitará todas as requisições da rede interna, se logo depois vc fechar tudo pra internet, a regra de aceitar será válida, o inverso não.

Para configurações de compartilhamento, seria regras de NAT,assim:

Para compartilhar a conexão do modem com a rede local:
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
{% endhighlight %}

Para compartilhar uma conexão via ADSL ou cabo instalada na eth0:
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
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

Para desativar o compartilhamento, você deve usar o comando :
{% highlight bash %}
iptables -t nat -F.
{% endhighlight %}

Uma observação é que estas regras não incluem um servidor DHCP, você deve configurar os clientes com endereço IP fixo ou então ativar o serviço __DHCPD__ na sua [distribuição](http://www.terminalroot.com.br/tags#distros). Será necessário também configurar os __DNS__, se não souber os endereços do seu provedor, você pode usar os DNS públicos do [Google](http://www.terminalroot.com.br/tags#google) __8.8.8.8__ e __8.8.4.4__, mais informações sobre esses DNS [Clique Aqui](http://terminalroot.com.br/2011/12/o-que-e-dns.html).

Mais uma linha interessante de se adicionar, que protege contra pacotes danificados (usados em ataques DoS por exemplo) é
{% highlight bash %}
iptables -A FORWARD -m unclean -j DROP
{% endhighlight %}
(esta linha deve ser adicionada antes das demais).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Depois de todas as regras criadas, voçê criar um script em Shell e gravar na pasta __/usr/bin/__ com o nome que você deseja e poderá executar esse nome no terminal que automaticamente, será criadas as regras, lembrando que para isso tem de estar com permissão de execução e deve ser o usuário __root__.Você também pode torná-lo inicializável, em [Debian](http://www.terminalroot.com.br/tags#debian) e [Debian-Likes](http://www.terminalroot.com.br/tags#debian-like)([Ubuntu](http://www.terminalroot.com.br/tags#ubuntu), [Linux Mint](http://www.terminalroot.com.br/tags#linux-min),...) com o comando
{% highlight bash %}
update-rc.d nome_do_script defaults
{% endhighlight %}
para excluir basta trocar o defaults por remove.

Para fazer um forward(Redirecionamento, exemplo: uma solicitação de jogo na porta __27020__, você quer que seja direcionada ao PC __192.168.1.107__ da sua rede)com Iptables.
{% highlight bash %}
modprobe iptable_nat
iptables -t nat -A PREROUTING -i etho -p tcp --dport 22 -j DNAT --to-dest 192.168.1.107
iptables -A FORWARD -p tcp -i eth0 --dport 22 -d 192.168.1.107 -j ACCEPT
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

Você pode repetir o comando várias vezes para direcionar varias portas diferentes para várias máquinas. Naturalmente uma mesma porta não pode ser fowardada duas vezes.Para um range de portas, o Counter Strike pode usar mesmo da __27015 até 27030__, se você não qual porta dessa range do seu colega está aberta, então você pode abrir esta faixa de portas assim:
{% highlight bash %}
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 27015:27030 -j DNAT --to-dest 192.168.1.107
iptables -A FORWARD -p tcp -i eth0 --dport 27015:27030 -d 192.168.1.107 -j ACCEPT
{% endhighlight %}

Eu crie um script em [PHP](http://www.terminalroot.com.br/tags#php) para verificar quais portas estão abertas da porta __1 até a 1024__ abaixo:

{% highlight php %}
$servidor="127.0.0.1";
for($i=1;$i<1024;$i++){
	$con = fsockopen($servidor, $i, $errono, $errostr, 3);
	if($con){
		echo 'A porta '.$i.' está aberta!';
	}
}
fputs($con, "Portas");
fclose($con);
{% endhighlight %}

Mas você pode utilizar o Nmap para verificar quais portas estão abertas no seu micro, para instalá-lo no [Debian](http://www.terminalroot.com.br/tags#debian) e [Debian-Likes](http://www.terminalroot.com.br/tags#debian-likes), basta:

{% highlight bash %}
apt-get install nmap
{% endhighlight %}

para analisar em rede interna use o IP interno, para análise à internet use seu IP externo, para loopback use:
{% highlight bash %}
nmap 127.0.0.1
{% endhighlight %}

Há também um serviço online que tem como você efetuar testes de portas e de invasões, eu uso muito ele, é o
[http://www.grc.com/](http://www.grc.com/)

- clique em Services
- depois clique em ShieldsUP
- depois clique em proceed
- clique em "Proceed"
- e inicie o teste clicando em "All Service Ports".

É isso aê, espero que gostem e comentem.

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


