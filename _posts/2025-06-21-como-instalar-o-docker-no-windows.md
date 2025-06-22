---
layout: post
title: "Como Instalar o Docker no Windows"
date: 2025-06-21 21:03:28
image: '/assets/img/docker/windows/docker-windows.jpg'
description: "🐋 Para quem deseja criar ambientes isolados e portáteis para desenvolvimento e produção."
icon: 'ion:terminal-sharp'
iconname: 'Docker/Windows'
tags:
- docker
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Docker** é uma ferramenta essencial para quem trabalha com containers e deseja criar ambientes isolados e portáteis para desenvolvimento e produção. Neste guia, você vai aprender como instalar o Docker no Windows de forma simples e rápida.

O Docker Desktop requer o **Windows 10 (ou versão mais recente)** com [suporte ao **Hyper-V**](https://stackoverflow.com/questions/27884846/virtualization-not-enabled-in-bios) e [**Windows Subsystem for Linux 2 (WSL 2)**](https://learn.microsoft.com/pt-br/windows/wsl/install).


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
1. **Acesse o site oficial do Docker**: [Docker Desktop para Windows](https://www.docker.com/products/docker-desktop).
2. Clique em **"Download for Windows"**, escolha a arquitetura do seu sistema, por exemplo: `AMD64`.

3. Após o download ser concluído, **abra o instalador** (`Docker Desktop Installer.exe`) que foi baixado.
4. O assistente de instalação será aberto. Clique em **"Install"** para começar a instalação.

![Docker installing](/assets/img/docker/windows/installing-docker-windows.jpg) 

5. **Aguarde a instalação**. O processo pode levar alguns minutos.

6. Após a instalação ser concluída, você pode ser solicitado a reiniciar o computador. Se isso acontecer, clique em **"Restart"** ou **"Reiniciar"**.

![Docker succeeded](/assets/img/docker/windows/docker-suceeded.jpg) 

---

## Utilização
1. Após o reinício (se necessário), **abra o Docker Desktop**.
> Você pode encontrá-lo na lista de aplicativos do Windows ou usar a busca do Windows (pressione **Windows + S** e digite "Docker").

2. Quando o Docker Desktop for iniciado, ele pode pedir para você fazer login com uma conta Docker. Se não tiver uma conta, pode criar uma gratuitamente.
> Aceite os termos durante a primeira execução do Docker.

![Docker accept](/assets/img/docker/windows/docker-accept.jpg) 

3. Verifique se está funcionando corretamente. Abra o **Prompt de Comando** ou **PowerShell**. Digite o comando:
> Ele também instala do `docker-compose`, verifique também a versão.

{% highlight bash %}
docker --version
docker-compose --version
{% endhighlight %}

![Docker and Docker Compose version](/assets/img/docker/windows/docker-version.jpg) 
> Isso deve retornar a versão do Docker que foi instalada, confirmando que o Docker foi instalado corretamente.

Alguns comandos inicias para testar são:
> Obter informações detalhadas sobre a instalação atual do Docker.

{% highlight bash %}
docker info
{% endhighlight %}

![Docker info](/assets/img/docker/windows/docker-info.jpg) 

E também, executar a imagem `hello-world` do [Docker Hub](https://hub.docker.com/). Ele serve para testar se o Docker está instalado e funcionando corretamente.

1. Baixa a imagem `hello-world` se não estiver localmente.
2. Cria e executa um container a partir dela.
3. O container imprime uma mensagem confirmando que o Docker está funcionando.

Exemplo:

{% highlight bash %}
docker run hello-world
{% endhighlight %}

![Docker run hello-world](/assets/img/docker/windows/docker-run-hello-world-01.jpg) 

Você também pode obter e gerar esses dados graficamente, exemplo:

![Docker desktop 01](/assets/img/docker/windows/docker-run-hello-world-02-desktop.jpg) 

---

Para mais informações acesse:
+ <https://docs.docker.com/desktop/setup/install/windows-install/>
+ <https://learn.microsoft.com/pt-br/virtualization/windowscontainers/manage-docker/configure-docker-daemon>
+ <https://www.docker.com/>
+ <https://www.docker.com/products/docker-desktop/>


