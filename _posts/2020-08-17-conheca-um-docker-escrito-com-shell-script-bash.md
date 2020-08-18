---
layout: post
title: "Conheça um Docker escrito com Shell Script"
date: 2020-08-17 13:55:01
image: '/assets/img/docker/docker-script.jpg'
description: 'Um Docker implementado com somente de 100 linhas de Bash.'
icon: 'ion:terminal-sharp'
iconname: 'bash'
tags:
- docker
- redes
- servidores
---

![Conheça um Docker escrito com Shell Script](/assets/img/docker/docker-script.jpg "Conheça um Docker escrito com Shell Script")

Salve, rapaziada! Teve uma vez que eu estava lendo o código fonte do [Docker](https://www.youtube.com/watch?v=bsGkIKP1OZ4) e percebi que dava pra fazer um software similar ao Docker usando somente [Shell Script](https://terminalroot.com.br/shell), cheguei a até postar isso no meu perfil do [Facebook](https://www.facebook.com/TerminalRootTV/) , e muita gente se interessou por isso.

Mas como é sempre bom dar uma *"stalkeada"* na internet antes, percebi que alguém teve a mesma ideia que a minha.

Não que isso seja motivo pra você deixar de executar seu projeto. Já existir um software similar não é desculpa pra você criar a sua versão, que isso fique bem claro. E para aqueles da cultura: *"Isso é reinventar a roda!"* , sinto muito em lhe informar, mas isso aqui é [SOFTWARE LIVRE](https://terminalroot.com.br/tags/#freesoftware) , é também a liberdade de não ser obrigado a usar uma única coisa, é luta contra o monopólio de tudo! De nada.

No entanto, eu criaria só pelo motivo de mostrar que é possível, logo, quando conheci esse projeto, já posso utilizar para justificar minhas afirmações.

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

O **Bocker** é um Docker implementado com somente de 100 linhas de [Bash](https://terminalroot.com.br/bash), ou em torno disso.

# Pré-requisitos
Os pacotes necessários para você conseguir rodar o Bocker(as dependências) são:

* btrfs-progs
* [curl](https://www.youtube.com/watch?v=HxezVt5IEHQ)
* iproute2
* [iptables](https://terminalroot.com.br/2014/11/como-utilizar-o-iptables-netfilter.html)
* libcgroup-tools
* util-linux >= 2.25.2
* coreutils >= 7.5

Como a maioria das distribuições não fornece uma versão nova o suficiente do util-linux, você provavelmente precisará pegar os fontes [daqui](https://www.kernel.org/pub/linux/utils/util-linux/v2.25/) e compilá-los você mesmo.

Além disso, seu sistema precisará ser configurado com o seguinte:

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
---

+ Um sistema de arquivos btrfs montado em `/var/bocker`
+ Uma rede em modo bridge de nome `bridge0` e um IP de `10.0.0.1/24`
+ Encaminhamento de IP habilitado em `/proc/sys/net/ipv4/ip_forward`
+ Um firewall roteando o tráfego de `bridge0` para uma interface física.

Para facilidade de uso, um Vagrantfile é incluído, o qual criará o ambiente necessário.

Mesmo se você atender aos pré-requisitos acima, provavelmente ainda dá pra executar o Bocker em uma máquina virtual. O Bocker é executado como `root` e, entre outras coisas, precisa fazer alterações em suas interfaces de rede, tabela de roteamento e regras de firewall. Segundo o desenvolvedor , é garantido que isso não destruirá seu sistema.

# Exemplo de uso
```sh
$ bocker pull centos 7
######################################################################## 100.0%
######################################################################## 100.0%
######################################################################## 100.0%
Created: img_42150

$ bocker images
IMAGE_ID        SOURCE
img_42150       centos:7

$ bocker run img_42150 cat /etc/centos-release
CentOS Linux release 7.1.1503 (Core)

$ bocker ps
CONTAINER_ID       COMMAND
ps_42045           cat /etc/centos-release

$ bocker logs ps_42045
CentOS Linux release 7.1.1503 (Core)

$ bocker rm ps_42045
Removed: ps_42045

$ bocker run img_42150 which wget
which: no wget in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin)

$ bocker run img_42150 yum install -y wget
Installing : wget-1.14-10.el7_0.1.x86_64                                  1/1
Verifying  : wget-1.14-10.el7_0.1.x86_64                                  1/1
Installed  : wget.x86_64 0:1.14-10.el7_0.1
Complete!

$ bocker ps
CONTAINER_ID       COMMAND
ps_42018           yum install -y wget
ps_42182           which wget

$ bocker commit ps_42018 img_42150
Removed: img_42150
Created: img_42150

$ bocker run img_42150 which wget
/usr/bin/wget

$ bocker run img_42150 cat /proc/1/cgroup
...
4:memory:/ps_42152
3:cpuacct,cpu:/ps_42152

$ cat /sys/fs/cgroup/cpu/ps_42152/cpu.shares
512

$ cat /sys/fs/cgroup/memory/ps_42152/memory.limit_in_bytes
512000000

$ BOCKER_CPU_SHARE=1024 \
	BOCKER_MEM_LIMIT=1024 \
	bocker run img_42150 cat /proc/1/cgroup
...
4:memory:/ps_42188
3:cpuacct,cpu:/ps_42188

$ cat /sys/fs/cgroup/cpu/ps_42188/cpu.shares
1024

$ cat /sys/fs/cgroup/memory/ps_42188/memory.limit_in_bytes
1024000000
```

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

# Funcionalidades
### Atualmente implementadas
* `docker build` †
* `docker pull`
* `docker images`
* `docker ps`
* `docker run`
* `docker exec`
* `docker logs`
* `docker commit`
* `docker rm` / `docker rmi`
* Networking
* Quota Support / CGroups

### Não implementadas
* Data Volume Containers
* Data Volumes
* Port Forwarding

# Licença
A licença do Bocker é [GPL-3.0 License](https://github.com/p8952/bocker/blob/master/LICENSE) e a paǵina oficial do projeto está no [GitHub](https://github.com/p8952/bocker):
## <https://github.com/p8952/bocker>

# Fui!
