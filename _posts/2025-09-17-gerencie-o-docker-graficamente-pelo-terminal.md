---
layout: post
title: "Gerencie o Docker Graficamente pelo Terminal"
date: 2025-09-17 11:27:51
image: '/assets/img/docker/lazydocker.jpg'
description: "🐋 Um aplicativo TUI feito em Go."
icon: 'ion:terminal-sharp'
iconname: 'Docker'
tags:
- tui
- go
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**LazyDocker** é uma ferramenta open-source escrita em [Go](https://terminalroot.com.br/tags#go): um aplicativo [TUI](https://terminalroot.com.br/tags#tui) que simplifica o gerenciamento de containers [Docker](https://terminalroot.com.br/tags#docker), imagens, volumes e serviços Docker-Compose diretamente pelo [terminal](https://terminalroot.com.br/tags#terminal), sem memorizar comandos complexos.

Funcionalidades:
* **Logs e métricas ao vivo**: exibe logs em tempo real e stats (CPU/memória) dos containers.
* **Navegação por teclado**: comandos rápidos para mover-se entre containers e serviços.
* **Controle rápido**: iniciar, parar, reiniciar, remover containers com um clique/tecla.
* **Suporte a Docker Compose**: detecta `docker-compose.yml` e permite gerenciar serviços no mesmo lugar.
* **Interface leve e visual**: ideal para servidores remotos ou preferências por terminal.
* **Mouse support e UI customizável**: suporta ações com mouse e configuração via YAML.

Benefícios:
* Evita memorização de comandos Docker complexos, agilizando seus fluxos de trabalho.
* Útil em desenvolvimento local, microserviços, debugging e ambientes remotos sem interface gráfica.
* Leve, rápido e eficiente comparado a GUIs pesadas.


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

**Homebrew**:
{% highlight bash %}
brew install lazydocker
{% endhighlight %}


**Scoop (Windows)**:
{% highlight bash %}
scoop install lazydocker
{% endhighlight %}

**Instalação via Go**:
{% highlight bash %}
go install github.com/jesseduffield/lazydocker@latest
{% endhighlight %}

**Docker (como container)**: Use `docker run` montando `/var/run/docker.sock`.

---

## Utilização

Após a instalação, basta executar:

{% highlight bash %}
lazydocker
{% endhighlight %}

Dentro da UI, você pode navegar pelas seções:

* <kbd>tab</kbd> ou setas para navegar entre painéis
* <kbd>enter</kbd> para focar
* <kbd>q</kbd> para sair
* Use ⬅/➡ ou outros atalhos listados na documentação para ações específicas.

---

Para mais informações acesse o repositório: <https://github.com/jesseduffield/lazydocker>.

