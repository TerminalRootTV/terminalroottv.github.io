---
layout: post
title: "Como Instalar a Nova Versão do Clang/LLVM no Windows"
date: 2025-05-30 12:59:16
image: '/assets/img/windows/clang-windows.jpg'
description: "🐉 Tanto a versão que independe do MSVC como a integrada."
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
- clang
- llvm
- windows
- linguagemc
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos [essa postagem sobre instalar Clang](https://terminalroot.com.br/2024/07/como-instalar-o-clang-no-windows-com-um-unico-comando.html), mas se tornou obsoleta. Nesse rápido artigo veremos como fazer isso facilmente.


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

## Instalação

### Se você chegou a instalar a versão do outro artigo
Antes de mais nada remova o diretório e também o caminho para a variável de ambiente.
> Abra o [PowerShell](https://terminalroot.com.br/tags#powershell) com privilégios de administrador.

Remova a instalção:
{% highlight powershell %}
Remove-Item -Path "C:\Users\$env:USERNAME\.utils" -Recurse -Force
{% endhighlight %}

Remova a variável de ambiente:
{% highlight powershell %}
[Environment]::SetEnvironmentVariable("Path", (
    ($env:Path -split ";") -ne "C:\Users\Marcos\.utils\llvm-mingw\bin" -join ";"
), [System.EnvironmentVariableTarget]::Machine)
{% endhighlight %}

### Instalação do Clang/LLVM MinGW
Essa versão não depende do [MSVC](https://terminalroot.com.br/tags#msvc).

Basta usar o [WinGet](https://winstall.app/apps/MartinStorsjo.LLVM-MinGW.UCRT)
{% highlight powershell %}
winget install --id=MartinStorsjo.LLVM-MinGW.UCRT  -e
{% endhighlight %}

Ainda com permissão de administrador, rode esse comando:
{% highlight powershell %}
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\LLVM\bin", "Machine")
{% endhighlight %}

Feche o [terminal](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html), abra novamente e verifique a versão:
{% highlight powershell %}
clang++ --version
{% endhighlight %}

Há também a versão para o MSVC, mas pra possuir as duas instaladas você precisa alterar o nome do caminho de uma das duas e adicionar também a `PATH`, basta usar o comando do [WinGet](https://winstall.app/apps/LLVM.LLVM).
{% highlight powershell %}
winget install --id=LLVM.LLVM  -e
{% endhighlight %}
> Se teve conflito, desinstale: `winget uninstall --id=LLVM.LLVM`

---

## Diferença entre as versões

### `--id=LLVM.LLVM`
> Versão oficial da Microsoft e LLVM.

* Instala o **LLVM oficial** distribuído pela **LLVM Foundation**.
* Inclui ferramentas como:
  * `clang`, `clang++` (compiladores C/C++)
  * `lld` (linker)
  * `lldb` (debugger)
  * `clang-format`, `clang-tidy`, etc.

Mais usada para:
* Desenvolvimento C/C++ moderno no Windows, Linux ou macOS.
* Substituir o MSVC (Visual C++) em projetos multiplataforma.
* Quando se quer compilar para **Windows nativo** com Clang + MSVC.

Por padrão, usa a **toolchain do Visual Studio (MSVC)** como backend no Windows (para linkagem, runtime, etc).


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

### `--id=MartinStorsjo.LLVM-MinGW.UCRT`
* Instala a distribuição **LLVM-MinGW**, mantida por **Martin Storsjö**.
* Usa **Clang + linker + runtime MinGW** (não depende do Visual Studio).
* Baseada na **UCRT** (Universal C Runtime), o que torna as executáveis mais modernos e compatíveis.

Mais usada para:
* Compilar aplicativos Windows usando LLVM sem precisar do Visual Studio.
* Produzir binários completamente livres de dependências do MSVC.
* Ideal para **desenvolvimento cross-platform**, automações CI/CD e compilação cruzada (ex: compilar Windows a partir do Linux).

Inclui:
* `clang`, `lld`, `libc++`, `libunwind`, headers/libraries MinGW (com UCRT)
* Ferramentas pré-configuradas para compilar direto para Windows

## Comparativo rápido:

| Característica            | `LLVM.LLVM` (Oficial)           | `LLVM-MinGW.UCRT` (Martin Storsjö) |
| ------------------------- | ------------------------------- | ---------------------------------- |
| Mantido por               | LLVM Foundation                 | Martin Storsjö                     |
| Backend padrão no Windows | MSVC (Visual Studio)            | MinGW + UCRT                       |
| Requer Visual Studio?     | Sim (para linkagem, por padrão) | Não                                |
| Target principal          | Windows (com MSVC)              | Windows (sem MSVC)                 |
| Uso típico                | IDEs como VSCode com Clang      | Cross-compiling, builds portáveis  |
| Licença                   | Permissiva (LLVM)               | Permissiva (LLVM + MinGW UCRT)     |




+ **Se você já usa o Visual Studio ou quer integração com o ecossistema MSVC**: Use `LLVM.LLVM`
+ **Se você quer uma toolchain completa e independente do MSVC** (especialmente útil para scripts, CI/CD ou compilações cruzadas): Use `MartinStorsjo.LLVM-MinGW.UCRT`.

## Veja também:
+ [Como Instalar a Nova Versão do GCC MinGW no Windows](https://terminalroot.com.br/2025/05/como-instalar-a-nova-versao-do-gcc-mingw-no-windows.html)
+ [Como Usar o Tmxlite para Mapas de Jogos(Windows e Linux)](https://terminalroot.com.br/2025/05/como-usar-o-tmxlite-para-mapas-de-jogos-windows.html)


