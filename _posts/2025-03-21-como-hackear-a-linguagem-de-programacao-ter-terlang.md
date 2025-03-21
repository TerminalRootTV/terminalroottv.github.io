---
layout: post
title: "Como 'hackear' a linguagem de programação Ter/Terlang"
date: 2025-03-21 14:00:43
image: '/assets/img/terlang/hack-terlang.jpg'
description: "🚀 Incorporar suas próprias funções diretamente via código-fonte com C++"
icon: 'ion:terminal-sharp'
iconname: 'Ter/Terlang'
tags:
- ter
- terlang
- programacao
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Quando eu [criei a linguagem de programação Ter/Terlang](https://terminalroot.com.br/2024/11/criei-minha-propria-linguagem-de-programacao.html) uma das coisas que eu queria que ela tivesse era justamente: a facilidade de poder *hackear* a linguagem e incorporar funções embutidas pelo programador.

Ou seja, você pode criar suas próprias [funções nativas](https://terminalroot.com.br/mylang/#21-funções-nativas). Isso vai ser interessante quando eu começar a incorporar bibliotecas, principalmente de [GameDev](https://terminalroot.com.br/tags#gamedev), como: [SFML](https://terminalroot.com.br/tags#sfml), [SDL](https://terminalroot.com.br/tags#sdl), [Raylib](https://terminalroot.com.br/tags#raylib) e entre outras para ser utilizada pela [Ter/Terlang](https://github.com/terroo/terlang).

Nesse exemplo vamos criar a função nativa: `helloworld()`, ou seja, ao imprimir essa função, deve exibir a mensagem: *Hello, World!*.

No momento se você criar um arquivo `helloworld.ter` e tentar fazer isso:
{% highlight cpp %}
output(helloworld())
{% endhighlight %}

Após rodar: `ter helloworld.ter`, a saída será um erro:
{% highlight bash %}
[line 1] Error: Undefined variable: 'helloworld'.
{% endhighlight %}

Então, vamos modificar o código-fonte para que isso funcione!


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

## Procedimento
Basta seguirmos 3 passos básicos para esse feito.

### 01. Antes de mais nada você precisa clonar 
E entrar no projeto:
{% highlight bash %}
git clone https://github.com/terroo/terlang
cd terlang
{% endhighlight %}

### 02. Agora vamos editar o arquivo: `./src/Builtin.hpp` 
E adicionar ao final do arquivo o código abaixo:
{% highlight cpp %}
class HelloWorld : public Callable {
    public:
        int arity() override;
        std::any call(Interpreter &interpreter, std::vector<std::any> arguments) override;
        std::string toString() override;
}; 
{% endhighlight %}
Todas as funções precisam *herdar* `Callable` de forma pública. As funções-membro: `arity()`, `call()` e `toString()` são o modelo para todas as funções que serão embutidas e precisam ser públicas.

### 03. Depois precisamos criar a execução para as funções-membro da classe `HelloWorld` que adicionamos. 
Edite o arquivo `./src/Builtin.cpp` e insira ao final do arquivo o conteúdo abaixo:

{% highlight cpp %}
// ------ HelloWorld -----------
int HelloWorld::arity(){
    return 0;
}

std::any HelloWorld::call(Interpreter &interpreter, std::vector<std::any> arguments){
    if(arguments.size() > (size_t)arity() && interpreter.global != nullptr){
        builtinError("helloworld");
    }

    std::string hello = "Hello, World!";

    return std::any_cast<std::string>(hello);
}

std::string HelloWorld::toString(){
    return "<function builtin>";
}
{% endhighlight %}
+ A função-membro `arity()` precisa retornar a quantidade de argumentos que ela recebe, como a função `helloworld()` não recebe nenhum argumento, retornamos zero, se fosse, por exemplo, uma função de nome `add(x, y)` recebe 2 argumentos, logo, precisaríamos retornar `return 2;`

+ A função-membro `call()` precisa sempre haver esse `if` inicial para verificar a quantidade de argumentos. Todos os retornos precisam ser transformados em [std::any](https://terminalroot.com.br/2024/06/utilize-stdany-do-cpp-moderno-nos-seus-projetos.html) com `std::any_cast`, como queremos que retorne uma `string` então convertemos para `std::string` que será a frase que será exibida.

+ E por final `toString()` sempre deve possuir esse conteúdo para mapearmos o tipo de erro e saber que a falha na verdade é nesse tipo de função.

### 04. Adicionar `helloworld` ao mapa da Terlang
Agora vamos editar o arquivo: `./src/BuiltinFactory.cpp` e adicionar AO FINAL DOS MAPAS `builtinFactory` e `builtinNames` o contexto. Com a sintaxe abaixo informe o nome da classe da sua função embutida, nesse caso: `HelloWorld`:
> Lembre que na linha acima dela, precisa ADICIONAR UMA VÍRGULA: `,` ao final da linha para mostrar que possuímos um novo elemento.

{% highlight cpp %}
{typeid(std::shared_ptr<HelloWorld>), [](){ return std::make_shared<HelloWorld>(); }}
{% endhighlight %}

E fazer o mesmo em `builtinNames`, o primeiro elemento desse mapa é o nome que você deseja chamar no seu arquivo `.ter`, nesse caso chamamos ela de `"helloworld"` mesmo:

{% highlight cpp %}
{"helloworld", typeid(std::shared_ptr<HelloWorld>)}
{% endhighlight %}

---

Tudo certo agora basta compilar e testar:
{% highlight bash %}
# rm -rf build/ se já tiver construído uma vez, pois o CMake pode usar o cache
cmake -B build .
cmake --build build
{% endhighlight %}

Crie o arquivo de teste: `helloworld.ter`:
{% highlight cpp %}
auto hello = helloworld()
output(hello)
{% endhighlight %}
> Nesse caso, fizemos diferente do arquivo acima, armazenamos o retorno de `helloworld()` na variável `hello`, mas você também pode imprimir diretamente caso queira: `output(helloworld())`

E rode:
{% highlight bash %}
./build/ter helloworld.ter
{% endhighlight %}
> A saída será: **Hello, World!**

Se quiser que fique disponível para seu sistema é só instalar: `sudo cmake --install build/`.

---

Bem simples, né?! Esse procedimento está disponível na [Wiki](https://github.com/terroo/terlang/wiki/Wiki-Terlang(dev-mode)).

Para mais informações acesse o repositório: <https://github.com/terroo/terlang/>.

Aprenda a criar sua própria linguagem de programação com nosso Curso:
## <https://terminalroot.com.br/mylang>


