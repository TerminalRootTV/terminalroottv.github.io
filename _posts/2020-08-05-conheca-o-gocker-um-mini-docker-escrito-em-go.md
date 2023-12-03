---
layout: post
title: "Conheça o Gocker: Um mini Docker escrito em Go"
date: 2020-08-05 13:34:53
image: '/assets/img/docker/gocker.png'
description: 'Contêineres, um caminho difícil ?'
icon: 'ion:terminal-sharp'
iconname: 'gocker'
tags:
- docker
- gnulinux
- servidores
---

![Conheça o Gocker: Um mini Docker escrito em Go](/assets/img/docker/gocker.png) 

Os contêineres se tornaram a maneira padrão como os aplicativos são empacotados e executados em servidores, inicialmente popularizados pelo Docker. Agora, o próprio Docker é incompreendido. É o nome de uma empresa e um comando (um conjunto de comandos) que permite gerenciar contêineres (criar, executar, excluir, rede) facilmente. Os próprios contêineres, no entanto, são criados a partir de um conjunto de primitivas do sistema operacional. O [Gocker](https://github.com/shuveb/containers-the-hard-way) se preocupa com contêineres no sistema operacional Linux e simplesmente age como se os contêineres no Windows não existissem, pois na verdade, não existem mesmo!

Não há uma chamada de sistema única no Linux que crie contêineres. Eles são uma construção frouxa feita utilizando namespaces do Linux e grupos de controle ou cgroups.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# O que é o [Gocker](https://github.com/shuveb/containers-the-hard-way)?

O [Gocker](https://github.com/shuveb/containers-the-hard-way) é uma implementação desde o início das principais funcionalidades do Docker na linguagem de programação Go. O principal objetivo dele é fornecer um entendimento de como exatamente os contêineres funcionam no nível de chamada do sistema Linux.O [Gocker](https://github.com/shuveb/containers-the-hard-way) permite criar contêineres, gerenciar imagens de contêineres, executar processos em contêineres existentes, etc.

# Alguns comandos do [Gocker](https://github.com/shuveb/containers-the-hard-way)
> Recursos do [Gocker](https://github.com/shuveb/containers-the-hard-way)

O [Gocker](https://github.com/shuveb/containers-the-hard-way) pode emular o núcleo do Docker, permitindo gerenciar imagens do Docker (obtidas no Docker Hub), executar contêineres, listar contêineres em execução ou executar um processo em um contêiner já em execução:

+ Executar um processo em um contêiner
{% highlight bash %}
gocker run <--cpus=cpus-max> <--mem=mem-max> <--pids=pids-max> <image[:tag]> </path/to/command>
{% endhighlight %}
+ Listar contêineres em execução
{% highlight bash %}
gocker ps
{% endhighlight %}
+ Executar um processo em um contêiner em execução
{% highlight bash %}
gocker exec <container-id> </path/to/command>
{% endhighlight %}
+ Listar imagens disponíveis localmente
{% highlight bash %}
gocker images
{% endhighlight %}
+ Remover uma imagem disponível localmente
{% highlight bash %}
gocker rmi <image-id>
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

Além de diversos outros recursos e capacidades como:
+ Isolamento de contêineres
+ Sessões
+ Acesso à bibliotecas externas
+ Restrição do consumo de RAM, CPUs e PIDs
+ E entre muitos outros recursos

Para instalar e usar o [Gocker](https://github.com/shuveb/containers-the-hard-way) recomendados você consultar a documentação oficial do projeto que pode ser encontrada no GitHub deles no endereço:
### <https://github.com/shuveb/containers-the-hard-way>

Se você ainda não conhece sobre contêineres e Docker , recomedo você assistir à esse vídeo que possui as principais funcionalidades do mesmo e é indicado para iniciantes:

<iframe width="1234" height="694" src="https://www.youtube.com/embed/bsGkIKP1OZ4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 




