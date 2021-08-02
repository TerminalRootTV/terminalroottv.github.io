---
layout: post
title: "Analise o desempenhos dos seus programas em C++ com GNU Gprof"
date: 2021-08-02 10:12:03
image: '/assets/img/cpp/gnu-gprof.jpg'
description: 'O legal desse utilitário é que ele faz parte do GNU Binutils e provavelmente já está no seu sistema.'
icon: 'ion:terminal-sharp'
iconname: 'GNU/C++'
tags:
- cpp
- cppdaily
- gnu
---

![Analise o desempenhos dos seus programas em C++ com GNU Gprof](/assets/img/cpp/gnu-gprof.jpg)

Existem diversos softwares para fazer análise de desempenho, no entanto, nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos ver como utilizar o [GNU Gprof](https://ftp.gnu.org/old-gnu/Manuals/gprof-2.9.1/html_mono/gprof.html) que faz parte do [GNU Binutils](https://www.gnu.org/software/binutils/) um pacote com diversas ferramentas úteis e que muito provavelmente já está instalado no seu sistema.

Para isso vamos ver como proceder para análisar um binário de um código.

---

Para esse exemplo vamos utilizar o seguinte código: `vim main.cpp`.

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


{% highlight cpp %}
#include <iostream>

int decrement_25mi( int );
int decrement_50mi( int );
int decrement_100mi( int );


int main( int argc, char ** argv ){
  int i = 0;
  for( int j = 0; j < 100000000; ++j){
    i++;
  }
  i = decrement_100mi(i);
  std::cout << "Contador = " << i << '\n';
  return 0;
}


int decrement_25mi( int i ){
  for( int j = 0; j < 25000000; ++j){
    --i;
  }
  return i;
}

int decrement_50mi( int i){
  i = decrement_25mi(i);
  i = decrement_25mi(i);
  return i;
}

int decrement_100mi( int i){
  i = decrement_50mi(i);
  i = decrement_25mi(i);
  i = decrement_25mi(i);
  return i;
}
{% endhighlight %}

Agora vamos compilar nosso código com a opção `-pg` para o GNU Gprof:
{% highlight bash %}
g++ -pg main.cpp
{% endhighlight %}

Agora precisamos rodar nosso binário para o GNU Gprof gerar o arquivo `gmon.out` no mesmo diretório
{% highlight bash %}
./a.out
{% endhighlight %}

Se quisermos obter os dados do desempenho basta rodar o comando:
{% highlight bash %}
gprof ./a.out
{% endhighlight %}
> A saída será extensa com diversas informações detalhadas.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Se quisermos dados gráficos que são mais fáceis de analisar, precisaremos de duas ferramentas do [Python](https://terminalroot.com.br/tags#python):
+ O [Graphiz](https://graphviz.org/download/)
+ E também o [Gprof2Dot](https://github.com/jrfonseca/gprof2dot)

Você pode usar o [PIP](https://pypi.org/project/pip/) para instalá-los
{% highlight bash %}
pip install graphviz --user
pip install gprof2dot --user
{% endhighlight %}
> Lembrando que o diretório dos binários do `pip` precisam estar na sua variável `$PATH` para você utilizar os comandos direto do seu terminal.

Após instalados, próximo passo é gerar a saída do GNU Gprof junto do binário com o `gmon.out` para um arquivo, exemplo:
{% highlight bash %}
gprof ./a.out gmon.out > report.txt
{% endhighlight %}

Agora vamos utilizar o `gprof2dot` para gerar um `.dot`:
{% highlight bash %}
gprof2dot report.txt > report.dot
{% endhighlight %}

E por fim gerar uma imagem com o comando `dot`:
{% highlight bash %}
dot -Tpng -o profile.png report.dot
{% endhighlight %}

Basta vermos a imagem e analisar o desempenho:
{% highlight bash %}
xdg-open profile.png
{% endhighlight %}

E o resultado será:

![Profile](/assets/img/cpp/profile.png)

Show, né?! Para mais informações rode: `main gprof`.

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

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










