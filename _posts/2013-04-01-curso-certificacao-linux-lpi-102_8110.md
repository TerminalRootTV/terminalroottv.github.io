---
layout: post
title: 'Curso Certificação Linux LPI-102: Servidor Postfix'
date: '2013-04-01T16:08:00.000-07:00'
image: '/assets/img/lpi/postfix1.gif'
description: " O Postfix é um agente de transferência de emails (MTA), um software livre para envio e entrega de emails."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Servidor Postfix](/assets/img/lpi/postfix1.gif "Servidor Postfix")

> O __Postfix__ é um agente de transferência de emails (__MTA__), um software livre para envio e entrega de emails. Rápido e fácil de administrar, é uma alternativa segura ao Sendmail, muito utilizado em servidores __UNIX__.

Ele é uma espécie de meio termo entre a simplicidade do __Qmail__ e a fartura de recursos do __Exim__. Entre os três, ele é o mais rápido e o mais simples de configurar, o que faz com que ele seja atualmente o mais popular e o que possui mais documentação disponível. O __Postfix__ também possui um excelente histórico de segurança, sendo __considerado por muitos tão seguro quanto o Qmail__.

Existem fortes motivos para não usar o __Sendmai__l ou o __Qmail__ em novas instalações, mas temos uma boa briga entre o __Postfix__ e o __Exim__. Escolhi abordar o __Postfix__ aqui simplesmente por que, entre os dois, ele é mais popular, o que torna mais simples encontrar documentação e conseguir ajuda quando tiver dúvidas.

## Instalando o Postfix
> Durante a Instalação ele deverá perguntar: Qual o tipo geral de configuração, marque o item Internet Site
{% highlight bash %}
apt-get install postfix
{% endhighlight %}

![Blog Linux](/assets/img/lpi/InternetSite.jpg "Blog Linux")

e o nome/endereço do Servidor, digite o nome que você deseja

![Blog Linux](/assets/img/lpi/marcospinguim.jpg "Blog Linux")

Para as demais perguntas, deixe as opções defaults como já vêm pré-marcadas.

> Obs.:Na pergunta: força atualizações síncronas na fila de email ? Marque como não

![Blog Linux](/assets/img/lpi/marcar_nao.jpg "Blog Linux")

## Configuração Inicial
Edite o arquivo 
{% highlight bash %}
vi /etc/postfix/main.cf
{% endhighlight %}

Inclua as configurações abaixo:
{% highlight bash %}
mydomain = SEU-HOST.com.br
myhostname = host.$mydomain
myorigin = $mydomain
mydestination = $myhostname, $mydomain
mynetworks = 127.0.0.0/8 192.168.1.1/24
home_mailbox = Maildir/
{% endhighlight %}

* __mydomain__: O nome do domínio do servidor de e-mail.
* __myhostname__: O nome da máquina do servidor de e-mail.
* __myorigin__: Especifica como ficará a terminação do e-mail após o @.
* __mydestination__: Os nomes dos domínios que o servidor de e-mail é responsável.
* __mynetworks__: Especifica a qual rede que o servidor de e-mail irá trabalhar.
* __home_mailbox__: Especifica o diretório onde ficará as mensagens de e-mail.

Após isso recarregue as informações no Postfix
{% highlight bash %}
/etc/init.d/postfix reload
{% endhighlight %}

## Testando o Envio de E-mails

No meu PC existe um usuario com o nome [marcos] e outro com o nome [eric], teste com os usuarios da sua máquina, se não houver crie-os com useradd, neste exemplo abaixo o usuário [marcos] enviou um e-mail para o usuário [eric], lógico que estou logado como root, mas usei o comando [MAIL from:] e especifiquei o usuário que envia o e-mail, para critério de teste.

{% highlight bash %}
telnet localhost 25
Trying ::1...
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
220 host.SEU-HOST.com.br ESMTP Postfix
HELO smtp.SEU-HOST.com.br
250 host.SEU-HOST.com.br
MAIL from: marcos
250 2.1.0 Ok
RCPT to: eric
250 2.1.5 Ok
DATA
354 End data with .
Este post sobre Postfix no blog é loucooooo!
.
250 2.0.0 Ok: queued as A8F958F5DE
QUIT
221 2.0.0 Bye
Connection closed by foreign host.
{% endhighlight %}
Instalar o pacote SASL
Este recurso é importante hoje em dia, pois sem encriptação, seus e-mails (incluindo o login e senha) são transmitidos em texto plano pela rede e podem ser Sniffados. Uma vez ativo o recurso no servidor, basta marcar a opção no cliente de e-mails.

