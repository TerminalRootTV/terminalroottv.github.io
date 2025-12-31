---
layout: post
title: "Conheça o GNU Guix um Sistema para Programadores"
date: 2025-12-31 10:25:20
image: '/assets/img/gnu/gnu-guix/gnu-guix.jpg'
description: "🦬 Um sistema operacional do projeto GNU que propõe uma abordagem interessante e diferente."
icon: 'ion:terminal-sharp'
iconname: 'GNU'
tags:
- gnu
- so
- freesoftware
- distros
- gnulinux
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **GNU Guix** é uma [distro](https://terminalroot.com.br/tags#distros), gerenciador de pacotes e sistema operacional do projeto [GNU](https://terminalroot.com.br/tags#gnu) que propõe uma abordagem radicalmente diferente da maioria das distribuições [GNU/Linux](https://terminalroot.com.br/tags#gnulinux). Ele é baseado em **gerenciamento funcional**(Guix System), com foco em **reprodutibilidade**, **isolamento** e **controle total do sistema** pelo usuário.

Semelhante ao [NixOS](https://terminalroot.com.br/2021/12/nixos-um-sistema-operacional-para-programadores.html), ele usa a linguagem [GNU Guile (Scheme)](https://www.gnu.org/software/guile/) para definir pacotes, serviços e a configuração inteira do sistema.

Características:
* A saída depende apenas das entradas.
* Não há efeitos colaterais no sistema.
* Cada pacote é instalado em um diretório único no `/gnu/store`.
* **Nada sobrescreve nada**
* Versões diferentes do mesmo software coexistem sem conflito.
* Rollback instantâneo
* Perfis independentes

O GNU Guix é muito utilizado para: <b>Pesquisa científica</b>, <b>DevOps</b> e <b>Auditoria de segurança</b>.

Guix segue rigorosamente as diretrizes da **Free Software Foundation**, tornando sólida a: Liberdade do Software Livre

GNU Guix não é para quem quer "*só instalar e usar*", é para quem quer **controle**, **previsibilidade** e **sistemas declarativos de verdade**.

Se você enxerga sistema operacional como código, o Guix faz mais sentido que qualquer distro tradicional.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## Download e Instalação
Você pode fazer o download do `.iso` na [página de Downloads do GNU Guix](https://guix.gnu.org/en/download/), escolha a alternativa que convém ao seu interesse, se for instalar na sua máquina física, escolha a primeira opção: **GNU Guix System (versão)** 64-bit(*x86_64*) ou 32-bit(*i686*).

Após iniciar o *boot* com o arquivo `.iso` é só seguir os passos para instalar que, por sinal, é bem intuitivo, a primeira tela será essa, se quiser facilidade basta escolher a opção usando **modo gráfico**:

![GNU Guix install 01](/assets/img/gnu/gnu-guix/01.png) 

O GNU Guix não usa o *Kernel Linux* comercial, mas lhe oferece dois tipos de *Kernels*: 
+ [GNU Hurd](https://pt.wikipedia.org/wiki/GNU_Hurd), um kernel ainda não finalizado, mas funcional que *separa as tarefas*, já que o Linux é considerado um *systemd*(tipo uma impressora multifuncional) dos kernels, ele faz várias tarefas o que, por muitos(inclusive, Tanenbaum, criador do Minix, o qual o Linux foi inspirado), é considerado uma má ideia;
+ e também o [GNU Linux-libre](https://pt.wikipedia.org/wiki/GNU_Linux-libre) um núcleo de sistema operacional, limpo de todos *blobs binários* que possuem firmwares privados, alguns deles até criados pela NSA.

A tela da escolha é essa aqui:

![GNU Guix](/assets/img/gnu/gnu-guix/02.png) 

### Escolha do Ambiente Gráfico
Durante a instalação você também já pode definir o seu [Ambiente Desktop](https://terminalroot.com.br/2021/09/os-7-melhores-frameworks-cpp-para-criar-interface-grafica.html) ou [Gerenciador de Janelas](https://terminalroot.com.br/2022/05/instale-esse-gerenciador-de-janelas-escrito-em-cpp.html), ou até instalar o seu próprio(KDE Plasma, por exemplo), que não está na lista posteriormente, mas já nessa tela há as opções: [GNOME](https://terminalroot.com.br/tags/#gnome), [XFCE](https://terminalroot.com.br/2021/12/nixos-um-sistema-operacional-para-programadores.html), [MATE](https://terminalroot.com.br/2016/05/como-alterar-o-icone-do-painel.html), Icewm, [Openbox](https://terminalroot.com.br/2021/11/os-17-melhores-temas-para-seu-openbox.html), [AwesomeWM](https://awesomewm.org/), [i3](https://github.com/terroo/i3-radius), [Ratpoison](https://www.nongnu.org/ratpoison/) e [Emacs EXWM](https://github.com/emacs-exwm/exwm):

![GNU Guix gráfico](/assets/img/gnu/gnu-guix/03.png) 

Após essas escolhas básicas é só particionar seu disco conforme deseja e iniciar o processo de instalação... e depois após o reboot é só escolher o sistema automaticamente no GRUB:

![GNU Guix multiple screens](/assets/img/gnu/gnu-guix/04.png) 

---

## Utilização
Para instalar qualquer coisa basta usar o comando `guix` sem `sudo`, exemplo, instalar o [Vim](https://terminalroot.com.br/vim):

{% highlight bash %}
guix install vim
{% endhighlight %}

Lembrando que o GNU Guix oferece perfis independentes, logo, o [Vim](https://terminalroot.com.br/tags#vim) só estará disponível para seu usuário.

Se quiser instalar globalmente, adicione o pacote `vim` na seção `packages` do `operating-system` no caminho: `/etc/config.scm`, exemplo de inclusão na linha de `append`:

{% highlight scheme %}
(use-modules (gnu))

(operating-system
  ;; ...
  (packages
   (append
    (list vim)
    %base-packages)))
{% endhighlight %}
> Caso precise reconfigurar para enxergar: `sudo guix system reconfigure /etc/config.scm`

Depois é só instalar com `sudo`:

{% highlight bash %}
sudo guix install vim
{% endhighlight %}

Na lista de pacotes tem tudo: [GNU GCC](https://terminalroot.com.br/tags#gcc), [GNU Make](https://terminalroot.com.br/tags#make), [Clang/LLVM](https://terminalroot.com.br/tags#clang), [CMake](https://terminalroot.com.br/tags#cmake), ... Para todos os pacotes veja em:

### <https://packages.guix.gnu.org/>

Ou aqui: <https://hpc.guix.info/browse>.

![GNU Guix Terminal Root](/assets/img/gnu/gnu-guix/05.png) 

---

Para mais informações acesse: <https://guix.gnu.org/>


