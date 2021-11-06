---
layout: page
title: "Guia Definitivo de Lua para Iniciantes"
permalink: "/lua/"
description: 'Aprenda facilmente programar em Lua.'
image: '/assets/img/lua/lua.jpg'
---

![{{ page.title }}]({{ page.image }})

Ultimamente diversas empresas internacionais estão oferecendo vaga no [Stack Overflow](https://stackoverflow.com/jobs/developer-jobs-using-lua), remota ou presencial, para programadores [C++](https://terminalroot.com.br/cpp) que possuem conhecimentos da linguagem de programação **Lua**, além de diversos softwares e [Games](https://terminalroot.com.br/tags#games) estão adotando Lua de maneira muito rápida Então, não deixe essas oportunidades escaparem!

Aqui tem tudo para você **iniciar** nesse mundo da linguagem de programação Lua!

Vamos lá!

> Observação: Esse tutorial é indicado para quem conhece basicamente qualquer linguagem de programação.

---

# Introdução
**Lua** é uma linguagem de programação interpretada, de script em alto nível, com tipagem dinâmica e multiparadigma, reflexiva e leve, projetada por **Tecgraf da PUC-Rio** em 1993 para expandir aplicações em geral, de forma extensível (que une partes de um programa feitas em mais de uma linguagem), para prototipagem e para ser embarcada em softwares complexos, como jogos. Assemelha-se com Python, Ruby e Icon, entre outras.

Lua foi criada por um time de desenvolvedores do Tecgraf da PUC-Rio, a princípio, para ser usada em um projeto da Petrobras. Devido à sua eficiência, clareza e facilidade de aprendizado, passou a ser usada em diversos ramos da programação, como no desenvolvimento de jogos (a Blizzard Entertainment, por exemplo, usou a linguagem no jogo World of Warcraft), controle de robôs, processamento de texto, etc. Também é frequentemente usada como uma linguagem de propósito geral.

Lua combina programação procedural com poderosas construções para descrição de dados, baseadas em tabelas associativas e semântica extensível. É tipada dinamicamente, interpretada a partir de bytecodes, e tem gerenciamento automático de memória com coleta de lixo. Essas características fazem de Lua uma linguagem ideal para configuração, automação (scripting) e prototipagem rápida.

### Quem usa Lua?
+ Em 2013, a Wikimedia Foundation começou a utilizar a linguagem nas predefinições.
+ Neovim - Possui suporte nativo para Lua. Uma das razões para fazer isso é que o VimScript é uma linguagem de interpretação lenta, quase sem otimizações. Muito do tempo gasto na inicialização do vim e em ações de plug-ins que podem bloquear o loop principal no editor é na análise e execução do vimscript.

E também:
+ Adobe Photoshop Lightroom
+ Celestia
+ Cheat Engine
+ ClanLib
+ CryEngine 3
+ Corona SDK
+ Damn Small Linux
+ Ginga
+ Kepler (software)
+ lighttpd
+ Liquid Feedback
+ MinGW
+ Monotone
+ Nmap
+ PlayStation Home

Jogos que também utilizam Lua:
> Exemplos de empresas que desenvolveram jogos usando a linguagem Lua: LucasArts, Croteam, BioWare, Microsoft, Relic Entertainment, Absolute Studios, Monkeystone Games, Blizzard, SNKPlaymore, Facepunch Studios, KOG. 


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ Angry Birds
+ Baldur's Gate
+ The Battle for Wesnoth
+ Civilization V
+ Counter-Strike Online / Counter-Strike Nexon: Zombies
+ Escape from Monkey Island
+ Fable II
+ Far Cry
+ FlyFF
+ Freeciv
+ Freelancer
+ Garry's Mod
+ Grand Chase
+ Grim Fandango
+ Impossible Creatures
+ Lego Universe
+ MapleStory
+ MDK2
+ Monopoly Tycoon
+ Multi Theft Auto


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

### História
Lua foi criada em 1993 por Roberto Ierusalimschy, Luiz Henrique de Figueiredo e Waldemar Celes, membros do Computer Graphics Technology Group na PUC-Rio, a Pontifícia Universidade Católica do Rio de Janeiro, no Brasil.[5] Versões de Lua antes da versão 5.0 foram liberadas sob uma licença similar à licença BSD. A partir da versão 5.0, Lua foi licenciada sob a licença MIT.

Alguns de seus parentes mais próximos são o Icon, por sua concepção, e Python, por sua facilidade de utilização por não programadores. Em um artigo publicado no Dr. Dobb's Journal, os criadores de Lua também afirmam que Lisp e Scheme foram uma grande influência na decisão de desenvolver a tabela como a principal estrutura de dados de Lua. Lua tem sido usada em várias aplicações, tanto comerciais como não comerciais.

O primeiro projeto utilizando a linguagem em jogos foi em 1997 quando a LucasArts a utilizou como linguagem de script no jogo Grim Fandango.[3]

Em 2008 Nasceu uma das engines mais famosas de Lua (Corona SDK)


Em 2009 nasceu o Love2D, uma engine para jogos 2D.

### Características

Lua é normalmente descrita como uma linguagem de múltiplos paradigmas, oferecendo um pequeno conjunto de características gerais que podem ser estendidas para encaixar diferentes tipos de problemas, em vez de fornecer uma especificação mais complexa e rígida para combinar com um único paradigma. Lua, por exemplo, não contém apoio explícito à herança, mas permite que ela seja executada com relativa facilidade com metatables. Do mesmo modo, Lua permite que programadores quando implementam nomes, classes, e outras funções, empreguem poderosas técnicas de programação funcional e completos escopos lexicais.

Lua é uma linguagem que suporta apenas um pequeno número de estruturas, tais como dados atômicos, valores booleanos, números (dupla precisão em ponto flutuante por padrão), e strings. As estruturas de dados comuns, tais como matrizes, conjuntos, tabelas, listas, e registros podem ser representados por meio de Lua. Lua não foi construída com suporte para programação orientada a objeto. 

Via: <https://pt.wikipedia.org/wiki/Lua_(linguagem_de_programação)>

---

# Preparando o Ambiente
Para instalar Lua basta usar o gerenciador de pacotes da sua distribuição, exemplo:
+ No Gentoo, Funtoo e derivados: `emerge lua`
+ No Debian, Ubuntu, Mint e derivados: `sudo apt install lua` ou se não funcionar, informe a versão, exemplo: `sudo apt install lua51`

Você pode escrever em Lua em qualquer IDE, no entanto, o mais recomendado é o [Neovim]() que incluive veremos como criar um plugin para o Neovim utilizando Lua que possui integração nativa.

Após instalar rode: `lua --help` a saída será:
{% highlight lua %}
lua --help
usage: lua [options] [script [args]].
Available options are:
  -e stat  execute string 'stat'
  -l name  require library 'name'
  -i       enter interactive mode after executing 'script'
  -v       show version information
  --       stop handling options
  -        execute stdin and stop handling options
{% endhighlight %}

Exemplos:
> Rodar somente o comando `lua` entra numa subshell, rode `os.exit()` dentro da subshell para sair.

| Parâmetro | Uso |
|---|---|
| `-e` | `lua -e 'print("Olá, Lua!")'` |
| `-i` | `lua -i script.lua` |
| `-v` | `lua -v` |

| Versão |
|---|
| **Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio** |


---

# Olá, Mundo!
O mais básico programa.

> `nvim ola-mundo.lua`
{% highlight lua %}
print("Olá, Lua!")
{% endhighlight %}

E execute: `lua ola-mundo.lua` ou:


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

{% highlight lua %}
#!/usr/bin/env lua
print("Olá, Lua!")
{% endhighlight %}
> `chmod +x ola-mundo.lua` e execute: `./ola-mundo.lua` . Você ainda podia substituir o cabeçalho por `which lua` e adicionar, exemplo: `#!/usr/bin/lua`

Outras formas de imprimir:
> Sem parenteses
{% highlight lua %}
print "Olá, sem parênteses, Lua!"
{% endhighlight %}

> Múltiplas linhas
{% highlight lua %}
print [[
Isso pode ser visto
em várias linhas
 inclusive os espaços iniciais
]]
{% endhighlight %}
> Ou também com parênteses: `print([[ ]])`

---

# Comentários
Comentários de uma única linha usa-se dois traços(--) pode ser:
{% highlight lua %}
-- aqui em cima
print "Luaaaaa" -- aqui ao lado
-- aqui abaixo
{% endhighlight %}

Ou em múltiplas linhas
{% highlight lua %}
print "Começando o código"
--[[ Comentario
de
multiplas
linhas
]]
print "Terminando o código"
{% endhighlight %}
> Detalhe: o `--` deve ficar colado do `[[` do início.

---

# Variáveis
Existem três tipos de variáveis em Lua: variáveis globais, variáveis locais e campos de tabelas. Assume-se que toda variável é uma variável global a menos que ela seja explicitamente declarada como uma variável local.

{% highlight lua %}
nome = "Marcos Oliveira"
print(nome)
print("O valor de nome é:", nome) -- saída espaçada com TAB
{% endhighlight %}

Criando uma variável local:
{% highlight lua %}
local versao = _VERSION
print( versao )
{% endhighlight %}

Campos de tabela:
{% highlight lua %}
minha_tabela = {
  x = 10,
  y = 20
}

print( minha_tabela.x )
print( minha_tabela.y )
{% endhighlight %}

Criando uma tabela vazia e adicionando posteriormente:
{% highlight lua %}
tabela = {}
tabela[1] = "Lua"
print( tabela[1])
{% endhighlight %}

---

# Concatenação
Para concatenar strings em Lua precisa-se utilizar duas vezes o ponto: `..` , exemplo:
{% highlight lua %}
ola = "Olá"
mundo = "Mundo"
print( ola .. ", " .. mundo .. "!" )
{% endhighlight %}
> Saída: `Olá, Mundo!` .

Podemos declarar múltiplas variáveis e imprimir assim:
{% highlight lua %}
nome,sobrenome = "Marcos","Olivera"
print(nome .. " " .. sobrenome)
{% endhighlight %}

---

# Constantes
Lua antes da versão **5.4** não oferecia suporte a constantes automaticamente, mas você pode adicionar uma tabela e tornando a tabela somente leitura usando metatabela(veremos mais à frente isso). Mas a partir da 5.4 use assim:

{% highlight lua %}
local minha_var <const> = 42
print( minha_var )
{% endhighlight %}
> Rode: `lua5.4 constantes.lua`

Se tentar redefinir, exemplo:
{% highlight lua %}
minha_var = 24
{% endhighlight %}
> Obterá o erro: `lua5.4: sandbox.lua:3: attempt to assign to const variable 'minha_var'`

---

# Arrays ou Matrizes
Matrizes são arranjos ordenados de objetos, que podem ser uma matriz unidimensional contendo uma coleção de linhas ou uma matriz multidimensional contendo várias linhas e colunas.

Em Lua, os arrays são implementados usando tabelas de indexação com inteiros. O tamanho de um array não é fixo e pode crescer com base em nossos requisitos, sujeito a restrições de memória.

> **Em Lua o array/matriz começa do 1**, se tentar imprimir o 0(zero) a saída será `nil`

#### Matriz unidimensional
Uma matriz unidimensional pode ser representada usando uma estrutura de tabela simples e pode ser inicializada como é mostrado abaixo.

{% highlight lua %}
meu_array = {"Lua", "C++", "JavaScript", "C", "Bash", "Rust", "PHP"}
print( meu_array[1]) -- Lua
{% endhighlight %}

---

# Tipos de Dados
A tipagem dos dados em Lua é dinâmica, mas caso você queira obter o tipo do dado basta, exemplo:

{% highlight lua %}
print( type("Qual o tipo desse dado?") ) -- string
print( type(936) ) -- number
print( type( true ) ) -- boolean
print( type( print ) ) -- function
print( type( os ) ) -- table
print( type( nil ) ) -- nil

nome = "Marcos Oliveira"
print( type( type ) ) -- function
print( type( 9.36 ) ) -- num
print( type( nome ) ) -- string
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

Além desse também existem os tipos: `userdata` e `thread` .

---

# Operadores
Lua utiliza quase todos os operadores que outras linguagens de programação utilizam, exemplos:


| operador | operador | operador | operador |
|---|---|---|---|
| `+` | `-` | `*` | `/` |
| `%` | `^` | `==` | `~=` |
| `>` | `<` | `>=` | `<=` |
| `and` | `or` | `not` | `#` |


> Além do `..` que nós já vimos que serve para concatenação.

Exemplos:

{% highlight lua %}
-- soma
print("2 + 2:")
print(2 + 2) -- 4

-- subtração
print("2 - 2:")
print(2 - 2) -- 0

-- multiplicação
print("2 * 2:")
print(2 * 2) -- 4

-- divisão
print("2 / 2:")
print(2 / 2) -- 1

-- resto da divisão(módulo)
print("2 % 2:")
print(2 % 2) -- 0
{% endhighlight %}

Os outros veremos mais à frente!

---

# Condições
Assim como as demais linguagens de programção, Lua também dispões de condições, lógico(o recurso mais utilizado em qualquer linguagem de programação).
> Note o uso das palavras: `then` e `end`

Para usar o `if`, exemplo:
{% highlight lua %}
numero = 10

if( numero == 10 ) then
  print("O número é igual a DEZ")
end
{% endhighlight %}

Para usar o `else`
{% highlight lua %}
numero = 8

if( numero == 10 ) then
  print("O número é igual a DEZ")
else
  print("O número é diferente de DEZ")
end

{% endhighlight %}


Para usar o `elseif`
{% highlight lua %}
numero = 8

if( numero == 10 ) then
  print("O número é igual a DEZ")
elseif( numero == 8 ) then
  print("O número é OITO")
else
  print("O número é DIFERENTE de DEZ e de OITO")
end
{% endhighlight %}

---

# Loops
Para executarmos uma ação em determinadas vezes utilizamos loops, em Lua há 3 tipos de loops: `while`, `for` e `repeat until` vamos ver como utilizá-los:
> Note o uso das palavras reservadas: `do` e `end`

Loop `while`
{% highlight lua %}
numero = 1

while( numero < 4 ) do
  print("Imprimindo " .. numero .. "º vez!")
  numero = numero + 1
end
{% endhighlight %}

Loop `for`
> Exemplos variados.

{% highlight lua %}
-- valor crescente
for i = 1,4 do
 print("Imprimindo "..i.."º vez!") 
end
{% endhighlight %}

{% highlight lua %}
-- valor decrescente
for i = 4,1,-1 do
 print("Imprimindo "..i.."º vez!") 
end
{% endhighlight %}

Loop `repeat until`
{% highlight lua %}
numero = 4 -- começa do número 4
repeat
   print("O valor de 'numero' é: "..numero)
   numero = numero + 1
until( numero > 8 ) -- até o número 8
{% endhighlight %}

Utilizando o `break`
{% highlight lua %}
numero = 4 -- começa do número 4
repeat
  print("O valor de 'numero' é: "..numero)
  if( numero == 6 ) then -- se for igual à 6 pára o loop
    break
  end
  numero = numero + 1
until( numero > 8 ) -- até o número 8
{% endhighlight %}

---

# Funções
Funções são importantes para reaproveitamento de código, vamos ver algumas formas de usar em Lua.

Função básica:
{% highlight lua %}
function ola_mundo()
  print("Olá Lua via função!")
end

ola_mundo() -- chama a função
{% endhighlight %}

Passando parâmetros:
{% highlight lua %}
function soma( x, y)
  print(x.." + "..y.." = "..x + y)
end

soma( 3, 9)
{% endhighlight %}

Utilizando assinatura:
{% highlight lua %}
saida = function(flag)
  print("O resultado é: "..flag)
end

function soma( x, y, callback)
  resultado = x + y
  callback(resultado)
end

soma( 3, 9, saida)
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


Função com argumento variável:
> Observe o uso da função nativa `ipairs` que é um *iterador*(veremos mais detalhes posteriormente)
{% highlight lua %}
function qtd_params(...)
  local qtd = 0;
  parametros = {...}
  for i,v in ipairs(parametros) do
    qtd = qtd + 1
  end
  return qtd
end

print([[A quantidade de parâmetros passados
para a função qtd_params(...) é: ]] .. qtd_params(8,4,11,2,17))
{% endhighlight %}
> Nesse caso passamos **5** parâmetros para a função.

Imprimindo todos os parâmetros passados com argumento variável:
{% highlight lua %}
function list_params(...)
  local qtd = 0;
  parametros = {...}
  for i,v in ipairs(parametros) do
    qtd = qtd + 1
  end

  for j = 1,qtd do
    print("O "..j.."º parâmetro é: "..parametros[j])
  end
end

list_params("Marcos", "Oliveira", "Terminal", "Root")
{% endhighlight %}

---

# Trabalhando com strings
+ Outra forma de impressão:
{% highlight lua %}
str = [[Lua é muito bacana!]]
print(str)
{% endhighlight %}

+ Imprimindo cores:
{% highlight lua %}
str = "Lua é muito bacana!"
amarelo = "\027[33m"
desliga = "\027[m"
print(amarelo..str..desliga)
{% endhighlight %}

+ Imprimindo todas as cores:

{% highlight lua %}
str = "Lua é muito bacana!"

-- do 30 ao 37(8 cores)
-- mas tem mais: tente do 0 até 106
for i = 30,37 do
  if( i == 30) then
    -- se seu terminal for a cor do fundo
    -- não aparecerá o fundo
    print("\027[90m"..str.."\027[m")
  else
    print("\027["..i.."m"..str.."\027[m")
  end
end
{% endhighlight %}

+ Convertendo para MAIÚSCULA ou minúscula
> Para MAIÚSCULA
{% highlight lua %}
str = "Lua é muito bacana!"
print( string.upper( str ) )
{% endhighlight %}

Perceba que as palavras acentuadas não alteram. Veremos como alterar isso quando falarmos sobre inclusão de bibiliotecas. 

> Para minúscula
{% highlight lua %}
str = "Lua é muito bacana!"
print( string.lower( str ) )
{% endhighlight %}

+ Substituindo partes de uma string
{% highlight lua %}
str = "Perl é muito bacana!"
str = string.gsub(str,"Perl","Lua")
print(str)
{% endhighlight %}

+ Formatando string:
  - No meio da frase
{% highlight lua %}
str = "❤"
print( string.format("Eu %s Lua!",str))
{% endhighlight %}
  - Formatando data
{% highlight lua %}
dia,mes,ano = 26,08,2021
print( string.format("%d/%02d/%d",dia,mes,ano))
{% endhighlight %}
> Para o mês com zero: `%02d`.

+ Imprimir float com 4 dígitos significativos:
{% highlight lua %}
print( string.format("%.4f",3.1415))
{% endhighlight %}

+ Encontrando uma string:

{% highlight lua %}
str = "A linguagem de programação Lua é muito legal"

if( string.find(str,"muito") ) then
  print("Encontrada a palavra 'muito'")
else
  print("NÃO foi encontrada a palavra 'muito'")
end

if( string.find(str,"tchau") ) then
  print("Encontrada a palavra 'tchau'")
else
  print("NÃO foi encontrada a palavra 'tchau'")
end
{% endhighlight %}

+ Revertendo uma string:
{% highlight lua %}
str = "Uauu! A Lua!"
print( string.reverse(str))
{% endhighlight %}

+ Obtendo o comprimento de uma string:
{% highlight lua %}
str = "Lua"
print( string.len(str))
{% endhighlight %}

+ Subdividindo uma string
> `string.sub(STRING, POS_INI, POS_FINAL)`
  - Imprime somente: **Lua**
{% highlight lua %}
str = "Lua Linguagem de Programação"
print( string.sub(str,0,3) )
{% endhighlight %}
  - Imprime somente: **Programação**
{% highlight lua %}
str = "Lua Linguagem de Programação"
print( string.sub(str, string.len(str) - 12, string.len(str) ) )
{% endhighlight %}
Ou
{% highlight lua %}
str = "Lua Linguagem de Programação"
print( string.sub(str, 18, 30 ) )
{% endhighlight %}

+ Repetir a string *n* vezes
> Para esse exemplo: 4 vezes
{% highlight lua %}
str = "Lua "
print( string.rep(str,4))
{% endhighlight %}

+ Imprimindo uma letra em formato de byte(número da tabela ASCII):
  - Obtendo número pela letra
{% highlight lua %}
print( string.byte("Lua")) -- primeiro caractere
print( string.byte("Lua",2)) -- segundo caractere
print( string.byte("Lua",-1)) -- último caractere
print( string.byte("Lua",-2)) -- penúltimo caractere
{% endhighlight %}
  - Obtendo a letra pelo número
{% highlight lua %}
print( string.char(97)) -- primeiro caractere
{% endhighlight %}

---

# Trabalhando com Tabelas
As tabelas são a única estrutura de dados disponível em Lua que nos ajuda a criar diferentes tipos, como arrays e dicionários. Lua usa matrizes associativas e que podem ser indexadas não apenas com números, mas também com strings, exceto nil. As tabelas não têm tamanho fixo e podem crescer de acordo com nossa necessidade.

Lua usa tabelas em todas as representações, incluindo a representação de pacotes. Quando acessamos um método string.format, significa que estamos acessando a função de formatação disponível no pacote string.

As tabelas são chamadas de objetos e não são valores nem variáveis. Lua usa uma expressão construtora {} para criar uma tabela vazia. É preciso saber que não existe uma relação fixa entre uma variável que contém a referência da tabela e a própria tabela.


> Leia os comentários no código para um maior entendimento:

{% highlight lua %}
tabela = {"Lua", "C++", "JavaScript", "C"}

-- imprime tudo junto
print("Imprimido a tabela: " .. table.concat(tabela))

-- imprime com espaçamento
print("Imprimido a tabela: " .. table.concat(tabela," "))

-- imprime do segundo ao terceiro elemento
print("Imprimido a tabela: " .. table.concat(tabela," ",2,3))

-- removendo o último índice da tabela:
table.remove( tabela)
print( table.concat( tabela,", " ) )

-- removendo o 3º índice(JavaScript) da tabela:
table.remove( tabela, 3)
print( table.concat( tabela,", " ) )

-- insere um índice(Rust) na última posição
table.insert(tabela, "Rust" )
print( table.concat( tabela," " ) )

-- insere um índice(PHP) na 1º posição
table.insert(tabela, 1, "PHP" )
print( table.concat( tabela," " ) )

-- informa a quantidade de índices da tabela
print("A 'tabela' tem: "..table.maxn(tabela) .. " índices")
{% endhighlight %}

Também há as funções: `sort`, `foreach`, `foreachi` e `getn`. Saiba mais [aqui](https://www.lua.org/pil/2.5.html).

---

# Módulos
O módulo é como uma biblioteca que pode ser carregada usando `require` e tem um único nome global contendo o código a ser utilizado. 

Exemplo: Usando uma função que está no arquivo `meu_modulo.lua` do programa `programa.lua`:

> `meu_modulo.lua`
{% highlight lua %}
function minha_funcao( param )
  print("Você passou o parâmetro: " .. param)
end
{% endhighlight %}

> `programa.lua`
{% highlight lua %}
require "meu_modulo"

minha_funcao("Olá, módulo!")
{% endhighlight %}

Outra forma de usar e *instanciar* o módulo:

> `meu_modulo.lua`
{% highlight lua %}
local mf = {}

function mf.minha_funcao( param )
  print("Você passou o parâmetro: " .. param)
end

return mf
{% endhighlight %}

> `programa.lua`
{% highlight lua %}
mf = require ("meu_modulo")
mf.minha_funcao("Lua é demais!")
{% endhighlight %}

---

# Trabalhando com a [Shell](https://terminalroot.com.br/shell)
Vamos utilizar a biblioteca nativa `os`


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

+ Obtendo variáveis de ambiente

{% highlight lua %}
home = os.getenv("HOME")
pwd = os.getenv("PWD")
editor = os.getenv("EDITOR")

print("Seu diretório pessoal é: " .. home)
print("Você está no diretório: " .. pwd)
print("Seu editor padrão é: " .. editor)
{% endhighlight %}

+ Executando comandos

{% highlight lua %}
os.execute("echo 'Olá, Shell via Lua!'")
os.execute("uptime")
os.execute("touch file.txt")
os.execute("ls")
{% endhighlight %}

+ Removendo arquivos:
{% highlight lua %}
os.remove("file.txt")
{% endhighlight %}

Saiba mais em: <https://www.lua.org/pil/22.1.html>

---

# Passando Parâmetros via linha de comando
Para isso usa-se a palavra reservada: `arg`. Veja os exemplos abaixo:

{% highlight lua %}
print( "O nome do arquivo é: " .. arg[0])

print([[Quantidade de argumentos
via linha de comando: ]] .. #arg)

if( #arg > 0 ) then
  for i = 1,#arg do
    print("Argumento "..i.." é "..arg[i])
  end
end

print("O comando é: " .. arg[-1])
{% endhighlight %}

# MetaTabelas
Uma metatabela é uma tabela que ajuda a modificar o comportamento de uma tabela à qual está anexada com a ajuda de um conjunto de chaves e métodos meta relacionados. Esses metamétodos são funcionalidades Lua poderosas que habilitam recursos como -
+ Alterar/adicionar funcionalidades aos operadores nas mesas.
+ Procurando meta-tabelas quando a chave não está disponível na tabela usando `__index` na meta-tabela.

Existem dois métodos importantes que são usados no tratamento de meta-tabelas, que incluem -
+ `setmetatable (tabela, meta-tabela)` - Este método é usado para definir a meta-tabela para uma tabela.
+ `getmetatable (table)` - Este método é usado para obter a meta-tabela de uma tabela.

Vejamos primeiro como definir uma tabela como metatabela de outra. É mostrado abaixo.

{% highlight lua %}
minha_tabela = {}
minha_meta_tabela = {}
setmetatable( minha_tabela , minha_meta_tabela )
{% endhighlight %}

Ou somente:
{% highlight lua %}
minha_tabela = setmetatable({}, {})
{% endhighlight %}

### Utilizando `__index`
Um exemplo simples de metatabela para pesquisar a metatabela quando não está disponível na tabela é mostrado abaixo.

{% highlight lua %}
minha_tabela = setmetatable({chave1 = "valor1"}, {
   __index = function(minha_tabela, key)

      if key == "chave2" then
         return "Valordametatabela"
      else
         return minha_tabela[key]
      end
   end
})

print(minha_tabela.chave1,minha_tabela.chave2)
{% endhighlight %}
> Saída: `valor1  Valordametatabela`

Resumindo o código acima:
{% highlight lua %}
minha_tabela = setmetatable({chave1 = "valor1"},
   { __index = { chave2 = "VALOR DA META TABELA" } })
print(minha_tabela.chave1,minha_tabela.chave2)
{% endhighlight %}

Se um índice não existir e você deseja adicionar quando for chamado e não existir você pode usar `__newindex` e criar um método/função para isso.

Mais informações [aqui](https://www.tutorialspoint.com/lua/lua_metatables.htm).

---

# LuaJIT
LuaJIT é um Compilador Just-In-Time (JIT) para a linguagem de programação Lua. Seu site oficial é: <https://luajit.org/> .

JIT é uma tecnologia que compila um programa em tempo de execução.
> A implementação LuaJIT parece superar todas as outras linguagens dinâmicas do JIT (V8, Tracemonkey, PLT Scheme, Erlang HIPE) por um ordem de magnitude .

Para instalar o LuaJIT use o gerenciador de pacotes do seu sistema, exemplos:

{% highlight sh %}
sudo emerge luajit # Gentoo, Funtoo e similares
sudo apt install luajit # Debian, Ubuntu e similares
sudo pacman -S luajit # Arch, Manjaro e similares
sudo dnf install luajit # Fedora, Red Hat e similares
# ...
{% endhighlight %}

Para utilizá-lo, em vez de usar o comando `lua`, use `luajit`, exemplo:

{% highlight sh %}
luajit meuprograma.lua
{% endhighlight %}

LuaJIT fornece uma desempenho superior ao interpretador Lua.

Como acontece com todo sistema de alto desempenho, a resposta no final se resume a duas coisas: algoritmos e engenharia. LuaJIT usa técnicas de compilação avançadas e também tem uma implementação de engenharia muito precisa. Por exemplo, quando as sofisticadas técnicas de compilação não conseguem lidar com um trecho de código, LuaJIT recorre a um interpretador muito rápido escrito em assembly x86.

LuaJIT ganha pontos duplos no aspecto de engenharia, porque não apenas LuaJIT em si é bem projetado, mas a própria linguagem Lua tem um design mais simples e mais coerente do que Python e JavaScript. Isso torna (marginalmente) mais fácil para uma implementação fornecer um desempenho consistentemente bom.

---

# LuaRocks
LuaRocks é um gerenciador de pacotes para a linguagem de programação Lua, similar aos gerenciadores de pacotes de outras linguagens como: [npm](https://terminalroot.com.br/tags#javascrito)(JavaScript), [composer](https://terminalroot.com.br/tags#php)(PHP), [gem](https://terminalroot.com.br/tags#ruby)(Ruby), [pip](https://terminalroot.com.br/tags#pythons)(Python) e entre outros.

Seu site oficial é: <https://luarocks.org/>


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Fornece um formato padrão para distribuição de módulos Lua (em um formato independente chamado "rock"), uma ferramenta projetada para gerenciar facilmente a instalação de rocks e um servidor para distribuí-los . Embora não esteja incluído na distribuição Lua, é chamado de "gerenciador de pacotes de fato para módulos Lua contribuídos pela comunidade".

Para instalá-lo use também o gerenciador de pacotes do seu sistema, exemplos:

{% highlight sh %}
sudo emerge luarocks # Gentoo, Funtoo e similares
sudo apt install luarocks # Debian, Ubuntu e similares
sudo pacman -S luarocks # Arch, Manjaro e similares
sudo dnf install luarocks # Fedora, Red Hat e similares
# ...
{% endhighlight %}

Para utilizá-lo use o comando `luarocks --help` .

---

Espero que vocês tenham gostado dessa pequena introdução à essa belíssima [Linguagem de Programação]() que é [Lua]().

Acompanhe a nossa **#hashtag**: <https://terminalroot.com.br/tags#lua> para mais tutoriais e dicas de Lua e também de [Neovim](https://terminalroot.com.br/tags#neovim) que usa Lua como principal fonte de configuração. Futuramente pode ser que iremos expandir esse tutorial, então não esqueça de voltar aqui sempre que possível!

# Abraços!
+ <https://terminalroot.com.br/lua/>
+ <https://www.lua.org/manual/5.1/pt/>
+ <https://www.lua.org/pil/3.4.html>

---

