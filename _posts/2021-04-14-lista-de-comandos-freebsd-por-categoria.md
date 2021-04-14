---
layout: post
title: "Lista de Comandos FreeBSD por Categoria"
date: 2021-04-14 13:56:57
image: '/assets/img/freebsd/freebsd-commands.jpg'
description: 'Aquela guia de consulta rápida para sempre que precisar lembrar de algo.'
icon: 'ion:terminal-sharp'
iconname: 'FreeBSD'
tags:
- freebsd
---

![Lista de Comandos FreeBSD por Categoria](/assets/img/freebsd/freebsd-commands.jpg)

Salve, rapaziada! Segue abaixo um **Cheat Sheet** do FreeBSD separados por categoria.

---

# Comandos de Montagem
+ Montar o sistema de arquivos MS-DOS (stick USB, unidade FAT32 externa)
{% highlight bash %}
sudo mount_msdosfs [-o large] /dev/ad0s1 /mnt
{% endhighlight %}

+ Montar ISO 9660 usando disco de memória
{% highlight bash %}
sudo mount -t cd9660 /dev/`mdconfig -f <image.iso>` /mnt
{% endhighlight %}

+ Montar Linux procfs
{% highlight bash %}
sudo mkdir -p /proc
sudo mount -t procfs proc /proc
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

+ Montar Linux linprocfs
{% highlight bash %}
sudo mkdir -p /compat/linux/proc
sudo mount -t linprocfs linproc /compat/linux/proc
{% endhighlight %}

+ Montar descritor de arquivo fs
{% highlight bash %}
sudo mount -t fdescfs fdesc /dev/fd
{% endhighlight %}

---

# Comandos de atualização
+ Executar a atualização binária do FreeBSD
{% highlight bash %}
sudo freebsd-update fetch
sudo freebsd-update upgrade -r <release>
sudo freebsd-update install
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

# Comandos do `pkg`
+ Instalar um pacotes
{% highlight bash %}
sudo pkg install [package]
{% endhighlight %}

+ Remover um pacote
{% highlight bash %}
sudo pkg delete [package]
{% endhighlight %}

+ Atualizar bancos de dados de pacotes do repositório
{% highlight bash %}
sudo pkg update
sudo pkg [-d] update
{% endhighlight %}

+ Remover depedências não mais utilizadas
{% highlight bash %}
sudo pkg autoremove
{% endhighlight %}

+ Atualizar pacotes para uma nova versão
{% highlight bash %}
sudo pkg upgrade [-f]
{% endhighlight %}

+ Atualizar banco de dados vuln.xml
{% highlight bash %}
sudo pkg audit -F
{% endhighlight %}

+ O `pkg` está instalado?
{% highlight bash %}
pkg info|grep <pkg>
{% endhighlight %}

+ Exibir informações do pacote
{% highlight bash %}
pkg info <pkg>
pkg show <pkg>
{% endhighlight %}

+ Bloquear pacote para a versão atual e exibir pacotes bloqueados
{% highlight bash %}
pkg lock <pkg>
pkg lock -l
{% endhighlight %}

+ Limpar o cache local
{% highlight bash %}
sudo pkg clean -y
{% endhighlight %}

+ Exibir estatísticas de pacotes
{% highlight bash %}
pkg stats
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

+ Encontre o pacote de instalação do arquivo:
{% highlight bash %}
pkg which /usr/local/bin/vim
{% endhighlight %}

+ Encontre o arquivo se o pacote não estiver instalado:
{% highlight bash %}
sudo pkg install pkg-provides
sudo pkg provides -uf
pkg provides /path/to/file
{% endhighlight %}

---

# Comandos de Rede

+ TCP sockets abertos (`LISTEN`, `ESTABLISHED`, `CLOSE_WAIT`)
{% highlight bash %}
sudo netstat -p tcp -an
sudo sockstat -P tcp -a
{% endhighlight %}

+ Consultar o script tcp dtrace em: `/usr/share/dtrace`
{% highlight bash %}
cd /usr/share/dtrace
sudo tcpconn
sudo tcpdebug
sudo tcpstate
sudo tcptrack
{% endhighlight %}

---

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Comandos dos módulos do kernel

+ Lista os módulos do kernel carregados
{% highlight bash %}
sudo kldstat [-v]
{% endhighlight %}

+ Módulo de carga do kernel (HW thermal sensors)
{% highlight bash %}
sudo kldload <module>
sudo kldload coretemp
{% endhighlight %}

+ Gerar hints(dicas) para o carregador de boot
{% highlight bash %}
sudo kldxref [v] /boot/kernel /boot/modules
sudo kldxref -R /boot
{% endhighlight %}

+ Despejar(Dump) a configuração do kernel em execução
{% highlight bash %}
sysctl -n kern.conftxt
config -x /boot/kernel/kernel
{% endhighlight %}

---

# Comandos para o `ports`

+ Atualizar e extrair snapshots
{% highlight bash %}
sudo mkdir -p /usr/ports
sudo portsnap fetch extract
{% endhighlight %}

