---
layout: post
title: "Veja o histórico do Terminal de forma interativa"
date: 2025-07-20 20:49:25
image: '/assets/img/comandos/his-thumb.jpg'
description: "▶️ his é um utilitário para histórico de comandos com ícones e cores que funciona no Windows e GNU/Linux."
icon: 'ion:terminal-sharp'
iconname: 'Terminal/C++'
tags:
- terminal
- windows
- gnulinux
- comandos
- cpp
- ncurses
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---  

`his` é um utilitário de histórico de comandos com ícones e cores que funciona no Windows e GNU/Linux.  


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

## 📦 Dependências  

### 🪟 Windows  
+ [Fontes](https://github.com/terroo/fonts)  
+ [Git](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)  
+ [GCC](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html) ou [Clang](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-clang-llvm-no-windows.html)  
+ [PDCurses](https://terminalroot.com.br/2024/07/como-instalar-a-pdcurses-a-ncurses-no-windows.html)  

### 🐂 GNU/Linux  
+ [Fontes](https://github.com/terroo/fonts)  
+ [Git](https://terminalroot.com.br/tags#git)  
+ [GCC](https://terminalroot.com.br/tags#gcc) ou [Clang](https://terminalroot.com.br/tags#clang)  
+ [NCurses](https://terminalroot.com.br/ncurses)  
+ [CMake](https://terminalroot.com.br/tags#cmake)  

Exemplo usando APT:  
{% highlight bash %}
sudo apt install build-essential cmake libncurses-dev git  
{% endhighlight %}
> As fontes precisam ser instaladas manualmente conforme o link acima.  

---  

## 🚧 Compilação  

### 🪟 Windows  
> [PowerShell](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html)  

{% highlight powershell %}
git clone https://github.com/terroo/his  
Set-Location his  
g++ -I C:\mingw64\include main.cpp his.cpp C:\mingw64\lib\pdcurses.a -o his  
New-Item -Path "C:\His\bin" -ItemType Directory  
Move-Item .\his.exe -Destination "C:\His\bin\"  
{% endhighlight %}
> Agora você pode sair do diretório clonado e removê-lo.  

Crie uma variável de ambiente para o seu usuário:  

{% highlight powershell %}
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\His\bin", [System.EnvironmentVariableTarget]::User)  
{% endhighlight %}
> Feche e abra o terminal novamente e teste: `his --version`  

### 🐂 GNU/Linux  

{% highlight bash %}
git clone https://github.com/terroo/his  
cd his  
cmake . -B build  
cmake --build build  
sudo cmake --install build  
{% endhighlight %}
> Agora você pode sair do diretório clonado e removê-lo: `cd .. && rm -rf his/`. E testar: `his --version`  

---  

## 💼 Como Usar  
### Depois de SELECIONAR o <u>comando desejado</u>, pressione `ENTER` para executá-lo via `his`  

> `his --help`  

{% highlight bash %}
Uso:  
his [opções]  

Opções:  
  --match-start,   -m  Busca apenas pelo comando exato.  
  --no-show-icons, -n  Não exibe ícones.  
  --help,          -h  Mostra esta mensagem.  
  --version,       -v  Mostra informações da versão.  
{% endhighlight %}

---  

## 🏃 Rodando
### 🐂 No GNU/Linux  
![Comando his](https://github.com/terroo/terroo.github.io/blob/main/assets/img/commands/his.gif?raw=true)  

### 🪟 No Windows  
![Comando his no Windows](https://github.com/terroo/terroo.github.io/blob/main/assets/img/commands/his-win.gif?raw=true)  

---  

### 📹 Tutorial em vídeo mostrando passo a passo como o comando `his` foi criado.  
#### <https://youtu.be/gILIsK3MiGQ>

