---
layout: post
title: "Instale o editor Turbo para C/C++ e mate saudade do Turbo Vision"
date: 2021-05-10 12:19:44
image: '/assets/img/cppdaily/turbo.png'
description: 'Para aqueles que curtem uma nostalgia!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
---

![Instale o editor Turbo para C/C++ e mate saudade do Turbo Vision](/assets/img/cppdaily/turbo.png)

No [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vou dar uma dica de um editor de texto nostálgico!!!

Há muito tempo atrás eu tentei aprender [C++](https://terminalroot.com.br/cpp) e o editor que me indicaram foi o [Turbo Vision](https://en.wikipedia.org/wiki/Turbo_Vision) e isso no [Windows XP](https://pt.wikipedia.org/wiki/Windows_XP) 😛 !!!

Eu não cheguei a obter sucesso nos estudos daquela época, mas notei que o Turbo Vision era o queridinho da época. Se você é dessa época ou se não é, mas é um estilo [hipster](https://pt.wikipedia.org/wiki/Hipster) ou um *retrô lover*, vai curtir o **Turbo** que é uma tentativa de recriar o visual do Turbo Vision.

Turbo é um editor de texto experimental para o terminal, baseado no componente de edição de código Scintilla de Neil Hodgson e no framework de aplicação Turbo Vision e utiliza a biblioteca [NCURSES](https://terminalroot.com.br/ncurses) .

Ele foi criado para demonstrar os novos recursos do Turbo Vision. Em particular, serviu como campo de testes para os recursos Unicode do Turbo Vision.

Como editor de texto, o Turbo pretende ser intuitivo e fácil de usar. Usabilidade e produtividade são seus outros dois grandes objetivos, embora ainda não tenha chegado tão longe. E apenas por ser um aplicativo Turbo Vision, oferece um visual vintage.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


---

# Instalação
Eu tentei compilar como tinha no *README.md* do projeto, mas obtive problemas. Consultei o [issue](https://github.com/magiblot/turbo/issues/4) relacionado à isso e vi que as informações estão bem dispersas e não conclusas.

Então, vou lhe mostrar aqui de forma atualizada como eu procedi.

Primeiramente tenhas as dependências instaladas, exemplo em um sistema que usa o APT, seria:
{% highlight bash %}
sudo apt install cmake build-essential git libfmt-dev libmagic-dev libgpm-dev libncursesw5 libncursesw5-dev clang pkg-config libxcb1-dev
{% endhighlight %}

Depois precisa clonar de forma recursiva
{% highlight bash %}
git clone --recursive https://github.com/magiblot/turbo
{% endhighlight %}

Próximo passo é entrar no diretório `tvision`, no issue eles informam o caminho incorreto, logo o certo é:
{% highlight bash %}
cd turbo/deps/tvision
{% endhighlight %}

E compilar o `tvision`
{% highlight bash %}
cmake . -B ./build && cmake --build ./build
{% endhighlight %}

Então voltar para a raíz do projeto e compilar:
{% highlight bash %}
cd ../../../turbo
{% endhighlight %}

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


Rodar o [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html)
{% highlight bash %}
cmake .
{% endhighlight %}

E finalmente compilar com [Make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html)
{% highlight bash %}
make
{% endhighlight %}

O binário final é o `turbo` e pode ser executado: `./turbo` ou instalado, exemplo:
{% highlight bash %}
sudo cp turbo /usr/local/bin
{% endhighlight %}

Resumindo os passos em sequência são:
{% highlight bash %}
git clone --recursive https://github.com/magiblot/turbo
cd turbo/deps/tvision
cmake . -B ./build && cmake --build ./build
cd ../../../turbo
cmake .
make
./turbo
{% endhighlight %}

![Turbo no Gentoo](/assets/img/cppdaily/tubo-gentoo.png)

Legalzão, né?!

Repositório do Turbo: <https://github.com/magiblot/turbo>

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!


