---
layout: post
title: Utilizando o SSH
date: '2015-01-04T12:36:00.001-08:00'
description: "Em informática o Secure Shell ou SSH é, simultaneamente, um programa de computador e um protocolo de rede que permite a conexão com outro computador na rede, de forma a executar comandos de uma unidade remota."
color: '#3b5998'
author: Marcos Oliveira
tags:
- gnulinux
- servidores
- gnu
- redes
thumbnail: http://3.bp.blogspot.com/-ldrjtnugdxq/vkmknoyiq2i/aaaaaaaabim/kauyzk5gg7u/s72-c/ssh.jpg
---


![SSH Blog Linux](http://3.bp.blogspot.com/-LdrJTnUGDxQ/VKmkNOyiq2I/AAAAAAAABIM/KAuyzK5Gg7U/s320/ssh.jpg "SSH Blog Linux")

Em informática o Secure Shell ou SSH é, simultaneamente, um programa de computador e um protocolo de rede que permite a conexão com outro computador na rede, de forma a executar comandos de uma unidade remota. Possui as mesmas funcionalidades do TELNET, com a vantagem da conexão entre o cliente e o servidor ser criptografada.Uma de suas mais utilizadas aplicações é o chamado Tunnelling, que oferece a capacidade de redirecionar pacotes de dados.


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=zl4PFglKeLY)


### Instalação

Para instalar o cliente e os server, apesar do cliente já vir instalado por default no Debian e em outras distribuições:
{% highlight bash %}
apt-get install openssh-client openssh-server
{% endhighlight %}

### Usuários e Conexão

Para conectar via IP ou por nome, levará em conta o nome do usuario que você está logado no local de conexão, exemplo se você está como "root", ele solicitará a senha de "root" do computador que você deseja, se tiver logado como "marcos" se no computador que você está tentando logar como "marcos" não houver este usuário, você receberá a "Conection Refused", e se tiver, deverá colocar a senha, ou usar o nome do usuario na frente e depois por o "@" e logo após o IP ou o nome do computador, depois é só pôr a senha do usuario ex.:

{% highlight bash %}
ssh 192.168.1.107
ssh algumsite.com
ssh root@192.168.1.107
ssh marcos@192.168.1.107
{% endhighlight %}

DEBUG - LOG - faça a conexão com -vv para exibir as mensagens, ajuda na localização de problemas, tente também iniciar o iniciar o servidor em modo debug (ssh -d) e conectar com o cliente, provavelmente o servidor vai exibir as mensagens de erros, tais como permissões e etc..., exemplos:

{% highlight bash %}
ssh -vv marcos@localhost
ssh -v marcos@localhost
{% endhighlight %}

para restringir acesso, deve editar o arquivo # /etc/ssh/sshd_config, no arquivo que se abrirá, procure a linha que contém a palavra "Subsystem", estará assim:

{% highlight bash %}
Subsystem sftp /usr/lib/openssh/sftp-server
{% endhighlight %}

bastar adicionar o "AllowUsers", ficará assim, ex.:
{% highlight bash %}
Subsystem sftp /usr/lib/openssh/sftp-server
AllowUsers marcos eric camila
{% endhighlight %}

Enquanto não utilizada a diretiva "AllowUsers" qualquer usuário da maquina pode conectar via ssh. Quando acrescenta-la, passa a permitir apenas os usuários listados e válidos na maquina, esta diretiva prevalece sobre a regra "default" que permite login de todos.

### Alterando a Porta

A porta padrão do ssh é 22, por isto tem muitos scripts que ficam tentando conexão nesta porta, por este e outros motivos, pode se alterar a porta do ssh, por exemplo, alterar de 22 para porta 2222, use seu editor preferido para editar o arquivo /etc/ssh/sshd_config e procure pela linha; #Port 22 altere para Port 2222, depois de efetuar a alteração, precisa reiniciar o serviço, veja no tópico sobre instalação, para testar na própria maquina, em um konsole execute a linha de comando neste formato:
{% highlight bash %}
ssh -p 2222 marcos@192.168.1.107
/etc/init.d/ssh restart
{% endhighlight %}

### Copiar arquivos remotamente com SSH

Nesse exemplo abaixo vou copiar o arquivo "teste.txt" para o a máquina remota, isso será copiado para o diretório /home/marcos/, lógico, irá pedir senha antes de executar a cópia:
{% highlight bash %}
scp teste.txt marcos@192.168.1.102:~/
marcos@192.168.1.102's password:
{% endhighlight %}

ou

{% highlight bash %}
scp teste.txt marcos@192.168.1.102:/home/marcos/
marcos@192.168.1.102's password:
{% endhighlight %}

para copiar todos os arquivos e sub-diretórios a partir do Shell local para o home do usuário marcos no destino.

{% highlight bash %}
scp -r * marcos@192.168.1.107:~/
{% endhighlight %}

para copiar para um sub-diretorio especifico no micro de destino, não use (~) e informe o caminho:
{% highlight bash %}
scp -r * marcos@192.168.1.107:/home/marcos/pasta_server/
{% endhighlight %}

para copiar da máquina remota para máquina local, usa-se o ponto no final e o formato assim:
{% highlight bash %}
scp marcos@192.168.1.107:/home/eric/arquivo_remoto.txt . 
{% endhighlight %}

o ponto no final da linha indica para salvar no diretório atual.Salvar em outro local, substitua o ponto "." pelo caminho na maquina local, exemplo para salvar na maquina local em /home/marcos/tmp:
{% highlight bash %}
scp marcos@192.168.1.107:~/teste.txt /home/marcos/tmp
scp -r marcos@192.168.1.107:~/isos /home/marcos/tmp
{% endhighlight %}

# Espero que gostem e comentem!

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



