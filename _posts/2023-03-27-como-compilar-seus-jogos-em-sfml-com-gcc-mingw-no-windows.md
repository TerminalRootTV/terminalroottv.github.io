---
layout: post
title: "Como Compilar Seus Jogos em SFML com GCC MinGW no Windows"
date: 2023-03-27 19:40:04
image: '/assets/img/sfml/sfml-windows-gcc.jpg'
description: 'Para usar com seu Editor de Códigos ou IDE preferido!'
icon: 'ion:terminal-sharp'
iconname: 'SFML'
tags:
- windows
- sfml
- gcc
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[SFML](https://terminalroot.com.br/games) é uma ótima alternativa para desenvolver jogos 2D, além de outros recursos multimidia.

No [Windows]() é muito fácil de usá-lo com o [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio), no entanto, há quem prefira usar o SFML no seu [Editor de Código/IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) preferido e também utilizar um outro compilador em vez do [MSVC](https://learn.microsoft.com/en-us/cpp/build/creating-and-managing-visual-cpp-projects?view=msvc-170).

Nesse artigo veremos como compilar seus projetos em [SFML](https://terminalroot.com.br/tags#sfml) com [GCC com MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html).

---

# Dependências
Antes de mais nada é necessário possuir o [GCC/G++ com MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html) devidamente instalado no seu sistema, e para fazer isso, caso você ainda não o possua instalado, basta seguir os passos desse tutorial:

## [Como Instalar GCC/G++ MinGW no Windows](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html).

---

## 01. Fazer o Download do SFML para MinGW
Após devidamente instalado e funcionando o **GCC/G++ com MinGW** próximo passo é fazer o download de um **pacote diferente do SFML**(diferente da versão Visual Studio)**.

E para isso acesse a página de downloads do site do SFML no link: <https://www.sfml-dev.org/download/sfml/2.5.1/> e faça o download da versão: `GCC 7.3.0 MinGW (SEH) - 64-bit` conforme imagem abaixo:

![Página de download do SFML 2.5.1](/assets/img/sfml/download-sfml-mingw.jpg) 

Se quiser baixar por aqui mesmo, basta clicar no botão abaixo:

<a href="https://www.sfml-dev.org/files/SFML-2.5.1-windows-gcc-7.3.0-mingw-64-bit.zip" class="btn btn-success">Download GCC 7.3.0 MinGW (SEH) - 64-bit</a>

---

## 02. Extrair o arquivo
O arquivo baixado será de nome e extensão: `SFML-2.5.1-windows-gcc-7.3.0-mingw-64-bit.zip`, extraia esse arquivo clicando com o botão direito do mouse e escolha `Extrair aqui`.

Após extraído haverá a pasta de nome: `SFML-2.5.1`, renomei ela para somente `SFML`.
> Ficará mais fácil ao usarmos quando compilar.


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

## 03. Copiando arquivos para seu projeto
Agora entre nessa pasta(`SFML`) e copie todos os arquivos que estão dentro da subpasta: `bin` para a "raiz" do seu projeto e depois copie também toda a pasta `SFML` também para dentro da "raiz" do seu projeto, os arquivos são:

![Files SFML MinGW Project](./files-sfml-mingw-project.jpg) 
> Após listar os arquivos com o comando `ls` do [PowerShell](https://terminalroot.com.br/tags#powershell) dentro da pasta do meu projeto: `MyProjectSFML`.

No que além da pasta `SFML` e dos arquivos copiados da subpasta `SFML\bin` há também o arquivo `main.cpp` que há o código que iremos compilar, se quiser usá-lo como teste, use o código abaixo:

{% highlight cpp %}
#include <SFML/Graphics.hpp>

int main(){
  sf::RenderWindow window(sf::VideoMode(800, 450), "SFML works!");
  sf::CircleShape shape(100.f);
  shape.setFillColor(sf::Color::Green);

  while (window.isOpen())
  {
    sf::Event event;
    while (window.pollEvent(event))
    {
      if (event.type == sf::Event::Closed)
        window.close();
    }

    window.clear();
    window.draw(shape);
    window.display();
  }

  return 0;
}
{% endhighlight %}

Agora vamos compilar!

---

## 04. Compilado um projeto SFML com GCC MinGW
Para compilar basta entrar no seu projeto através do [PowerShell](https://terminalroot.com.br/tags#powershell) ou `CMD` e rodar o comando:

{% highlight bash %}
g++ .\main.cpp -I SFML\include\ -L SFML\lib\ -lsfml-main -lsfml-graphics -lsfml-system -lsfml-window
{% endhighlight %}

Note o uso dos parâmetros: `-I`(include) e `-L`(lib) com os respectivos direcionamentos para a pasta `SFML` que está dentro do nosso projeto. E também das flags: 
{% highlight bash %}
-lsfml-main -lsfml-graphics -lsfml-system -lsfml-window
{% endhighlight %}
> Se estiver criando um código com Áudio e/ou Network adicone as flags: `-lsfml-audio -lsfml-network`.

Agora é só rodar o binário e correr pro abraço:
{% highlight bash %}
.\a.exe
{% endhighlight %}

![SFML Rodando com MinGW](/assets/img/sfml/sfml-mingw-running.jpg) 

---

Se quiser utilizar [Makefile](https://terminalroot.com.br/tags#make) ou um script em [Lua](https://terminalroot.com.br/lua) para facilitar o comando de compilação, fique à vontade! Nós mostramos como fazer isso no artigo sobre [Imagens com SDL2](https://terminalroot.com.br/2023/03/como-usar-imagens-png-e-jpg-com-sdl2-images-no-windows.html).

---

# Veja também
+ [Crie Jogos para Web com SMK - Uma alternativa ao SFML 🎮](https://terminalroot.com.br/2023/03/crie-jogos-para-web-com-smk-uma-alternativa-ao-sfml.html)
+ [Lua Orbitando a Terra em C++ 🌘 🌎 🎶](https://terminalroot.com.br/2023/01/lua-orbitando-a-terra-em-cpp.html)
+ [Como Recriar o Jogo TETRIS com C++](https://terminalroot.com.br/2022/09/como-recriar-o-jogo-tetris-com-cpp.html)
+ [Como Recriar Flappy Bird com C++ em 35 Minutos!](https://terminalroot.com.br/2022/08/como-recriar-flappy-bird-com-cpp-em-35-minutos.html)
+ [Crie Jogos 2D com Lua e SFML](https://terminalroot.com.br/2022/07/crie-jogos-2d-com-lua-e-sfml.html)
+ [Como Implementar Dear ImGUi com SFML no Windows 10](https://terminalroot.com.br/2022/07/como-implementar-dear-imgui-com-sfml-no-windows-10.html)
+ [Como Criar um Jogo estilo Pong com C++ e SFML](https://terminalroot.com.br/2022/07/como-criar-um-jogo-estilo-pong-com-cpp-e-sfml.html)
+ [Como Criar Interfaces Gráficas com Dear ImGui e SFML](https://terminalroot.com.br/2022/05/como-criar-interfaces-graficas-com-dear-imgui-e-sfml.html)
+ [Como Criar uma Animação de Particulas com C++ e SFML](https://terminalroot.com.br/2022/05/como-criar-uma-animacao-de-particulas-com-cpp-e-sfml.html)
+ [Como Criar um Game MENU com C++ e SFML](https://terminalroot.com.br/2022/05/como-criar-um-game-menu-com-cpp-e-sfml.html)



