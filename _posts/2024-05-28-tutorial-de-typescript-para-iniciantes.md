---
layout: post
title: "Tutorial de TypeScript para Iniciantes"
date: 2024-05-28 11:31:11
image: '/assets/img/typescript/typescript.jpg'
description: "🗞️ TypeScript oferece suporte a arquivos de definição que podem conter informações de tipo de bibliotecas JavaScript, assim como arquivos de cabeçalho C++."
icon: 'ion:terminal-sharp'
iconname: 'TypeScript'
tags:
- typescript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[TypeScript](https://terminalroot.com.br/tags#typescript) é uma linguagem de programação de [código aberto](https://terminalroot.com.br/tags#opensource) desenvolvida pela **Microsoft**. 

É um superconjunto sintático estrito de JavaScript e adiciona tipagem estática opcional à linguagem. 

Esse tutorial é especialmente voltado para programadores que já conhecem [JavaScript](https://terminalroot.com.br/tags#javascript), abordará os conceitos fundamentais do [TypeScript](https://terminalroot.com.br/tags#typescript) e destacará algumas das "*pegadinhas*" mais importantes.

O TypeScript foi desenvolvido por Anders Hejlsberg, arquiteto da linguagem [C#](https://terminalroot.com.br/tags#csharp) e criador das linguagens [Delphi](https://www.embarcadero.com/products/delphi) e [Turbo Pascal](https://terminalroot.com.br/2021/05/instale-o-editor-turbo-para-c-cpp-e-mate-saudade-do-turbo-vision.html).

**TypeScript** oferece suporte a arquivos de definição que podem conter informações de tipo de bibliotecas *JavaScript existentes*, assim como arquivos de cabeçalho [C++](https://terminalroot.com.br/cpp) podem descrever a estrutura de arquivos de objeto existentes.

O endereço oficial do TypeScript é: <https://www.typescriptlang.org/>.

Você pergunta:
####  *— Se o TypeScript é um superconjunto do JavaScript, então, todo o código JavaScript também já é TypeScript?!!!*
Apesar de na própria [documentação oficial do TypeScript ter escrito isso](https://www.typescriptlang.org/pt/docs/handbook/typescript-in-5-minutes.html), a resposta é **NÃO**!

Há algumas diferenças sim, por exemplo, se você criar variáveis ou constantes(`var`, `let` ou `const`) com o nome: `name` em TypeScript, não funcionará, dará erro:
{% highlight typescript %}
var name = "Marcos"
{% endhighlight %}

Você obterá o erro:
{% highlight bash %}
■ Cannot redeclare block-scoped variable 'name'.
{% endhighlight %}

Isso porque o *transpilador* do TypeScript já usa uma declaração com esse mesmo nome de: `name`. Se for usar algo para denominar um objeto ou qualquer outra coisa, use exemplos assim:
{% highlight bash %}
var userName  = "Eric"
let firstName = "Camila"
const theName = "Marcos"
{% endhighlight %}

Mas, em [JavaScript](https://terminalroot.com.br/tags#javascript) isso não há problema nenhum, exemplos:
{% highlight javascript %}
var name = "Débora"
console.log(name)
alert(name)
document.write(name) // Para uso no navegador
{% endhighlight %}

Esse código abaixo, também **NÃO FUNCIONA EM TypeScript**!

<blockquote class="twitter-tweet"><p lang="pt" dir="ltr">o legal do JS é que tem vários easter eggs <a href="https://t.co/Jbks00bTTX">pic.twitter.com/Jbks00bTTX</a></p>&mdash; Terminal Root (@TerminalRootTV) <a href="https://twitter.com/TerminalRootTV/status/1794001079140585554?ref_src=twsrc%5Etfw">May 24, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

> `console.log(++[[]][+[]]+[+[]])`

No entanto, se você veio de outras linguagens de programação, você ainda contará com algumas dificuldades de entender TypeScript. Isso, por exemplo, funciona em TypeScript:

<blockquote class="twitter-tweet"><p lang="pt" dir="ltr">Em JS as constantes são modificáveis, isso demorou de entrar na minha mente <a href="https://t.co/NVBd9ctCF3">pic.twitter.com/NVBd9ctCF3</a></p>&mdash; Terminal Root (@TerminalRootTV) <a href="https://twitter.com/TerminalRootTV/status/1787261823793725508?ref_src=twsrc%5Etfw">May 5, 2024</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


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

## Como Instalar o TypeScript
Para testar os códigos TypeScript você pode escrever no [Playground](https://www.typescriptlang.org/pt/play) do TypeScript. Ou instalar o comando `tsc` na sua máquina utilizando o [NPM](https://terminalroot.com.br/tags#npm), assim:

{% highlight bash %}
sudo npm install -g typescript
{% endhighlight %}
> No [Windows](https://terminalroot.com.br/tags#windows) e no [macOS](https://terminalroot.com.br/tags#macos) não precisa do `sudo`.

Depois crie um código básico, por exemplo, `main.ts`(extensão `.ts`):
{% highlight typescript %}
console.log("Salve, TypeScript!")
{% endhighlight %}

Rode o arquivo com o comando `tsc`:
{% highlight bash %}
tsc main.ts
tsc main.ts --outFile index.js // Compila para um nome diferente
{% endhighlight %}

Após rodar esse comando ele criará um arquivo de mesmo nome, mas com extensão `.js`: `main.js`.

E rode usando um *JavaScript runtime*, exemplos: [Bun](https://terminalroot.com.br/2023/08/conheca-o-bun-um-javascript-runtime-que-vem-fazendo-muito-sucesso.html), [Node](https://terminalroot.com.br/tags#nodejs) ou [QuickJS](https://terminalroot.com.br/2022/03/instale-o-quickjs-uma-alternativa-ao-nodejs-e-denojs.html):
{% highlight bash %}
bun main.js
node main.js
qjs main.js
{% endhighlight %}

Você também pode criar um ambiente de desenvolvimento, exemplo:
{% highlight bash %}
mkdir aprender-typescript
cd aprender-typescript
npm init -y
npm install typescript --save-dev
npx tsc --init
{% endhighlight %}
> Isso fica mais interessante para seu LSP: [Como Configurar o LSP para TypeScript no Neovim](https://terminalroot.com.br/2022/07/como-configurar-o-lsp-para-typescript-no-neovim.html).

Você pode modificar o arquivo `tsconfig.json`, e deixar assim:
{% highlight json %}
{
  "compilerOptions": {
    "outDir": "./dist",
    "module": "commonjs",
    "target": "es6"
  },
  "include": ["main.ts"]
}
{% endhighlight %}

Ele sempre compilará o arquivo `main.ts` apenas rodando:
{% highlight bash %}
tsc
{% endhighlight %}
> E criará um `main.js` dentro da pasta `dist`.

E rodar o arquivo JavaScript:
{% highlight bash %}
bun dist/main.js
{% endhighlight %}
> Ou tudo de uma só vez: `tsc && bun dist/main.js`

Para mais detalhes sobre o comando `tsc` use a ajuda:
{% highlight bash %}
tsc --help
{% endhighlight %}

---

# Tutorial básico
O TypeScript possui *tipos*, por isso seu nome é: TypeScript! 😃 

#### 01. Exemplos dos seus tipos primitivos:
{% highlight typescript %}
let isDone: boolean = false;
let age: number = 42;
let userName: string = "John Doe";
{% endhighlight %}
> Não existe `float` ou `double` é tudo `number`! Mas, tem [outros tipos](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes-func.html#built-in-types) primitivos como: `bigint`, `symbol`, `unknown`, ...

No meu caso, eu tenho o [OpenGL](https://terminalroot.com.br/tags#opengl) instalado e ele definiu tipos para o TypeScript, logo, o tipo `GLfloat` está disponível:
> Meu LSP lista todos os tipos pra mim!
![OpenGL TypeScript 1](/assets/img/typescript/glfloat-opengl-ts-1.png) 
![OpenGL TypeScript 2](/assets/img/typescript/glfloat-opengl-ts-2.png) 

Mas, se não funcionar para você(tem que ter o OpenGL instalado no sistema), defina assim:
{% highlight typescript %}
type GLfloat = number;

let pi: GLfloat = 3.14;
console.info(pi);
{% endhighlight %}


Há um tipo especial: `any`, que você pode usar sempre que não quiser que um valor específico cause erros de verificação de digitação.
{% highlight typescript %}
let obj: any = { x: 0 };
{% endhighlight %}
> Saiba mais [aqui](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#any).

---


<!-- RECTANGLE 2 - OnParagragraph -->
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

#### 02. Possui Arrays e Tuplas:
Um *tipo de tupla* é outro tipo de `Array` que sabe exatamente quantos elementos contém e exatamente quais tipos contém em posições específicas.

{% highlight typescript %}
let numbers: number[] = [1, 2, 3];
let tuple: [string, number] = ["Olá", 42];

console.info(numbers[1])
console.log(tuple[1])
{% endhighlight %}

#### 03. Enumeradores
Enums permitem que um desenvolvedor defina um conjunto de constantes nomeadas. O uso de enums pode facilitar a documentação da intenção ou a criação de um conjunto de casos distintos. TypeScript fornece enumerações numéricas e baseadas em string.

{% highlight typescript %}
enum Color { Vermelho, Verde, Azul }
let c: Color = Color.Verde;

console.log(`O número Verde é: ${c}`)
{% endhighlight %}

#### 04. Interfaces e Classes
Uma declaração de interface é outra maneira de nomear um tipo de objeto:

> Interface
{% highlight typescript %}
interface Person {
    firstName: string;
    lastName: string;
    age?: number; // Opcional
}

function greeter(person: Person) {
    return `E aí, ${person.firstName} ${person.lastName}?!`;
}

const myPerson: Person = {
    firstName: "Mark",
    lastName: "Simmons",
    age: 39
};

console.log(greeter(myPerson));
{% endhighlight %}

> Classe
{% highlight typescript %}
class Animal {
    name: string;

    constructor(name: string) {
        this.name = name;
    }

    distance(distanceInMeters: number = 0) {
        console.log(`O ${this.name} está a ${distanceInMeters}m de mim.`);
    }
}

const myAnimal = new Animal("gato");
myAnimal.distance(10);
{% endhighlight %}
> Note: `name` está dentro de uma classe! 😃 

---

## Dicas
+ Você pode utilizar tipos de união (`|`) e interseção (`&`) para maior flexibilidade.
{% highlight typescript %}
function padLeft(value: string, padding: number | string) {
  if (typeof padding === "number") {
    return `${value}:  ${padding}`
  }
  if (typeof padding === "string") {
    return `${value} ${padding}`;
  }
  throw new Error(`Expected string or number, got '${typeof padding}'.`);
}

console.log(padLeft("Olá", "amigo"))
console.log(padLeft("Olá", 36))
//console.log(padLeft(9, 36)) // Erro
{% endhighlight %}

+ Evite o uso de tipos automáticos:
{% highlight typescript %}
// Má ideia
let myStr1 = "Isso é minha string"

// Boa ideia
let myStr2 : string = "Isso sim é minha string"
{% endhighlight %}

+ Use módulos (`import` e `export`) para organizar seu código.
{% highlight typescript %}
// mymodule.ts
export function dizAi(name: string) {
    return `Calma ${name}`;
}

// main.ts
import { dizAi } from './mymodule';
console.log(dizAi("Calabreso"));
{% endhighlight %}
> Note: Declarei a variável `name`, mas como argumento de função!

Após compilar e rodar:
{% highlight bash %}
tsc && bun dist/main.js
Calma Calabreso
{% endhighlight %}

---

## EXERCÍCIO: [Gerar Números para a Mega-Sena](https://terminalroot.com.br/2024/03/como-gerar-numeros-para-mega-sena-com-linguagem-c.html) com TypeScript
Como vamos usar a função `process.stdout.write()` precisamos instalar o `@types/node`, então rode:
{% highlight bash %}
npm i --save-dev @types/node
{% endhighlight %}

Agora leia o código devidamente comentado com explicação de cada bloco:

{% highlight typescript %}
// Esta função sorteia seis números distintos entre 1 e 60.
function megaSena(): number[] { // Tipo de retorno é um array de number

  // Usamos um Set para armazenar os números. 
  // Um Set não permite duplicatas, então ele garante que todos os números sejam únicos.
  const numbers: Set<number> = new Set();

  while (numbers.size < 6) {
    // A função Math.random() gera um número pseudoaleatório entre 0 (inclusive) e 1 (exclusivo). 
    // Multiplicamos por 60 e adicionamos 1 para obter um número entre 1 e 60.
    const randomNumb = Math.floor(Math.random() * 60) + 1;
    numbers.add(randomNumb);
  }

  // Após gerar seis números, convertê-los de Set para um Array e ordená-los em ordem crescente.
  return Array.from(numbers).sort((a, b) => a - b);
}

// chamamos a função que retorna um Array
const array = megaSena();

// Fazemos um loop e usamos process.stdout.write para não pular linha, console.log pula
for (let index = 0; index < array.length; index++) {
  process.stdout.write(`${array[index]} `)
}
console.log()
{% endhighlight %}

Rode e não esqueça de jogar esses números! 😃 

---

## Conclusão
**TypeScript** oferece uma poderosa maneira de escrever JavaScript com tipos facilitando a manutenção do código. 

> Com os fundamentos acima, você deve estar bem equipado para começar a usar TypeScript em seus projetos. Lembre-se de aproveitar os recursos do TypeScript para criar código mais robusto.

Dê prosseguimento ao seu aprendizado e consulte a documentação no [site oficial](https://www.typescriptlang.org/).



