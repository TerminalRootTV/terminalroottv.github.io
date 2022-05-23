---
layout: post
title: "Como instalar o GTKMM 4 no Ubuntu 22.04"
date: 2022-05-23 12:51:04
image: '/assets/img/gtkmm/synfig-gtkmm.png'
description: 'Até o momento desse artigo a única versão disponível no repositório é 3.0 .'
icon: 'ion:terminal-sharp'
iconname: 'gtkmm'
tags:
- gtkmm
- cpp
- cppdaily
---

![Synfig Studio, feito com gtkmm]({{ page.image }} '{{ page.description }}')
> [Synfig Studio](https://www.synfig.org/) é um dos diversos software que foi feito com gtkmm

---

Nós já publicamos alguns vídeos sobre [gtkmm](https://terminalroot.com.br/tags#gtkmm), além de detalharmos e criarmos alguns apps com **gtkmm** e também com [Glade](https://terminalroot.com.br/2016/11/blog-linux-crie-aplicacoes-graficas-no-linux-com-glade.html) no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp), mas com a versão 3. 

Clique [aqui](https://www.youtube.com/watch?v=83vtYDbvB1Q&list=PLUJBQEDDLNclqDgPBN9Y2iHPqUBiDEcZc) para assistir a [série completa no canal do Youtube](https://www.youtube.com/watch?v=83vtYDbvB1Q&list=PLUJBQEDDLNclqDgPBN9Y2iHPqUBiDEcZc) .

Mas o **gtkmm-4.0** tem diversas novas melhorias e facilidades.

Nesse artigo vamos ver como compilar no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) 22.04 .
> Antes de seguir esse tutorial, verifique se já está disponível a versão 4 no repositório, pois algumas distros já possui. Mas de qualquer forma servirá de aprendizado ou para novas versões! 😃 

---

# Dependências
Instale as dependências de construção

O GNOME utliza por padrão o [Meson](https://terminalroot.com.br/tags#meson), mas em todos os pacotes há alternativa para compilar com [GNU Autotools](https://terminalroot.com.br/tags#autotools), nesse caso vamos compilar tudo com Autotools:
> É bom também possuir o [gtkmm-3.0](https://terminalroot.com.br/tags#gtkmm) para já resolver outras dependências. Além do [Gtk4](https://www.gtk.org/) .

{% highlight sh %}
sudo apt install build-essential git g++ autotools-dev libgtkmm-3.0-dev \
         libgtkmm-3.0-doc mm-common libgtk-4-bin \
         libgtk-4-common libgtk-4-dev libgtk-4-doc pkg-config
{% endhighlight %}

Agora vamos utilizar as versões atualizadas, sem elas não dá pra continuar, clique nos links se já houver uma versão mais recente, baixe a mais recente. Ele aceita essas versões ou superiores.

É necessário possuir o [SigC++-3.07](https://github.com/dbus-cxx/libsigc--3.0):
{% highlight sh %}
wget ftp://ftp.acc.umu.se/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.7.tar.xz
tar Jxvf libsigc++-3.0.7.tar.xz
cd libsigc++-3.0.7/
./autogen.sh --prefix=/usr/local
make
sudo make install
{% endhighlight %}

É necessário possuir o [giomm-2.68](https://gitlab.gnome.org/GNOME/glibmm) e para obtê-lo compilamos/instalamos a [glibmm-2.68](https://gitlab.gnome.org/GNOME/glibmm):
{% highlight sh %}
wget https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.tar.xz
tar Jxvf glibmm-2.68.2.tar.xz
cd glibmm-2.68.2/
./autogen.sh --prefix=/usr
make
sudo make install
{% endhighlight %}

É necessário possuir a versão mais recente do [cairomm](https://github.com/freedesktop/cairomm):
{% highlight sh %}
git clone https://github.com/freedesktop/cairomm
cd cairomm
./autogen.sh --prefix=/usr
make
sudo make install
{% endhighlight %}

E por final o [pangomm-2.50](https://download.gnome.org/sources/pangomm/2.50/):
{% highlight sh %}
wget https://download.gnome.org/sources/pangomm/2.50/pangomm-2.50.0.tar.xz
tar Jxvf pangomm-2.50.0/
cd pangomm-2.50.o/
./autogen.sh --prefix=/usr
make
sudo make install
{% endhighlight %}

Se quise ver o caminho onde todos são instalados veja [aqui](https://gist.github.com/terroo/812d4cc385e64058d7f23341fb857aa8) .


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

# Compilar e instalar o [gtkmm-4.0](http://www.gtkmm.org/)

Faça o download e verifique a [hash](https://terminalroot.com.br/tags#hash)
{% highlight sh %}
wget https://download.gnome.org/sources/gtkmm/4.6/gtkmm-4.6.1.tar.xz
wget https://download.gnome.org/sources/gtkmm/4.6/gtkmm-4.6.1.sha256sum
sha256sum -c --ignore-missing gtkmm-4.6.1.sha256sum
{% endhighlight %}
> Se aparecer: `gtkmm-4.6.1.tar.xz: SUCESSO` é porque está tudo certo e podemos proceder, caso contrário faça novamente o download dos arquivos.

Descompacte, compile e instale
{% highlight sh %}
tar Jxvf gtkmm-4.6.1.tar.xz
cd gtkmm-4.6.1
./autogen.sh --prefix=/usr
make
sudo make install
{% endhighlight %}

---

# Verificando a `libsigc-3.0.so`
Rode o comando:

{% highlight sh %}
ls /usr/lib/libsigc-3*
{% endhighlight %}

Se não encontrar nada, CRIE esses links simbólicos:

{% highlight sh %}
sudo ln -s /usr/local/lib/libsigc-3.0.so.0.0.0 /usr/lib/libsigc-3.0.so.0.0.0
sudo ln -s /usr/local/lib/libsigc-3.0.la /usr/lib/libsigc-3.0.la
sudo ln -s /usr/local/lib/libsigc-3.0.so /usr/lib/libsigc-3.0.so
sudo ln -s /usr/local/lib/libsigc-3.0.so.0 /usr/lib/libsigc-3.0.so.0
{% endhighlight %}
> Se algum deles não houver em `/usr/local/lib`, basta ignorar e criar somente dos que existem.

Isso resolverá problemas ao rodar nosso programa!

---

# Testando o gtkmm-4.0
Crie um arquivo de nome qualquer, exemplo `main.cpp` e insira o conteúdo abaixo:

{% highlight cpp %}
#include <gtkmm.h>

class MyWindow : public Gtk::Window {
public:
  MyWindow();
};

MyWindow::MyWindow(){
  set_title("Basic application");
  set_default_size(800, 450);
}

int main(int argc, char ** argv){
  auto app = Gtk::Application::create("org.gtkmm.examples.base");
  return app->make_window_and_run<MyWindow>(argc, argv);
}
{% endhighlight %}

Compile e rode:

{% highlight sh %}
g++ main.cpp $(pkg-config gtkmm-4.0 --cflags --libs)
./a.out
{% endhighlight %}

Se todas as etapas foram seguidas corretamente, aparecerá essa janela:

![gtkmm-4.0 running](/assets/img/gtkmm/gtkmm-4-running.png) 

<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# [Aprenda C++](https://terminalroot.com.br/cpp)
## <https://terminalroot.com.br/cpp>

---

# Links úteis
+ <http://www.gtkmm.org/>
+ <https://en.wikipedia.org/wiki/Gtkmm>
+ <https://developer-old.gnome.org/gtkmm-tutorial/stable/sec-basics-simple-example.html.en>
+ <https://developer-old.gnome.org/gtkmm-tutorial/stable/sec-install-unix-and-linux.html.en>
+ <https://download.gnome.org/sources/gtkmm/4.6/>
+ <https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec2.md>
+ <https://github.com/dbus-cxx/libsigc--3.0>
+ <https://www.linuxfromscratch.org/blfs/view/11.0/general/libsigc3.html>
+ <https://github.com/libsigcplusplus/libsigcplusplus>
+ <https://github.com/ToshioCP/Gtk4-tutorial/blob/main/gfm/sec2.md>
+ <https://github.com/freedesktop/cairomm>
+ <https://download.gnome.org/sources/pangomm/2.50/>



