---
layout: post
title: "Baixe o Youtube-dl em Duas imagens"
date: 2020-10-24 13:49:17
image: '/assets/img/code/ytdl.jpg'
description: 'Ferraram com o Youtube-DL, mas nem tudo está perdido.'
icon: 'openmoji:hacker-cat'
iconname: 'youtube-dl'
tags:
- hacker
- downloads
---

![Baixe o Youtube-dl em Duas imagens](/assets/img/code/ytdl.jpg)


Ontem(dia 23 de outubro de 2020), uma das melhores ferramentas para baixar quase todos vídeos da internet tem seu repositório e seus forks removidos por conta de direitos autorais, você pode ver o bot da DMCA informando [nesse link](https://github.com/github/dmca/blob/master/2020/10/2020-10-23-RIAA.md).

Mas calma, nem tudo está perdido, há uma forma de você obtê-lo fazendo download de somente duas imagens, assim:

1. Baixe as imagens:
```sh
wget https://terminalroot.com.br/downs/ytdl1.png
wget https://terminalroot.com.br/downs/ytdl2.png
```

E rode esses comandos:
```sh
convert -depth 8 ytdl1.png rgb:yt_dl1.part
convert -depth 8 ytdl2.png rgb:yt_dl2.part
cat yt_dl1.part yt_dl2.part > yt_dl-2020.9.20.tar.gz
```

Será gerado um arquivo [gzip](https://pt.wikipedia.org/wiki/Gzip) e então é só descompactá-lo:
```sh
tar zxvf yt_dl-2020.9.20.tar.gz
```

Pronto! O código do Youtube-DL já está na sua máquina!

Caso queira facilitar use esse script: `vim ytdl.sh`
```sh
#!/usr/bin/env bash
convert -depth 8 ytdl1.png rgb:yt_dl1.part
convert -depth 8 ytdl2.png rgb:yt_dl2.part
cat yt_dl1.part yt_dl2.part > yt_dl-2020.9.20.tar.gz
tar zxvf yt_dl-2020.9.20.tar.gz
```
E rode-o: `bash ytdl.sh`

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

Alternativamente você tem alguns repositórios em outras plataformas como [esse do GitLab](https://gitlab.com/HacktorIT/youtube-dl) , apesar de não estar tão atualizado como o das imagens.

Essa dica foi do [hacker](https://terminalroot.com.br/tags#hacker): [cat /dev/spooky](https://twitter.com/GalacticFurball/status/1319765986791157761)