+ Procurar um `ports` na árvore
{% highlight bash %}
cd /usr/ports/*/*/<portname>
make -C /usr/ports search name=<portname>
make -C /usr/ports search name=<portname> display=name,path

sudo pkg install psearch
psearch <portname>
{% endhighlight %}

+ Exibir variáveis ​​do `ports`
{% highlight bash %}
make -C /usr/ports/editor/vim -V MAINTAINER -V PORTVERSION
make -C /usr/ports/editor/vim -V WRKSRC -V WRKDIR
{% endhighlight %}

+ Buscar distfile(s)
{% highlight bash %}
cd /usr/ports/editor/vim && make fetch extract
cd work
{% endhighlight %}

+ Gerar novamente a hash de informações do(s) distfile(s)
{% highlight bash %}
make -C /usr/ports/editor/vim makesum
{% endhighlight %}

+ Alterar a configuração do KNOB/Options
{% highlight bash %}
make -C /usr/ports/editor/vim showconfig
make -C /usr/ports/editor/vim config
make -C /usr/ports/editor/vim rmconfig

make check-license check-categories check-deprecated check-vulnerable security-check check-sanity check-plist check-orphans check-config
{% endhighlight %}

+ Listar os destinos do Makefile dos `ports`
{% highlight bash %}
grep -E '^[^${\.#]+:$' /usr/ports/Mk/bsd.port.mk |cut -d ':' -f1 | sort -u
make -C /usr/ports -V .ALLTARGETS
{% endhighlight %}

+ Listar dependências para reconstruir
{% highlight bash %}
make all-depends-list
make build-depends-list
make run-depends-list
{% endhighlight %}

+ Reconstruir `ports` sem construir suas dependências
{% highlight bash %}
make missing-packages # list missing packages
make install-missing-packages
make install clean
{% endhighlight %}

---

# Comandos para o `src`
+ Extrair `/usr/src` alvos Makefile com descrições (lista todos os alvos disponíveis)
{% highlight bash %}
grep '^# [a-z].*- [A-Z].*' /usr/src/Makefile | sed 's,^# ,,' | sort
make -C /usr/src -V .ALLTARGETS
{% endhighlight %}

+ Entre na pasta do código de fonte do utilitário binário userland (por exemplo, ls)
{% highlight bash %}
cd `where -sq ls`
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

# Comandos do `poudriere`
+ Criar um `jail`
{% highlight bash %}
sudo poudriere jail -c -j <jail> -v 12.2-RELEASE -a <arch> -M ftp -p <ptree>
sudo poudriere jail -c -j 12amd64 -v 12.2-RELEASE -a amd64 -M ftp -p portsdir
{% endhighlight %}

+ Deletar um `jail`
{% highlight bash %}
sudo poudriere jail -d -j <jail> -C all
sudo poudriere jail -d -j 12amd64 -C all
{% endhighlight %}

+ Listar `jail`(s)
{% highlight bash %}
sudo poudriere jail -l
sudo poudriere jail -l [-n] [-q]
{% endhighlight %}

+ Upgrade jail
{% highlight bash %}
sudo poudriere jail -u -j <jail>
sudo poudriere jail -u -j <jail> -t 12.1
{% endhighlight %}

+ Criar `ports`
{% highlight bash %}
sudo poudriere ports -c -m null -M ${PWD}/svn/ports -p portsdir -v
sudo poudriere ports -l
{% endhighlight %}

+ Lista árvore do `ports`
{% highlight bash %}
sudo poudriere ports -l
sudo poudriere ports -l [-n] [-q]
{% endhighlight %}

+ Construir um `ports` de teste
{% highlight bash %}
sudo poudriere testport -o <origin>/<port> -p portsdir -n # dry run
sudo poudriere testport -o editor/vim -p portsdir -v # verbose
{% endhighlight %}

---

# Comandos de desenvolvimento
+ Obter `sources`
{% highlight bash %}
git clone --depth 1 https://github.com/freebsd/freebsd.git /usr/src
git clone --depth 1 https://git.freebsd.org/src.git /usr/src
{% endhighlight %}

Para uma `branch` específica, por ex. *Versão 12.x*:
{% highlight bash %}
git checkout -b releng-12.2 freebsd/releng/12.2
git switch -c releng-12.2 freebsd/releng/12.2
{% endhighlight %}

+ Baixar `ports`
{% highlight bash %}
git clone --depth 1 https://github.com/freebsd/freebsd-ports.git /usr/ports
git clone --depth 1 https://git.freebsd.org/ports.git /usr/ports
{% endhighlight %}

---

# Comandos para Wireless (Redes sem fio)
+ Reiniciar a rede wi-fi
{% highlight bash %}
sudo service wpa_supplicant restart wlan0
{% endhighlight %}

+ Listar os dispositivos Wireless
{% highlight bash %}
sysctl net.wlan.devices
{% endhighlight %}

