---
layout: post
title: "Revelando os Segredos dos Hackers de Hollywood"
date: 2020-10-09 08:34:18
image: '/assets/img/comandos/no-more-secrets.jpg'
description: 'Quem nunca viu aqueles hackers dos filmes descriptografando dados com um único [enter] ?'
icon: 'ion:terminal-sharp'
iconname: 'fake-hacker'
tags:
- comandos
- hacker
- webhacker
---

![Revelando os Segredos dos Hackers de Hollywood](/assets/img/comandos/no-more-secrets.jpg)

Quem nunca viu aqueles hackers dos filmes descriptografando dados com um único [enter] ? Seria bom se fosse fácil assim, mas o efeito é legalzinho! 😃 

Agora vamos ver como que eles fazem aquelas descriptografias toscas, como no [trecho desse filme](https://www.youtube.com/watch?v=F5bAa6gFvLs&t=35):

<iframe width="1234" height="694" src="https://www.youtube.com/embed/F5bAa6gFvLs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

Sem mais segredos! 😎 

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# No More Secrets
Este projeto é uma ferramenta de linha de comando chamada `nms` que recria o famoso efeito de descriptografia de dados visto na tela no filme de hackers de 1992, Sneakers.

Canalize qualquer texto ASCII ou UTF-8 para `nms` e aplicará o efeito Hollywood, inicialmente mostrando os dados criptografados e, em seguida, iniciando uma sequência de descriptografia para revelar os caracteres de texto simples originais.

# Instalação
Uma galera se empenhou em criar um software que faz o efeito idêntico via linha de comando. Para instalar basta rodar os comandos abaixos na ordem:
> Você precisará do [git](https://terminalroot.com.br/git/), [make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) e [gcc](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) instalados.

{% highlight bash %}
git clone https://github.com/bartobri/no-more-secrets.git
cd ./no-more-secrets
make nms
make sneakers             ## Optional
sudo make install
{% endhighlight %}

# Utilização
Para usar basta rodar qualquer comando que exiba saída e jogar o `stdout` para o comando `nms`(ex.: `man ls | head -n 30 | nms`) e depois que os dados "*criptografados*" forem exibidos, basta pressionar [enter] para "*descriptografar*" . Veja a imagem abaixo:

![No More Secrets](/assets/img/comandos/no-more-secrets.gif)

Alternativamente você também tem o comando `sneakers` que exibe justamente o conteúdo do filme [Sneakers](https://www.youtube.com/watch?v=F5bAa6gFvLs&t=35):

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

![Sneakers](/assets/img/comandos/sneakers.gif)

Se quiser desinstalar basta entrar no repositório que você clonou, rodar o comando: `sudo make uninstall` e remover o repositório do seu computador:
{% highlight bash %}
git clone https://github.com/bartobri/no-more-secrets.git
cd ./no-more-secrets
sudo make uninstall
cd ..
rm -rf ./no-more-secrets
{% endhighlight %}

---

Pronto, já é o primeiro passo para se tornar um hacker... de Hollywood! 😛 

# Página Oficial do `No More Secrets`
<https://github.com/bartobri/no-more-secrets>

