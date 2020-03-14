---
layout: post
title: "Conheça o Yabar - uma alternativa para sua barra de status"
date: 2019-07-25 13:31:16
image: '/assets/img/polybar/yabar.jpg'
description: 'Yabar é uma barra de status moderna e leve para bspwm e i3wm .'
tags:
- yabar
- polybar
- dicas
---

![Yabar](/assets/img/polybar/yabar.jpg)

O [Yabar](https://github.com/geommer/yabar) é uma barra de status moderna e leve que deve ser usada junto com a X Window, como o bspwm e o i3. Yabar tem os seguintes recursos:

+ Extremamente configurável usando um único arquivo de configuração.
+ Renderização de fontes Pango com suporte ao [Pango Markup Language](https://developer.gnome.org/pango/stable/PangoMarkupFormat.html).
+ Suporte para ícones e imagens.
+ **Suporte para transparência**.
+ Suporte a vários monitores usando o RandR.
+ Totalmente clicável.
+ Suporte para diversas variáveis de ambiente.
+ Várias barras na mesma sessão.

> Aviso: Yabar ainda está em sua infância e longe de ser maduro. Sinta-se livre para contribuir ou relatar bugs!

## Instalação

Está disponível no repositório de diversas distribuições, exemplos:

{% highlight bash %}
sudo apt install yabar # Debian, Ubuntu, Linux Mint e derivados
nix-env -iA nixos.yabar # NixOS / Nix
{% endhighlight %}

Ou você pode compilar com os comandos:

{% highlight bash %}
git clone https://github.com/geommer/yabar
cd yabar
make yabar
sudo make install
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

## Configuração

O arquivo de configuração do Yabar fica no caminho: `~/.config/yabar/yabar.conf` , segue abaixo um exemplo de configuração do link:
<https://github.com/geommer/yabar/blob/master/examples/example.config>

Para cada linha de configuração e outras dúvidas, sugiro você analisar a documentação, que por sinal, é bem fácil de entender.
**<https://github.com/geommer/yabar/blob/master/doc/yabar.1.asciidoc>**

## Página Oficial do Yabar
### <https://github.com/geommer/yabar>

Ficou alguma dúvida ? Comente!

Abraços !
    