+ Listar ponto de acesso SSID sem fio (com dispositivo wlan0)
{% highlight bash %}
sudo ifconfig [-v] wlan0 list scan
{% endhighlight %}

+ Debugar a "pilha"(stack) da rede wireless
{% highlight bash %}
sudo sysctl debug.iwi=1
sudo sysctl hw.wi.debug=1
sudo sysctl net.wlan.debug=1
{% endhighlight %}

---

# Comandos de construção
+ Construir o "mundo"(world) e o kernel
{% highlight bash %}
cd /usr/src
sudo nice -n -20 make -j`sysctl -n hw.ncpu` -DNO_CLEAN -DKERNFAST buildworld buildkernel | tee -a build.log
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

+ Instalar o Kernel (debug)
{% highlight bash %}
cd /usr/src
sudo make installworld installkernel
sudo make installkernel.debug
{% endhighlight %}

+ Atualizar configurações do `/etc`
{% highlight bash %}
sudo etcupdate
sudo mergemaster -ui
{% endhighlight %}

---

# Comandos de hardware
+ Dispositivos PCI
{% highlight bash %}
sudo pciconf -vl
sudo pkg install pciutils
sudo lspci [-v]
{% endhighlight %}

+ Dispositivos USB
{% highlight bash %}
sudo usbconfig list
sudo usbconfig dump_all_desc
sudo pkg install usbutils
sudo lsusb [-v]
{% endhighlight %}

+ Informações da CPU
{% highlight bash %}
sudo dmesg
sudo dmesg | sed -n '/^CPU:/,/^real/p'
sudo sysctl hw.model hw.ncpu
sudo sysctl kern.smp.cpus
{% endhighlight %}

---

# Comandos de memória
+ Memória virtual
{% highlight bash %}
vmstat -c 1
sysctl hw.realmem hw.physmem
top -bt 0
{% endhighlight %}

+ Processar mapeamentos de memória
{% highlight bash %}
procstat vm <pid>
cat /proc/<pid>/map
cat /compat/linux/proc/<pid>/maps
{% endhighlight %}

---

# Comandos de som
+ Dispositivos de som
{% highlight bash %}
sudo cat /dev/sndstat
sudo sysctl dev.pcm
{% endhighlight %}

+ Desativar beep
{% highlight bash %}
sudo sysctl hw.syscons.bell=0
sudo sysctl kern.vt.enable_bell=0
{% endhighlight %}

+ Volume via mixer
{% highlight bash %}
mixer vol 100
{% endhighlight %}

---

# Comandos de Entrada e Saída (I/O, E/S)
+ Estatísticas de Entrada e Saída para leitura/gravação de dispositivo
{% highlight bash %}
iostat [-x]
iostat -x -w 1 # watch mode
{% endhighlight %}

---

# Comandos para/do ZFS
+ Importar ZFS Pools 
{% highlight bash %}
zpool import -R /mnt zroot
zpool import -R /mnt -e readonly=on zroot # readonly
{% endhighlight %}

+ Lista e montagem de conjuntos de dados ZFS
{% highlight bash %}
zfs list
mount -t vfs zroot/usr/home /tmp/home
{% endhighlight %}

---

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

# Links úteis
+ [Conheça o helloSystem, um FreeBSD com cara de macOS](https://terminalroot.com.br/2021/03/conheca-o-hellosystem-um-freebsd-com-cara-de-macos.html)
+ [Conheça o FuryBSD - Um Sistema baseado no FreeBSD](https://terminalroot.com.br/2019/12/conheca-o-furybsd-um-sistema-baseado-no-freebsd.html)
+ [Como Instalar e Configurar o i3wm e GNOME no FreeBSD](https://terminalroot.com.br/2019/09/freebsd-i3wm-gnome.html)
+ [Conheça o PacBSD - O Arch Linux com Kernel FreeBSD](https://terminalroot.com.br/2019/07/conheca-o-pacbsd-o-arch-linux-com-kernel-freebsd.html)
+ [Conheça o NomadBSD uma alternativa ao Tails](https://terminalroot.com.br/2019/06/conheca-o-nomadbsd-uma-alternativa-ao-tailos.html)
+ [Conheça o GhostBSD - Um Sistema Simples, Rápido e Elegante](https://terminalroot.com.br/2019/04/ghostbsd-simples-rapido-elegante.html)
+ [Como Compilar Programas no FreeBSD via Ports](https://terminalroot.com.br/2018/02/como-compilar-programas-no-freebsd-via-ports.html)
+ [Como Customizar a Aparencia do LXDE](https://terminalroot.com.br/2017/12/como-customizar-a-aparencia-do-lxde.html)
+ [Como Instalar o Lumina Desktop no FreeBSD](https://terminalroot.com.br/2017/12/como-instalar-o-lumina-desktop-no-freebsd.html)
+ [Instalando Aplicativos e Customizando o FreeBSD](https://terminalroot.com.br/2017/09/instalando-aplicativos-e-customizando-o-freebsd.html)
+ [Lista de Comandos FreeBSD](https://github.com/sbz/freebsd-commands)



