---
layout: post
title: "Crie facilmente Jogos em Lua com LÖVE"
date: 2024-05-10 11:21:20
image: '/assets/img/lua/love.jpg'
description: "❤️  Escrito em C++ e usa Lua como linguagem de script. Está disponível para Windows, macOS, Android, GNU+Linux e iOS."
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- lua
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[LÖVE](https://love2d.org/) é um *framework* gratuito e de código-aberto para [desenvolvimento de jogos](https://terminalroot.com.br/tags#gamedev).

Escrito em [C++](https://terminalroot.com.br/tags#cpp) e usa [Lua](https://terminalroot.com.br/tags#lua) como linguagem de script. Está disponível para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [Android](https://terminalroot.com.br/tags#android), [GNU+Linux](https://terminalroot.com.br/tags#gnulinux) e [iOS](https://terminalroot.com.br/tags#swift).

**LÖVE** é muito conhecido nas [Competições de Desenvolvimento de Games](https://terminalroot.com.br/tags#games). Ele suporta e fornece diversos recursos do mundo [#gamedev](https://terminalroot.com.br/tags#gamedev), tais como:
+ [OpenGL](https://terminalroot.com.br/tags#opengl);
+ UTF-8;
+ Imagens PNG, JPEG, GIF, TGA e BMP.
+ Formatos de áudio: WAV, OGG e MP3;
+ Pode ser usado em conjunto com Box2D para facilitar o uso de fórmulas da Física.

E entre diversos outros recursos.


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

# Instalação
O LÖVE, em resumo, é só um comando que recebe arquivos como parâmetro, ou seja, a instalação é baixar o binário e instalar. Mas, caso você queira compilar do zero, basta seguir as instruções de compilação descritas no [repositório do GitHub](https://github.com/love2d/love).

Para fazer o download, vá até o endereço: <https://love2d.org/> e clique na opção de acordo com seu sistema operacional e arquitetura:

[![LÖVE download](/assets/img/lua/download-love.png)](https://love2d.org/)

No meu caso, eu optei por fazer o download do [AppImage](https://github.com/love2d/love/releases/download/11.5/love-11.5-x86_64.AppImage):

```bash
wget https://github.com/love2d/love/releases/download/11.5/love-11.5-x86_64.AppImage
chmod +x love-11.5-x86_64.AppImage
```

Pra rodar, basta executar o binário:
```bash
./love-11.5-x86_64.AppImage
```

Aparecerá uma janela com a animação de um balão estilo emoji com a cauda escrito: `NO GAMES`:
![LÖVE janela inicial](/assets/img/lua/no-games-love.png) 

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

Para instalar, use o comando `install` em distros GNU+Linux:
> Nesse caso, instalando e renomeando para o comando ser somente: `love`

```bash
sudo install -v love-11.5-x86_64.AppImage /usr/local/bin/love
```
> Saída: `'love-11.5-x86_64.AppImage' -> '/usr/local/bin/love'`.

Agora, para rodar, independente de onde você estiver, basta rodar o comando: `love`!

Para o Windows, basta usar o [PowerShell](https://terminalroot.com.br/tags#powershell) ou o [Windows Terminal](https://terminalroot.com.br/2023/04/melhore-seu-desempenho-utilizando-o-windows-terminal.html). Se quiser instalar, mova para unidade `C:\`, de prefrẽncia dentro de uma pasta de nome `LÖVE/love.exe` e adicione a **PATH** para usar somente como comando `love` também.

---

# Criando um 'Hello World'
Toda vez que você for desenvolver com LÖVE, eu aconselho criar uma pasta/diretório para seu projeto:
```bash
mkdir MyProjectLove
cd MyProjectLove
```

E dentro desse projeto, crie um arquivo [Lua](https://terminalroot.com.br/lua) de nome: `main.lua` e insira o código abaixo:
```lua
function love.draw()
    love.graphics.print('Hello World!', 400, 300)
end
```

Esse código vai criar uma janela de largura 400px e altura de 300px e desenhará a frase: 'Hello World' nessa janela.
> Para aprender Lua rapidamente acesse: <https://terminalroot.com.br/lua>.

> **OBSERVAÇÃO**: Não rode: `love main.lua`. Isso não funciona!!! Você obterá uma janela *azul de erro* e informações como: `Error: [love "boot.lua"]:330: Cannot load game at path ()...`.

Para rodar, você precisa executar o diretório onde está o código, ou seja, o diretório completo, se está no mesmo, logo é somente o ponto: (`.`), assim:

```bash
love .
```

Aparecerá a janela:
![LÖVE Hello World](/assets/img/lua/love-hello-world.png) 

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

# Criando uma animação básica
Vamos criar uma animação básica de desenhar olhos na janela e mexê-los conforme movimentarmos o mouse. Edite o arquivo `main.lua` e insira o código abaixo:

```lua
function love.draw()
    function drawEye(eyeX, eyeY)
        local distanceX = love.mouse.getX() - eyeX
        local distanceY = love.mouse.getY() - eyeY
        local distance = math.min(math.sqrt(distanceX^2 + distanceY^2), 30)
        local angle = math.atan2(distanceY, distanceX)

        local pupilX = eyeX + (math.cos(angle) * distance)
        local pupilY = eyeY + (math.sin(angle) * distance)

        love.graphics.setColor(1, 1, 1)
        love.graphics.circle('fill', eyeX, eyeY, 50)

        love.graphics.setColor(0, 0, .4)
        love.graphics.circle('fill', pupilX, pupilY, 15)
    end

    drawEye(200, 200)
    drawEye(330, 200)
end
```

E rode novamente:
```bash
love .
```

A saída será similar abaixo:

![LÖVE eyes move](/assets/img/lua/love-eyes-move.png) 

---

De acordo com esse artigo foi possível notar o quão fácil e interessante é usar o LÖVE. Existe uma infinidade de coisas sobre e para isso eu separei os links abaixo:
+ <https://love2d.org/>
+ <https://github.com/love2d/love>
+ <https://love2d.org/wiki/Main_Page>
+ <https://love2d.org/forums/>
+ <https://simplegametutorials.github.io/love/>
+ <https://love2d.org/wiki/Getting_Started>
+ <https://github.com/love2d-community/awesome-love2d>
+ <https://en.wikipedia.org/wiki/L%C3%96VE_(game_framework)>




