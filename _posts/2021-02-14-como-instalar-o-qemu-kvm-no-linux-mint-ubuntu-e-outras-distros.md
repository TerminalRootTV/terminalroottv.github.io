---
layout: post
title: "Como instalar o QEMU/KVM no Linux Mint, Ubuntu e outras Distros"
date: 2021-02-14 08:55:47
image: '/assets/img/virtualizacao/qemu.jpg'
description: 'Nesse artigo/vídeo veremos como instalar e utilizar o QEMU no Linux.'
icon: 'ion:terminal-sharp'
iconname: 'virtualização'
tags:
- virtualizacao
- mint
- ubuntu
- gentoo
---

![Como instalar o QEMU/KVM no Linux Mint, Ubuntu e outras Distros](/assets/img/)

Já faz tempo que me perguntam quando haverá um vídeo/artigo sobre o [KVM](https://www.linux-kvm.org/) e [QEMU](https://www.qemu.org/), então resolvi e escolhi fazer um vídeo e artigo para sabermos do que se trata, como instala e como funciona.

# Qual a diferença entre KVM e QEMU
### [KVM](https://www.linux-kvm.org/)
+ Kernel-based Virtual Machine, em português, Máquina Virtual baseada em Núcleo integrada ao [Linux](https://terminalroot.com.br/tags#linux). No entanto, também funciona em outros sistemas operacionais como: [BSD](http://terminalroot.com.br/tags/#bsd), Solaris, Microsoft [Windows](https://terminalroot.com.br/tags#windows), Haiku, ReactOS, AROS e com uma versão modificada é capaz de funcionar no [Mac OS X](https://www.youtube.com/watch?v=2B8Q6IWvVa8).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ Por si só, KVM não realiza nenhuma emulação. Ao invés disso, um programa de espaço de usuário(conhecido como `userspace`, quando a CPU processa apenas instruções não privilegiadas somente executando após aval do Kernel). O KVM usa a interface `/dev/kvm` endereçar memória para um host da máquina virtual. Pelo menos dois programas aproveitam este recurso: uma versão modificada do Qemu e o próprio Qemu, desde a versão 0.10.0. 

+ O KVM é licenciado sob os termos das licenças: [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.html), [GNU GPLv2](https://www.gnu.org/licenses/gpl-3.0.html), [GNU LGPL](https://www.gnu.org/licenses/gpl-3.0.html) e [GNU LGPLv2](https://www.gnu.org/licenses/gpl-3.0.html), cada parte desse software possui uma ou mais dessas licenças.

+ A KVM é mantida por Avi Kivity e é financiada primariamente pela Qumranet que foi adquirida pela Red Hat que por sua vez foi adquirida pela IBM .

### [QEMU](https://www.qemu.org/)
+ QEMU é um software livre que serve para emular um processador.

+ Foi criado por [Fabrice Bellard](https://bellard.org), o mesmo criador do [FFmpeg](https://terminalroot.com.br/2014/05/como-converter-trecho-de-video-em-gif.html) e também do QuickJS, esse segundo por sua vez, é um motor [Javascript](https://terminalroot.com.br/tags#javascript) utilizado, por exemplo, para rodar um Linux no navegador, um exemplo seria o [JSLinux](https://jslinux.org/).

+ O QEMU é um hypervisor e é semelhante a projetos como o Bochs, VMware Workstation e o PearPC, mas possui várias características que faltam nestes, incluindo aumento de velocidade em x86 .

+ O QEMU possui dois modos de operação: modo de usuário(Licenciado pela GNU LGPL) e o modo de computador completo(Sob os termos da licença [GNU](https://terminalroot.com.br/tags#gnu) GPL)

+ O [VirtualBox](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) quando foi lançado usava alguns dos dispositivos de hardware virtual do QEMU.

---

# Instalação no [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu) e [Mint](https://terminalroot.com.br/tags#mint)
Para usar o KVM e QEMU nesses sistemas você precisará instalar os seguintes pacotes:

+ `qemu-kvm` - software que fornece emulação de hardware para o KVM.
+ `libvirt-daemon-system` - arquivos de configuração para executar o daemon `libvirt` como um serviço do sistema.
+ `libvirt-clients` - software para gerenciar plataformas de virtualização, antigamente instalável pelo pacote `libvirt-bin` que teve seu nome alterado.
+ `bridge-utils` - um conjunto de ferramentas de linha de comando para configurar Ethernet.
+ `virtinst` - um conjunto de ferramentas de linha de comando para a criação de máquinas virtuais.
+ `virt-manager` - uma interface GUI fácil de usar e utilitários de linha de comando de suporte para gerenciar máquinas virtuais por meio de libvirt.

Em resumo o comando é:
{% highlight bash %}
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
{% endhighlight %}

Assim que os pacotes forem instalados, o daemon `libvirt` será iniciado automaticamente. Você pode verificar digitando:
{% highlight bash %}
sudo systemctl is-active libvirtd
{% endhighlight %}
> A saída deve ser: `active` , se por algum motivo não estiver ativa, então faça manualmente com o comando:
{% highlight bash %}
sudo systemctl enable --now libvirtd
{% endhighlight %}

Para você conseguir criar "máquinas virtuais", certifique-se de incluir seu usuário aos grupos: `kvm` e `libvirt` da seguinte forma:
{% highlight bash %}
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
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

![libvirt infograma](/assets/img/virtualizacao/libvirt-suport.png)

---

# Utilização
Após instalado procure no Menu de Aplicativos o software: Gerenciador de Máquinas Virtuais
> Que é o `virt-manager` com nome completo para o Português Brasileiro.
E abra-o:
![Menu de Aplicativos](/assets/img/virtualizacao/qemu-kvm-menu-01.jpg)

+ Após aberto, clique no ícone que representa uma tela de computador para criar uma nova máquina virtual:

![Criar um nova máquina virtual - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-02.jpg)
> Observação: se você obter esse erro:
> 
![Erro: nenhuma conexão ativa para instalar - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-03.jpg)
Podem ser duas coisas:
+ 1º - Talvez você precise reiniciar sua máquina
+ 2º - Você não adicionou seu usuário aos grupos `kvm` e `libvirt` como citados no passo acima.
E se nenhuma dessas coisas deram certo, tente adicionar uma conexão:
![Adicionar conexão - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-04.jpg)

E somente clique em `Conectar` na janela que se abre.

+ Escolha: `Mídia de instalação local(Imagem ISO ou CD-ROM)`
![Mídia de instalação local(Imagem ISO ou CD-ROM) - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-05-1.jpg)

+ Próxima tela é essa para você escolher o `.iso` do sistema que você deseja virtualizar, clique em `Navegar`
![alt](/assets/img/virtualizacao/qemu-kvm-menu-05-2.jpg)

+ Agora escolha o local da sua imagem, se sua imagem estiver no seu diretório local(provavelmente estará), adicione clicando no `+` ou clique em `Navegar Localmente`
![Adicionar ou Navegar Localmente - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-06.jpg)

+ E então escolha a imagem, nesse caso vou testar o LiveCD do [Gparted](https://www.youtube.com/watch?v=fB6C-mXEnE4)
![Escolhendo a ISO - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-07.jpg)

+ Após escolhida, lembre-se de desmarcar a opção: `Automatically detect from the installation media / source`, navegar na seta do combo e escolher: `Generic default` se sua iso não for reconhecida automaticamente.
![Generic default - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-08.jpg)

+ Agora selecione as configurações de memória e CPU da sua VM:
![Memória e CPU](/assets/img/virtualizacao/qemu-kvm-menu-09.jpg)

+ Em seguida informe a quantidade do tamanho do disco(HD):
![Tamanho em disco](/assets/img/virtualizacao/qemu-kvm-menu-10.jpg)

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

+ Agora informe um nome para sua máquina virtual, nesse caso, chamei de `GParted` mesmo:
![Nome da Máquina Virtual - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-11.jpg)

+ Após isso aguarde a criação da VM:

![Criando a máquina virtual - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-12.jpg)

+ A máquina virtual será inicializada em seguida e você poderá: pausar(⏸️ ), desligar,... e entre outros pelos controles exibidos na Barra de Ferramentas:
![Rodando a VM - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-13.jpg)

+ Comando de atalhos:
  - `Ctrl + Alt + F` - Para alternar entre tela cheia
  - `Ctrl + Alt + G` - Para alternar o cursor do mouse entre o host e a máquina física

Todas as máquinas que você criou serão exibidas assim que você abrir o programa, nesse caso só tenho uma então só aparece ela:

![Lista das VMs - QEMU/KVM](/assets/img/virtualizacao/qemu-kvm-menu-14.jpg)

Você também pode listar as VMs criadas e que estão rodando via linha de comando, rodando o seguinte comando:
{% highlight bash %}
virsh -c qemu:///system list
{% endhighlight %}
No meu caso, a saída gera:
{% highlight bash %}
 Id   Name      State
-------------------------
 4    Gparted   running
{% endhighlight %}
> Se não estiver rodando, só aparecerá o cabeçalho.

---

# Criando uma VM via [linha de comando](https://terminalroot.com.br/tags#comandos)
Para o exemplo do [Gparted](https://terminalroot.com.br/2017/09/como-utilizar-o-gparted.html) usei esse comando:
+ 1º primeiramente crie a máquina vitual
{% highlight bash %}
qemu-img create -f qcow2 gparted.img 10G
{% endhighlight %}

+ 2º em seguida, abra indicando o caminho do `.iso`
{% highlight bash %}
qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda gparted.img -cdrom gparted-live-1.1.0-1-amd64.iso
{% endhighlight %}

Explicação dos parâmetros
Vamos explicar o comando anterior parte por parte:

+ `-m 1024`: Aqui escolhemos a quantidade de RAM que desejamos fornecer para o QEMU ao executar o arquivo ISO. Escolhemos 1024 MB aqui. Você pode alterá-lo se quiser de acordo com suas necessidades.
+ `-boot -d`: A opção de inicialização nos permite especificar a ordem de inicialização, qual dispositivo deve ser inicializado primeiro? -d significa que o CD-ROM será o primeiro, então o QEMU inicializará normalmente na imagem do disco rígido. Usamos a opção -cdrom como você pode ver no final do comando. Você pode usar -c se quiser inicializar a imagem do disco rígido primeiro.
+ `-enable-kvm`: Esta é uma opção muito importante. Ele nos permite usar a tecnologia KVM para emular a arquitetura que desejamos. Sem ele, o QEMU usará a renderização por software, que é muito lenta. É por isso que devemos usar esta opção, apenas certifique-se de que as opções de virtualização estão habilitadas no BIOS do seu computador.
+ `-smp 3`: Se quisermos usar mais de 1 núcleo para o sistema operacional emulado, podemos usar esta opção. Optamos por usar 3 núcleos para executar a imagem virtual, o que a tornará mais rápida. Você deve alterar este número de acordo com a CPU do seu computador.
+ `-net nic -net user`: Ao usar essas opções, vamos permitir que uma conexão Ethernet com a Internet esteja disponível na máquina virtual em execução por padrão.
+ `-hda gparted.img`: aqui especificamos o caminho para o disco rígido que será usado. No nosso caso, foi o arquivo `gparted.img` que criamos antes.
+ `-cdrom gparted-live-1.1.0-1-amd64.iso`: Finalmente, dissemos ao QEMU que desejamos inicializar nosso arquivo ISO "`gparted-live-1.1.0-1-amd64.iso`".

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

Depois de executar o comando anterior, o QEMU será iniciado para você como uma janela independente:

Agora, se você deseja apenas inicializar a partir do arquivo de imagem sem o arquivo ISO (por exemplo, se você concluiu a instalação e agora deseja sempre inicializar o sistema instalado), pode apenas remover a opção -cdrom:
{% highlight bash %}
qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda gparted-live-1.1.0-1-amd64.iso
{% endhighlight %}

Observe que, neste tutorial, usamos a arquitetura `x86_64` para executar o QEMU. Se desejar, você pode escolher entre várias outras arquiteturas disponíveis para testar seus sistemas:
{% highlight bash %}
ls /usr/bin | grep qemu-system*
qemu-system-x86_64
{% endhighlight %}
> No meu caso, somente `x86_64` mesmo.

Se quiser usar o QEMU para inicializar de um CD / DVD inserido na unidade de disco, você pode fazer facilmente:
{% highlight bash %}
qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda from-my-cdrom-drive.img -cdrom /dev/cdrom
{% endhighlight %}

---

# Instalação no [Gentoo](https://terminalroot.com.br/2017/05/como-instalar-o-gentoo.html)
O screenshot abaixo já foi feito no [Gentoo](https://wiki.gentoo.org/wiki/QEMU) que eu acredito que possui uma documentação bem detalhada e dispensa artigos em blog. Apesar do processo ser um pouco mais detalhado, se resume ao mesmo, você pode consultar a documentação [nesse link](https://wiki.gentoo.org/wiki/QEMU).

![QEMU/KVM via linha de comando no Gentoo](/assets/img/virtualizacao/qemu-kvm-gentoo-17.png)

Eu particularmente dispenso o uso de [Virt-Manager](https://virt-manager.org/) uso o [QEMU](https://www.qemu.org/) somente via linha de comando, pois acho mais prático.

Ainda sobre a documentação do Gentoo há um aviso importante de que se você habilitar no Kernel suporte de AMD e Intel simultaneamente, haverá um erro, então escolha um ou o outro, os dois há uma rejeição do QEMU:
![Intel ou AMD - QEMU/KVM - Gentoo](/assets/img/virtualizacao/qemu-kvm-gentoo-16.png)

Outra coisa é que se nada deu certo pra você, deve ser porque seu processador não suporta, para saber se suporta ou não rode o comando:
{% highlight bash %}
grep --color -E "vmx|svm" /proc/cpuinfo
{% endhighlight %}
Se não houve saída(essas palavras com cor diferente): `vmx` ou `svm` é porque não há suporte para seu caso.

---

# Instalação em outras distros [Linux](https://terminalroot.com.br/linux/)
### [Fedora](https://terminalroot.com.br/2019/09/ambiente-de-desenvolvimento-fedora-30.html)
{% highlight bash %}
sudo dnf install qemu qemu-kvm
{% endhighlight %}

### OpenSUSE
{% highlight bash %}
sudo zypper in qemu
{% endhighlight %}

### [Arch Linux](https://terminalroot.com.br/tags#archlinux)
{% highlight bash %}
sudo pacman -S qemu
{% endhighlight %}

Espero ter ajudado! 

Abraços!

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

# Assista ao Vídeo
<iframe width="1234" height="694" src="https://www.youtube.com/embed/p09vXPhglF4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

---

# Bibliografia
+ <https://www.linux-kvm.org/>
+ <https://www.qemu.org/>
+ <https://bellard.org/>
+ <https://pt.wikipedia.org/wiki/QEMU>
+ <https://pt.wikipedia.org/wiki/Kernel-based_Virtual_Machine>
+ <https://pt.wikipedia.org/wiki/Espaço_de_usuário>
+ <https://pt.wikipedia.org/wiki/Fabrice_Bellard>
