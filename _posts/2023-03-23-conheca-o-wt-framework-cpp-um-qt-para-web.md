---
layout: post
title: "Conheça o Wt Framework C++, um Qt para Web"
date: 2023-03-23 09:53:04
image: '/assets/img/cpp/wt.jpg'
description: 'Wt Framework é uma biblioteca toolkit desenvolvida com C++ Moderno baseado e inspirado no também framework Qt.'
icon: 'ion:terminal-sharp'
iconname: 'C++/Desenvolvimento Web'
tags:
- cpp
- desenvolvimentoweb
- web
- qt
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

[Wt Framework](https://www.webtoolkit.eu/) é uma biblioteca toolkit desenvolvida com [C++ Moderno](https://terminalroot.com.br/tags#cpp) que substitui o uso de [JavaScript](https://terminalroot.com.br/tags#javascript) na [Web](https://terminalroot.com.br/tags#web). 

Possui segurança nativa contra ataques [SQL](https://terminalroot.com.br/tags#sql) Injection, XSS e CSRF. Está disponível para diversas plataformas e sistemas operacionais, tais como: [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux), [Android](https://terminalroot.com.br/tags#android), RaspberyPI, [FreeBSD](https://terminalroot.com.br/tags#freebsd) e OpenSolaris.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/lfZetbL36uw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Instalação
Você pode instalar o Wt Framework de diversas formas, usando binários pré-compilados ou compilando o código fonte.
> [Veja aqui o procedimento](https://redmine.webtoolkit.eu/projects/wt/wiki/Wt_Installation) para todos os sistemas operacionais e plataformas suportadas.

Exemplo para [Ubuntu](https://terminalroot.com.br/tags#ubuntu)

---

### Instale as dependências
{% highlight bash %}
sudo apt install gcc g++ libboost-all-dev cmake
{% endhighlight %}

Você ainda pode complementar instalando também as dependências opcionais:
{% highlight bash %}
sudo apt install doxygen libgraphicsmagick3 libssl-dev libpq-dev libssl-dev libfcgi-dev
{% endhighlight %}
> No mesmo link citado acima existe o procedimento para outras distros.


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

### Compile e instale no seu sistemas
Agora é só fazer o download do pacote, compilar e instalar. Até a data de publicação desse artigo a versão mais recente é a: **4.9.1**, mas consulte [o endereço aqui na web](https://www.webtoolkit.eu/wt) para mais informações.

{% highlight bash %}
wget -c https://github.com/emweb/wt/archive/4.9.1.tar.gz
tar zxvf wt-4.9.1.tar.gz
cd wt-4.9.1/
cmake -B build .
cd build && make
sudo make install
sudo ldconfig
{% endhighlight %}

---

# Código básico
[Nesse exemplo](https://www.webtoolkit.eu/wt/doc/tutorial/wt.html) é possível obter um tipo de "Hello, World!" para ter noção de como o framework funciona. 

Crie um arquivo `main.cpp` e cole o código abaixo:

{% highlight cpp %}
#include <Wt/WApplication.h>
#include <Wt/WBreak.h>
#include <Wt/WContainerWidget.h>
#include <Wt/WLineEdit.h>
#include <Wt/WPushButton.h>
#include <Wt/WText.h>

class HelloApplication : public Wt::WApplication {
  public:
    HelloApplication(const Wt::WEnvironment& env);

  private:
    Wt::WLineEdit *nameEdit_;
    Wt::WText *greeting_;
};

HelloApplication::HelloApplication(const Wt::WEnvironment& env)
  : Wt::WApplication(env){
    setTitle("Hello world");

    root()->addWidget(std::make_unique<Wt::WText>("Your name, please? "));
    nameEdit_ = root()->addWidget(std::make_unique<Wt::WLineEdit>());
    Wt::WPushButton *button = root()->addWidget(std::make_unique<Wt::WPushButton>("Greet me."));
    root()->addWidget(std::make_unique<Wt::WBreak>());
    greeting_ = root()->addWidget(std::make_unique<Wt::WText>());
    auto greet = [this]{
      greeting_->setText("Hello there, " + nameEdit_->text());
    };
    button->clicked().connect(greet);
  }

int main(int argc, char **argv){
  return Wt::WRun(argc, argv, [](const Wt::WEnvironment& env) {
      return std::make_unique<HelloApplication>(env);
      });
}
{% endhighlight %}

Para compilar rode o seguinte comando:
{% highlight bash %}
g++ main.cpp -lwthttp -lwt
{% endhighlight %}

E para rodar, rode:
{% highlight bash %}
./a.out --docroot . --http-address 0.0.0.0 --http-port 9090
{% endhighlight %}

A aplicação estará disponível no endereço e porta: <http://0.0.0.0:9090>, abra essa url no seu navegador.


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

---

# Para mais informações acesse os links abaixo:
+ <https://github.com/emweb/wt>
+ <https://www.webtoolkit.eu/widgets>
+ <https://www.webtoolkit.eu/wt>


