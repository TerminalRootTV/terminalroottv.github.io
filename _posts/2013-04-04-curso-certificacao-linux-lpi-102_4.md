---
layout: post
title: "Curso Certificação Linux LPI-102: Configurando o Shell Seguro OpenSSH"
date: '2013-04-04T16:16:00.000-07:00'
image: '/assets/img/lpi/ssh.jpg'
description: "Secure Shell ou SSH é, simultaneamente, um programa de computador e um protocolo de rede que permite a conexão com outro computador na rede"
tags:
- linux
- lpi
---

![Configurando o Shell Seguro OpenSSH](/assets/img/lpi/ssh.jpg "Configurando o Shell Seguro OpenSSH")

> __Secure Shell__ ou __SS__ H é, simultaneamente, um programa de computador e um protocolo de rede que permite a conexão com outro computador na rede, de forma a executar comandos de uma unidade remota. Possui as mesmas funcionalidades do TELNET, com a vantagem da conexão entre o cliente e o servidor ser criptografada.Uma de suas mais utilizadas aplicações é o chamado Tunnelling, que oferece a capacidade de redirecionar pacotes de dados.

## Instalação

> Para instalar o cliente e os server, apesar do cliente já vir instalado por default no Debian e em outras distribuições:

{% highlight bash %}
apt-get install openssh-client openssh-server
{% endhighlight %}

## Usuários e Conexão

Para conectar via __IP__ ou por nome, levará em conta o nome do usuario que você está logado no local de conexão, exemplo se você está como "__root__", ele solicitará a senha de "__root__" do computador que você deseja, se tiver logado como "marcos" se no computador que você está tentando logar como "__marcos__" não houver este usuário, você receberá a "__Conection Refused__", e se tiver, deverá colocar a senha, ou usar o nome do usuario na frente e depois por o "__@__" e logo após o IP ou o nome do computador, depois é só pôr a __senha__ do usuario ex.:

{% highlight bash %}
ssh 192.168.1.107
ssh algumsite.com
ssh root@192.168.1.107
ssh marcos@192.168.1.107
{% endhighlight %}

> __DEBUG__ - __LOG__ - faça a conexão com -vv para exibir as mensagens, ajuda na localização de problemas, tente também iniciar o iniciar o servidor em modo debug (ssh -d) e conectar com o cliente, provavelmente o servidor vai exibir as mensagens de erros, tais como permissões e etc...

{% highlight bash %}
ssh -vv marcos@localhost
ssh -v marcos@localhost
{% endhighlight %}

> Para restringir acesso, deve editar o arquivo __# /etc/ssh/sshd_config__, no arquivo que se abrirá, procure a linha que contém a palavra "__Subsystem__", estará assim

{% highlight bash %}
Subsystem sftp /usr/lib/openssh/sftp-server
{% endhighlight %}

> Bastar adicionar o "__AllowUsers__", ficará assim
{% highlight bash %}
Subsystem sftp /usr/lib/openssh/sftp-server
AllowUsers marcos eric camila
{% endhighlight %}

Enquanto não utilizada a diretiva "__AllowUsers__" qualquer usuário da maquina pode conectar via ssh. Quando acrescenta-la, passa a permitir apenas os usuários listados e válidos na maquina, esta diretiva prevalece sobre a regra "default" que permite login de todos.



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



## Alterando a Porta

A porta padrão do __ssh__ é __22__, por isto tem muitos scripts que ficam tentando conexão nesta porta, por este e outros motivos, pode se __alterar a porta do ssh__, por exemplo, alterar de __22__ para porta __2222__, use seu editor preferido para editar o arquivo __/etc/ssh/sshd_config__ e procure pela linha; __#Port 22__ altere para Port __2222__, depois de efetuar a alteração, precisa reiniciar o serviço, veja no tópico sobre instalação, para testar na própria maquina, em um __konsole__ execute a linha de comando neste formato

{% highlight bash %}
ssh -p 2222 marcos@192.168.1.107
/etc/init.d/ssh restart
{% endhighlight %}

## Copiar arquivos remotamente com SSH

> Nesse exemplo abaixo vou copiar o arquivo "__teste.txt__" para o a máquina remota, isso será copiado para o diretório __/home/marcos/__, lógico, irá pedir senha antes de executar a cópia
{% highlight bash %}
scp teste.txt marcos@192.168.1.102:~/
marcos@192.168.1.102's password:
{% endhighlight %} 
ou 
{% highlight bash %}
scp teste.txt marcos@192.168.1.102:/home/marcos/
marcos@192.168.1.102's password:
{% endhighlight %}

> Para copiar todos os arquivos e sub-diretórios a partir do Shell local para o home do usuário marcos no destino.
{% highlight bash %}
scp -r * marcos@192.168.1.107:~/
{% endhighlight %}

> Para copiar para um sub-diretorio especifico no micro de destino, não use (__~__) e informe o caminho
{% highlight bash %}
scp -r * marcos@192.168.1.107:/home/marcos/pasta_server/
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


> Para copiar da máquina remota para máquina local, usa-se o ponto no final e o formato assim
{% highlight bash %}
scp marcos@192.168.1.107:/home/eric/arquivo_remoto.txt . 
{% endhighlight %}

> o ponto no final da linha indica para salvar no diretório atual. Salvar em outro local, substitua o ponto "__.__" pelo caminho na maquina local, exemplo para salvar na maquina local em __/home/marcos/tmp__
{% highlight bash %}
scp marcos@192.168.1.107:~/teste.txt /home/marcos/tmp
scp -r marcos@192.168.1.107:~/isos /home/marcos/tmp
{% endhighlight %}

### Veja alguns vídeos sobre SSH

<iframe width="920" height="400" src="https://www.youtube.com/embed/zl4PFglKeLY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

***

<iframe width="920" height="400" src="https://www.youtube.com/embed/c42j3B8HRG0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


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

