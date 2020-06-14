---
layout: post
title: "Dica rápida: Renomeando Imagens com Docker"
date: 2020-06-14 15:52:51
image: '/assets/img/docker/docker.jpg'
description: 'Despoluindo nomes.'
icon: 'cib:docker'
iconname: 'docker'
tags:
- docker
- terminal
- comandos
---

![Dica rápida: Renomeando Imagens com Docker](/assets/img/docker/docker.jpg)

Ás vezes quando você faz o download de uma imagem em Docker `docker pull <imagem>` ela possui um nome extenso, exemplo: `arch-linux/glibc-amd64:latest` . Então se você deseja deixa o nome mais simplificado, exemplo: `archlinux`, basta usar o parâmetro `tag` e em seguida remover a imagem antiga:
> `docker tag <nome-antigo> <novo-nome>`

```sh
docker tag arch-linux/glibc-amd64:latest archlinux
docker rmi arch-linux/glibc-amd64:latest
```

E se for um conatiner, basta alterar `tag` por `rename`, exemplo: `docker rename CONTAINER NEW_NAME` .

Simples, né?

Se ainda não conhece o básico de [Docker]() sugiro assistir à esse vídeo abaixo:

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<iframe width="424" height="238" src="https://www.youtube.com/embed/bsGkIKP1OZ4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Valeu!

Links úteis:
+ <https://docs.docker.com/engine/reference/commandline/rename/>
+ <https://bit.ly/2YsjEc4> 
