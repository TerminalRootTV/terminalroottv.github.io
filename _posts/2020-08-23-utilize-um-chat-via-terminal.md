---
layout: post
title: "Utilize um Chat via Terminal"
date: 2020-08-23 01:48:37
image: '/assets/img/terminal/weechat.jpg'
description: 'WeeChat é um cliente IRC distribuído sob os termos da licença GNU GPLv3.'
icon: 'heroicons-solid:chat-alt-2'
iconname: 'weechat'
tags:
- terminal
- gnulinux
- bsd
---

![Utilize um Chat via Terminal](/assets/img/terminal/weechat.jpg)

[WeeChat](https://weechat.org/) é um cliente [IRC](https://pt.wikipedia.org/wiki/Internet_Relay_Chat) distribuído sob os termos da licença [GNU General Public License 3](https://www.gnu.org/licenses/gpl-3.0.pt-br.html) e vem sendo desenvolvido desde 2003.

Ele é extensível para diversas linguagens como: [C](https://terminalroot.com.br/tags/#linguagemc), [Python](https://terminalroot.com.br/tags/#python), [Perl](https://www.perl.org/), [Ruby](https://terminalroot.com.br/tags/#ruby), [Lua](https://terminalroot.com.br/tags/#lua), Tcl, Scheme, [Javascript](https://youtu.be/HI6YZJxoaIQ) e [PHP](https://terminalroot.com.br/php/).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Utilize o gerenciador de pacotes da sua distribuição, exemplos:
{% highlight bash %}
emerge weechat # Gentoo, Funtoo, ...
sudo apt install weechat # Debian, Ubuntu, Mint, ...
sudo pacman -S weechat # Arch, Manjaro, ...
sudo dnf install weechat # Red Hat, CentOS, Fedora, ...
{% endhighlight %}

O WeeChat também está disponível para: [OpenBSD](https://terminalroot.com.br/tags/#openbsd), [NetBSD](https://www.youtube.com/watch?v=OWiokP4ZUek), [FreeBSD](https://terminalroot.com.br/tags/#freebsd), [GNU Hurd](https://terminalroot.com.br/tags/#gnu), [macOS](https://terminalroot.com.br/tags/#macos), [Solaris](https://www.oracle.com/br/solaris/solaris11/) e entre outros.

# Utilização

+ 01. `weechat` - Abre o WeeChat;
+ 02. `/help` - Obtém ajuda;
+ 03. `/quit` - Sai do WeeChat;
+ 04. `/clear` ou somente o alias `CL` - Limpa o buffer;
+ 05. `/server add freenode chat.freenode.net` - Adiciona um server, nesse exemplo o do [freenode.net](https://freenode.net) o mais conhecido;
+ 06. `/connect freenode` - Conecta ao freenode sem nickname e sem canal;
+ 07. `/join #gentoo` - Entra no canal <b>#gentoo</b> ou cria um canal temporário para uso;
+ 08. `/nick marcosgentoo` - Define seu nickname para marcosgentoo;
+ 09. `/msg user "Minha mensagem"` - Envia uma mensagem privada para <b>user</b>, para todos do canal basta digitar e presionar enter;
+ 10. `/close` - Sair de um canal ou de um chat privado;
+ 11. `/disconnect` - Desconectar do Servidor.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Se quiser fazer testes online, sugiro você testar com: <https://webchat.freenode.net/>

# Alguns Atalhos
+ `Alt + ←`, `Alt + ↓`, ..., `F5` ou `F6` - Navega pelo painel lateral para escolher para quem enviar, por exemplo: usuário específico ou todo canal;
+ `F12` - Faz scroll nos nomes dos usuários online;
+ `Alt + l` - Troca o estilo do layout;

# Registrando um usuário
Se quiser possuir um nickname registrado, use o comando:
{% highlight bash %}
/msg NickServ REGISTER YourPassword youremail@example.com
{% endhighlight %}
Logar com seu usuário registrado:
{% highlight bash %}
/connect chat.freenode.net 6667 YourNick:YourPassword
{% endhighlight %}

Sempre que usar e quiser perguntar alguma coisa, junte-se ao canal: **#terminalroot** e vamos lá bater um papo!

# Assista ao vídeo
<iframe width="1234" height="694" src="https://www.youtube.com/embed/gi36Ap9PIB0 " frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

É possível ainda realizar muita coisa com o WeeChat, para isso sugiro você consultar a documentação nos links:
+ <https://weechat.org/files/doc/stable/weechat_quickstart.en.html>
+ <https://weechat.org/doc>
+ <https://wiki.gentoo.org/wiki/WeeChat>
+ <https://pt.wikipedia.org/wiki/WeeChat>
E para mais dicas do freenode.net:
+ <https://freenode.net/kb/answer/registration>




