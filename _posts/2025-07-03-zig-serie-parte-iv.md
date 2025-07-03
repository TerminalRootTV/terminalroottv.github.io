---
layout: post
title: "Zig Série: Parte IV"
date: 2025-07-03 10:47:18
image: '/assets/img/zig/zig-series-04.jpg'
description: "⚡ Operadores, Condições e Loops."
icon: 'ion:terminal-sharp'
iconname: 'Zig'
tags:
- zig
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Vamos dar continuidade a nossa Série sobre [Zig](https://terminalroot.com.br/tags#zig)!

Na [postagem anterior](https://terminalroot.com.br/2025/06/zig-serie-parte-iii.html) vimos:
+ Tipos de dados
+ e Arrays

E nessa postagem veremos:
+ Operadores
+ Condições
+ e loops

---

## Operadores
Assim como em outras linguagens de programação, os operadores em Zig são usados para executar operações em variáveis e valores. São eles:


| Categoria             | Operador                      | Descrição                                      |                 |
| --------------------- | ----------------------------- | ---------------------------------------------- | --------------- |
| **Aritméticos**       | `+`                           | Soma                                           |                 |
|                       | `-`                           | Subtração                                      |                 |
|                       | `*`                           | Multiplicação                                  |                 |
|                       | `/`                           | Divisão inteira (com erro em divisão por zero) |                 |
|                       | `divTrunc`                    | Divisão truncada (não lança erro)              |                 |
|                       | `divFloor`                    | Divisão com arredondamento para -∞             |                 |
|                       | `%`                           | Resto (mod)                                    |                 |
|                       | `mod`                         | Módulo matemático (resultado sempre positivo)  |                 |
|                       | `**`                          | Potência                                       |                 |
| **Incremento/Decr.**  | `+=`                          | Soma e atribuição                              |                 |
|                       | `-=`                          | Subtração e atribuição                         |                 |
|                       | `*=`                          | Multiplicação e atribuição                     |                 |
|                       | `/=`                          | Divisão e atribuição                           |                 |
| **Bitwise**           | `&`                           | AND bit a bit                                  |                 |
|                       | \`                            | \`                                             | OR bit a bit    |
|                       | `^`                           | XOR bit a bit                                  |                 |
|                       | `~`                           | NOT bit a bit                                  |                 |
|                       | `<<`                          | Shift à esquerda                               |                 |
|                       | `>>`                          | Shift à direita                                |                 |
|                       | `&=`                          | AND e atribuição                               |                 |
|                       | \`                            | =\`                                            | OR e atribuição |
|                       | `^=`                          | XOR e atribuição                               |                 |
|                       | `<<=`                         | Shift à esquerda e atribuição                  |                 |
|                       | `>>=`                         | Shift à direita e atribuição                   |                 |
| **Comparação**        | `==`                          | Igualdade                                      |                 |
|                       | `!=`                          | Diferença                                      |                 |
|                       | `<`                           | Menor                                          |                 |
|                       | `<=`                          | Menor ou igual                                 |                 |
|                       | `>`                           | Maior                                          |                 |
|                       | `>=`                          | Maior ou igual                                 |                 |
| **Lógicos**           | `!`                           | NOT lógico                                     |                 |
|                       | `and`                         | AND lógico                                     |                 |
|                       | `or`                          | OR lógico                                      |                 |
| **Outros**            | `?`                           | Operador de erro (unwrap / try / catch)        |                 |
|                       | `try`                         | Propaga erro                                   |                 |
|                       | `catch`                       | Trata erro                                     |                 |
|                       | `orelse`                      | Valor padrão em caso de `null` ou erro         |                 |
|                       | `if`                          | Condicional                                    |                 |
|                       | `else`                        | Alternativa ao `if`                            |                 |
|                       | `while`, `for`                | Laços                                          |                 |
|                       | `break`, `continue`, `return` | Controle de fluxo                              |                 |
| **Pointer/Deref.**    | `*`                           | Dereferência                                   |                 |
|                       | `&`                           | Referência (endereço)                          |                 |
|                       | `.`                           | Acesso a campo                                 |                 |
|                       | `->`                          | Acesso a campo de ponteiro (via `.*`)          |                 |
| **Array/Slice**       | `[]`                          | Indexação                                      |                 |
|                       | `len`                         | Tamanho (`.len`)                               |                 |
| **Struct/Enum/Union** | `@field`                      | Acesso dinâmico a campo                        |                 |
|                       | `@enumToInt`                  | Enum para inteiro                              |                 |
|                       | `@intToEnum`                  | Inteiro para enum                              |                 |

> Zig não tem sobrecarga de operadores nem operadores customizáveis.

---

## Condições
Zig, lógico, também suporta condições lógicas e declarações:

### `if` e `else`

{% highlight zig %}
const std = @import("std");

pub fn main() void {
    const x = 10;

    if (x > 5) {
        std.debug.print("maior que 5\n", .{});
    } else {
        std.debug.print("menor ou igual a 5\n", .{});
    }
}
{% endhighlight %}

* `if` exige valor booleano.
* Não precisa de parênteses, mas são permitidos.


### `if` como expressão

{% highlight zig %}
const result = if (true) 1 else 2;
// result == 1
{% endhighlight %}


### `if` com `orelse` (para opcionais)

{% highlight zig %}
const maybe_num: ?i32 = null;
const val = maybe_num orelse 42; // se null, usa 42
{% endhighlight %}


### `if` com `catch` (para erros)

{% highlight zig %}
fn mightFail() !i32 {
    return error.Fail;
}

const result = mightFail() catch 123;
// se erro, usa 123
{% endhighlight %}


### `switch`

{% highlight zig %}
const std = @import("std");

pub fn main() void {
    const value = 2;

    switch (value) {
        1 => std.debug.print("um\n", .{}),
        2 => std.debug.print("dois\n", .{}),
        else => std.debug.print("outro\n", .{}),
    }
}
{% endhighlight %}

* `switch` exige exaustividade ou `else`.
* Pode ser usado como expressão:

{% highlight zig %}
const name = switch (value) {
    1 => "um",
    2 => "dois",
    else => "outro",
};
{% endhighlight %}


### `if` com `optional` + `if`

{% highlight zig %}
const opt: ?i32 = 5;

if (opt) |val| {
    // val contém o valor não-nulo
    std.debug.print("Valor: {}\n", .{val});
} else {
    std.debug.print("É null\n", .{});
}
{% endhighlight %}


### `if` com `error union`

{% highlight zig %}
fn f() !i32 {
    return 5;
}

if (f()) |val| {
    std.debug.print("Sem erro: {}\n", .{val});
} else |err| {
    std.debug.print("Erro: {}\n", .{err});
}
{% endhighlight %}

---

## Loops
Na programação estruturada, loop ou laço é um recurso para executar determinadas ações até que a condição seja satisfatória. No caso do comando loop ou laço seletivo que o torna possível o local e o momento que será usado em um programa para a verificação da condição de encerramento do mesmo.

Abaixo estão **todos os tipos de loops em Zig**, com exemplos objetivos:


### `while`

{% highlight zig %}
var i: i32 = 0;
while (i < 5) : (i += 1) {
    std.debug.print("i = {}\n", .{i});
}
{% endhighlight %}

* `: (i += 1)` é o incremento (opcional).
* Equivalente a `for` clássico de C.


### `while` com `break` e `continue`

{% highlight zig %}
var i: i32 = 0;
while (true) {
    if (i == 3) {
        i += 1;
        continue; // pula o restante do loop
    }
    if (i >= 5) break;
    std.debug.print("{}\n", .{i});
    i += 1;
}
{% endhighlight %}


### `while` com binding (opcional)

{% highlight zig %}
const opt: ?i32 = 10;
while (opt) |val| {
    std.debug.print("val = {}\n", .{val});
    break;
}
{% endhighlight %}


### `while` com erro

{% highlight zig %}
fn maybeFail(i: i32) !i32 {
    if (i == 3) return error.Fail;
    return i;
}

var i: i32 = 0;
while (maybeFail(i)) |val| : (i += 1) {
    std.debug.print("val = {}\n", .{val});
}
{% endhighlight %}


### `for` com arrays/slices

{% highlight zig %}
const arr = [_]i32{1, 2, 3};
for (arr) |val| {
    std.debug.print("val = {}\n", .{val});
}
{% endhighlight %}

* `|val|` é o valor do elemento.
* Para índice:

{% highlight zig %}
for (arr) |val, i| {
    std.debug.print("arr[{}] = {}\n", .{i, val});
}
{% endhighlight %}


### `for` com break/continue

{% highlight zig %}
for (arr) |val| {
    if (val == 2) continue;
    if (val == 3) break;
    std.debug.print("val = {}\n", .{val});
}
{% endhighlight %}


### `inline for` (comptime)

{% highlight zig %}
const std = @import("std");

const arr = [_]i32{1, 2, 3};

pub fn main() void {
    inline for (arr) |val| {
        std.debug.print("Comptime val = {}\n", .{val});
    }
}
{% endhighlight %}

* Executa o loop em tempo de compilação.
* Usado para gerar código, não para lógica em runtime.


### `loop` com rótulo (label) para controle aninhado

{% highlight zig %}
outer: while (true) {
    inner: while (true) {
        break :outer; // quebra o loop externo
    }
}
{% endhighlight %}

### `while` com condição

{% highlight zig %}
var i: i32 = 0;
while (i < 5) : (i += 1) {
    std.debug.print("{}\n", .{i});
}
{% endhighlight %}

### `while` com optional binding

{% highlight zig %}
const arr = [_]?i32{ 1, 2, null, 4 };
var i: usize = 0;

while (i < arr.len) : (i += 1) {
    if (arr[i]) |val| {
        std.debug.print("Valor: {}\n", .{val});
    } else {
        std.debug.print("Null\n", .{});
    }
}
{% endhighlight %}

---

Até o próximo artigo!

