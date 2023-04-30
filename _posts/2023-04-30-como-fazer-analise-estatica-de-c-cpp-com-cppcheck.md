---
layout: post
title: "Como Fazer Análise Estática de C/C++ com Cppcheck"
date: 2023-04-30 19:12:47
image: '/assets/img/cpp/cppcheck.jpg'
description: 'Enxerga falhas que nem você e nem seu compilador conseguem encontrar.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- linguagemc
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

As linguagens de programação [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) existem diversas ferramentas opcionais que: sabendo usá-las, serão essenciais para escrever um *código seguro*. 

Por isso são linguagens recomendadas para profissionais da área, caso contrário, a pessoa deve procurar linguagens mais fáceis e que gerenciam coisas de forma automática onde muitas vezes o programador(a) nem sabe o que realmente está fazendo. C e C++ é como um **painel de controle de um avião**, e as vezes as pessoas estão querendo usá-las como um *controle de TV*.

Uma das formas essenciais de não trocar "*gato por lebre*" é fazer: ANÁLISE ESTÁTICA.

---

# O que é Análise Estática?
Análise Estática, em resumo, é encontrar *bugs* no seu código sem executá-lo. Por isso tem esse nome: *estático*, se fizermos as análises durante a execução do programa seria uma *análise dinâmica*. 

Geralmente essas análises são feitas por programas adicionais que conseguem enxergar detalhes que nem você e nem seu compilador identifica.

Nesse artigo veremos como utilizar o **Cppcheck** que é uma das ferramentas mais conhecidas e fáceis de usar para análise estática em códigos escritos em C/C++.

---

# Sobre o Cppcheck
Cppcheck é uma ferramenta de análise de código estático para as linguagens de programação C e C++ . É uma ferramenta versátil que pode verificar códigos não padronizados. Cppcheck é um [software livre](https://terminalroot.com.br/tags#freesoftware) feito sob a licença [GNU General Public License](https://terminalroot.com.br/tags#gnu).

Cppcheck oferece suporte a uma ampla variedade de verificações estáticas que podem não ser cobertas pelo próprio compilador. Essas verificações são análises estáticsa que podem ser executadas no nível do código-fonte.

Algumas das verificações suportadas incluem:
+ Verificação automática de variáveis
+ Verificação de limites para saturações de matriz
+ Verificação de classes (por exemplo, funções não utilizadas, inicialização de variáveis e duplicação de memória)
+ Uso de funções obsoletas ou substituídas de acordo com o Open Group
+ Verificação de segurança de exceção, por exemplo, uso de alocação de memória e verificações de destruidor
+ Vazamentos de memória, por exemplo, devido à perda de escopo sem desalocação
+ Vazamentos de recursos, por exemplo, devido ao esquecimento de fechar um identificador de arquivo
+ Uso inválido de funções e idiomas da biblioteca de modelos padrão
+ Eliminação de código morto usando a opção usedFunction
+ Diversos erros estilísticos e de desempenho

O projeto está ativamente em desenvolvimento e é mantido em diferentes sistemas operacionais. Ele encontrou bugs válidos em vários projetos populares como o [kernel Linux](https://terminalroot.com.br/tags#linux) e o MPlayer.

---

# Instalação
Você pode instalar utilizando o gerenciador de pacotes do seu sistema operacional, exemplos: `winget`, `choco`, `apt`, `pacman`, `emerge` e entre outros. Exemplos:
{% highlight bash %}
winget install -e --id Cppcheck.Cppcheck # Windows
brew install cppcheck # macOS
sudo apt install cppcheck # Ubuntu, Debian, Mint e similares
emerge cppcheck # Gentoo, Funtoo e similares
{% endhighlight %}

Ou também pode instalar direto do código-fonte disponível no [GitHub](https://terminalroot.com.br/tags#github), assim:
{% highlight bash %}
git clone git://github.com/danmar/cppcheck
cd cppcheck
make
sudo make install
{% endhighlight %}

Após instalação confirme se está tudo correto verificando a versão:
{% highlight bash %}
cppcheck --version
Cppcheck 2.9
{% endhighlight %}
> Nesse caso, de acordo com a data de publicação desse artigo, sua versão atual é a `2.9`.

---

# Utilização
Suponhamos que você possua esse código abaixo: `main.cpp`:

{% highlight cpp %}
#include <iostream>
#include <memory>

class Test {
  typedef std::string String;
  String name;

  public:
    Test(String iname) : name(iname){}
    String getName(){
      return name;
    }
};

int main(){
  auto t = std::make_unique<Test>("Terminal Root");
  std::cout << t->getName() << '\n';
  return 0;
}
{% endhighlight %}

### Você consegue encontrar erros nesse código?
A verdade é que nem o compilador consegue, mesmo se habilitarmos todas as `flags` necessárias para *debug*, exemplo:

{% highlight bash %}
g++ -Wall -Wextra -Werror -Wpedantic main.cpp
{% endhighlight %}
> Note que compilará sem avisar nem um *warning* se quer e ainda executará normalmente.

Agora vamos fazer a ANÁLISE ESTÁTICA com `cppcheck` com o seguinte comando:

{% highlight bash %}
cppcheck --enable=all main.cpp
{% endhighlight %}

Veja a imagem abaixo os erros que ele listou:

![cppcheck --enable=all main.cpp](/assets/img/cpp/cppcheck-enable-all.png) 

Que loucura, né?! 😃 

Agora vamos corrigir nosso código adicionando [explicit](https://en.cppreference.com/w/cpp/language/explicit) ao nosso construtor como ele indicou e também o parâmetro: `const String& iname`

{% highlight cpp %}
#include <iostream>
#include <memory>

class Test {
  typedef std::string String;
  String name;

  public:
    explicit Test(const String& iname) : name(iname){}
    String getName(){
      return name;
    }
};

int main(){
  auto t = std::make_unique<Test>("Terminal Root");
  std::cout << t->getName() << '\n';
  return 0;
}

{% endhighlight %}

Ao rodar novamente o mesmo comando notaremos que resolvemos todos os erros, menos o erro:
{% highlight bash %}
nofile:0:0: information: Cppcheck cannot find all the include files (use --check-config for details) [missingIncludeSystem]
{% endhighlight %}
> Esse *erro* **não é bem um erro** e sim o caminho da biblioteca padrão que pode ter inúmeros locais dependendo do sistema operacional e até mesmo do compilador. Logo, podemos ignorá-lo.

Mas, com esse exemplo, notamos o quão útil a análise estática com `cppcheck` pode lhe ajudar no dia a dia. Lembrando que gastamos mais tempo *debugando* que *escrevendo o código* em si, logo, essas análises lhe pouparão muito trabalho e também *dores de cabeça*.

Existem plugins para o Cppcheck para diversos IDEs e Editores tais como: [Vim](https://terminalroot.com.br/tags#vim), [Neovim](https://terminalroot.com.br/tags#neovim), [Emacs](https://terminalroot.com.br/tags#emacs), Eclipse, [Code:Blocks](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#09-codeblocks), [Qt Creator](https://terminalroot.com.br/cpp), [Kdevelop](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) e muitos outros!

Para mais informações acesse o [repositório no GitHub](https://github.com/danmar/cppcheck) e a página no [Source Forge](https://cppcheck.sourceforge.io/).

<!--
+ https://en.wikipedia.org/wiki/Static_program_analysis
+ https://en.wikipedia.org/wiki/Cppcheck
-->

