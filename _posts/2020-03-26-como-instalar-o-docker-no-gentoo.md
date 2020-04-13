---
layout: post
title: "Como instalar o Docker no Gentoo"
date: 2020-03-26 18:41:37
image: '/assets/img/docker/docker-gentoo.jpg'
description: 'Habilitando os módulos do kernel corretamente. 🐋'
icon: 'logos:docker-icon'
iconname: 'docker'
tags:
- docker
- gentoo
- linux
---

[![Como instalar o Docker no Gentoo](/assets/img/docker/docker-gentoo.jpg)](/assets/img/docker/docker-gentoo.jpg)

Nós já possuímos um tutorial de [Docker](https://docker.com/) para iniciantes que pode ser consultado [aqui](https://terminalroot.com.br/2019/08/tutorial-definitivo-de-docker-para-iniciantes-ubuntu.html). Mas nesse artigo vamos mostrar os passos no [Gentoo](https://gentoo.org/).

## 1. Habilite módulos no [Kernel](https://www.kernel.org/)
Abra o menu de configuração do [Kernel](https://github.com/torvalds/linux)
{% highlight bash %}
su
cd /usr/src/linux
make menuconfig
{% endhighlight %}

E habilite os módulos

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
General setup  --->
    [*] POSIX Message Queues
    -*- Control Group support  --->
        [*]   Memory controller 
        [*]     Swap controller
        [*]       Swap controller enabled by default
        [*]   IO controller
        [ ]     IO controller debugging
        [*]   CPU controller  --->
              [*]   Group scheduling for SCHED_OTHER
              [*]     CPU bandwidth provisioning for FAIR_GROUP_SCHED
              [*]   Group scheduling for SCHED_RR/FIFO
        [*]   PIDs controller
        [*]   Freezer controller
        [*]   HugeTLB controller
        [*]   Cpuset controller
        [*]     Include legacy /proc/<pid>/cpuset file
        [*]   Device controller
        [*]   Simple CPU accounting controller
        [*]   Perf controller
        [ ]   Example controller 
    -*- Namespaces support
        [*]   UTS namespace
        -*-   IPC namespace
        [*]   User namespace
        [*]   PID Namespaces
        -*-   Network namespace
-*- Enable the block layer  --->
    [*]   Block layer bio throttling support
    -*- IO Schedulers  --->
        [*]   CFQ IO scheduler
            [*]   CFQ Group Scheduling support   
[*] Networking support  --->
      Networking options  --->
        [*] Network packet filtering framework (Netfilter)  --->
            [*] Advanced netfilter configuration
            [*]  Bridged IP/ARP packets filtering
                Core Netfilter Configuration  --->
                  <*> Netfilter connection tracking support 
                  *** Xtables matches ***
                  <*>   "addrtype" address type match support
                  <*>   "conntrack" connection tracking match support
                  <M>   "ipvs" match support
            <M> IP virtual server support  --->
                  *** IPVS transport protocol load balancing support ***
                  [*]   TCP load balancing support
                  [*]   UDP load balancing support
                  *** IPVS scheduler ***
                  <M>   round-robin scheduling
                  [*]   Netfilter connection tracking
                IP: Netfilter Configuration  --->
                  <*> IPv4 connection tracking support (required for NAT)
                  <*> IP tables support (required for filtering/masq/NAT)
                  <*>   Packet filtering
                  <*>   IPv4 NAT
                  <*>     MASQUERADE target support
                  <*>   iptables NAT support  
                  <*>     MASQUERADE target support
                  <*>     NETMAP target support
                  <*>     REDIRECT target support
        <*> 802.1d Ethernet Bridging
        [*] QoS and/or fair queueing  ---> 
            <*>   Control Group Classifier
        [*] L3 Master device support
        [*] Network priority cgroup
        -*- Network classid cgroup
Device Drivers  --->
    [*] Multiple devices driver support (RAID and LVM)  --->
        <*>   Device mapper support
        <*>     Thin provisioning target
    [*] Network device support  --->
        [*]   Network core driver support
        <M>     Dummy net driver support
        <M>     MAC-VLAN support
        <M>     IP-VLAN support
        <M>     Virtual eXtensible Local Area Network (VXLAN)
        <*>     Virtual ethernet pair device
    Character devices  --->
        -*- Enable TTY
        -*-   Unix98 PTY support
        [*]     Support multiple instances of devpts (option appears if you are using systemd)
File systems  --->
    <*> Overlay filesystem support 
    Pseudo filesystems  --->
        [*] HugeTLB file system support
Security options  --->
    [*] Enable access key retention support
    [*]   Enable register of persistent per-UID keyrings
    <M>   ENCRYPTED KEYS
    [*]   Diffie-Hellman operations on retained keys
{% endhighlight %}

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## 2. Certifique-se de ter habilitado todos os módulos corretamente
Para isso você pode usar um [script em Bash](https://terminalroot.com.br/bash): `check-config.sh`
{% highlight bash %}
wget https://git.io/check-config.sh
chmod +x check-config.sh
sh check-config.sh
{% endhighlight %}

A saída será similar a isso:
[![Chech config Docker módulos do Kernel](/assets/img/docker/check-config-output.jpg)](/assets/img/docker/check-config-output.jpg)

Caso existam módulos *não habilitados*(`missing`), verifique antes se a sua versão do Kernel possui esse nome de módulo, exemplo para o módulo [CONFIG_EXT3_FS_XATTR](https://cateee.net/lkddb/web-lkddb/EXT3_FS_XATTR.html):
{% highlight bash %}
grep 'CONFIG_EXT3_FS_XATTR' /usr/src/linux/.config 
{% endhighlight %}
Se não retornar saída é porque não tem, mas se retornar, copie o nome do módulo e pesquise em qualquer tela do menu do Kernel, pressionando a barra(`/`) abrirá um box para você inserir o nome que deseja pesquisar, basta colar o nome que você havia copiado e em seguida pressionar **Enter**, exemplo:

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

Pesquise o módulo: **CONFIG_NETFILTER_XT_MATCH_IPVS**
[![search module kerne](/assets/img/docker/search-module-kernel.jpg)](/assets/img/docker/search-module-kernel.jpg)
-Resultado com o caminho completo e todos os dados:
{% highlight bash %}
Symbol: NETFILTER_XT_MATCH_IPVS [=m]
Type  : tristate
Prompt: "ipvs" match support
  Location: 
    -> Networking support (NET [=y])
       -> Networking options
        -> Network packet filtering framework (Netfilter) (NETFILTER [=y])
          -> Core Netfilter Configuration
(1)         -> Netfilter Xtables support (required for ip_tables) (NETFILTER_XTABLES [=y])
  Defined at net/netfilter/Kconfig:1322
  Depends on: NET [=y] && INET [=y] && NETFILTER [=y] && NETFILTER_XTABLES [=y] && IP_VS [=m] && NETFILTER_ADVANCED [=y] && NF_CONNTRACK [=y]
{% endhighlight %}
[![result module](/assets/img/docker/result-module.jpg)](/assets/img/docker/result-module.jpg)

A linha **Prompt** indica o nome que ele está no menu e em **Location** o caminho completo para encontrá-lo.
> Nesse caso, está habilitado como módulo: **[=m]** , mas se estiver como **is not set** será necessário habilitar.

## 3. Compile o Kernel
{% highlight bash %}
make && make modules_install && make install
{% endhighlight %}

## 4. Instale e configure o Docker
{% highlight bash %}
emerge --ask --verbose app-emulation/docker
{% endhighlight %}

Adicione seu usuário ao grupo `docker`
{% highlight bash %}
usermod -aG docker <username>
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

Se quiser adicione o Docker para iniciar junto com o [OpenRC](https://wiki.gentoo.org/wiki/OpenRC)
{% highlight bash %}
rc-update add docker default
{% endhighlight %}
> Se não quiser que inicie junto com o sistema, para utilizar o Docker será sempre necessário iniciar manualmente: `rc-service docker start` . Se utilizar [systemd](https://freedesktop.org/wiki/Software/systemd/) rode: `systemctl start docker.service`.

Reinicie seu sistema para que alguns módulos sejam lidos na inicialização e a alteração de grupo do seu usuário tenham efeito: `sudo reboot`.
{% highlight bash %}
# Testando se está tudo certo
docker info
{% endhighlight %}

# Assista a um vídeo sobre Docker

<iframe width="1244" height="500" src="https://www.youtube.com/embed/bsGkIKP1OZ4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Links úteis:
+ <https://wiki.gentoo.org/wiki/Docker>
+ <https://cateee.net/lkddb/>
+ <https://github.com/coreos/docker/blob/master/contrib/check-config.sh>
+ <https://terminalroot.com.br/2020/03/melhores-alternativas-para-compartilhamento-de-trechos-de-codigo.html>
