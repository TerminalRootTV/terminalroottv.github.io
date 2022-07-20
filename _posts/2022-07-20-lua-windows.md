---
layout: post
title: "Como instalar Lua no Windows 10"
date: 2022-07-20 13:32:11
image: '/assets/img/windows/lua-win/lua-windows10.jpg'
description: 'Para usar com o Power Shell ou CMD .'
icon: 'ion:terminal-sharp'
iconname: 'Lua/Window'
tags:
- lua
- windows
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Para aquelas pessoas que não conseguiram instalar a linguagem de programação [Lua](https://terminalroot.com.br/lua) no [Windows 10](https://terminalroot.com.br/tags#windows), nesse artigo vamos exibir um passo à passo que vai ajudar à obter esse feito.

---

# Passo à Passo
São 14 passos com imagens que podem lhe auxiliar, se fizer os passos corretamente, tudo irá funcionar!

### 01. Faça o download do arquivo: `lua-5.4.2_Win64_bin.zip` [NESSE LINK](https://sourceforge.net/projects/luabinaries/files/5.4.2/Tools%20Executables/)
![link lua exe](/assets/img/windows/lua-win/01-lua.png) 

---

### 02. Descompacte
![Lua no Windows](/assets/img/windows/lua-win/02-lua.png) 

---

### 03. Recorte a pasta descompactada e cole em `C:\Arquivos de Programas\`
![Lua no Windows](/assets/img/windows/lua-win/03-lua.png) 
![Lua no Windows](/assets/img/windows/lua-win/04-lua.png) 

Clique em `Continuar` para permitir colar nessa pasta:

![Lua no Windows](/assets/img/windows/lua-win/05-lua.png) 


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

### 04. Entre na pasta que você colou
E renomei o arquivo `lua54` para `lua` somente

![Lua no Windows](/assets/img/windows/lua-win/10-lua.png) 
![Lua no Windows](/assets/img/windows/lua-win/11-lua.png) 

---

### 05. Copie o caminho da pasta: `C:\Program Files\lua-5.4.2_Win64_bin`
> Observação: O caminho é em inglês mesmo.
![Lua no Windows](/assets/img/windows/lua-win/12-lua.png) 

---

### 06. No [Menu Iniciar do Windows] digite a palavra: ambiente
E abra a opção **Editar as variáveis de ambiente**

![Lua no Windows](/assets/img/windows/lua-win/06-lua.png) 

---

### 07. Clique em `Variáveis de Ambiente`
![Lua no Windows](/assets/img/windows/lua-win/07-lua.png) 

---

### 08. Em Variáveis do sistema
Selecione a linha `Path` e clique em `Editar`

![Lua no Windows](/assets/img/windows/lua-win/08-lua.png) 

---

### 09. Clique em `Novo`
![Lua no Windows](/assets/img/windows/lua-win/09-lua.png) 


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

### 10. Cole o caminho da pasta que você havia copiado no PASSO 05
E em seguida pressione `Ok` e depois `Aplicar` e `Ok` de novo e já pode fechar essa janelinha das variáveis de ambiente .

![Lua no Windows](/assets/img/windows/lua-win/variaveis-de-ambiente-lua.png) 

---

### 11. Volte à pasta `C:\Program Files\lua-5.4.2_Win64_bin`
E no local onde tem o nome do caminho digite: `cmd` e pressione `Enter` .

![Lua no Windows](/assets/img/windows/lua-win/14-lua.png) 

---

### 12. No `cmd` que irá se abrir
Teste rodando o comando `lua`, se aparecer o conteúdo similar ao abaixo é porque está tudo certo, basta teclar `Ctrl + c` para sair .

![Lua no Windows](/assets/img/windows/lua-win/15-lua.png) 

---

### 13. Abra o Bloco de Notas do Windows
E digite:
{% highlight lua %}
print("Hello, World!")
{% endhighlight %}

E em seguida salve em qualquer lugar que desejar como um nome de arquivo que a extensão seja `.lua`.

Nesse exemplo criei uma pasta de nome `LuaProgramas` dentro de `Documentos` e salvei o arquivo com o nome `hello-world.lua` .
> Fique atento, pois às vezes o Bloco de Notas insere um `.txt` ao final dos arquivos criados por ele, se esse for o caso, use um [editor de código](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html) ou renomei o arquivo para ter a extensão final somente `.lua` .

![Lua no Windows](/assets/img/windows/lua-win/16-lua.png) 


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

### 14. Abra o `cmd` conforme fizemos no PASSO 11 e 12 
> Dentro da pasta onde você salvou o arquivo `.lua`

E agora em vez de somente rodar o comando `lua`, rode o comando `lua hello-world.lua`, ou o nome do arquivo que você escolheu.

A saída imprimirá a palavra `Hello, World!` conforme programamos para isso.

![Lua no Windows](/assets/img/windows/lua-win/run-lua.png) 


---

## Alternativa ao [Power Shell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html)
Se quiser usar o Power Shell em vez do `cmd` faça o seguinte:

### 15. Abra o [Power Shell](https://terminalroot.com.br/2021/12/como-instalar-powershell-no-ubuntu-e-primeiros-passos.html)
Digitando `power` no Menu Iniciar do Windows e selecione(Abra) o aplicativo.

![Lua no Windows](/assets/img/windows/lua-win/open-powershell.png) 

---

### 16. Entre na pasta que está seu arquivo `hello-world.lua`
Nesse meu caso está em `Documentos\LuaProgramas\`, então usei o comando `cd` para entrar no mesmo e em seguida `lua .\hello-world.lua`

![Lua no Windows](/assets/img/windows/lua-win/power-shell-lua.png) 


---

# Aprenda a Linguagem de Programação Lua:
## <https://terminalroot.com.br/lua>