{% highlight bash %}
apt-get install sasl2-bin
{% endhighlight %}

Agora abra novamente o arquivo __main.cf__ e inclua as linhas abaixo nele
{% highlight bash %}
smtpd_sasl_auth_enable = yes
broken_sasl_auth_clients = yes
smtpd_sasl_authenticated_header = yes
smtpd_helo_required = yes
smtpd_recipient_restrictions = 
permit_mynetworks,
permit_sasl_authenticated,
reject_unauth_destination
{% endhighlight %}

Depois ative ele abrindo o arquivo de configuração
{% highlight bash %}
vi /etc/default/saslauthd
{% endhighlight %}

Inclua o código abaixo no arquivo, na verdade essa linhas já existirão, mas você deve alterá-las para ficar assim

> Obs.:As linhas não estão uma abaixo da outra, procure-as e altere

{% highlight bash %}
START=yes
OPTIONS="-c -m /var/spool/postfix/var/run/saslauthd -r"
{% endhighlight %}

Salve e feche o arquivo. Agora rode esse comando no terminal para verificar se o usuário postfix existe:

{% highlight bash %}
groups postfix
{% endhighlight %}

Se retornar postfix : postfix , rode esse comando:
{% highlight bash %}
usermod -G sasl postfix
{% endhighlight %}

Se verificar novamente com o comando groups postfix, agora retornará __postfix : postfix sasl__ , caso não ocorra, dê um reload no __postfix__ (__/etc/init.d/postfix reload__).

Crie o arquivo smtpd.conf no diretório "__/etc/postfix/sasl__" e adicione as seguintes linhas abaixo
{% highlight bash %}
pwcheck_method: saslauthd
mech_list: plain login
{% endhighlight %}

Terminado as configurações, reinicie o Postfix e o serviço de autenticação
{% highlight bash %}
/etc/init.d/postfix restart
/etc/init.d/saslauthd restart
{% endhighlight %}

Você pode ainda implementar uma criptogrfia TLS e criar o certificado, dá uma pesquisada na Internet. 

## Lendo os e-mails

Para poder ler as mensagens de e-mail recebidas, será usado o __Servidor POP3__

{% highlight bash %}
apt-get install courier-pop-ssl
{% endhighlight %}

## Testando o Servidor POP3

Para verificar se o Servidor POP3 está funcionando, use o Telnet para ler as mensagens de e-mail recebidas:lembra que o [marcos] enviou mensagem para o usuário [eric] ? Agora o [eric] irá ler.

{% highlight bash %}
telnet localhost 110
Trying ::1...
Connected to localhost.
Escape character is '^]'.
+OK Hello there.
USER eric
+OK Password required.
PASS informe_aqui_a_senha
+OK logged in.
LIST
+OK POP3 clients that break here, they violate STD53.
1 517
.
RETR 1
+OK 517 octets follow.
Return-Path: 
X-Original-To: eric
Delivered-To: eric@SEU-HOST.com.br
Received: from smtp.SEU-HOST.com.br (localhost [127.0.0.1])
by host.SEU-HOST.com.br (Postfix) with SMTP id A8F958F5DE
for ; Wed,  4 Jan 2012 12:01:31 -0200 (BRST)
Message-Id: 
Date: Wed,  4 Jan 2012 12:01:31 -0200 (BRST)
From: marcos@SEU-HOST.com.br
To: undisclosed-recipients:;
Este post sobre Postfix no blog é loucooooo!
.
QUIT
+OK Bye-bye.
Connection closed by foreign host.
{% endhighlight %}

> Obs.: Percebam que as mensagem são arquivos e ficam nas pasta Maildir/cur dos usuários (/home/usuario/Maildir/cur).

## Pronto! Espero que gostem e comentem!
