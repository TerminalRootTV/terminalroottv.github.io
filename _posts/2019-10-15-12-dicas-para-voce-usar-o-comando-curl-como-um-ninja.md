---
layout: post
title: "12 DICAS para você usar o COMANDO curl como um NINJA"
date: 2019-10-15 00:07:05
image: '/assets/img/comandos/curl-thumbnail-youtube.jpg'
description: 'curl é um comando/biblioteca (libcurl) disponível na maioria dos sistemas baseado em Unix.'
tags:
- curl
- comandos
- webhacker
---

[![12 DICAS para você usar o COMANDO curl como um NINJA](/assets/img/comandos/curl-thumbnail-youtube.jpg "Meme Drake Curl")](/assets/img/comandos/curl-thumbnail-youtube.jpg)

## Introdução

[curl](https://curl.haxx.se) é um comando/biblioteca (libcurl) disponível na maioria dos sistemas baseado em Unix. Ele é usado como abreviação para “Client URL”. Ele é utilizado para diversas finalidades como: navegação, inserção de dados via web, download, transferência de dados e entre outros. Ele suporta diversos protocolos.

## Instalação

Para instalar o curl você pode usar o gerenciador de pacotes da sua distro, mas antes de instalar verifique se o mesmo já está instalado com o comando: `which curl`, exemplos:

{% highlight bash %}
emerge curl # Para Gentoo, Funtoo e similares
sudo apt install curl # No Debian, Ubuntu, Linux Mint e similares
sudo pacman -S curl # Arch Linux, Manjaro e similares
sudo yum install curl # Red Hat, CentOS e Fedora (prefira o dnf)
pkg install curl # FreeBSD e sistema relativos
pkg_add curl # OpenBSD
pkgin install curl # NetBSD
{% endhighlight %}

Após a instalação, verifique se está tudo ok, por exemplo, vendo a versão: `curl --version`

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

## Dica 1. Prenchendo Formulário de um Site via Linha de Comando

{% highlight bash %}
curl -F "mail=ninguem@nada.com" -F "msg=valeu" http://dandosopa.org/ #OK
curl -X POST -F "mail=ninguem@nada.com" -F "msg=valeu" http://dandosopa.org/ #OK
# cat data.txt #mail=nada@tudo.com&msg=Sei nao #OK
curl --data "mail=querocomer@suasopa.com&msg=Delícia" http://dandosopa.org/ #OK
curl -d "@data.txt" -X POST http://dandosopa.org/ #OK
{% endhighlight %}

## Dica 2. Fazendo Upload de Arquivos via Linha de Comando

Nesse caso precisamos informar na URL o caminho do arquivo que será responsável pelo recebimento do arquivo, nesse caso eu sei que é `upload.php` , mas ele poderia ficar na raíz do host, lembrando que, como eu havia dito, ele redireciona para 'm/' sem alteração de URL .

{% highlight bash %}
curl -i -X POST -H "Content-Type: multipart/form-data" -F "data=@DICAS_COMANDOS" http://dandosopa.org/upload.php #OK
curl -F "data=@DSC03666.JPG" http://dandosopa.org/upload.php >/dev/null 2>/dev/null #OK
{% endhighlight %}



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

### Dica 3. Download de Arquivos

+ Download com o mesmo nome do arquivo original que está no servidor:
O parâmetro `-O` ou `--remote-name` indica que o arquivo origem é binário , logo se você não passá-lo o curl não conseguirá efetuar o download.

{% highlight bash %}
curl -O dandosopa.org/downloads/distro.iso

% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  841M  100  841M    0     0  46.0M      0  0:00:18  0:00:18 --:--:-- 44.0M
{% endhighlight %}
- **%** - Mostra o total em PORCENTAGEM do download;
- **Total** - Mostra o total em MEGABYTES do download;
- ...

> Se você quiser que não mostre os dados, use o parâmetro `--silent` ou `-s` : `curl --silent dandosopa.org/downloads/distro.iso` 

> Se você errar o nome do arquivo, o curl irá baixar o arquivo 404 , logo é sempre bom você conferir o tamanho do arquivo `du -lhs distro.iso` , se estiver incorreto veja qual foi a resposta do servidor: `cat distro.iso` (pode ser que seja erro do servidor se não for 404, por exemplo, 301) , por isso o ideal mesmo é fazer uma [HASH do arquivo pós baixado](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html)

> Observação: Ainda não há nenhum parâmetro que salve sem sobrescrever o arquivo se ele existir, logo você precisa criar uma solução na shell, exemplo:
{% highlight bash %}
[ ! -f data.txt ] && curl -O dandosopa.org/downloads/data.txt || echo Arquivo já existe
{% endhighlight %}

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
	 style="display:inline-block;width:336px;height:280px"
	 data-ad-client="ca-pub-2838251107855362"
	 data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Dica 4. Download do arquivo salvando com um nome definido por você:
{% highlight bash %}
curl dandosopa.org/downloads/distro.iso -o refisefuqui.iso
{% endhighlight %}
> Não use em conjunto com o `-O` , caso contrário o curl irá priorizar a ordem que o parâmetro foi informado na linha de comando.

### Dica 5. Retomar um download interrompido
{% highlight bash %}
curl -C - -O http://dandosopa.org/downloads/distro.iso
{% endhighlight %}



<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="autorelaxed"
     data-ad-client="ca-pub-2838251107855362"
     data-ad-slot="9652691879"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Dica 6. Download de múltiplos arquivos
{% highlight bash %}
curl -O http://yoursite.com/refisefuqui.iso -O http://dandosopa.org/downloads/data.txt
{% endhighlight %}

### Dica 7. Baixar URLs de um arquivo
{% highlight bash %}
cat urls.txt
dandosopa.org/downloads/distro.iso
dandosopa.org/downloads/data.txt

xargs -n 1 curl -O < urls.txt
{% endhighlight %}


<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
	 style="display:inline-block;width:336px;height:50px"
	 data-ad-client="ca-pub-2838251107855362"
	 data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Dica 8. Limitar a velocidade do download
curl --limit-rate 100K http://dandosopa.org/downloads/distro.iso -O

### Dica 9. Download com barra de progresso
{% highlight bash %}
curl -# -O dandosopa.org/downloads/distro.iso
{% endhighlight %}

### Dica 10. Consultar cabeçalhos HTTP
{% highlight bash %}
curl -I terminalroot.com.br
{% endhighlight %}
> Nem todos os sites permitem essa consulta.


### Dica 11. Especiqfique um User Agent
{% highlight bash %}
curl https://gnu.terminalroot.com.br/ip.php
# Exemplo Windows 10 Edge:
curl http://localhost --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134"
{% endhighlight %}

### Dica 12. Autenticação Apache
{% highlight bash %}
curl -u usuário:senha -O http://dandosopa.org/m/secret/meus-arquivos-secretos.tar.gz
{% endhighlight %}

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

# Veja o vídeo sobre curl

<iframe width="920" height="400" src="https://www.youtube.com/embed/HxezVt5IEHQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis

+ <https://curl.haxx.se/docs/manpage.html>
+ <https://curl.haxx.se/docs/httpscripting.html>
+ <https://gnu.terminalroot.com.br/>
+ <https://gnu.terminalroot.com.br/ip.php>
+ <https://developers.whatismybrowser.com/useragents/explore/>
+ <https://addons.mozilla.org/pt-BR/firefox/addon/user-agent-switcher-revived/>

Abraços!    
