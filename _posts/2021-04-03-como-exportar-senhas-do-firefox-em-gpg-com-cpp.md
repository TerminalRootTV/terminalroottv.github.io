---
layout: post
title: "Como Exportar Senhas do Firefox em GPG com C++"
date: 2021-04-03 13:01:48
image: '/assets/img/gtkmm/fox-gpg-submodule.jpg'
description: 'Novo vídeo da série de Gtkmm'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- gtkmm
---

![Como Exportar Senhas do Firefox em GPG com C++](/assets/img/gtkmm/fox-gpg-submodule.jpg)

Nesse vídeo exportamos os dados de senha e URLs salvas no [Firefox](https://terminalroot.com.br/2019/09/limpe-sua-url.html) com [C++](https://terminalroot.com.br/cpp) no formato [GPG](https://terminalroot.com.br/2019/12/gerar-senha-linux.html) com criptografia e adicionamos como biblioteca com `git submodule`.

Esse vídeo é continuação do vídeo: [Aprenda a Criar um Aplicativo Gráfico com C++ e GTKmm](https://www.youtube.com/watch?v=83vtYDbvB1Q) .

Fizemos upload dos arquivos para o [GitHub](https://terminalroot.com.br/2020/11/conheca-o-codespaces-um-ide-do-github-direto-no-navegador.html) e se você quiser testar basta fazer o seguinte:
{% highlight bash %}
git clone https://github.com/terroo/pass-firefox
cd pass-firefox
git submodule update --init
make
./app-pass-firefox
{% endhighlight %}

# Assista ao vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/bdExgjQUi9U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e [SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html)) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

# Fui!

<!-- RETANGULO LARGO -->
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


