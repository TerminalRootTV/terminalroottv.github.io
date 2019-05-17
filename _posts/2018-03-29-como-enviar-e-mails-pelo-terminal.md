---
layout: post
title: "Como Enviar E-Mails pelo Terminal"
date: 2018-03-29 12:09:19
image: '/assets/img/terminal/mutt.jpg'
description: 'Todos os clientes de e-mail são idiotas. Este só é um pouco menos!'
main-class: 'misc'
tags:
- terminal
- mutt
- bash
- dicas
---

> __Todos os clientes de e-mail são idiotas. Este só é um pouco menos!__

Para efetuar essa façanha vamos utilizar o [mutt](http://www.mutt.org/) . Mutt é um cliente de email em modo texto puro para sistemas Unix-like (POSIX). Foi originalmente escrito por Michael Elkins em 1995 e lançado sob a GNU General Public License versão 2 ou posterior. O slogan do mutt é _"Todos os "mail clients" são idiotas. Este só é um pouco menos"_.


Mutt é um Mail User Agent (MUA), ou seja, ele ler e-mails no protocolo especificado, para enviar e-mails, você precisará possuir na sua máquina um MTA (Mail Transfer Agent), nesse caso vamos utilizar o sendmail . Você pode usar o gerenciador de pacotes da sua distribuição para instalá-lo, no [Gentoo](http://terminalroot.com.br/tags#Gentoo) basta você rodar o comando <kbd>emerge mutt sendmail</kbd> , no entanto, vamos compilar alguns pacotes junto com eles, que nas versões binárias, provavelmente vocês não precisarão instalar.

> Se você não possuir o comando __euse__ instale o [Gentoolkit](https://wiki.gentoo.org/wiki/Gentoolkit) com o comando
> 
> <kbd>emerge --ask app-portage/gentoolkit</kbd>

{% highlight bash %}
euse -E imap lmdb ssl sasl smtp
emerge --ask mail-client/mutt mail-mta/sendmail
{% endhighlight %}

Após isso você precisa criar um arquivo no seu diretório pessoal <kbd>vim ~/.muttrc</kbd> e nele pôr o seguinte conteúdo:

{% highlight bash %}
set ssl_starttls="yes" 
set ssl_force_tls="yes" 
set imap_user="SEU_E_MAIL@gmail.com" 
set imap_pass="A_SENHA_DO_SEU_EMAIL" 
set from="SEU_E_MAIL@gmail.com" 
set realname="SEU_NOME" 
set folder="imaps://imap.gmail.com/" 
set spoolfile="imaps://imap.gmail.com/INBOX" 
set postponed="imaps://imap.gmail.com/[Gmail]/Drafts" 
set smtp_url="smtps://SEU_E_MAIL@gmail.com:A_SENHA_DO_SEU_EMAIL@smtp.gmail.com:465/" 
set move="no" 
set imap_keepalive="900"
{% endhighlight %}

> Substitua a palavra __SEU_E_MAIL__ com seu e-mail; __A_SENHA_DO_SEU_EMAIL__ com sua senha; e __SEU_NOME__ pelo seu nome.

Pra você conseguir enviar e-mails, você precisa autorizar o uso de __APLICATIVOS MENOS SEGUROS NO GMAIL__ . Há duas formas de você fazer isso:

+ __1°__ - Vá em: [Minha Conta](https://myaccount.google.com) > [Login e Segurança](https://myaccount.google.com/security) > [Permitir aplicativos menos seguros](https://myaccount.google.com/security?utm_source=OGB&utm_medium=app&pli=1#connectedapps) e habilitar para __ATIVADA__

+ __2°__ - Ou só [clicar nesse link https://myaccount.google.com/lesssecureapps](https://myaccount.google.com/lesssecureapps) e habilitar para __ATIVADA__ 

> Se você não habilitar no GMail essa opção, provavelmente você obterá o erro:

<pre>
TLSv1.2 connection using TLSv1/SSLv3 (ECDHE-RSA-AES128-GCM-SHA256)
SASL authentication failed
Could not send the message.
</pre>

Após efetuado esses passos, você já consegue enviar e-mails com o simples comando:

{% highlight bash %}
echo "Conteúdo teste" | mutt -s "Assunto teste" destinatario@email.com
{% endhighlight %}

Onde __Conteúdo teste__ é o _corpo do e-mail_ ; __Assunto teste__ é o título; e __destinatario@email.com__ é o e-mail que você enviará o conteúdo.

Envio de e-mail __com anexo__ , o __-a__ informa o(s) anexo(s) , se houver mais de um , também separe por espaços , neste exemplo estou enviando dois arquivos anexos

> __Obs.:__ Observe que após o nome do último arquivo a anexar deve-se colocar '--' (dois traços) para depois informar o(s) destinatário(s).

{% highlight bash %}
echo 'Teste com anexo' | mutt -s 'Assunto teste com anexo' -a meuscript.sh logs.tar.gz -- destinatario@email.com
{% endhighlight %}

Pra você ler seus e-mails, basta você rodar o comando <kbd>mutt</kbd> , se colorir e entre outras facilidades, insira o conteúdo abaixo no início do seu arquivo __~/.muttrc__ 

{% highlight bash %}
# Ilumine coisas com cores, para mais exemplos de colorir veja:
# http://aperiodic.net/phil/configs/mutt/colors
color normal      white          black
color hdrdefault  green          default
color quoted      green          default
color quoted1     yellow         default
color quoted2     red            default
color signature   cyan           default
color indicator   brightyellow   red
color error       brightred      default
color status      brightwhite    blue
color tree        brightmagenta  black
color tilde       blue           default
color attachment  brightyellow   default
color markers     brightred      default
color message     white          black
color search      brightwhite    magenta
color bold        brightyellow   default
# se você não gosta da barra de progresso preta na parte inferior da tela,
# comente essa linha abaixo
color progress    white          black
{% endhighlight %}

Se quiser mais facilidades ainda insira o conteúdo abaixo também no seu __~/.muttrc__ (ANTES DO CÓDIGO DAS CORES), mas leia antes os comentários para obter mais informações.

{% highlight bash %}
# conjunto de caracteres em mensagens enviadas
set send_charset="utf-8"

# se não houver nenhum conjunto de caracteres fornecido nas mensagens recebidas, é provavelmente o Windows
set assumed_charset="iso-8859-1"

# certifique-se de que Vim sabe que Mutt é um cliente de correio e que uma mensagem codificada UTF-8 será composta
set editor="vim -c 'set syntax=mail ft=mail enc=utf-8'"

# basta percorrer uma linha em vez da página completa
set menu_scroll=yes

# queremos ver alguns tipos MIME inline, veja abaixo esta listagem de código para explicação
auto_view application/msword
auto_view application/pdf

# faça o padrão de busca padrão para pesquisar em To, Cc e Subject
set simple_search="~f %s | ~C %s | ~s %s"

# classificar por tópicos
set sort=threads
set strict_threads=yes

# Marcar como Spam ao ler uma mensagem
spam "X-Spam-Score: ([0-9\\.]+).*" "SA: %1"
set pager_format = " %C - %[%H:%M] %.20v, %s%* %?H? [%H] ?"

# não mostra todos os cabeçalhos, apenas os que deseja
ignore          *
unignore        From To Cc Bcc Date Subject
# e nesta ordem
unhdr_order     *
hdr_order       From: To: Cc: Bcc: Date: Subject:
{% endhighlight %}

E se quiser ainda mais alternativas, adicione isso depois das cores:

{% highlight bash %}
# Configurações pessoais
alternates "SEU_E_MAIL@gmail.com|OUTRO_SEU_EMAIL@gmail.com"
# descomente a linha abaixo se você deseja usar/tem assinatura
# set signature = ~/.signature

# descomente a linha abaixo se você deseja usar: catálogo de endereços
# source ~/.aliases

# Configurações de conexão do IMAP
set mail_check=60
set imap_keepalive=300

# Configurações de conta do IMAP
set folder=imaps://SEU_E_MAIL@imap.gmail.com/
set spoolfile=imaps://SEU_E_MAIL@imap.gmail.com/
set record=imaps://SEU_E_MAIL@imap.gmail.com/Sent
set postponed=imaps://SEU_E_MAIL@imap.gmail.com/Drafts

# use headercache para IMAP (certifique-se de que este é um diretório para melhor desempenho!)
set header_cache=/var/tmp/.mutt

# descomente isso para ativar o recurso da barra lateral
#set sidebar_visible = yes
set sidebar_width = 15
set sidebar_folder_indent = yes
set sidebar_short_path = yes

# faça as atualizações de progresso não tão caras, isso atualizará a barra a cada 300ms
set read_inc = 1
set time_inc = 300

# somente se você compilou o Mutt com gpgme, habilite o back gpgme
# set crypt_use_gpgme = yes
# você pode configurar isso para ocultar a saída de verificação do gpg e apenas confiar na FLAG de estado do Mutt
#set crypt_display_signature = no
# habilitar a assinatura de e-mails por padrão
#set pgp_autosign = yes
#set pgp_sign_as = 0xXXXXXXXX   # seu keypad gpg aqui
#set pgp_replyencrypt = yes

# entradas que queremos monitorar para novos e-mails
mailboxes "="
mailboxes "=Lists"

# listas de grupos de e-mails (isso são expressões regulares, não são curingas!)
#subscribe "subscribe-.*@server\\.org"

# Configuração de envio SMTP (para envio de e-mail)
#set smtp_url=smtp://SEU_E_MAIL@gmail.com/
{% endhighlight %}

> __NÃO ESQUEÇA DE ALTERAR__ 
- 'SEU_E_MAIL'
- 'SEU_NOME' ENTRE OUTRAS COISAS, 
> __# LEIA OS COMENTÁRIOS DOS CÓDIGOS PRONTOS__ !

# Pra eliminar qualquer dúvida
# ASSISTA AO VÍDEO TUTORIAL

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=cmLRfmwMwhM)


# Link Úteis
<http://www.mutt.org/>

<https://pt.wikipedia.org/wiki/Mutt_(cliente_de_email)>

<https://pt.wikipedia.org/wiki/Sendmail>

<https://wiki.gentoo.org/wiki/Mutt>

# Comente!
