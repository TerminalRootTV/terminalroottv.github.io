---
layout: post
title: "Conheça o GENODE, um framework para criar Sistemas Operacionais"
date: 2021-10-19 15:07:32
image: '/assets/img/os/genode.jpg'
description: 'Escrito em C++ e reduz a complexidade de criação de forma segura!'
icon: 'ion:terminal-sharp'
iconname: 'Genode'
tags:
- cpp
- unix
- linux
---

![Conheça o GENODE, um framework para criar Sistemas Operacionais](/assets/img/os/genode.jpg)

**Genode OS Framework** é um kit de ferramentas para a construção de sistemas operacionais de uso especial altamente seguros escrito em [C++](https://terminalroot.com.br/cpp).

Ele pode ser dimensionado desde sistemas embarcados com apenas 4 MB de memória até cargas de trabalho de uso geral altamente dinâmicas.

Genode é baseado em uma estrutura de sistema recursiva. Cada programa é executado em uma área restrita dedicada e recebe apenas os direitos de acesso e recursos necessários para sua finalidade específica.

Os programas podem criar e gerenciar sub-sandboxes com seus próprios recursos, formando hierarquias onde as políticas podem ser aplicadas em cada nível. A estrutura fornece mecanismos para permitir que os programas se comuniquem entre si e negociem seus recursos, mas apenas de maneiras estritamente definidas.


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Graças a esse regime rígido, a superfície de ataque das funções críticas de segurança pode ser reduzida em ordens de magnitude em comparação com os sistemas operacionais contemporâneos.

A estrutura alinha os princípios de construção de L4 com a filosofia [Unix](https://terminalroot.com.br/tags#unix). Em linha com a filosofia Unix, Genode é uma coleção de pequenos blocos de construção, dos quais sistemas sofisticados podem ser compostos.

Mas, ao contrário do Unix, esses blocos de construção incluem não apenas aplicativos, mas também todas as funcionalidades clássicas do sistema operacional, incluindo kernels, drivers de dispositivo, sistemas de arquivos e pilhas de protocolo.

# Recursos
+ Arquiteturas de CPU: x86 (32 e 64 bits), ARM (32 e 64 bits), RISC-V
+ Kernels: a maioria dos membros da família L4 (NOVA, seL4, Fiasco.OC, OKL4 v2.1, L4ka :: Pistachio, L4 / Fiasco), Linux e um kernel personalizado.
+ Virtualização: VirtualBox (no NOVA), um monitor de máquina virtual personalizado para ARM e um tempo de execução personalizado para software Unix

Mais de 100 [componentes](https://genode.org/documentation/components) prontos para uso!

# Download
Para baixar o Genode, basta acessar [esse link](https://genode.org/download/index) haverá 4 opções, sendo que **Sculpt OS** é um sistema operacional de uso geral baseado em Genode, imagens de sistema prontas para uso permitem que você use Genode sem a necessidade de compilar o sistema do zero.

Você pode baixar a imagem rapidamente com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html):


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

{% highlight sh %}
wget https://genode.org/files/sculpt/sculpt-21-10.img
{% endhighlight %}
> [Hash](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) SHA256: `a6c1cf9b438f084fa9fe6b8dabc256e5f62c51eecdcfecb47fd262427a4d1444` 

Crie uma partição e copie com o comando [dd](https://terminalroot.com.br/2017/09/como-clonar-particao-com-o-comando-dd.html):
> Exemplo:
{% highlight sh %}
sudo dd if=sculpt-21-10.img of=/dev/sdx bs=1M conv=fsync
{% endhighlight %}

Para mais informações e detalhes de uso utilize a [documentação](https://genode.org/documentation/index) que por sinal é bem intuitiva!

Site oficial: <https://genode.org/> e [repositório oficial](https://github.com/genodelabs/genode) .

## Fui!
