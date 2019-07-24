---
layout: post
title: "Acesse seu Computador pelo Navegador com Shell In A Box"
date: 2017-04-15 17:34:53
image: '/assets/img/shell-script/shellinabox-terminal.jpg'
description: "Shell in A Box é uma ferramenta que torna possível o acesso via SSH pelo Browser do Navegador"
main-class: 'bash'
tags:
- shell-script
- ssh
- web
---

![Acesse seu Computador pelo Navegador com Shell In A Box](/assets/img/shell-script/shellinabox/shellinabox-terminal.jpg "Acesse seu Computador pelo Navegador com Shell In A Box")

## Introdução

[Shell in A Box](https://github.com/shellinabox/shellinabox) é uma ferramenta que torna possível o acesso via [SSH](https://pt.wikipedia.org/wiki/Secure_Shell) pelo [Navegador](https://pt.wikipedia.org/wiki/Navegador_web). O __SSH__ baseado na Web torna possível acessar servidores __Secure Shell (SSH)__ através de navegadores web. Ele funciona como um serviço autônomo ou em conjunto com um servidor web para fornecer acesso __HTTPS__ a um shell de login e é empacotado para distribuições __Debian__ e __RedHat__ derivadas do __Linux__.

## Instalação

No __Debian__, se não possuir o sudo, use o __root__ e depois com o __APT__, basta rodar o comando, lembrando que você precisará do __OpenSSH__ e o __OpenSSL__ instalados
{% highlight bash %}
apt-get install openssh-client openssh-server openssl
{% endhighlight %}

E depois instale o __Shell In A Box__
{% highlight bash %}
apt-get install shellinabox
{% endhighlight %}

No __Ubuntu, Linux Mint e derivados__, como __sudo__
{% highlight bash %}
sudo apt-get install shellinabox
{% endhighlight %}

Em distribuições baseadas em __RedHat__
{% highlight bash %}
yum install openssl shellinabox
{% endhighlight %}

## Utilização

Após instalado, basta você acessar o computador que você deseja, informando o __IP__ e em seguida a porta __4200__ que é a que o Shell In A Box usa
![Endereço IP e Porta 4200](/assets/img/shell-script/shellinabox/shellinabox-login.jpg "Endereço IP e Porta 4200")
![Shell In A Box Logado](/assets/img/shell-script/shellinabox/shellinabox-logado.jpg "Shell In A Box Logado")

> Obs.: Para endereços locais, muito provavelmente o Navegador pedirá "__Confirmação de Segurança__" e "__Confirmar Exceção__"

## Configuração

No arquivo __/etc/default/shellinabox__ você pode

+ Alterar a porta de conexão, por questões de segurança
+ Informar o IP de conexão SSH
+ Alterar a inicialização automática do serviço, pois ele já setado para iniciar automaticamente.
+ entre outras configurações

Você ainda pode usar Editores de Texto pelo navegador: VI, VIM, Nano, Joe,...

Após as alterações efetuadas no arquivo __/etc/default/shellinabox__ você precisará *restartar* o serviço pra que as alterações tenham efeito
{% highlight bash %}
/etc/init.d/shellinabox restart
{% endhighlight %}

> Você também pode __alterar as cores de fundo e do terminal web clicando com o botão direito na página da conexão__, entre outras configurações.

## Página Oficial do Projeto
<http://code.google.com/p/shellinabox/>

# Faça nosso curso gratuito de Shell Script e adquira todo conteúdo nesse link
<http://www.terminalroot.com.br/shell/>

## Deixe seu comentário!

## Valeu!

![Shell In A Box Desconectado](/assets/img/shell-script/shellinabox/shellinabox-disconected.jpg "Shell In A Box Desconectado")

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

