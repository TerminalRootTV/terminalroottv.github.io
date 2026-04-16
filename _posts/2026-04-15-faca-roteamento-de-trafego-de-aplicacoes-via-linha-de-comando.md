---
layout: post
title: "Faça roteamento de Tráfego de aplicações via linha de comando"
date: 2026-04-15 22:00:27
image: '/assets/img/go/tori-cli.jpg'
description: "🛜 Uma ferramenta voltada para uso com a rede Tor."
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- rede
- go
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **toricli.sh** é uma ferramenta escrita em [Go](https://terminalroot.com.br/tags#go), focado em facilitar o roteamento de tráfego de aplicações via linha de comando. A proposta é simplificar o uso de anonimização no Linux sem depender de configurações complexas.

Ele entra na mesma categoria de ferramentas como `torsocks`, mas com uma abordagem mais direta e automatizada.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Instalação
> Para [Windows](https://terminalroot.com.br/tags#windows) use o [WSL](https://learn.microsoft.com/pt-br/windows/wsl/install)

{% highlight bash %}
# systemd
curl -fsSL https://raw.githubusercontent.com/thobiasn/tori-cli/main/deploy/install.sh | sudo sh

# Arch
yay -S tori-cli-bin

# macOS
curl -fsSL https://raw.githubusercontent.com/thobiasn/tori-cli/main/deploy/install.sh | sh -s -- --client
{% endhighlight %}

Docker:
{% highlight bash %}
docker run -d --name tori \
  --restart unless-stopped \
  --pid host \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /run/tori:/run/tori \
  -v tori-data:/var/lib/tori \
  -v ./config.toml:/etc/tori/config.toml:ro \
  ghcr.io/thobiasn/tori-cli:latest
{% endhighlight %}

## Exemplo de uso

{% endhighlight %}
toricli curl example.com
{% endhighlight %}

E o tráfego sai anonimizado.

---

Para mais informações acesse: <https://toricli.sh/>.

