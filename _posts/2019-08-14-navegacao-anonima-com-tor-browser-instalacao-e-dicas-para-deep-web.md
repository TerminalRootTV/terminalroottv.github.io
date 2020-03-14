---
layout: post
title: "Navegação Anônima com Tor Browser - Instalação e dicas para Deep Web"
date: 2019-08-14 09:54:19
image: '/assets/img/hacker/tor-browser.jpg'
description: 'Sua identidade na internet é quase desconhecida com esse Navegador.'
tags:
- tor
- webhacker
- privacidade
---

![Navegação Anônima com Tor Browser - Instalação e dicas para Deep Web](/assets/img/hacker/tor-browser.jpg)

O [Tor Browser](https://www.torproject.org/) é um [software livre](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Software Livre) de de código aberto The Tor Project , que proporciona a comunicação anônima e segura ao navegar na Internet e em atividades online, protegendo contra a censura e principalmente a privacidade.

Algumas características do **Tor Browser**

+ Seu nome é um acrônimo para **T**he **O**nion **R**outer, (uma rede de domínio *.onion* inacessível por navegadores comuns);
+ É baseado no [Firefox](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Firefox);
+ Roteamento cebola ou por camadas, por isso seu logo tem característica de uma cebola;
+ É o navegador utilizado por [Edward Snowden](https://terminalroot.com.br/2019/07/assista-o-filme-de-eduard-snowden-completo.html).

## Instalação

É possível você encontrar ou adicionar o Tor no repositório da sua distribuição, mas pode ser que não tenha a versão mais recente, e se tatando de segurança, estar atualizado é primordial. Para isso nós criamos um [Shell Script](https://terminalroot.com.br/shell) para que você consegue instalar a versão mais recente sem precisar usar *sudo* ou *root* e o mesmo ficará disponível no seu Dash, sempre que você desejar, para instalar rode:

{% highlight bash %}
wget terminalroot.com.br/sh/tor.in
chmod +x tor.in
./tor.in --install
{% endhighlight %}

Ou rode o script sem parâmetros para obter um *help* para instalar a versão em inglês, caso você deseje.

## Utilização

Para um maior entendimento e aprendizado, recomendamos você assistir ao nosso vídeo sobre o Tor, veja o vídeo abaixo:

<iframe width="920" height="400" src="https://www.youtube.com/embed/UYFCql7ca_Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

### Utilitários para Deep Web
+ [Guerrilla Mail](https://www.guerrillamail.com/)
+ [Enigma Mail](https://www.enigmail.net/home/index.php)
+ [Orbot](https://play.google.com/store/apps/details?id=org.torproject.android)
+ [Onion/Orbot Browser](https://itunes.apple.com/us/app/onion-browser/id519296448?mt=8)

### Alguns endereços que você pode acessar na Deep Web com o Tor:

+ DuckDuckGo do domínio Onion: http://3g2upl4pq6kufc4m.onion/
+ Facebook no domínio Onion: https://facebookcorewwwi.onion/
+ Wikipédia no domínio Onion: https://www.qgssno7jk2xcr2sj.onion/

## Links Úteis
+ <https://www.torproject.org/>
+ <https://tails.boum.org/index.pt.html>
+ <https://pt.wikipedia.org/wiki/Deep_web_e_surface_web>

## Conheça também
+ Alternativa ao Tor: [Whonix](https://www.whonix.org/)
+ Alternativa ao TailsOS: [NomadBSD](https://terminalroot.com.br/2019/06/conheca-o-nomadbsd-uma-alternativa-ao-tailos.html)

Se quiser desinstalar o Tor, use o mesmo script com a opção `--uninstall`


    
