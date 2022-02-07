---
layout: post
title: "Nyxt, um navegador estilo Emacs feito com Common Lisp"
date: 2022-02-07 13:10:21
image: '/assets/img/web/nyxt.jpg'
description: 'Todo o seu código-fonte pode ser modificado e ajustado para sua especificação exata.'
icon: 'ion:terminal-sharp'
iconname: 'Lisp'
tags:
- lisp
- web
- browser
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Nyxt Browser](https://nyxt.atlas.engineer/) é um navegador da web que pode ser totalmente hackeável - todo o seu código-fonte pode ser introspectivo, modificado e ajustado para sua especificação exata.

Foi escrito em [Lisp](https://nyxt.atlas.engineer/) e baseado em comandos estilo [Emacs](https://terminalroot.com.br/2018/07/spacemacs-um-editor-para-desenvolvimento-profissional.html) .

---

# Instalação
Existem diversas formas de instalar o Nyxt no seu sistema. Apesar de estar disponível oficialmente para [Linux](https://terminalroot.com.br/tags#linux), pode ser também instalado no [macOS](https://terminalroot.com.br/tags#macos) e [FreeBSD](https://terminalroot.com.br/tags#freebsd) .

Para Linux a forma de instalação pode depender da sua distribuição, no entanto, independente da sua [distribuição](https://terminalroot.com.br/tags#distros) há uma forma que serve para todas e não precisa de nenhuma dependência e é a forma que eu recomendo, mas ao final desse artigo há links que você pode ver como instalar de outra forma .

+ Primeiramente crie um diretório local de nome `nyxt` e entre no mesmo:
{% highlight sh %}
mkdir nyxt && cd nyxt
{% endhighlight %}

+ Faça o download do arquivo compactado:
> Essa é a versão mais recente de acordo com esse artigo.
{% highlight sh %}
wget https://github.com/atlas-engineer/nyxt/releases/download/2.2.4/nyxt-2.2.4.tar.xz 
{% endhighlight %}


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

+ Descompacte o arquivo:
{% highlight sh %}
tar Jxvf nyxt-2.2.4.tar.xz
{% endhighlight %}
> A partir desse momento você já pode testar o Nyxt rodando o comando: `./usr/local/bin/nyxt`

+ Após descompactado, remova o arquivo `tar.xz`:
{% highlight sh %}
rm nyxt-2.2.4.tar.xz
{% endhighlight %}

+ Saia do diretório e mova o diretório `nyxt` para `/opt`
{% highlight sh %}
cd ..
sudo mv nyxt/ /opt/
{% endhighlight %}

+ Agora crie um link simbólico para `/usr/local/bin`:
{% highlight sh %}
sudo ln -s /opt/nyxt/usr/local/bin/nyxt /usr/local/bin/nyxt
{% endhighlight %}
> A partir desse momento você já pode testar o Nyxt rodando somente o comando: `nyxt`

+ Torne possível acessá-lo pelo [Launcher](https://terminalroot.com.br/2020/01/os-12-melhores-launchers-para-linux.html) ou Dashboard do seu sistema e copie o `.desktop` para o Launcher:
{% highlight sh %}
find /opt/nyxt/ -name "nyxt.desktop" -exec sudo cp {} /usr/share/applications/ \;
{% endhighlight %}

+ Altere o caminho do executável do arquivo `nyxt.desktop`:
{% highlight sh %}
sudo sed -i 's/Exec.*/Exec=nyxt %u/g' /usr/share/applications/nyxt.desktop
{% endhighlight %}

+ Defina o caminho padrão para o ícone do Nyxt ser exibido corretamente:
{% highlight sh %}
sudo cp $(find /opt/nyxt/ -name "nyxt.png" | grep 256x256) /usr/share/pixmaps/
{% endhighlight %}

Agora teste tentando encontrá-lo e abrindo pelo seu Launcher/Dashboard.
> No meu caso que uso o [Rofi](https://terminalroot.com.br/2020/05/como-customizar-o-rofi-like-a-foss.html):
[![Nyxt Launcher Rofi](/assets/img/web/nyxt-rofi.jpg)](/assets/img/web/nyxt-rofi.jpg)
> Clique na imagem para abrir em uma nova guia para uma visualização maior.


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

# Utilização
Assim que você abre o Nyxt pela primeira vez a página inicial já lhe oferece links para: **Atalhos de teclados**, **Tutoriais** e entre outros, mas os procedimentos básicos para navegar são:
> Lembre que em [Emacs](https://terminalroot.com.br/2018/07/spacemacs-um-editor-para-desenvolvimento-profissional.html) quase tudo são combinações com as teclas **Ctrl** e **Alt**, onde **C** é o *Ctrl* e o **M** é o *Alt* .

+ `C-l`(Ctrl + L): Abrir uma URL , se você não digitar o protocolo, ex.: `https://terminalroot.com.br/` ele pesquisará por padrão no [DuckDuckGo](https://terminalroot.com.br/2019/10/como-pesquisar-no-google-e-duckduckgo-via-linha-de-comando.html) o nome/URL digitada.
+ `C-r`: Atualizar a página (Recarregar o buffer)
+ `M-l`(Alt + L): Abre a URL em um novo buffer
+ `C-[, C-]`: Alternar buffer
+ `M-[`: Retorna à página anterior durante a navegação
+ `M-]`: Avança à página acessada durante a navegação
+ `C-j`: Exibe todos os link clicáveis da página - Depois digite as duas letras que aparece do link e pressione ENTER
+ `C-q`: Sair do Nyxt Browser
+ `C-space`: Para executar um comando
+ `F1 b`: Exibe todas as teclas de atalho
+ `Esc`: Fecha o menu inferior quando estiver aberto.

Na barra inferior do navegador há possibilidade de alterar abas, abrir menu, recarregar a página e entre outros usando somente o clique co o mouse:

[![Nyxt Bottom Bar](/assets/img/web/nyxt-bottom-bar.png)](/assets/img/web/nyxt-bottom-bar.png)
> Clique na imagem para abrir em uma nova guia para uma visualização maior.

---

Para outras formas de instalação e documentação completa acesse os links abaixo:
+ <https://github.com/atlas-engineer/nyxt>
+ <https://nyxt.atlas.engineer/documentation>
+ <https://nyxt.atlas.engineer/download>
+ <https://github.com/atlas-engineer/nyxt/blob/master/documents/README.org>

