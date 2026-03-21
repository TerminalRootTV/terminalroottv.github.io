---
layout: post
title: "Copie arquivos via linha de comando com C++"
date: 2026-01-02 22:40:52
image: '/assets/img/cpp/xclip.jpg'
description: "🕸️ Seu comando customizado, simples e rápido!"
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- comandos
- terminal
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Que tal a comodidade de copiar os arquivos via [linha de comando](https://terminalroot.com.br/tags#comandos)? Basta, você criar seu próprio comando rapidamente com [C++](https://terminalroot.com.br/tags#cpp).

Veja abaixo o passo a passo!


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


## Dependências
Exemplo em distros que usam o APT como gerenciador de pacotes
> Procure nomes correspondentes para a sua distro.

```bash
sudo apt install build-essential libx11-dev libxcb1-dev libpng-dev
```

E compile e instale também o [clip](https://github.com/dacap/clip)
```bash
git clone https://github.com/dacap/clip
cd clip
cmake . -B build
cmake --build build
sudo cmake --install build
```
---

## Crie o Código
Exemplo: `main.cpp`

```cpp
#include <clip.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include <memory>

const auto use = [](){
  std::cerr << "Use: xclip++ <file> [file...]\n";
};

class Xclip {
  public:
    Xclip(int argc, char** argv){
      std::ostringstream buffer;

      for (int i = 1; i < argc; ++i) {
        std::ifstream file(argv[i], std::ios::binary);
        if (!file) {
          std::cerr << "Error opening: " << argv[i] << "\n";
          std::exit(1);
        }

        buffer << file.rdbuf();

        if(i + 1 < argc){
          buffer << '\n';
        }
      }

      clip::set_text(buffer.str());
    }
};

int main(int argc, char** argv){
  if(argc < 2){
    use();
    return 1;
  }

  auto xclip = std::make_unique<Xclip>(argc, argv);
}
```

---

## Compile e Instale
```bash
g++ main.cpp -o xclip++ -lclip -lxcb -lX11 -lpng -pthread
sudo install -v xclip++ /usr/local/bin/
```

---

## Use facilmente
```bash
xclip++ file.txt
# Ou vários arquivos
xclip++ file1.txt file2.md file3.cpp # ...
```

---

## Atualização e correção
Se vc notar, ao tentar usar o *pipe*(`|`) não funciona, exemplos:
```bash
cat file.txt | xclip++
echo 'Lorem Ipsum' | xclip++
```

Pra resolver isso adicionei:
+ `<unistd.h>`
+ Sobre carreguei o construtor: `Xclip(const std::string& content)` para `clip::set_text(content);`
+ E finalmente adicionei o `setvbuf(stdout, NULL, _IONBF, 0);`

Código pronto para o uso com pipe:

```cpp
#include <clip.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include <memory>
#include <unistd.h>

const auto use = [](){
  std::cerr << "Use: xclip++ <file> [file...]\n";
};

class Xclip {
  public:
    Xclip(int argc, char** argv){
      std::ostringstream buffer;

      for(int i = 1; i < argc; ++i){
        std::ifstream file(argv[i], std::ios::binary);
        if(!file){
          std::cerr << "Error opening: " << argv[i] << "\n";
          std::exit(1);
        }

        buffer << file.rdbuf();

        if(i + 1 < argc){
          buffer << '\n';
        }
      }

      clip::set_text(buffer.str());
    }

    Xclip(const std::string& content){
      clip::set_text(content);
    }
};

int main(int argc, char** argv){
  setvbuf(stdout, NULL, _IONBF, 0);

  bool has_pipe = !isatty(STDIN_FILENO);

  if(has_pipe){
    std::ostringstream ss;
    ss << std::cin.rdbuf();
    std::string input = ss.str();

    Xclip xclip(input);
  }else if (argc > 1){
    Xclip xclip(argc, argv);
  }else{
    use();
    return 1;
  }

  return 0;
}
```

Compile e instale:
```bash
g++ main.cpp -o xclip++ -lclip -lxcb -lX11 -lpng -pthread
sudo install -v xclip++ /usr/local/bin/
```

Se quise o nome do comando de forma mais resumida, rode também:
```bash
mv xclip++ xclip
sudo install -v xclip /usr/local/bin/
```

Agora basta usar o comando `xclip`, exemplos:
```bash
# Único arquivo:
xclip++ file.txt

# Vários arquivos:
xclip++ file1.txt file2.md file3.cpp # ...

# Via pipe:
echo 'My test' | xclip
cat file.txt | xclip
```

---

Veja também: [Copie e cole via linha de comando do Linux com xclip](https://terminalroot.com.br/2020/10/copie-e-cole-via-linha-de-comando-do-linux-com-xclip.html)

## [Aprenda C++](https://terminalroot.com.br/cpp)
### <https://terminalroot.com.br/cpp>


