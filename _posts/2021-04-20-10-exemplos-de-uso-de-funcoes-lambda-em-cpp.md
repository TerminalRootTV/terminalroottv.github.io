---
layout: post
title: "10 exemplos de uso de Funções Lambda em C++"
date: 2021-04-20 11:24:36
image: '/assets/img/cppdaily/lambda.png'
description: 'Lambdas resolvem um problema de legibilidade, expressividade e praticidade.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![10 exemplos de uso de Funções Lambda em C++](/assets/img/cppdaily/lambda.png)

**Lambdas** resolvem um problema de legibilidade, expressividade e praticidade. Falamos mais sobre elas e com exemplos e detalhes no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp/) . Mas nesse artigo vamos mostrar 10 formas de você utilizar ela no seu código.

A sintaxe dela se resume em: <kbd>[](){};</kbd>

---

# Exemplo 1
Isso não faz nada, mas é a forma mais básica de compilar sem erro.
{% highlight cpp %}
#include <iostream>

int main(){
  [](){};
  return 0;
}
{% endhighlight %}

---

# Exemplo 2
Atribuindo o retorno da Lambda à uma variável
{% highlight cpp %}
auto a = [](){};
{% endhighlight %}

---

# Exemplo 3
Inserindo conteúdo no corpo da lambada
{% highlight cpp %}
auto b = [](){
  std::cout << "I \u2764 Lambda!\n";
};
{% endhighlight %}

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

# Exemplo 4
Imprimindo o conteúdo da lambda
{% highlight cpp %}
auto c = [](){
  std::cout << "I \u2764 Lambda!\n";
};

c();
{% endhighlight %}

---

# Exemplo 5
Passando parametro para Lambda
{% highlight cpp %}
auto d = []( const char * s ){
  std::cout << s;
};
d("I \u2764 Lambda!\n");
{% endhighlight %}

---

# Exemplo 6
Retornando tipo definido
{% highlight cpp %}
auto e = []()->float {
  return 3.6f;
}; std::cout << "0.9 + e = " << 0.9f + e() << '\n';
{% endhighlight %}

---

# Exemplo 7
Passando variáveis já existentes
{% highlight cpp %}
int x, y; x = y = 0;
auto f = [ x, &y ]{
  ++y;
  std::cout << "x e y = " << x << " e " << ++y << '\n';
}; f();
// como y é referência, o valor é alterado
// o x é read-only
// Saida: x e y = 0 e 2
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


---

# Exemplo 8
Executando dentro do `std::remove_if` e deixando o CPF(123.456.789-00) só com números
{% highlight cpp %}
  std::string s("192.168.195-10");
  std::vector<std::string> cpf;
  for (int i = 0; i < s.length() ; i++) {
    cpf.push_back( s.substr(i, 1) );
  }

  cpf.erase( std::remove_if( cpf.begin() , cpf.end(), []( std::string h )->bool{ 
                                                        return ( h == "-" || h == "." );
                                                      } ) , cpf.end() );
{% endhighlight %}
> Para ver a saída: `for( auto z : cpf ){ std::cout << z; }; std::cout << '\n';`

---

# Exemplo 9
Chamando com parametros diretos
{% highlight cpp %}
int n = [] (int x, int y) { return x + y; }(5, 4);
std::cout << n << '\n';
{% endhighlight %}

---

# Exemplo 10
Capturando a cláusula como referência
{% highlight cpp %}
auto indices = [&]( std::string index ){
  std::cout << index << '\n';
};
indices("Iniciando os trabalhos ...");
{% endhighlight %}

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

# Links Úteis
+ <https://docs.microsoft.com/pt-br/cpp/cpp/examples-of-lambda-expressions?view=msvc-160>
+ <https://en.cppreference.com/w/cpp/language/lambda>


