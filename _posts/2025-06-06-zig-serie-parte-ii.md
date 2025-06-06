---
layout: post
title: "Zig Série: Parte II"
date: 2025-06-06 13:26:13
image: '/assets/img/zig/zig-series-02.jpg'
description: "⚡ Comentários, Variáveis, Concatenação, Tipos de Dados e Constantes"
icon: 'ion:terminal-sharp'
iconname: 'Zig'
tags:
- zig
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Vamos dar continuidade a nossa Série sobre [Zig](https://terminalroot.com.br/tags#zig)!

Na postagem anterior vimos: [⚡ Introdução, Preparando o Ambiente e Olá, Zig!](https://terminalroot.com.br/2025/05/zig-serie-a-linguagem-do-futuro.html) e nessa postagem veremos:

+ **Comentários**
+ **Variáveis**
+ **Concatenação**
+ e **Constantes**

---

## 01. Comentários e Concatenação de String
Zig só usa o comentário *barra barra*( `//`) de linha única, exemplo:

```zig
// Isso é um comentário
const x = 42;
```

Esse tipo de comentário de múltiplas linhas: **NÃO FUNCIONA**:

❌ Erro.
```zig
/*
  Comentário de várias linhas
  /* Comentário aninhado */
+/
```
Saiba mais:
+ **[issue #161](https://github.com/ziglang/zig/issues/161)**
+ **[issue #1305](https://github.com/ziglang/zig/issues/1305)**

Dicas:
+ ****Boa prática:** Use comentários apenas quando o código não for autoexplicativo.**
+ ****Evite:** Comentários redundantes ou que apenas repetem o que o código já diz.**
+ ****Não há preprocessador:** Comentários não são usados para macros como em C/C++.**

### Exemplo do uso de Concatenação de String
```zig
const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const str1 = "Olá, ";
    const str2 = "Mundo!";
    
    // Aloca buffer para as duas strings
    var buffer = try allocator.alloc(u8, str1.len + str2.len);
    defer allocator.free(buffer);
    
    // Usa @memcpy ao invés de std.mem.copyBytes
    @memcpy(buffer[0..str1.len], str1);
    @memcpy(buffer[str1.len..], str2);
    
    // Cria slice do resultado
    const result = buffer[0..str1.len + str2.len];
    
    std.debug.print("{s}\n", .{result});
}
// zig build-exe main.zig && ./main
```

Ou criando uma função separada:
```zig
const std = @import("std");

// Função concat que recebe duas strings e retorna a concatenação
fn concat(allocator: std.mem.Allocator, a: []const u8, b: []const u8) ![]u8 {
    // Aloca buffer para as duas strings
    var buffer = try allocator.alloc(u8, a.len + b.len);
    
    // Copia as strings para o buffer
    @memcpy(buffer[0..a.len], a);
    @memcpy(buffer[a.len..], b);
    
    return buffer;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const str1 = "Olá, ";
    const str2 = "mundo!";
    
    // Chama a função concat
    const result = try concat(allocator, str1, str2);
    defer allocator.free(result); // Importante: liberar a memória
    
    std.debug.print("{s}\n", .{result});
}
// zig build-exe main.zig && ./main
```

Ou ainda salvar a função em um arquivo externo, exemplo:
```bash
projeto/
├── main.zig
└── string_utils.zig
```

> `string_utils.zig`:
```zig
// string_utils.zig
const std = @import("std");

// Função concat que recebe duas strings e retorna a concatenação
pub fn concat(allocator: std.mem.Allocator, a: []const u8, b: []const u8) ![]u8 {
    // Aloca buffer para as duas strings
    var buffer = try allocator.alloc(u8, a.len + b.len);
    
    // Copia as strings para o buffer
    @memcpy(buffer[0..a.len], a);
    @memcpy(buffer[a.len..], b);
    
    return buffer;
}

// Versão alternativa usando std.fmt.allocPrint (mais simples)
pub fn concatSimple(allocator: std.mem.Allocator, a: []const u8, b: []const u8) ![]u8 {
    return try std.fmt.allocPrint(allocator, "{s}{s}", .{ a, b });
}

// Versão que aceita múltiplas strings
pub fn concatMany(allocator: std.mem.Allocator, strings: []const []const u8) ![]u8 {
    var total_len: usize = 0;
    
    // Calcula o tamanho total necessário
    for (strings) |str| {
        total_len += str.len;
    }
    
    // Aloca buffer
    var buffer = try allocator.alloc(u8, total_len);
    var offset: usize = 0;
    
    // Copia todas as strings
    for (strings) |str| {
        @memcpy(buffer[offset..offset + str.len], str);
        offset += str.len;
    }
    
    return buffer;
}
```

> `main.zig`:
```zig
// main.zig
const std = @import("std");
const string_utils = @import("string_utils.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const str1 = "Olá, ";
    const str2 = "mundo!";
    
    // Usando a função concat do módulo externo
    const result = try string_utils.concat(allocator, str1, str2);
    defer allocator.free(result);
    
    std.debug.print("Resultado: {s}\n", .{result});
    
    // Exemplo usando a versão simples
    const result2 = try string_utils.concatSimple(allocator, "Zig ", "é incrível!");
    defer allocator.free(result2);
    
    std.debug.print("Resultado 2: {s}\n", .{result2});
    
    // Exemplo usando múltiplas strings
    const strings = [_][]const u8{ "Uma ", "frase ", "com ", "várias ", "palavras!" };
    const result3 = try string_utils.concatMany(allocator, &strings);
    defer allocator.free(result3);
    
    std.debug.print("Resultado 3: {s}\n", .{result3});
}
// zig build-exe main.zig && ./main
```

---

## 02. Variáveis e Constantes
+ **1. Declaração de Variáveis**
  - `var`: variável mutável.
> `main.zig`

```zig
const std = @import("std");

pub fn main() void {
    var x: i32 = 10;
    x = 20;
    std.debug.print("Output: {}!\n", .{x}); // {s} é para string
}
// zig build-exe main.zig && ./main
```

  - `const`: variável imutável.
```zig
const std = @import("std");

pub fn main() void {
    const y: i32 = 5;
    std.debug.print("Output: {}\n", .{y});
}
// zig build-exe main.zig && ./main
```

  - Tipagem pode ser inferida:
```zig
const std = @import("std");

pub fn main() void {
    // Variável:
    //var a = 42;   // tipo inferido como i32, erro: nunca é mutado(use const)
    // Ou:
    var a: i32 = 42;
    a = 36;         // Precisa modificar pelo menos uma vez

    // Constante:
    const b = true; // tipo inferido como bool
    std.debug.print("Output a: {}\n", .{a});
    std.debug.print("Output b: {}\n", .{b});
}
// zig build-exe main.zig && ./main
```

+ **2. Inicialização Obrigatória**
Toda variável deve ser inicializada no momento da declaração.

```zig
var z: i32; // Erro: não inicializada
```

+ **3. Somente Atribuição Após a Declaração**
Não é possível declarar e depois atribuir valor fora da declaração.

```zig
var x: i32 = 0; // Correto
x = 5;          // Correto

var y: i32;     // Erro
y = 10;
```

+ **4. Shadowing Não Suportado**
Zig não permite redeclarar uma variável com o mesmo nome no mesmo escopo.

+ **5. Variáveis com `comptime`**
Usadas em tempo de compilação:

```zig
const std = @import("std");

pub fn main() void {
  comptime var value = 123;
  value = 321; // precisa mudar pelo menos uma vez
  std.debug.print("Output: {}\n", .{value});
}
// zig build-exe main.zig && ./main
```

+ **6. Dicas**
  - **Use `const` sempre que possível.**
  - **Tipos explícitos ajudam na legibilidade e segurança.**
  - **Zig não tem `null` por padrão — use `?T` para tipos opcionais:**
```zig
var maybe_num: ?i32 = null;
```
