---
layout: post
title: "Como converter trecho de vídeo em gif (Função Shell Scripting)"
date: '2014-05-10T18:28:00.000-07:00'
image: '/assets/img/shell-script/video2gif-shell-script.gif'
description: "Script para quem quiser criar gif de trecho de  vídeo."
main-class: 'bash'
tags:
- Shell Script
- Dicas
- Open Source
- Código Aberto
- GNU
- Terminal
- terminalroot
- Comandos
---

![Como converter trecho de vídeo em gif (Função Shell Scripting)](/assets/img/shell-script/video2gif-shell-script.gif "Como converter trecho de vídeo em gif (Função Shell Scripting)")

Acabei de criar esse script para quem quiser criar gif de trecho de  vídeo. Há o script dessa função bash, no final desse artigo, como toda  as linhas comentadas, linhas que começam com ‘tralha'(#), no entanto,  vou explicar passo a passo.

+ Você precisa ter o [ffmpeg](https://ffmpeg.org/) e o [Image Magik](http://www.terminalroot.com.br/2015/03/tratamento-de-imagens-com-imagemagick.html) instalados, você pode adquirilos clicando nos links, fazendo o download  e compilando os pacotes, ou pode instalar via instaladores da sua  distribuição: ( __apt-get; yum; pacman;__ ).

+ Usamos o ffmpeg para a 1° etapa da conversão
{% highlight bash %}
ffmpeg -t 5 -ss 00:00:10 -i funny.mp4 out%04d.gif 
{% endhighlight %}

+ Depois passamos para segunda etapa da conversão, como o convert
{% highlight bash %}
convert -delay 1x20 -loop 0 out*.gif animation.gif
{% endhighlight %}

+ Em seguida, finalizamos a conversão com uma otimização
{% highlight bash %}
convert -layers Optimize animation.gif animation_small.gif
{% endhighlight %}

#### Segue a Função/Script abaixo (possui cabeçalho)
{% highlight bash %}
#!/bin/bash
# ---------------------------------------------------------------
# gifconv
#
# Converter trecho de vídeo em gif (Função Shell Scripting)
#
# Uso: $ sh gifconv.sh 
#    $ ./gifconv 
#   ou , em aso de estar nas funções terminalroot ou
#   como alias no seu .bashrc
#    $ gifconv 
#
# Ex.: $ gifconv [Clipe do Bebê.mp4]
#
# Autor: Marcos da B. M. Oliveira, www.terminalroot.com.br
# Desde: Dom Mai 10 14:41:27 2015 
# Versão: 0.1
# Licença: GPL
# ----------------------------------------------------------------
_pkgs(){
 # Verifica se tem o ffmpeg instalado.
 if test -f /usr/bin/ffmpeg ; then
  echo -n
 else
  echo "É necessário possuir o 'ffmpeg' para que esse script funcione.";
  echo "Abortar."
  exit 0;
 fi
 
 #verifica se tem o convert instalado.
 if test -f /usr/bin/convert ; then
  echo -n
 else
  echo "É necessário possuir o 'convert' para que esse script funcione.";
  echo "Abortar."
  exit 0;
 fi
}
# Funão que irá fazer a onversão
_gifconv(){
 # Validador dos pacotes necessários
 _pkgs
 # Verifica se vc informou o vídeo (se passou o parâmetro)
 if [ -z $1 ]; then
  echo "Informe o vídeo, ex.: converter.sh video.mp4";
 else
  # Interação para informar o tempo que será iniciado
  echo "Informe o tempo de INÍCIO que deseja, iniciar o corte, ex.: 00:05:12";
  read tempo;
  
  # Interação para informar a duração do gif
  echo "Informe o tempo de DURAÇÃO que deseja, 2 segundos, ex.: 2";
  read duracao;
  
  # Cria um diretório temporário que depoi será excluido
  mkdir tempdir
  
  # Informa que está tudo certo
  echo "[+] - Transformando o vídeo...aguarde";
  
  # Faz a conversão
  ffmpeg -sameq -ss $tempo -t $duracao -i "$*" tempdir/out%04d.gif 2>/dev/null
 
  # Nova etapa da conversão
  convert -delay 1x25 -loop 0 tempdir/out*.gif tempdir/animacao.gif;
  
  # Extrai o nome do vídeo que será o mesmo nome pro gif
  arquivo=$(echo "$*" | rev | cut -c5- | rev);
 
  # Otimização da conversão
  convert -layers Optimize tempdir/animacao.gif "$arquivo.gif";
  
  # Se tudo der certo, informará o sucesso da operação
  if [ -f "$arquivo.gif" ]; then
   echo "Pronto!";
  else
   echo "Erro ao transformar arquivo em gif, contacte o dsenvolvedor.";
  fi
  
  # Deleta o diretório temporário
  [ -d tempdir ] &amp;&amp; rm -rf tempdir;
 
 # Finaliza a verificação 
 fi
 
 # Saída
 exit 0
}
# Chama a função com o parâmetro*
_gifconv "$*"
{% endhighlight %}
