---
layout: post
title: "OpenBSD em Dual Boot com Linux (Partição Única)"
date: 2019-06-03 17:23:15
image: '/assets/img/openbsd/openbsd-linux.jpg'
description: 'Como Instalar o OpenBSD em Dual Boot com Linux (Partição Única)'
tags:
- openbsd
- bsd
- unix
---

![OpenBSD em Dual Boot com Linux](/assets/img/openbsd/openbsd-linux.jpg)

Nos artigos/vídeos anteriores mostramos

+ [Como Instalar o OpenBSD](http://terminalroot.com.br/2018/07/openbsd-o-sistema-mais-seguro-do-mundo-instalacao-e-configuracao.html)
+ [Como gerenciar seus downloads com wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html)
+ [O que é uma Função Hash ? Como fazer ?](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html)
+ [OpenBSD - Instalação pelo Disco USB (pendrive)](https://terminalroot.com.br/2019/05/openbsd-instalacao-pelo-disco-usb.html)

## 1º É interessante criar as partições anteriormente.

> Ou seja, já possuir uma partição já criada e formatada de perferência em um sistema de arquivos que identifique a partição, no entanto, pode conseguir distingui-la pelos CHS.

## 2º Boot normalmente pelo disco USB ou CD do OpenBSD

## 3º Efetue a instalação normalmente até chegar na parte de selecionar que informa o conteúdo:

{% highlight bash %}
Use (W)hole disk MBR, whole disk (G)PT or (E)dit? [whole]
{% endhighlight %}

Não pressione [ENTER] , pois o sistema vai apagar o disco rígido e usar a label **OpenBSD** para o tamanho completo. Digite a letra `e` para Editar.

> Antes perceba na descrição das partições que ele mostra as partições que já estão criadas, você pode identificar qual partição você deseja usar analisando dados como: `size`; `start` e entre outros.

## 4º Agora selecione a partição que deseja (veja o número da mesma, observando a primeira coluna). 

Vamos supôr que vamos instalar o OpenBSD que tem o maior tamanho de partição, então o comando seria: `e 0`

> Se tiver dúvida digite `help` para mais informações. Lembrando que a letra `e` é o mesmo do comando `edit`, ou seja, é uma abreviação: `edit 0`. Assim como: h(help), w(write), q(quit), ...

## 5º Agora é necessário informar o **id** da partição

o ID para a label do OpenBSD é o **a6** ou **A6** , para saber todos os identificadores, você pode teclar o simbolo de interrogação **?** . Se seu teclado estiver desconfigurado, o símbolo da interrogação geralmente é o [Shift + ;] (segure o Shift e pressione a tecla do ponto e vírgula).


## 6 º Agora ele irá perguntar se você deseja editar o CHS (Cylindres, Heads, Sectors):

{% highlight bash %}
Do you wish to edit in CHS mode ? [n]
{% endhighlight %}

Nesse caso, basta aceitar o padrão que ele propôs [n] , ou seja, só pressionar [ENTER] e aceitar os tamanhos já definidos da partição, a menos que você deseje alterar tamanho(size) e o CHS.

Pronto, agora basta pressionar a letra `w` (write) e se quiser ver como alterações ficaram pressione `p` (print) e depois `q`(quit) para sair .

## 7 º É chegado o momento de criar o layout da partição. 

> Lembre-se que por padrão o OpenBSD irá criar múltiplas partições, podendo dividí-la em até 16 partições dependendo do tamanho do seu HD . Mas se você deseja, você pode criar um layout semelhante ao do Linux:

+ 1 - Partiçao SWAP
+ 2 - Partição ROOT (os os arquivos do sistema serão instalados)

Para isso pressione `c` (Custom Layout), se você somente pressionar [ENTER] sem digitar a letra `c`, ele irá aceitar o padrão definido entre colchetes que é o `[a]` (Auto layout).

## 8 º Agora pressione `p` para mostrar como está atulamente a *divisão* . 

Lembrando que a letra **c** representa o HD e não uma partição, e se já houver outra letra, provavelmente a letra **i** , é que que é o tamanho disponível para particionar. 

Logo , vamos criar a partição *root* , basta digitar a letra `a` (add) e o OpenBSD automaticamente irá lhe perguntar se deseja criar a partição de letra **a** (não confundir com o `a` de *add* , entre os colchetes ele informa o nome/letra da partição) , geralmente o root é a letra **a**, basta pressionar [ENTER]. O *offset* será padrão mesmo, só pressione [ENTER], já no *size* informe um tamanho de forma que sobre para a SWAP, exemplo: Se o tamanho for *42000000* 42GB , e você deseja reservar 2G para SWAP, digite: **40000000** , dessa forma sobrará 2GB para a SWAP. O **FS TYPE** deve ser *4.2BSD* mesmo, se estiver entre colchetes, basta pressionar [ENTER]. E o **mount point** precisa ser o root **/** , se seu teclado estiver desconfigurado, o *barra*(**/**) geralmente é o **;**(ponto e vírgula, sem o Shift =) ) . 

Pronto, definimos a partição root.

## 9 º Próximo passo agora é criar a partição de SWAP:

1. Tecle `a` novamente;
2. Aceite a letra `b` que está entre colchetes, para isso basta pressionar [ENTER];
3. O *offset* será padrão, pressione [ENTER];
4. O *size* mostrará todo restante do tamanho  que sobrou, o tamanho aparecerá entre colchetes, basta pressionar [ENTER];
5. E finalmente o *FS Type* será **swap** mesmo, que aparecerá entre colchetes, ou seja, novamente basta pressionar [ENTER];

## 10 º Pronto, agora pressione a letra `w` (write) para gravar as alterações. 

Se quiser ver como ficou o layout após as alterações pressione a letra `p` e para sair e continuar a instalação pressione a letra `q` e depois [ENTER]. lógico! =)

### Continue a instalação como nesse vídeo.

<iframe width="1246" height="701" src="https://www.youtube.com/embed/3OVsq9quYNQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Espero que tenha gostado.

### Comente e compartilhe!

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

