---
layout: post
title: "Como acessar o Google Drive pelo Terminal Linux"
date: 2017-01-16 19:05:08
image: '/assets/img/dicas/drive.jpg'
description: "O desenvolvedor Petter Rasmussen, sob MIT License , criou um aplicativo que torna possível esse acesso pelo Terminal"
color: '#3b5998'
tags:
- linux
- terminal
- google
categories:
---

![Google Drive Terminal Linux](/assets/img/dicas/drive.jpg)

# Introdução

[Google Drive](https://www.google.com/drive/) é um serviço de armazenamento e sincronização de arquivos oferecido pelo Google,  baseia-se no conceito de computação em nuvem, pois o internauta poderá armazenar arquivos através deste serviço e acedê-los a partir de qualquer computador ou outros dispositivos compatíveis, desde que ligados à internet.

Há Clientes para o Google Drive para diversos sistemas operacionais, no entanto ainda não foi desenvolvido pelo Google um Cliente para o Linux!

Porém o desenvolvedor Petter Rasmussen, sob MIT License , criou um aplicativo que torna possível esse acesso pelo Terminal, estamos nos referindo ao [GDrive](https://github.com/prasmussen/gdrive).

# Download e Instalação

Baixe o arquivo, nesse caso iremos usar como exemplo 32bit, veja a lista de Arquiteturas disponíveis: [https://github.com/prasmussen/gdrive](https://github.com/prasmussen/gdrive)

Torne-o __executável__
{% highlight bash %}
chmod +x gdrive-linux-386
{% endhighlight %}

Rode esse comando pra gerar a __URL__ e pôr o __código de autenticação do Google__, acesse a URL , copie e entre com seu __código__:
{% highlight bash %}
./gdrive-linux-386 about
{% endhighlight %}


Depois de autenticado, você pode __listar seus arquivos__ com esse comando
{% highlight bash %}
./gdrive-linux-386 list
{% endhighlight %}

Para __baixar__ um arquivo do Google Drive, use o comando
{% highlight bash %}
./gdrive-linux-386 download [nome-do-arquivo]
{% endhighlight %}

Para __criar um Diretório no Drive__
{% highlight bash %}
./gdrive-linux-386 mkdir [nome-do-diretorio]
{% endhighlight %}

Para fazer __Upload de um arquivo__
{% highlight bash %}
./gdrive-linux-386 upload [nome-do-arquivo-local]
{% endhighlight %}

Ainda há vários parâmetros que podem ser passados, como:

* -f, --force , força substituir um arquivo
* -r, --recursive , recursivamente
* --path
* --delete
* --no-progress
(...)

## Consulte a documentação para informação completa
[https://github.com/prasmussen/gdrive](https://github.com/prasmussen/gdrive)



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



