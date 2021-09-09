---
layout: post
title: "Como fazer Parser de Toml com C++"
date: 2021-09-09 11:03:29
image: '/assets/img/cpp/toml++.png'
description: 'Com 11 exemplos práticos de como implementar'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![Como fazer Parser de Toml com C++](/assets/img/cpp/toml++.png)

**[Toml](https://toml.io/)** é um formato de arquivo de configuração criado para ser mais legível para humanos usando uma sintaxe mínima, semelhante ao arquivo [INI](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html). O nome é um acrônimo para "**T**om's Obvious, **M**inimal **L**anguage" (em português: "Linguagem Mínima e Óbvia do Tom"). O formato foi desenvolvido para mapear de forma inequívoca para tabelas [hash](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html).

Apesar de sua especificação ainda ser considerada instável pelo [autor](https://github.com/mojombo), é usado pelo [Cargo](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html), ferramenta de produtividade oficial da linguagem [Rust](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html), a ferramenta de dependências da linguagem [Go](https://terminalroot.com.br/tags#go), [GitLab](https://gitlab.com/terminalroot) Runner e InfluxDB e entre outros projetos. Possui implementações nas principais [linguagens de programação](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html). [Saiba+](https://en.wikipedia.org/wiki/TOML) .


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

**[Toml++](https://marzer.github.io/tomlplusplus/)** é um analisador de arquivo de configuração TOML e serializador para [C++17](https://terminalroot.com.br/cpp) e posterior.

Recursos da biblioteca Toml++:
+ Header-only
+ Suporta a versão **TOML** mais recente (*v1.0.0*), além de suporte opcional para alguns recursos de linguagem TOML não lançados;
+ [C++17](https://terminalroot.com.br/cpp) (mais alguns recursos [C++20](https://terminalroot.com.br/cpp) quando disponíveis, por exemplo, suporte experimental para strings `char8_t`);
+ Manuseio adequado de **UTF-8** (incl. **BOM**);
+ Funciona com ou sem exceções;
+ Não requer RTTI;
+ Suporte de primeira classe serializando para [JSON](https://terminalroot.com.br/2020/01/javascript.html);
+ Testado no [Clang(6+)](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html), [GCC(7+)](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html) e MSVC(VS2019);
+ Testado em x64, x86 e ARM.

---

# Instalação
Instale o [subversion](https://terminalroot.com.br/2019/09/como-clonar-somente-um-subdiretorio-com-git-ou-svn.html)
> Exemplos para cada distro:
{% highlight sh %}
sudo emerge subversion # Gentoo, Funtoo e Portage baseds
sudo apt-get install subversion # Debian, Ubuntu, Linux Mint APT baseds
sudo pacman -S subversion # Arch Linux, Manjaro e PacMan baseds
sudo yum install subversion # Fedora, Red Hat, CentOS e YUM baseds
{% endhighlight %}

Crie e entre no diretório do seu projeto, exemplo:
{% highlight sh %}
mkdir meu-projeto
cd meu-projeto
{% endhighlight %}

Utilize um arquivo [Toml](https://toml.io/) de exemplo:
> `vim exemplo.md`

Conteúdo do `exemplo.toml`

{% highlight toml %}
# Este é um documento TOML.

titulo = "Terminal Root"

[proprietario]
nome = "Marcos Oliveira"
tempo = 2021-09-09T07:32:00-08:00 # Datas sem espaços

[base]
ip = "192.168.1.1"
portas = [8000, 8001, 8002]
max = 5000
ativado = true

[servidores]

   # O recuo (tabulações e/ou espaços) é permitido, mas não obrigatório
   [servidores.alpha]
   ip = "10.0.0.1"
   dc = "eqdc10"

   [servidores.beta]
   ip = "10.0.0.2"
   dc = "eqdc10"

[clientes]
dados = [["gama", "delta"], [1, 2]]

# As quebras de linha estão OK quando dentro de arrays
hosts = [
   "alfa",
   "omega"
]
{% endhighlight %}

Clone o subdiretório com o comando:
{% highlight sh %}
svn export https://github.com/marzer/tomlplusplus/trunk/include/toml++
{% endhighlight %}

Esse procedimento é para cada projeto que você for criar. Se quiser que fique disponível no seu sistema, rode o comando:

```sh
sudo cp -r toml++/ /usr/local/include/
```



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

# Utilização
Vamos ver **11 exemplos** de utilização do **Toml++**.

## 01. Fazendo o parser básico:
> `vim main.cpp`

Se você instalou no sistema com `sudo`, use assim:
```cpp
#include <toml++/toml.h>
```

Se só clonou com `svn` dentro do seu projeto, mas não instalou no sistema, use assim:
```cpp
#include "toml++/toml.h"
```



Insira isso no seu `main.cpp`

{% highlight cpp %}
#include <iostream>
#include <toml++/toml.h>

int main(int argc, char** argv){

  if( argc <= 1 ){
    std::cerr << "Informe o arquivo. Exemplo: " << argv[0] << " exemplo.toml\n";
    return 1;
  } 

  toml::table tbl;
  try{
    tbl = toml::parse_file(argv[1]);
    std::cout << tbl << "\n";
  }
  catch (const toml::parse_error& err){
    std::cerr << "Falha ao fazer parser:\n" << err << "\n";
    return 1;
  }

  return 0;
}
{% endhighlight %}

Compile com [C++17](https://terminalroot.com.br/cpp):
{% highlight sh %}
g++ -std=c++17 main.cpp
{% endhighlight %}

---

## 02. Obtendo um dado único
Por exemplo, saber qual o valor de `titulo`

{% highlight cpp %}
tbl = toml::parse_file(argv[1]);
auto titulo = tbl["titulo"];
std::cout << "Título: " << titulo << "\n";
{% endhighlight %}

---

## 03. Utilizando com o [xmake](https://terminalroot.com.br/2021/09/compile-para-c-cpp-com-xmake-baseado-em-lua.html)
Se quiser para não ficar digitando o comando para compilar toda hora, utilize esse [xmake](https://youtu.be/ydgcsv-hssY) : `vim xmake.lua`

{% highlight lua %}
add_rules("mode.debug", "mode.release")
set_config("cxxflags", "-std=c++17")
add_cflags("-g", "-Wall", {force = true})

target("parsertomlpp")
  set_kind("binary")
  add_files("main.cpp")
{% endhighlight %}

Compile e rode:
{% highlight sh %}
xmake -q && xmake run parsertomlpp $(pwd)/exemplo.toml
{% endhighlight %}
---

## 04. Remover as aspas simples da saída:
{% highlight cpp %}
std::optional<std::string> titulo = tbl["titulo"].value<std::string>();
std::cout << *titulo << '\n';
{% endhighlight %}

Saída será:
{% highlight txt %}
Terminal Root
{% endhighlight %}

---

## 05. Convertendo para `std::string`
{% highlight cpp %}
std::string& titulo = tbl["titulo"].ref<std::string>();
std::cout << titulo << '\n';
{% endhighlight %}


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

---

## 06. Obtendo *sub dados*
No `exemplo.toml` note que a propriedade **ip**  faz parte de `[base]`, mas também faz parte de `[servidores]`(alpha e beta).

Suponha que você deseja obter os dados da `[base]`:

{% highlight cpp %}
auto ip = tbl["base"]["ip"];
std::cout << ip << '\n';
{% endhighlight %}

Caso você quisesse agora o **ip** de `[servidores]` e de `alpha`:

{% highlight cpp %}
auto ip = tbl["servidores"]["alpha"]["ip"];
std::cout << ip << '\n';
{% endhighlight %}

---

## 07. Verificar qual a segunda porta disponível
{% highlight cpp %}
auto porta = tbl["base"]["portas"][1];
std::cout << porta << '\n';
{% endhighlight %}

---

## 08. Verifica qual o *tipo de dado* de `portas`
{% highlight cpp %}
auto portas = tbl["base"]["portas"];
std::cout << portas.type() << '\n';
{% endhighlight %}
> Saída: `array`

Qual o *tipo de dado* de uma *porta* de *portas*
{% highlight cpp %}
auto porta = tbl["base"]["portas"][0];
std::cout << porta.type() << '\n';
{% endhighlight %}
> Saída: `integer`

---

## 09. Descobrindo quantos elementos tem uma *tabela* do Toml
Exemplo, quantos elementos tem em **hosts**

{% highlight cpp %}
auto host = tbl["clientes"]["hosts"];
unsigned int i = {0};
toml::array* arr = host.as_array();
for (toml::node& elem : *arr){
  ++i;
}
std::cout << "Hosts tem: " << i << " elemento(s)." << '\n';
{% endhighlight %}

---

## 10. Verificando se um elemento existe em uma tabela
Por exemplo, a tabela `["clientes"]["hosts"]` só tem: *alfa* e *omega*, mas caso não soubéssemos, vamos verificar se **beta** existe nessa tabela:

{% highlight cpp %}
auto hosts = tbl["clientes"]["hosts"];
bool its = false;

if (toml::array* arr = hosts.as_array()){
  for (toml::node& elem : *arr){
    std::string& str = elem.ref<std::string>();
    if( str == "beta" ){
      its = true;
    } 
  }
}

std::cout << ( its ? "Disponível" : "Indisponível" ) << '\n';
{% endhighlight %}
> Saída: `Indisponível`.


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

---

## 11. Adicionando um elemento à uma tabela
Adicionando **beta** à `[clientes.hosts]`:

{% highlight cpp %}
auto hosts = tbl["clientes"]["hosts"];
toml::array* arr = hosts.as_array();
arr->push_back("beta");
std::cout << hosts << '\n';
{% endhighlight %}
> Saída: `[ 'alfa', 'omega', 'beta' ]`

---

Para mais informações acesse o site oficial e o repositório no GitHUb:
### <https://marzer.github.io/tomlplusplus/>
### <https://github.com/marzer/tomlplusplus/>

---

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




