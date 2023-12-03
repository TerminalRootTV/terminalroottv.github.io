---
layout: post
title: "Tutorial Definitivo de Docker para INICIANTES (Ubuntu)"
date: 2019-08-28 10:22:53
image: '/assets/img/docker/docker-basic.jpg'
description: 'Ele tem a capacidade de implantar instâncias de contêineres que fornecem uma virtualização usando o kernel do host.'
tags:
- docker
- virtualizacao
- gnulinux
- ubuntu
---

![Tutorial Definitivo de Docker para INICIANTES](/assets/img/docker/docker-basic.jpg)

## Introdução

[Docker](https://www.docker.com/) é um ambiente de virtualização de contêiner que pode estabelecer ambientes de desenvolvimento ou de tempo de execução sem modificar o ambiente do sistema operacional de base. Ele tem a capacidade de implantar instâncias de contêineres que fornecem uma virtualização usando o kernel do host, o que o torna mais rápido e leve do que a virtualização de hardware completa.

## Versões

+   **Docker.io** - Versões mais antigas do Docker eram chamadas docker-engine ou docker.io. O pacote docker-io era o nome usado no Debian/Ubuntu . Essa referência não existe mais.
+   **Docker CE** - É a versão gratuita do Docker que significa Docker Community Edition.
+   **Docker EE** - É a versão paga do Docker e possui mais recursos. Significa Docker Entreprise Edition.

> Os contêineres que produzem Kernel Panic induzirão Kernel Panic no sistema operacional do host.

## Instalação

Para instalar vamos utilizar o `snap` . Só lembrando que o snap está disponível para diversas distribuições, como: Arch, Gentoo, Linux Mint e entre outras. O legal dele é que iremos evitar problemas de versões do Docker.

+   `sudo snap install docker` - Instala o Docker
+   `ps -A | grep docker` - Verifica se o daemon já está rodando
+   `sudo docker run hello-world` - Rodando seu primeiro contêiner

A saída será algo do tipo:

{% highlight bash %}
sudo docker run hello-world

Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete 
Digest: sha256:41a65640635299bab090f783209c1e3a3f11934cf7756b09cb2f1e02147c6ed8
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
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

## Executando Docker sem sudo

1.  Verique quais grupos estão disponíveis no seu sistema, rode o comando: `cat /etc/group | cut -d: -f1` (para exibir grupos ao lado: `cat /etc/group | cut -d: -f1 | tr '\n' ' ' && echo`) , se entre os grupos listados estiver _docker_ , então esse grupo existe, se quiser rodar um comando que lhe diz se existe ou não o grupo, rede o comando: `[[ $(grep 'docker' /etc/group) ]] && echo 'Existe o grupo docker' || echo 'Não existe o grupo docker'`

2.  Use esse passo somente se não existir o grupo docker. Então crie o grupo com o comando: `sudo groupadd docker`.

3.  Agora adicione seu usuário ao grupo docker com o comando: `sudo usermod -aG docker $USER` (ou `sudo gpasswd -a $USER docker`) e verifique se você agora está no grupo com o comando `groups $USER`.

> Se quiser remover o usuário do grupo, rode: `sudo gpasswd -d $USER docker`

4.  Agora você precisa reiniciar seu computador para que as alterações tenham efeito. E após reiniciar teste sem o sudo `docker run hello-world` , se rodar é porque está tudo certo.

## Rodando um container

> Para esse exemplo vamos utilizar um aplicativo de Shell Script: [Funções ZZ](https://terminalroot.com.br/2017/11/como-instalar-e-utilizar-as-funcoes-zz.html)

Primeiro, baixe a imagem do contêiner para a sua máquina:

> Se fizer parte do grupo docker como anteriormente mencionado, ignore o _sudo_ para todos os passos seguintes.

+   `sudo docker pull funcoeszz/zz`

A saída será algo do tipo:

{% highlight bash %}
sudo docker pull funcoeszz/zz
Using default tag: latest
latest: Pulling from funcoeszz/zz
386a066cd84a: Pull complete 
4e1412bf2f54: Pull complete 
9e64dc8a144a: Pull complete 
4efdf586deec: Pull complete 
856d94476b10: Pull complete 
Digest: sha256:23a5e20ceeb907e39652c4b130d5a6a8d77bc25a4aeba003a66871ada88d07dc
Status: Downloaded newer image for funcoeszz/zz:latest
{% endhighlight %}

Liste as imagens que já estão na sua máquina:

+   `docker images`

Agora basta rodar o contêiner e informar qual função você quer usar, junto com seus parâmetros, exemplo: `sudo docker run --rm funcoeszz/zz maiusculas tá funcionando`

Saída:

{% highlight bash %}
# --rm é opcional
# docker run --rm funcoeszz/zz maiusculas tá funcionando
sudo docker run funcoeszz/zz maiusculas tá funcionando
TÁ FUNCIONANDO
{% endhighlight %}

+   Procurar um contêneir: `docker search nginx`
+   Comandos para informações: `docker info` e outras, consulte: `docker --help` ou `docker` somente

## Parando e removendo images e conteiners

O comando *docker run* pega a imagem do Docker como modelo e produz um contêiner a partir dela.

1.  Listando as images e conteiners: `docker images` ou `docker image ls`
2.  Parando conteiners: `docker stop $(docker ps -a -q)`
3.  Removendo todos os conteiners: `docker rm $(docker ps -a -q)`
4.  Removendo todas as images: `docker rmi $(docker images -a -q)` ou `docker rmi ID_IMAGE`

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

## Criando um conteiner

1.  Criar um diretório e entrar no mesmo: `mkdir myshell && cd myshell`
2.  Criar um arquivo de nome: **Dockerfile**: `vim Dockerfile`

{% highlight makefile %}
FROM ubuntu:19.04
ENV PATH=/app:$PATH
COPY myshell.sh /app/
WORKDIR /app
ENTRYPOINT ["./myshell.sh"]
{% endhighlight %}

3.  Criar arquivo shell script: `vim myshell.sh`

{% highlight bash %}
#!/bin/bash
echo "Testando essa bagaça ... [OK]"
{% endhighlight %}

Ou

Esse caso para exemplo de servidor, para jogar para background

{% highlight bash %}
#!/bin/bash
while true; do 
    echo -en "Rodando meu script, hora agora: $(date +%H:%M:%S)\r\r"
done
{% endhighlight %}

1.  Permissão de execução: `chmod +x myshell.sh`
2.  Construir a imagem do App: `docker build --tag=myshell .`
3.  Confirme a existência da imagem: `docker image ls`
4.  Rodando o conteiner: `docker run myshell`

> ID do conteiner: `docker container ls`

## Fazendo upload de uma image/conteiner

1.  Crie uma conta em: [https://hub.docker.com/signup](https://hub.docker.com/signup)
2.  Confirme seu e-mail
3.  Logue em: [https://hub.docker.com/login](https://hub.docker.com/login)
4.  Na URL raíz, crie um repositório: [https://hub.docker.com/](https://hub.docker.com/)

> [Create Repository +] , estilo criar um repositório no GitHub: nome, descrição, public..create

5.  Logando via linha de comando: `docker login` , insira seu nome de usuário[ENTER] e depois sua senha[ENTER]
6.  Criando uma Tag da Image: `docker tag myshell terminalroot/myshell:v1` ou sem tag: `docker tag myshell terminalroot/myshell`
7.  Publicando: `docker push terminalroot/myshell:v1` ou se você não inseriu tag: `docker push terminalroot/myshell`

Se quiser testar é só remover as images e os conteiners todos e depois fazer o `pull` explicado no início e ver se está funcionando de verdade.

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

## Removendo Docker

1.  Parar todos os processos: `docker stop $(docker ps -a -q)`
2.  Removendo os processos: `docker rm $(docker ps -a -q)`
3.  Lista as imagens: `docker images`
4.  Removendo todas as images: `docker rmi IMAGE_ID [nImage_ID ...]`
5.  Veja os grupos e remova o grupo **docker**:

{% highlight bash %}
groups $USER
sudo groupdel docker
groups $USER
{% endhighlight %}

Listando os snaps e remove o snap:

{% highlight bash %}
snap list
sudo snap remove docker`
snap list
sudo snap refresh
{% endhighlight %}

Mais inforções sobre [snap](https://tutorials.ubuntu.com/tutorial/basic-snap-usage)

# Assista a um Vídeo Completo sobre Docker para INICIANTES

<iframe width="920" height="400" src="https://www.youtube.com/embed/bsGkIKP1OZ4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links úteis

+   [Docker Cheat Sheet](https://www.docker.com/sites/default/files/Docker_CheatSheet_08.09.2016_0.pdf)
+   [Docker Get Started](https://docs.docker.com/get-started/)
+   [Docker no Gentoo](https://wiki.gentoo.org/wiki/Docker)

### Alternativas ao Docker

+   [https://coreos.com/rkt/](https://coreos.com/rkt/)
+   [http://mesos.apache.org/](http://mesos.apache.org/)
+   [https://linuxcontainers.org/](https://linuxcontainers.org/)
+   [https://containerd.io/](https://containerd.io/)

Mais em: [https://alternativeto.net/software/docker/](https://alternativeto.net/software/docker/)
    


