---
layout: post
title: "Como Fazer Parser de CSV com C++ Moderno"
date: 2023-05-30 18:56:43
image: '/assets/img/cpp/cppsv.jpg'
description: 'Esse vídeo também mostra como funciona o desenvolvimento Moderno de C++ com recursos e ferramentas Modernas.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo vamos ver como fazer parser de **CSV** com [C++](https://terminalroot.com.br/tags#cpp) sem nenhuma biblioteca pronta para isso e <u>aproveitar para utilizar algumas ferramentas modernas e recursos</u>, tais como:

+ [C++23](https://en.cppreference.com/w/cpp/23)
+ [Utilizando fmtlib](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html)
+ [Memória segura](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html)
+ [Análise estática com CppCheck](https://terminalroot.com.br/2023/04/como-fazer-analise-estatica-de-c-cpp-com-cppcheck.html)
+ [CMake](https://terminalroot.com.br/tags#cmake)
+ Conversão para Banco de Dados [SQL](https://terminalroot.com.br/tags#sql): [MySQL/MariaDB](https://terminalroot.com.br/tags#mariadb)

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/xYQt8fyXSp0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos utilizados no vídeo

> `file.csv`

```csv
Bjarne Stroustroup,1979,C++,bjarne@stroustroup.com
Dennis Ritchie,1970,C,dennis@ritchie.net
Maurice Wilkes,1940,Assembly,maurice@wilkes.us
Brian Kernighan,1977,AWK,brian@kernighan.org
Anonymous,,,anom@null.net
```

---

> `main.cpp`

```cpp
#include <fmt/format.h>
#include <fstream>
#include <cstring>
#include <array>

auto main(int argc, char **argv) -> int {
  if(argc > 1){
    std::string line {};
    std::ifstream file(argv[1]);
    if(file.is_open()){
      const char * delim = ",";
      std::array<std::string, 4> fields {"NAME", "YEAR", "LANG", "MAIL"};
      int i {};
      while(std::getline(file, line)){
        char * buf = &line[0];
        char * pline = strsep(&buf, delim);
        while(pline != NULL){
          fmt::print("{}: {}\n", fields[i], pline);
          pline = strsep(&buf, delim);
          ++i;
          if(i > 3){
            fmt::print("-------\n");
            i = 0;
          }
        }
      }
      file.close();
    }
  }else{
    fmt::print(stderr, "Use: {} file.csv\n", argv[0]);
  }
}
```

---

> `Makefile`

```makefile
TARGET=a.out
CC=g++ -std=c++23
DEBUG=-g
OPT=-O1
WARN=-Wall -Werror -Wextra -Wpedantic
FMT=-lfmt
CCFLAGS=$(DEBUG) $(OPT) $(WARN)
LD=g++
OBJS= main.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(FMT)
	@rm -f *.o
 
main.o: main.cpp
	$(CC) -c $(CCFLAGS) main.cpp -o main.o $(FMT)
```

---

> `CMakeLists.txt`

```cmake
cmake_minimum_required(VERSION 3.26.3)
project(cppsv
  LANGUAGES CXX
  VERSION 0.0.1
)
add_compile_options(-Wall -Werror -Wextra -Wpedantic)
set (CMAKE_CXX_STANDARD 23)
add_executable(a.out main.cpp)
find_package(fmt)
target_link_libraries(a.out PRIVATE fmt::fmt-header-only)
```

---

# 👀 Veja também:
+ 🔗 [Utilizando a fmtlib](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html)
+ 🔗 [Análise Estática com Cppcheck](https://terminalroot.com.br/2023/04/como-fazer-analise-estatica-de-c-cpp-com-cppcheck.html)
+ 🔗 [Sobre strtok](https://www.youtube.com/watch?v=sbqCeG2Ly_Q)
+ 🔗 [Ponteiros Inteligentes](https://www.youtube.com/watch?v=7NF3kuaJdL8)
+ 🔗 [20 Livros sobre Linguagem SQL que você deveria ler](https://terminalroot.com.br/2023/05/20-livros-sobre-linguagem-sql-que-voce-deveria-ler.html)
+ 🔗 [Conheça 15 alternativas para criar Interfaces Gráficas com C++](https://terminalroot.com.br/2023/05/conheca-15-alternativas-para-criar-interfaces-graficas-com-cpp.html)


