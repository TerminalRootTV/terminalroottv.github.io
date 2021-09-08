---
layout: post
title: "15 exemplos de uso diferente do ffmpeg"
date: 2021-09-08 08:20:22
image: '/assets/img/multimidia/ffmpeg.jpg'
description: 'ffmpeg é uma ferramenta excelente. É um editor de vídeo completo via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'ffmpeg'
tags:
- multimidia
---

![15 exemplos de uso diferente do ffmpeg](/assets/img/multimidia/ffmpeg.jpg)

O [ffmpeg](https://en.wikipedia.org/wiki/FFmpeg) foi criado por [Fabrice Bellard](https://bellard.org/) o mesmo criador do [QEMU](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html) e do [QuickJS](https://bellard.org/quickjs/), a *engine* por trás do [JSLinux](https://jslinux.org/).

Além dos comandos convencionais de conversão que usamos no dia a dia, vamos ver mais 15 utilidades que podem ser bom para você em muitos casos.

---

# 1. Descobrindo quantos FPS seu vídeo possui
{% highlight bash %}
ffmpeg -i output.mp4 2>&1 | egrep -o '[0-9]+ fps'
{% endhighlight %}

---

# 2. Inserindo ZOOM no seu vídeo
{% highlight bash %}
fmpeg -i input.mp4 -vf "zoompan=z='if(lte(mod(time,10),10),2,1)':d=1:x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):fps=30" output.mp4
{% endhighlight %}

---

# 3. Optimizando o seu vídeo
Diminuindo o tamanho sem perder a qualidade da imagem:
{% highlight bash %}
ffmpeg -i input.mp4 -vcodec libx264 -crf 28 output.mp4
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

---

# 4. Redimensionando a resolução do video
Deixando ele na resolução: **1280x720**
{% highlight bash %}
ffmpeg -i input.mp4 -vf scale=1280:720 -preset slow -crf 18 output.mp4
{% endhighlight %}

---

# 5. Redimensionando a largura e altura será proporcional
Especificado para largura de **1280** .
{% highlight bash %}
ffmpeg -i input.mp4 -vf scale=1280:-1 output.mp4
{% endhighlight %}

---

# 6. Redimensionando a altura e a largura será proporcional
Especificado para altura de **720**
{% highlight bash %}
ffmpeg -i input.mp4 -vf scale=-1:720 output.mp4
{% endhighlight %}

---

# 7. Removendo o áudio de um vídeo
{% highlight bash %}
ffmpeg -i input.mp4 -c copy -an output.mp4
{% endhighlight %}

---

# 8. Rotacionando um vídeo
Fica parecendo tela de celular, a largura se transforma na altura e vice-versa


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



{% highlight bash %}
ffmpeg -i input.mp4 -vf "transpose=clock" output.mp4
{% endhighlight %}

---

# 9. Rotacionando em 180°
Se o vídeo estiver de "ponta cabeça"/"cabeça para baixo" você irá reverter, senão você deixará ele de "cabeça para baixo"
{% highlight bash %}
ffmpeg -i input.mp4 -vf "transpose=2,transpose=2" output.mp4
{% endhighlight %}

---

# 10. Resumindo a saída de informações
Quando você roda o comando: `ffmpeg -i output.mp4` o ffmpeg exibe os dados do vídeo, mas o *cabeçalho* dificulta visualizar isso, para ignorar aqueles dados iniciais, rode:
{% highlight bash %}
ffmpeg -i output.mp4 -hide_banner
{% endhighlight %}

---

# 11. Extraindo os frames de um vídeo
{% highlight bash %}
mkdir frames
ffmpeg -y -ss 00:00 -i input.mp4 -t 10 "frames/filename%05d.jpg"
{% endhighlight %}
> Haverão diversas imagens no diretório *frames* de nome *filename00001.jpg* até o máximo de imagens que o vídeo possuir.

---

# 12. Extrair os frames de somente os 10 segundos iniciais
{% highlight bash %}
ffmpeg -y -ss 00:00 -i input.mp4 -t 10 "frames/filename%05d.jpg"
{% endhighlight %}

---

# 13. Assistindo vídeo
{% highlight bash %}
ffplay video.mp4
{% endhighlight %}

---

# 14. Escutando música
{% highlight bash %}
ffplay music.mp3
{% endhighlight %}

---

# 15. Adicionando legendas ao vídeo
Legenda exemplo:
> `vim subtitle.srt`
{% highlight txt %}
1
00:00:00,000 --> 00:00:02,827
- Terminal Root - Sistemas
Operacionais, C++ e Desenvolvimento.

2
00:00:02,827 --> 00:00:06,383
15 Exemplos de uso diferente
do ffmpeg para lhe auxiliar

3
00:00:06,383 --> 00:00:09,427
Não se esqueça de também ler
os links abaixo. Valeu!
{% endhighlight %}

Comando:
{% highlight bash %}
ffmpeg -i input.mp4 -i subtitle.srt -c copy -c:s mov_text outfile.mp4
{% endhighlight %}


# Veja também:
+ [Como converter trecho de vídeo em gif (Função Shell Scripting)](https://terminalroot.com.br/2014/05/como-converter-trecho-de-video-em-gif.html)
+ [Como criar um SLIDE de IMAGENS ou VÍDEOS pelo TERMINAL](https://terminalroot.com.br/2016/02/como-criar-um-slide-de-imagens-ou.html)
+ [Como fazer ScreenCasts e Conversões de Video e Audio](https://terminalroot.com.br/2011/12/como-fazer-screencasts-e-conversoes-de.html)
+ [Como criar uma galeria de fotos pelo Terminal](https://terminalroot.com.br/2015/08/como-criar-uma-galeria-de-fotos-pelo_19.html)
+ [Transformando múltiplos arquivos FLV para MP3 com Shell Script](https://terminalroot.com.br/2014/09/transformando-multiplos-arquivos-flv.html)



