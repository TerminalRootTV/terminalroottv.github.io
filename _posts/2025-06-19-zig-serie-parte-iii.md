---
layout: post
title: "Zig Série: Parte III"
date: 2025-06-19 10:56:39
image: '/assets/img/zig/serie-zig-tipos-de-dados-e-arrays.jpg'
description: "⚡ Tipos de dados e Arrays."
icon: 'ion:terminal-sharp'
iconname: 'Zig'
tags:
- zig
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Vamos dar continuidade a nossa Série sobre [Zig](https://terminalroot.com.br/tags#zig)!

Na [postagem anterior](https://terminalroot.com.br/2025/06/zig-serie-parte-ii.html) vimos: 
+ Comentários
+ Variáveis
+ Concatenação
+ e Constantes

E nessa postagem veremos:
+ Tipos de dados
+ e Arrays


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

## Tipos de Dados em Zig
Zig possui tipos de dados simples e explícitos, com forte foco em controle e desempenho. Abaixo, os principais:

#### 1. **Tipos Inteiros**
+ **Com sinal:** `i8`, `i16`, `i32`, `i64`, `i128`
+ **Sem sinal:** `u8`, `u16`, `u32`, `u64`, `u128`
+ **Inteiro genérico:** `usize` (tamanho de ponteiro), `isize`
{% highlight zig %}
const a: i32 = -10;
const b: u64 = 42;
const size: usize = 1024;
{% endhighlight %}

#### 2. **Ponto Flutuante**
+ `f16`, `f32`, `f64`, `f128` (dependendo da plataforma)
{% highlight zig %}
const pi: f64 = 3.1415;
const small: f32 = 0.0001;
{% endhighlight %}

#### 3. **Booleano**
+ `bool` (`true` ou `false`)
{% highlight zig %}
const is_valid: bool = true;
{% endhighlight %}

#### 4. **Ponteiros**
+ `*T`: ponteiro simples
+ `[*]T`: fatia de comprimento fixo
+ `[]T`: fatia de comprimento dinâmico
+ `?*T`: ponteiro opcional (pode ser `null`)
{% highlight zig %}
const x: i32 = 10;
const px: *const i32 = &x;      // ponteiro constante
const buffer: []u8 = "abc";     // slice dinâmica
{% endhighlight %}

#### 5. **Arrays**
+ `[N]T`: array de tamanho fixo
+ `[]const u8`: string (sem null terminator)
{% highlight zig %}
const fixed: [3]u8 = .{1, 2, 3};
const str: []const u8 = "Zig!";
{% endhighlight %}

#### 6. **Enums**
+ `enum { A, B, C }`: mapeia para inteiros
+ Suporta discriminação e introspecção
{% highlight zig %}
const State = enum { Idle, Running, Done };
var s: State = State.Idle;
{% endhighlight %}

#### 7. **Structs**
+ `struct { x: i32, y: i32 }`: agrupamento de campos com tipos definidos
{% highlight zig %}
const Vec2 = struct {
    x: f32,
    y: f32,
};

const v = Vec2{ .x = 1.0, .y = 2.0 };
{% endhighlight %}

#### 8. **Unions**
+ `union(enum) { A: i32, B: f32 }`: tipo com variantes exclusivas
{% highlight zig %}
const Value = union(enum) {
    Int: i32,
    Float: f32,
};

var v = Value{ .Int = 10 };
{% endhighlight %}

#### 9. **Optionals**
+ `?T`: tipo que pode ser `null`
{% highlight zig %}
const maybe_value: ?i32 = null;
if (maybe_value) |val| {
    std.debug.print("Valor: {}\n", .{val});
}
{% endhighlight %}

#### 10. **Errors**
+ `error{Err1, Err2}`: enum de erros
+ Usado com `!T`: retorno que pode ser valor ou erro
{% highlight zig %}
const MyError = error{ NotFound };

fn get() !i32 {
    return MyError.NotFound;
}
{% endhighlight %}

#### 11. **Comptime**
+ `comptime T`: tipo avaliado em tempo de compilação
{% highlight zig %}
fn printType(comptime T: type) void {
    std.debug.print("Tipo: {}\n", .{@typeName(T)});
}
{% endhighlight %}

#### 12. **Anytype**
+ Tipo genérico que se adapta automaticamente
{% highlight zig %}
fn identity(value: anytype) @TypeOf(value) {
    return value;
}
{% endhighlight %}

#### 13. **Void e NoReturn**
+ `void`: ausência de valor
+ `noreturn`: função que nunca retorna (ex: loop infinito ou panic)
{% highlight zig %}
fn doNothing() void {}

fn crash() noreturn {
    while (true) {}
}
{% endhighlight %}

---

## Exemplos
Usando os tipos em contexto funcional:

### Enum com `switch`
{% highlight zig %}
const std = @import("std");

const State = enum {
    Idle,
    Running,
    Finished,
};

fn handleState(state: State) void {
    switch (state) {
        State.Idle => std.debug.print("Idle\n", .{}),
        State.Running => std.debug.print("Running\n", .{}),
        State.Finished => std.debug.print("Finished\n", .{}),
    }
}

pub fn main() void {
    handleState(State.Running);
}
{% endhighlight %}

---

### Optional com verificação
{% highlight zig %}
const std = @import("std");

fn maybeFind(value: i32) ?i32 {
    if (value > 0) return value;
    return null;
}

pub fn main() void {
    const result = maybeFind(5);
    if (result) |val| {
        std.debug.print("Found: {}\n", .{val});
    } else {
        std.debug.print("Not found\n", .{});
    }
}
{% endhighlight %}

---

### Criando esse código [C++](https://terminalroot.com.br/tags#cpp) equivalente em [Zig](https://terminalroot.com.br/tags#zig)
> Uso de *arrays*.

Nesse caso estamos usando [std::vector](https://terminalroot.com.br/2021/08/diferencas-entre-list-e-vector-na-stl-do-cpp.html), mas podia ser quaisquer outros, exemplos:
> [deque](https://terminalroot.com.br/2022/02/deque-ou-vector-qual-devo-escolher-em-cpp.html), [list](https://terminalroot.com.br/2022/02/deque-ou-vector-qual-devo-escolher-em-cpp.html), `unordered_list`, [set](https://terminalroot.com.br/2021/04/cpp-daily-std-set-multiset-move.html), `unordered_set`, [array](https://terminalroot.com.br/2023/05/como-usar-o-stdarray-em-cpp.html), `forward_list`, [multiset](https://terminalroot.com.br/2021/04/cpp-daily-std-set-multiset-move.html), `unordered_multiset`, queue, `priority_queue`, [map](https://terminalroot.com.br/2024/10/qual-a-mais-rapida-stdunorderedmap-ou-stdmap.html) ou [unordered_map](https://terminalroot.com.br/2024/10/qual-a-mais-rapida-stdunorderedmap-ou-stdmap.html).

+ **C++**:
{% highlight cpp %}
#include <iostream>
#include <vector>

int main(){
  std::vector<std::string> langs {"C++", "C", "Go", "Zig", "Java"};

  std::cout << "Imprimindo todos os elementos:\n";
  for(const auto& target : langs){
    std::cout << target << ' ';
  }
  std::cout.put('\n');

  std::cout << "Adicionando 1 elemento ao final:\n";
  langs.push_back("Python");

  std::cout << "Adicionando 1 elemento a 3º posição:\n";
  langs.insert(langs.begin() + 2, "Assembly");

  std::cout << "Removendo o 1º elemento:\n";
  langs.erase(langs.begin());

  std::cout << "Removendo o último elemento:\n";
  langs.pop_back();

  std::cout << "Removendo o 3º elemento:\n";
  if (langs.size() > 2) langs.erase(langs.begin() + 2);

  std::cout << "Remover elemento por nome(Assembly):\n";
  langs.erase(std::remove(langs.begin(), langs.end(), "Assembly"), langs.end());

  std::cout << "Adicionando 1 elemento no início:\n";
  langs.insert(langs.begin(), "C++"); // Ou langs.emplace(langs.begin(), "C++");


  std::cout << "Imprimindo todos os elementos:\n";
  for(const auto& target : langs){
    std::cout << target << ' ';
  }
  std::cout.put('\n');
}
{% endhighlight %}

+ **Zig**, usando `std.ArrayList([]const u8)` com alocador padrão(heap):
{% highlight zig %}
const std = @import("std");

pub fn main() !void {
  const allocator = std.heap.page_allocator;
  var langs = std.ArrayList([]const u8).init(allocator);

  // Inicializar a lista
  try langs.appendSlice(&[_][]const u8{
    "C++", "C", "Go", "Zig", "Java"
  });

  std.debug.print("Imprimindo todos os elementos:\n", .{});
  printList(langs.items);

  // Adiciona no final
  std.debug.print("Adicionando 1 elemento ao final:\n", .{});
  try langs.append("Python");

  // Insere na posição 2 (índice 2 == 3º elemento)
  std.debug.print("Adicionando 1 elemento a 3º posição:\n", .{});
  try langs.insert(2, "Assembly");

  // Remove o primeiro
  std.debug.print("Removendo o 1º elemento:\n", .{});
  _ = langs.orderedRemove(0);

  // Remove o último
  std.debug.print("Removendo o último elemento:\n", .{});
  _ = langs.pop();

  // Remove o 3º (índice 2)
  std.debug.print("Removendo o 3º elemento:\n", .{});
  if (langs.items.len > 2) {
    _ = langs.orderedRemove(2);
  }

  // Remove "Assembly" por nome
  std.debug.print("Remover elemento por nome(Assembly):\n", .{});
  var i: usize = 0;
  while (i < langs.items.len) {
    if (std.mem.eql(u8, langs.items[i], "Assembly")) {
      _ = langs.orderedRemove(i);
    } else {
      i += 1;
    }
  }

  // Adiciona no início
  std.debug.print("Adicionando 1 elemento no início:\n", .{});
  try langs.insert(0, "C++");

  // Imprime lista final
  std.debug.print("Imprimindo todos os elementos:\n", .{});
  printList(langs.items);

  // Libera memória
  langs.deinit();
}

fn printList(list: []const []const u8) void {
  for (list) |item| {
    std.debug.print("{s} ", .{item});
  }
  std.debug.print("\n", .{});
}
{% endhighlight %}
* O uso de `std.ArrayList` permite comportamento similar ao `std::vector`.
* `orderedRemove(index)` remove e preserva a ordem (como `erase` em C++).
* Strings são tratadas como `[]const u8` (fatias).
* O `allocator` usado é o `page_allocator` por simplicidade.

Você também poderia usar: `std.heap.ArenaAllocator` ou lista com `[]std.BoundedArray`.

