---
layout: post
title: "Enviando e-mail via Terminal"
date: '2015-08-01T16:31:00.000-07:00'
image: '/assets/img/terminal/e-mail.jpg'
description: "Utilizando o Mutt"
main-class: 'linux'
tags:
- Linux
- Servidores
- GNU
- Terminal
- Comandos
---

<script>window.location = "http://terminalroot.com.br/2018/03/como-enviar-e-mails-pelo-terminal.html";</script>

![Enviando e-mail via Terminal](/assets/img/terminal/e-mail.jpg "Enviando e-mail via Terminal")


Para instalar o [mutt](http://www.mutt.org/) , no [Debian](https://www.debian.org/) , basta usar o __apt-get__ , mas caso você possua outra distro , tente com o seu gerenciador de pacotes correspondente , ou então baixe-o e compile
Para instalar no Debian:
{% highlight bash %}
su
apt-get install mutt
{% endhighlight %}

Durante a instalação , aparecerão __duas telas__, na __primeira__ só aperte __ENTER__ na __segunda__ , use o '__No configuration__' , pois o ideal aqui é só enviar e-mails , o __mutt__ é muito poderoso e possui configurações para servidor.

Depois crie na __raíz do seu diretório pessoal__ um arquivo com o nome __.muttrc__ , eu usei o vi , mas você pode usar seu editor preferido
{% highlight bash %}
vi ~/.muttrc
{% endhighlight %}

Salve esse arquivo dentro dele com suas configurações ( seu nome, seu e-mail e sua senha ) , exemplo para o Gmail
{% highlight bash %}
# Nome do Remetente
set realname="Seu Nome" 
# Email do Remetente
set from="seuemail@gmail.com;"
# Usuario da conta de email
set my_user=seuemail@gmail.com
# Senha da conta de email
set my_pass='SUA SENHA'
# Autenticacao no servidor smtp de email, nesse caso do gmail.com
set smtp_url=smtps://$my_user:$my_pass@smtp.gmail.com
# Camada de segurança, requerida pelo gmail.com
set ssl_force_tls = yes
{% endhighlight %}

Agora é só enviar os e-mails, envio de e-mail simples , o __echo__ envia o conteúdo depois do __pipe__ envia com o comando mutt e o utiliza o __-s__ na frente do assunto, e no final o destinatário
{% highlight bash %}
echo "Conteúdo teste" | mutt -s "Assunto teste" destinatario@email.com
{% endhighlight %}

Envio de e-mail __com anexo__ , o __-a__ informa o(s) anexo(s) , se houver mais de um , também separe por espaços , neste exemplo estou enviando dois arquivos anexos

> Obs.: Observe que após o nome do último arquivo a anexar deve-se colocar '__--__' (dois traços) para depois informar o(s) destinatário(s).
{% highlight bash %}
$ echo 'Teste com anexo' | mutt -s 'Assunto teste com anexo' -a meuscript.sh logs.tar.gz -- destinatario@email.com
{% endhighlight %}

> Na maioria dos casos é necessário [Permitir que aplicativos menos seguros acessem sua conta](https://support.google.com/accounts/answer/6010255?hl=pt-BR)
