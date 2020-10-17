---
layout: post
title: "Curso Certificação Linux LPI-1: Arquitetura de Hardware."
date: '2012-11-10T15:15:00.000-08:00'
image: '/assets/img/lpi/arquitetura.jpg'
description: "Entrada/saída (em inglês: Input/output, sigla I/O) é um termo utilizado quase que exclusivamente no ramo da computação."
tags:
- linux
- lpi
---

![LPI Linux Arquitetura de Hardware](/assets/img/lpi/architeture.jpg "LPI Linux Arquitetura de Hardware")

> Entrada/saída __E/S__ (em inglês: Input/output, sigla __I/O__) é um termo utilizado quase que exclusivamente no ramo da computação , indicando entrada de dados por meio de algum código ou programa, para algum outro programa ou hardware, bem como a sua saída (obtenção de dados) ou retorno de dados, como resultado de alguma operação de algum programa, consequentemente resultado de alguma entrada.

### São exemplos de unidades de entrada de um computador

+ disco rígido
+ microfone
+ teclado
+ mouse
+ tela sensível ao toque
+ Scanner
+ Leitor de código de barras
+ Celular
+ Pendrive
+ Máquina fotográfica digital
+ Webcam
+ joystick e outros acessórios de jogos.

### São exemplos de unidades de saída de um computador
- monitor
- caixas de som
- impressora
- disco rígido.

> Um placa de sompadrão, por exemplo, utiliza as portas: __0x220__, __0x330__ e __0x338__.

Cada dispositivo utiliza um endereço de porta única que não pode ser compartilhado por outros dispositivos.

Os endereços de __E/S__ podem ser visualizados com o comando
{% highlight bash %}
cat /proc/ioports
{% endhighlight %}

O termo __DMA__ é um acrónimo para a expressão em inglês __Direct Memory Access__. O DMA permite que certos dispositivos de hardware num computador acessem a memória do sistema para leitura e escrita independentemente da CPU.

![Blog Linux LPI](/assets/img/lpi/arquitetura.jpg "Blog Linux LPI")
 
Muitos sistemas utilizam DMA, incluindo controladores de disco, placas gráficas, de rede ou de som. Os canais de DMA no sistema podem ser visualizados através do comando
{% highlight bash %}
cat /proc/dma
{% endhighlight %}

Um pedido de interrupção (abreviação __IRQ__ (em inglês)) é a forma pela qual componentes de hardware requisitam tempo computacional da CPU. Um IRQ é a sinalização de um pedido de interrupção de hardware.As interrupções do sistema podem ser visualizadas com o comando
{% highlight bash %}
cat /proc/interrupts
{% endhighlight %}

![Blog Linux](/assets/img/lpi/irq.jpg "Blog Linux")

## Recursos já reservados 

![Blog Linux](/assets/img/lpi/recursos.jpg "Blog Linux")

__SCSI__ (pronuncia-se "scãzi"), sigla de __Small Computer System Interface__, é uma tecnologia que permite ao usuário conectar uma larga gama de periféricos, tais como discos rígidos, unidades CD-ROM, impressoras e scanners.

Características físicas e elétricas de uma interface de entrada e saída (E/S) projetadas para se conectarem e se comunicarem com dispositivos periféricos são definidas pelo SCSI.Existe uma grande variedade de padrões de dispositivos SCSI, sendo que estes inicialmente usavam interfaces paralelas.

Alguns exemplos
+ SCSI-1 (barramento de 8 bits, clock de 5 MHz e taxa de transferência de 5 MB/s)
+ Fast SCSI (barramento de 8 bits, clock de 10 MHz e taxa de transferência de 10 MB/s)
+ Ultra SCSI (barramento de 8 bits, clock de 20 MHz e taxa de transferência de 20 MB/s)
+ Ultra2 Wide SCSI (barramento de 16 bits, clock de 40 MHz e taxa de transferência de 80 MB/s) e Ultra-320 SCSI (barramento de 16 bits, clock de 80 MHz DDR e taxa de transferência de 320 MB/s).

