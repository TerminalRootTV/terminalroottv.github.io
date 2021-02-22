---
layout: post
title: "Repositório e detalhes do Software escrito em C++ do Drone da NASA em Marte"
date: 2021-02-22 15:36:36
image: '/assets/img/cpp/ingenuity-nasa.jpe'
description: 'Saiba como instalar e/ou contribuir .'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- nasa
---

![Repositório e detalhes do Software escrito em C++ do Drone da NASA em marte](/assets/img/cpp/ingenuity-nasa.jpe)

No dia 18 de fevereiro desse ano(2021) a [NASA](https://www.nasa.gov/) enviou seu quarto robô(**Perseverance**) para [Marte](https://www.nasa.gov/). Essa operação possui recursos mais avançados em comparação com os robôs anteriores.

O **Perseverance** possui um **drone**(o **Ingenuity**) acoplado à sua estrutura física que fará em torno de quatro vôos por mês para analisar o território marciano.

O Ingenuity por sua vez, além de possuir o sistema operacional [Linux](https://terminalroot.com.br/tags#linux) instalado, utilizará um software criado com [C++](https://terminalroot.com.br/cpp), (**F´, fprime** para esses vôos. Não é de hoje que [C++](https://terminalroot.com.br/cpp) já está em Marte, desde sondas anteriores, a NASA usa-o como ferramenta para cáculos precisos, como por exemplo, o sistema de pouso do robô anterior, o Curiosity, também foi escrito em [C++](https://terminalroot.com.br/cpp) e muito provavelmente o pouso do Perseverance também.

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

# Detalhes do F´(fprime)
**F´(fprime)**, originalmente desenvolvido no **Jet Propulsion Laboratory da NASA**, é um [software](https://terminalroot.com.br/tags#softwarelivre) de [código aberto](https://terminalroot.com.br/tags#opensource) que foi implantado com sucesso para várias aplicações espaciais. Ele tem sido usado, mas não está limitado a, CubeSats, SmallSats, instrumentos e implementáveis.

F´ possui as seguintes características:
+ Arquitetura de componentes com interfaces bem definidas
+ Estrutura [C++](https://terminalroot.com.br/cpp) que fornece recursos básicos como filas, threads e abstração do [sistema operacional](https://terminalroot.com.br/linux)
+ Ferramentas para projetar sistemas e gerar código automaticamente a partir do projeto de sistemas
+ Uma biblioteca padrão de componentes dignos de voo
+ Ferramentas de teste para teste em nível de unidade e sistema

---

# Recursos do F´

| F´ | Resources |
|---|---|
| Recursos                            | [Recursos](https://nasa.github.io/fprime/features.html) |
| Projetos                            | [Projetos](https://nasa.github.io/fprime/projects.html) |
| Instalação                          | [INSTALL.md](https://nasa.github.io/fprime/INSTALL.html) |
| Tutoriais                           | [Tutoriais](https://nasa.github.io/fprime/Tutorials/README.html) |
| Guia do usuário                     | [Guia do usuário](https://nasa.github.io/fprime/UsersGuide/guide.html) |
| Repositório                         | [https://github.com/nasa/fprime](https://github.com/nasa/fprime) |
| Fórum e lista de discussão          | [https://groups.google.com/d/forum/fprime-community](https://groups.google.com/d/forum/fprime-community) |
| GitHub da comunidade                | [https://github.com/fprime-community](https://github.com/fprime-community) |
| referência padrão para o aplicativo | [Ref](https://github.com/nasa/fprime/blob/master/Ref/README.md) |
| Referência para o Raspberry PI      | [RPI](https://github.com/nasa/fprime/blob/master/RPI/README.md) |
| Visão geral da arquitetura          | [Arquiterura](https://nasa.github.io/fprime/Architecture/FPrimeArchitectureShort.pdf) |

---

# Requisitos para o F´
Para desenvolver aplicativos com F´, os seguintes requisitos do sistema do usuário devem ser atendidos.
+ Sistema operacional [Linux](https://terminalroot.com.br/2021/02/os-6-melhores-scanners-de-rede-para-linux.html) ou [Mac OS X](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) (ou subsistema [Windows](https://terminalroot.com.br/2018/03/como-usar-o-shell-bash-no-windows.html) para [Linux](https://terminalroot.com.br/tags#linux) no [Windows](https://terminalroot.com.br/2019/08/assista-agora-o-filme-piratas-do-vale-do-silicio.html))

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

+ [CMake](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html)
+ [Bash](https://terminalroot.com.br/bash) ou [shell](https://terminalroot.com.br/shell) compatível com [Bash](https://terminalroot.com.br/shell)
+ Compilador [CLang](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) ou [GCC](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html)
+ [Python 3](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html) e [PIP](https://terminalroot.com.br/2021/01/termgraph-desenhe-graficos-no-terminal.html)

---

# Guia rápido de Instalação

**F´** pode ser rapidamente instalado e pronto para uso clonando o repositório GitHub, instalando o código Python (normalmente em um ambiente virtual) e desenvolvendo nossos aplicativos de referência. Para obter instruções de instalação completas, consulte: [INSTALL.md](https://nasa.github.io/fprime/INSTALL.html).

+ Clonar e instalar:
{% highlight bash %}
git clone https://github.com/nasa/fprime.git
cd fprime
pip install --upgrade wheel setuptools pip
pip install Fw/Python Gds/
{% endhighlight %}

+ Construir a aplicação
{% highlight bash %}
cd Ref
fprime-util generate
fprime-util install
{% endhighlight %}

# Referências adicionais
Informações completas sobre o código e [F´](http://github.com/nasa/fprime) estão disponíveis em nossa página do Github: <http://github.com/nasa/fprime>.
Para começar, siga o [guia de instalação](https://nasa.github.io/fprime/INSTALL.html). Em seguida, inspecione a [referência](https://github.com/nasa/fprime/blob/master/Ref/README.md), a [referência do rapberry pi](https://github.com/nasa/fprime/blob/master/Ref/README.md) ou os [tutoriais](https://nasa.github.io/fprime/Tutorials/README.html).

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


