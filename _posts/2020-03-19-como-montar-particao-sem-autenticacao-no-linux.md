---
layout: post
title: "Como Montar Partição sem Autenticação no Linux"
date: 2020-03-19 10:11:44
image: '/assets/img/dicas/autenticacao-montar-particao.jpg'
description: 'Facilita o acesso à outros dispositivos.'
tags:
- linux
- dicas
- polkit
---
	
![Como Montar Partição sem Autenticação no Linux](/assets/img/dicas/autenticacao-montar-particao.jpg)

Quando você vai acessar uma partição via interfaçe gráfica em alguns sistemas como [Gentoo](https://terminalroot.com.br/2020/03/10-dicas-fundamentais-para-seu-gentoo-linux.html) e [Debian](https://terminalroot.com.br/2017/09/como-instalar-o-debian-remotamente-via-ssh.html), por exemplo, é pedido que você insira sua senha de `sudo` ou `root` como no exemplo abaixo:
![Autenticação GNOME](/assets/img/dicas/autenticacao-montar-particao-gnome.png)

No caso de um [gerenciador de janelas](https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html), como [bspwm](https://terminalroot.com.br/2018/09/bspwm-review.html) por exemplo, se você não iniciou o [Polkit](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html) manualmente ou no seu arquivo de início de sessão ele não abre o [Gksudo](https://linux.die.net/man/1/gksudo) e mostra um erro similar à imagem representada abaixo:
![Não foi possível - bspwm](/assets/img/dicas/nao-foi-possivel-bpspwm.png)

Mas você pode configurar para montar automaticamente sem pedir senha, da seguinte maneira:

## No [Gentoo](https://gentoo.org/):
Abra o arquivo `/usr/share/polkit-1/actions/org.freedesktop.UDisks2.policy`
{% highlight bash %}
sudo vim /usr/share/polkit-1/actions/org.freedesktop.UDisks2.policy
{% endhighlight %}

## No [Debian](https://terminalroot.com.br/2017/09/como-instalar-debian-gnu-kfreebsd.html):
Abra o arquivo `/usr/share/polkit-1/actions/org.freedesktop.UDisks2.policy`
{% highlight bash %}
sudo vim /usr/share/polkit-1/action/org.freedesktop.udisk2.policy
{% endhighlight %}

E no trecho(`<action id="org.freedesktop.udisks2.filesystem-mount-system">` , na tag `defaults`) similar ao abaixo, troque as informações: **auth_admin** por **yes**

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
<action id="org.freedesktop.udisks2.filesystem-mount-system">
    <description>Mount a filesystem on a system device</description>
    <description xml:lang="zh_TW">在系統裝置掛載檔案系統</description>
    <description xml:lang="zh_CN">在系统设备上挂载文件系统</description>
    <description xml:lang="uk">Змонтувати файлову систему на пристрої зберігання системи</description>
    <description xml:lang="tr">Bir sistem aygıtı üzerinde bir dosya sistemi bağla</description>
    ....
    <defaults>
    <allow_any>auth_admin</allow_any>
    <allow_inactive>auth_admin</allow_inactive>
    <allow_active>auth_admin_keep</allow_active>
    </defaults>
</action>
{% endhighlight %}

Deixando assim:

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight bash %}
<action id="org.freedesktop.udisks2.filesystem-mount-system">
    <description>Mount a filesystem on a system device</description>
    <description xml:lang="zh_TW">在系統裝置掛載檔案系統</description>
    <description xml:lang="zh_CN">在系统设备上挂载文件系统</description>
    <description xml:lang="uk">Змонтувати файлову систему на пристрої зберігання системи</description>
    <description xml:lang="tr">Bir sistem aygıtı üzerinde bir dosya sistemi bağla</description>
    ....
    <defaults>
    <allow_any>yes</allow_any>
    <allow_inactive>yes</allow_inactive>
    <allow_active>yes</allow_active>
    </defaults>
</action>
{% endhighlight %}

Depois nem precisa reiniciar nada, basta tentar montar de agora em diante
> Se não conseguir, tente alterar também no arquivo que tem a informação **Udisk** ou **udisk2**

No [i3wm](https://terminalroot.com.br/2018/07/como-instalar-e-configurar-o-i3wm-e-o-i3blocks.html) , se quiser que peça senha em vez de montar automaticamente, adicione essa linha ao seu **config**: `exec_always --no-startup-id /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &`, no caso do Debian.

## Sobre o Polkit
O Polkit é um componente para controlar privilégios em todo o sistema em sistemas operacionais semelhantes ao Unix. Ele fornece uma maneira organizada para processos não privilegiados se comunicarem com os privilegiados. O Polkit permite um nível de controle da política do sistema centralizado.

Desde a versão 0.105, lançada em abril de 2012, o nome do projeto foi alterado do PolicyKit para o polkit para enfatizar que o componente do sistema foi reescrito e que a API foi alterada, quebrando a compatibilidade com versões anteriores, [saiba mais](https://en.m.wikipedia.org/wiki/Polkit).

## Links úteis:
+ [Polkit](https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html)
+ [Polkit, Gentoo Wiki](https://wiki.gentoo.org/wiki/Polkit)
+ [Exemplo de config para o i3wm](https://github.com/terroo/fonts/blob/master/files/i3/config)
+ [How to mount internal device without needing password?](https://forums.linuxmint.com/viewtopic.php?t=152357)