> SCSI é mais comumente usado em discos rígidos e unidades de fita, mas também pode ser conectado em uma grande gama de dispositivos, incluindo scanners e drivers de CD.

![Blog Linux](/assets/img/lpi/scsi_tipos.jpg "Blog Linux")

Configurando Dispositivos de Rede:  Com o comando abaixo nós podemos identificar o fabricando e o modelo de uma placa PCI.
{% highlight bash %}
lspci
{% endhighlight %}

{% highlight c %}
00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller (rev 10)
00:02.0 VGA compatible controller: Intel Corporation 82G33/G31 Express Integrated Graphics Controller (rev 10)
00:1b.0 Audio device: Intel Corporation N10/ICH 7 Family High Definition Audio Controller (rev 01)
00:1c.0 PCI bridge: Intel Corporation N10/ICH 7 Family PCI Express Port 1 (rev 01)
00:1d.0 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller #1 (rev 01)
00:1d.1 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller #2 (rev 01)
00:1d.2 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller #3 (rev 01)
00:1d.3 USB Controller: Intel Corporation N10/ICH 7 Family USB UHCI Controller #4 (rev 01)
00:1d.7 USB Controller: Intel Corporation N10/ICH 7 Family USB2 EHCI Controller (rev 01)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev e1)
00:1f.0 ISA bridge: Intel Corporation 82801GB/GR (ICH7 Family) LPC Interface Bridge (rev 01)
00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Controller (rev 01)
00:1f.2 IDE interface: Intel Corporation N10/ICH7 Family SATA IDE Controller (rev 01)
00:1f.3 SMBus: Intel Corporation N10/ICH 7 Family SMBus Controller (rev 01)
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8101E/RTL8102E PCI Express Fast Ethernet controller (rev 01)
02:01.0 Modem: Motorola SM56 Data Fax Modem (rev 04)
{% endhighlight %}

Carregando módulos  Depois de identificarmos a placa, o endereçamento de entrada e saída e o IRQ, será preciso carregar o módulo do Kernel correspodente ou compilar o suporte ao dispositivo.

Para carregar o suporte ao dispositivo através de um módulo do Kernel, devemos utilizar o comando
{% highlight bash %}
modprobe 8139too
{% endhighlight %}

O Linux suporta que os módulos sejam carregados automaticamente durante a carga do sistema(boot).

As configurações dos parâmetros devem ser feitas no arquivo 
{% highlight bash %}
cat /etc/modules.conf
{% endhighlight %}

## Configurando a Placa de Som  

O Linux suporta dois padrões de Sistemas de Som:  
- OSS (Open Sound Sistem) e; 
- ALSA(Advanced Linux Sound Architecture)

Para utilizar o dispositivo de som, carregue o módulo da placa com o comando
{% highlight bash %}
modprobe NOME_DO_MODULO
{% endhighlight %}

Algumas placas requerem que seja especificado o recurso de hardware utilizado com parâmetro 
{% highlight bash %}
modprobe sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x388
{% endhighlight %}

Depois de instanciado no Kernel o módulo do dispositivo, os recursos, estarão disponíveis.
{% highlight bash %}
/dev/audio
{% endhighlight %}

{% highlight bash %}
/dev/dsp
{% endhighlight %}

{% highlight bash %}
/dev/mixer
{% endhighlight %}

## Configurando Dispositivos USB
Universal Serial Bus (USB) é um tipo de conexão "ligar e usar" que permite a conexão de periféricos sem a necessidade de desligar o computador. O primeiro passo é deteminar qual xHCI(Host Controller Interface) sua placa mãe possui, e carregar o módulo correspodente ao chip. 

O comando para determinar qual o chip utilizado em sua placa-mãe é
{% highlight bash %}
lspci -vt
{% endhighlight %}

O Linux tem suporte a diversos dispositivos USB através dos módulos do Kernel.Você poderá consultar os chipsets suportados no diretório
{% highlight bash %}
/lib/modules/versao_do_kernel/kernel/drivers/usb
{% endhighlight %}

### Até o momento é só, até o próximo tópico. 

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



