---
layout: post
title: "Tutorial de Assembly x86_64 com GNU Assembler (GAS) para Iniciantes"
date: 2024-05-27 10:03:26
image: '/assets/img/assembly/gas.jpg'
description: 'Além de mostrar as diferenças básicas em GAS e NASM.'
icon: 'ion:terminal-sharp'
iconname: 'Assembly'
tags:
- assembly
- gnu
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **GNU Assembler**, comumente conhecido como **gas** ou **as**, é o assembler desenvolvido pelo [Projeto GNU](https://terminalroot.com.br/tags#gnu). 

É o *back-end* padrão do [GCC](https://terminalroot.com.br/tags#gcc). 

Ele é usado para montar o [sistema operacional GNU](https://en.wikipedia.org/wiki/GNU) e o kernel [Linux](https://terminalroot.com.br/tags#gnulinux), e vários outros softwares. 

Faz parte do pacote [GNU Binutils](https://www.gnu.org/software/binutils/).

O GAS é multiplataforma e pode ser executado e montado em diversas arquiteturas de computador diferentes.

É um [software livre](https://terminalroot.com.br/tags#freesoftware) lançado sob a [Licença Pública Geral GNU v3](https://www.gnu.org/licenses/gpl-3.0.html).

A extensão padrão é `.s`(o ideal é para identificação), mas você pode usar qualquer extensão desde que haja somente código GAS dentro do arquivo, exemplos: `.gas`, `.as` e `.S`.


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

## Conceito inicial sobre Registradores
Os registradores em assembly `x86_64` são utilizados para armazenar dados temporários e realizar operações aritméticas e lógicas. São eles:

### Registradores de Propósito Geral (64 bits)
+ **RAX (Accumulator Register)**: Usado para operações aritméticas e retornos de funções.
+ **RBX (Base Register)**: Pode ser usado para acessar dados na memória.
+ **RCX (Counter Register)**: Utilizado como contador em loops e operações de repetição.
+ **RDX (Data Register)**: Usado em operações aritméticas e I/O.
+ **RSI (Source Index)**: Utilizado como ponteiro de origem em operações de string.
+ **RDI (Destination Index)**: Utilizado como ponteiro de destino em operações de string.
+ **RBP (Base Pointer)**: Utilizado para apontar para a base de uma stack frame.
+ **RSP (Stack Pointer)**: Aponta para o topo da pilha.
+ **R8-R15**: Registradores adicionais de propósito geral.

### Registradores Segment (16 bits)
+ **CS (Code Segment)**: Segmento de código.
+ **DS (Data Segment)**: Segmento de dados.
+ **SS (Stack Segment)**: Segmento de pilha.
+ **ES, FS, GS**: Segmentos adicionais utilizados em operações de dados específicos.

### Registradores de Propósito Especial
+ **RIP (Instruction Pointer)**: Aponta para a próxima instrução a ser executada.
+ **RFLAGS (Flags Register)**: Contém flags de status e controle, como carry, zero, sign, overflow, etc.

### Registradores de Propósito Geral (32 bits)
+ **EAX, EBX, ECX, EDX, ESI, EDI, EBP, ESP**: Versões de 32 bits dos registradores de 64 bits.
+ **R8D-R15D**: Versões de 32 bits dos registradores R8-R15.

### Registradores de Propósito Geral (16 bits)
+ **AX, BX, CX, DX, SI, DI, BP, SP**: Versões de 16 bits dos registradores de 64 bits.
+ **R8W-R15W**: Versões de 16 bits dos registradores R8-R15.

### Registradores de Propósito Geral (8 bits)
+ **AH, AL, BH, BL, CH, CL, DH, DL**: Subdivisões dos registradores de 16 bits (AX, BX, CX, DX).
+ **R8B-R15B**: Versões de 8 bits dos registradores R8-R15.
+ **SPL, BPL, SIL, DIL**: Versões de 8 bits dos registradores SP, BP, SI, DI.

### Registradores de Vetor/SIMD
+ **XMM0-XMM15**: Usados para operações SIMD (Single Instruction, Multiple Data) de 128 bits.
+ **YMM0-YMM15**: Versões de 256 bits dos registradores XMM.
+ **ZMM0-ZMM31**: Versões de 512 bits dos registradores XMM, usados em AVX-512.
+ **Exemplos de Uso**:
+ **RAX**: Guardar resultado de uma operação de multiplicação.
+ **RSI e RDI**: Usados em operações de copiar memória (movsb, movsw, movsd, movsq).
+ **RCX**: Usado como contador de loop (loop).
+ **Esses são os principais registradores em NASM para x86_64. Eles são essenciais para manipulação de dados, controle de fluxo, e execução de operações em programas assembly.

---

## Diferença entre os registradores GAS e NASM
Os registradores possuem o mesmo conceito e funcionalidade básica tanto no NASM quanto no GNU Assembler (GAS) para a arquitetura `x86_64`. A principal diferença entre NASM e GAS é a sintaxe usada para escrever os programas, mas os registradores e suas utilizações permanecem consistentes.

### Registradores de Propósito Geral (64 bits)
+ **NASM**: `rax`, `rbx`, `rcx`, `rdx`, `rsi`, `rdi`, `rbp`, `rsp`, `r8-r15`
+ **GAS**: `%rax`, `%rbx`, `%rcx`, `%rdx`, `%rsi`, `%rdi`, `%rbp`, `%rsp`, `%r8-%r15`

### Registradores de Propósito Geral (32 bits)
+ **NASM**: `eax`, `ebx`, `ecx`, `edx`, `esi`, `edi`, `ebp`, `esp`, `r8d-r15d`
+ **GAS**: `%eax`, `%ebx`, `%ecx`, `%edx`, `%esi`, `%edi`, `%ebp`, `%esp`, `%r8d-%r15d`

### Registradores de Propósito Geral (16 bits)
+ **NASM**: `ax`, `bx`, `cx`, `dx`, `si`, `di`, `bp`, `sp`, `r8w-r15w`
+ **GAS**: `%ax`, `%bx`, `%cx`, `%dx`, `%si`, `%di`, `%bp`, `%sp`, `%r8w-%r15w`

### Registradores de Propósito Geral (8 bits)
+ **NASM**: `ah`, `al`, `bh`, `bl`, `ch`, `cl`, `dh`, `dl`, `spl`, `bpl`, `sil`, `dil`, `r8b-r15b`
+ **GAS**: `%ah`, `%al`, `%bh`, `%bl`, `%ch`, `%cl`, `%dh`, `%dl`, `%spl`, `%bpl`, `%sil`, `%dil`, `%r8b-%r15b`

### Registradores Segment (16 bits)
+ **NASM**: `cs`, `ds`, `ss`, `es`, `fs`, `gs`
+ **GAS**: `%cs`, `%ds`, `%ss`, `%es`, `%fs`, `%gs`

### Registradores de Propósito Especial
+ **NASM**: `rip`, `rflags`
+ **GAS**: `%rip`, %rflags

### Registradores de Vetor/SIMD
+ **NASM**: `xmm0-xmm15`, `ymm0-ymm15`, `zmm0-zmm31`
+ **GAS**: `%xmm0-%xmm15`, `%ymm0-%ymm15`, `%zmm0-%zmm31`


<!-- RECTANGLE LARGE -->
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

## Instalação
Para instalar o GNU Assembler (GAS) você deve instalar o pacote [binutils](https://www.gnu.org/software/binutils/), que inclui o assembler as (parte do conjunto de ferramentas GNU Binutils). 

Você pode fazer o download direto da página: <https://www.gnu.org/software/binutils/> ou usar o seu gerenciador de pacotes, exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install binutils
{% endhighlight %}

No Windows você deve usar o [MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) e fazer [download aqui](https://sourceforge.net/projects/mingw/files/MinGW/Base/binutils/binutils-2.28/) do binutils.

---

## Exemplos
Agora veremos alguns exemplos de códigos básicos para nos adaptarmos como a sintaxe é utilizada.

### 01. Criando um "Hello, World!"

{% highlight nasm %}
.section .data
hello:
    .ascii "Hello, World!\0"

.section .text
.globl _start

_start:
    mov $1, %rax        # syscall: sys_write
    mov $1, %rdi        # file descriptor: stdout
    mov $hello, %rsi    # endereço da string
    mov $13, %rdx       # comprimento da string
    syscall             # chama o kernel

    mov $60, %rax       # syscall: sys_exit
    xor %rdi, %rdi      # status de saída: 0
    syscall             # chama o kernel
{% endhighlight %}

+ `.section .data`: Declara a seção de dados, onde as variáveis e *strings* são armazenadas.
+ `hello: .ascii "Hello, World!\0"`: Define uma string terminada em nulo (`0`).
+ `.section .text`: Declara a seção de código, onde o código executável é armazenado.
+ `.globl _start`: Torna a label `_start` visível para o linker.
+ `_start`: Ponto de entrada do programa.
+ `mov $1, %rax`: Coloca o número do *syscall sys_write* no registrador `rax`.
+ `mov $1, %rdi`: Coloca o número do file descriptor (*stdout*) no registrador `rdi`.
+ `mov $hello, %rsi`: Coloca o endereço da *string* `hello` no registrador `rsi`.
+ `mov $13, %rdx`: Coloca o comprimento da string no registrador `rdx`.
+ `syscall`: Chama o kernel para executar o `syscall`.
+ `mov $60, %rax`: Coloca o número do *syscall sys_exit* no registrador `rax`.
+ `xor %rdi, %rdi`: Zera o registrador `rdi` para definir o status de saída como `0`.
+ `syscall`: Chama o kernel para terminar o programa.

Compilar e executar:
{% highlight bash %}
as --64 -o hello.o hello.s
ld -o hello hello.o
./hello
{% endhighlight %}
> No Windows é o `hello.exe` em vez de `./hello`.

Após rodar, note que o `Hello, World!` vai colar com o *prompt*:
{% highlight bash %}
Hello, World!$prompt> 
{% endhighlight %}

Para resolver isso, troque o `\0` por `\n`:
{% highlight bash %}
# .ascii "Hello, World!\0"
.ascii "Hello, World!\n"
{% endhighlight %}

E aumente o comprimento da string para 14 bytes (13 caracteres + 1 para a quebra de linha `\n`):
{% highlight bash %}
# mov $13, %rdx
mov $14, %rdx
{% endhighlight %}

Recompile e rode!

---

## Comparação do GAS com NASM
> Mesmo código, mas com NASM:
{% highlight nasm %}
section .data
    msg db 'Hello, World!', 0

section .text
    global _start
_start:
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; file descriptor: stdout
    mov rsi, msg            ; pointer to message
    mov rdx, 13             ; message length
    syscall                 ; make the syscall
    mov rax, 60             ; syscall: exit
    xor rdi, rdi            ; status: 0
    syscall                 ; make the syscall
{% endhighlight %}
> Para compilar e rodar o NASM:
{% highlight bash %}
# Antes instale o NASM, ex.: sudo apt install nasm
nasm -f elf64 hello.asm
ld -s -o hello hello.o
./hello
{% endhighlight %}

**Note**: Além do símbolo `%`(do GAS) *na frente* do registradores e os comentários serem `#`(GAS) e `;`(NASM), o GAS também pode comentar estilo [C](https://terminalroot.com.br/c): `/* Comentário para multiplas linhas */`, além de outras formas dependendo da arquitetura, exemplos: 
+ `;`  — AMD 29k family, ARC, H8/300 family, HPPA, PDP-11, picoJava, Motorola e M32C
+ `@`  — ARM 32-bit
+ `//` — AArch64
+ `|`  — M680x0
+ `!`  — Renesas SH
+ `#`  — i386, x86-64, i960, 68HC11, 68HC12, VAX, V850, M32R, PowerPC, MIPS, M680x0, e RISC-V

Embora a sintaxe seja diferente (**NASM** usa uma abordagem mais "*intel*" enquanto **GAS** usa uma abordagem "*AT&T*"), os registradores desempenham as mesmas funções em ambas as assemblers.


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

## Há outros Assemblers
Além do **GNU Assembler (GAS)** e do **NASM (Netwide Assembler)**, existem vários outros assemblers conhecidos e amplamente utilizados. Aqui estão alguns dos mais notáveis:

#### MASM (Microsoft Macro Assembler):
+ Utilizado principalmente para desenvolvimento em plataformas Windows.
+ Suporta diversas versões de sintaxe e é frequentemente usado para desenvolver drivers e outros componentes de baixo nível.

#### FASM (Flat Assembler):
+ Um assembler de código aberto e multiplataforma.
+ Conhecido por sua velocidade e capacidade de compilar a si mesmo.

#### TASM (Turbo Assembler):
+ Desenvolvido pela Borland.
+ Era popular nos anos 80 e 90 e frequentemente utilizado em conjunto com o Turbo C e outras ferramentas Borland.

#### YASM:
+ Um assembler de baixo nível compatível com a sintaxe NASM.
+ Suporta x86 e x86-64 e é projetado para ser rápido e extensível.

#### A86/A386:
+ Um assembler DOS shareware para programação x86.
+ Conhecido por ser fácil de usar e eficiente.

#### HLA (High-Level Assembler):
+ Desenvolvido por Randall Hyde, conhecido por seu livro "The Art of Assembly Language".
+ Proporciona uma sintaxe de alto nível que facilita o aprendizado e o uso do assembly.

#### SPIM:
+ Um assembler e simulador para a arquitetura MIPS.
+ Frequentemente utilizado em cursos universitários para ensino de assembly MIPS.

#### Keil Assembler:
+ Parte do conjunto de ferramentas Keil para microcontroladores, especialmente populares para desenvolvimento com ARM.

#### TASM (Turbo Assembler):
+ Desenvolvido pela Borland, é um assembler antigo que foi muito usado nos anos 80 e 90.
+ Esses assemblers são usados em diferentes contextos, desde desenvolvimento de sistemas embarcados até programação de aplicações de baixo nível em diversas plataformas. Cada um tem suas próprias características e sintaxes que podem ser mais adequadas para determinadas tarefas e ambientes de desenvolvimento.

Esses assemblers são usados em diferentes contextos, desde desenvolvimento de sistemas embarcados até programação de aplicações de baixo nível em diversas plataformas. Cada um tem suas próprias características e sintaxes que podem ser mais adequadas para determinadas tarefas e ambientes de desenvolvimento.

---

### 02. Criando "Hello, World!" com Variável

{% highlight nasm %}
.section .bss
    .lcomm buffer, 13            # reserva 13 bytes para o buffer

.section .data
hello:
    .ascii "Hello, World!\0"

.section .text
.globl _start

_start:
    mov $buffer, %rdi            # endereço do buffer
    mov $hello, %rsi             # endereço da string
    call copy_string             # chama a função para copiar a string

    mov $1, %rax                 # syscall: sys_write
    mov $1, %rdi                 # file descriptor: stdout
    mov $buffer, %rsi            # endereço do buffer
    mov $13, %rdx                # comprimento da string
    syscall                      # chama o kernel

    mov $60, %rax                # syscall: sys_exit
    xor %rdi, %rdi               # status de saída: 0
    syscall                      # chama o kernel

copy_string:
    mov $13, %rcx                # comprimento da string
.loop:
    mov (%rsi), %al              # lê um byte da string
    mov %al, (%rdi)              # escreve no buffer
    inc %rsi                     # avança para o próximo byte da string
    inc %rdi                     # avança para o próximo byte do buffer
    loop .loop                   # repete até copiar todos os bytes
    ret                          # retorna para _start
{% endhighlight %}

+ `.lcomm buffer, 13`: Reserva 13 bytes para o *buffer* na *seção BSS*.
+ `call copy_string`: Chama a função `copy_string` para copiar a *string* `hello` para o *buffer*.
+ `copy_string`: Função que copia a *string* para o *buffer*.
+ `mov $13, %rcx`: Define o contador de repetição para o comprimento da *string*.
+ `loop .loop`: Laço de repetição para copiar cada *byte* da *string*.

---

### 03. Criando um Função que imprime: "Hello, World!"

{% highlight nasm %}
.section .data
hello:
    .ascii "Hello, World!\0"

.section .text
.globl _start

_start:
    call print_hello             # chama a função para imprimir a string

    mov $60, %rax                # syscall: sys_exit
    xor %rdi, %rdi               # status de saída: 0
    syscall                      # chama o kernel

print_hello:
    mov $1, %rax                 # syscall: sys_write
    mov $1, %rdi                 # file descriptor: stdout
    mov $hello, %rsi             # endereço da string
    mov $13, %rdx                # comprimento da string
    syscall                      # chama o kernel
    ret                          # retorna para _start
{% endhighlight %}

+ `call print_hello`: Chama a função `print_hello` para imprimir a *string* `hello`;
+ `print_hello`: Função que executa o *syscall sys_write* para imprimir a *string*.

---

### 04. Escrevendo um código que: Soma de Dois Números
> E imprime na tela com quebra de linha/nova linha (sem colar no prompt)!

{% highlight nasm %}
.section .data
quebra:
    .ascii "\n"                 # para pular/quebrar uma linha
num1:
    .quad 5                     # define o primeiro número
num2:
    .quad 10                    # define o segundo número
result:
    .quad 0                     # reserva espaço para o resultado
buffer:
    .space 2                    # espaço para a string do número (2 dígitos)

.section .text
.globl _start

_start:
    mov num1(%rip), %rax        # carrega num1 em rax
    add num2(%rip), %rax        # soma num2 a rax
    mov %rax, result(%rip)      # armazena o resultado

    # código para imprimir o resultado
    mov result(%rip), %rax      # carrega o resultado em rax
    mov $buffer + 2, %rsi       # aponta para o final do buffer(2 dígitos)
    call int_to_string          # converte o número para string

    mov $1, %rax                # syscall: sys_write
    mov $1, %rdi                # file descriptor: stdout
    lea buffer(%rip), %rsi      # endereço da string
    mov $2, %rdx                # comprimento máximo da string (2 dígitos)
    syscall                     # chama o kernel

    mov $1, %rax                # syscall: sys_write
    mov $1, %rdi                # file descriptor: stdout
    mov $quebra, %rsi           # endereço da quebra
    mov $1, %rdx                # comprimento da quebra(1 dígito)
    syscall                     # chama o kernel

    mov $60, %rax               # syscall: sys_exit
    xor %rdi, %rdi              # status de saída: 0
    syscall                     # chama o kernel

int_to_string:
    # converte %rax para string decimal e armazena em %rsi
    mov %rax, %rcx              # copia o número para rcx
    mov $10, %rbx               # base decimal

    convert_loop:
        xor %rdx, %rdx          # limpa rdx (dividendo)
        div %rbx                # divide rax por 10
        add $'0', %dl           # converte o resto para caractere ASCII
        dec %rsi                # move o ponteiro do buffer para trás
        mov %dl, (%rsi)         # armazena o caractere no buffer
        test %rax, %rax         # verifica se rax é 0
        jnz convert_loop        # se não for 0, continua o loop

    ret                         # retorna para _start
{% endhighlight %}

+ `num1: .quad 5` e `num2: .quad 10`: Define os números a serem somados.
+ `result: .quad 0`: Reserva espaço para armazenar o resultado.
+ `add num2(%rip), %rax`: Soma `num2` ao valor de `num1` armazenado em `rax`.
+ `mov %rax, result(%rip)`: Armazena o resultado da soma.
+ `call print_result`: Chama a função `print_result` para imprimir o resultado.

---

Para mais informações e uma documentação completa do GNU Assembler visite o endereço: <https://sourceware.org/binutils/docs-2.42/as.html>.

