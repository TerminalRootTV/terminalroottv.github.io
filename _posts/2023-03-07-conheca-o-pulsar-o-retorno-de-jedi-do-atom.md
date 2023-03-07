---
layout: post
title: "Conheça o PULSAR, o Retorno de Jedi do Atom"
date: 2023-03-07 19:35:41
image: '/assets/img/editores/pulsar.jpg'
description: 'Da unidade de matéria à dimensões atronômicas!'
icon: 'ion:terminal-sharp'
iconname: 'Editores de Códigos/IDE'
tags:
- editores
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Já faz algum tempo que tivemos [notícia do fim do Atom](https://github.blog/2022-06-08-sunsetting-atom/). O Atom era um [editor de códigos(ou até mesmo um IDE)](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#26-atom) desenvolvido pelo [GitHub](https://terminalroot.com.br/tags#github), no entanto, após a compra do GitHub pela Microsoft, eles deram pouca atenção ao Atom até chegar as status de: `DISCONTINUED`.

Isso porque o editor de códigos principal da Microsoft é o [VS Code](https://terminalroot.com.br/tags#vscode), então para eles não havia muito sentido manter o desenvolvimento do Atom.

Mas, nem tudo são cinzas!

Assim como o Atom é, cientificamente falando, a unidade de matéria e todos sempre procuraram similaridades do átomo com grandezas astronômicas, por exemplo, as órbitas de um sistema planetário são comparáveis por muitos, superposições de um elétron(ou [Electron](https://www.electronjs.org/), framework utilizado para criar ambos, 😛  ) . 

Dentro desse contexto nasceu o: **Pulsar**, que na ciência é uma [estrela de nêutron](https://pt.wikipedia.org/wiki/Pulsar), mais precisamente o brilho que é emitido quando o feixe de luz fica em posição *perpendicular* à "nossa observação!".

### — Mas que papo é esse de ciência?
### — E o que ele tem a ver com o [editor de texto](https://terminalroot.com.br/tags#editores) Atom?
### — Valeu por lembrar, sou tão apaixonado por esses assuntos que já estava me dispersando.

**Pulsar** é um fork do Atom! Também está disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos) e [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux).

Apesar de ser idêntico ao Atom, como ele retornou ao processo de adição de recursos, logo, podemos dizer que ele já é um Atom melhorado, ou um Atom IMproved, para os amantes do [Vim](https://terminalroot.com.br/tags#vim), seria um: Aim. 😃 🚫 

Vamos deixar de piada estilo *A Praça é Nossa* e de papo de ciência, antes de chegarmos nas: Teorias da Conspiração, e vamos ver como instalar o Pulsar.

---

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

# Instalando o Pulsar!
No [Windows](https://terminalroot.com.br/tags#windows) você tem duas opções: 
- Setup - Você instala ele no seu sistema baixando [esse arquivo](https://download.pulsar-edit.dev/?os=windows&type=windows_setup), dando um duplo clique após baixado e basta seguir o passos até o final e sempre que precisar utilizar é só procurar na lista de programas do Windows clicando no logo do Windows da Barra de Ferramentas, ou em um provável atalho, se preferir criar.
- Portable - Esse não precisa de instalação, basta [fazer o download aqui](https://download.pulsar-edit.dev/?os=windows&type=windows_portable) e dá um duplo clique no arquivo executável: `.exe`.

No [macOS](https://terminalroot.com.br/tags#macos) há as versões: 
- DMG Installer ou um arquivo compactado, para ambas formas há suporte tanto para **Apple Sillicon**, aqueles com **M1/M2**: [dmg](https://download.pulsar-edit.dev/?os=silicon_mac&type=mac_dmg) e [zip](https://download.pulsar-edit.dev/?os=silicon_mac&type=mac_zip).
- e também para versões antigas de hardware **Intel**: [dmg](https://download.pulsar-edit.dev/?os=intel_mac&type=mac_dmg) e [zip](https://download.pulsar-edit.dev/?os=intel_mac&type=mac_zip).

Em sistemas baseados em [Linux](https://terminalroot.com.br/tags#linux), lógico que precisa ser sistemas que possui camadas de suporte do [GNU](https://terminalroot.com.br/tags#gnu), ou seja, aqueles que utilizam [GNU GlibC](https://www.gnu.org/software/libc/), basta usar um [AppImage](https://terminalroot.com.br/2020/05/conheca-o-app-get-um-gerenciador-de-appimages-via-linha-de-comando.html). E para isso basta rodar os comandos:
{% highlight bash %}
wget "https://download.pulsar-edit.dev/?os=linux&type=linux_appimage" -O Pulsar.AppImage
chmod +x Pulsar.AppImage
./Pulsar.AppImage
{% endhighlight %}
> Além de AppImage há também pacotes especificos para algumas distribuições, aquelas que usam: `.deb` e `.rpm` além de um `tar.gz`. 

---

A interface, assim como a do Atom, é bem intuitiva e todas as extensões/complementos do Atom, funcionam no Pulsar. Apesar de eu ser um **[Vim](https://terminalroot.com.br/vim)/[Neovim](https://terminalroot.com.br/tags#neovim) User**, sempre gostei muito do Atom(principalmente do esquema de cores padrão) e testando o Pulsar me senti à vontade!

[![Pulsar Minivim]( /assets/img/editores/minivim-pulsar.png)]( /assets/img/editores/minivim-pulsar.png) 
> Testando o Pulsar editando o [Minivim](https://github.com/terroo/minivim), um mini editor de texto estilo Vim que eu criei para o: [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp) e que também foi disponibilizado [nesse vídeo](https://youtu.be/p7k2tiGbcwE).

Desculpa a *historinha no início*, parece até que eu queria enrolar, mas tem muita gente que gosta de vir aqui também para ler, apesar de serem poucos. Outro motivo é que existe um mínimo de palavras no seu artigo para que o Google indexe rapidamente, então é isso! 😃 

Espero que vocês gostem do Pulsar e até o próximo artigo!

---

# Links úteis
+ [Página oficial do Pulsar](https://pulsar-edit.dev/)
+ [Perfil do Pulsar no GitHub](https://github.com/pulsar-edit)
+ [Atom Community, outro fork do Atom](https://atom-community.github.io/)



