---
layout: post
title: "7 Exemplos de Uso do PowerShell"
date: 2025-03-19 14:23:08
image: '/assets/img/windows/powershell.jpg'
description: "🚀 Um estilo cheat sheet para informações rápidas."
icon: 'ion:terminal-sharp'
iconname: 'PowerShell'
tags:
- powershell
- windows
- csharp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[PowerShell](https://terminalroot.com.br/tags#powershell) é um [shell](https://terminalroot.com.br/tags#shell) de [linha de comando](https://terminalroot.com.br/tags#comandos) baseado em tarefas e [linguagem de script](https://terminalroot.com.br/mylang) desenvolvido no [.NET](https://terminalroot.com.br/tags#csharp). Inicialmente, apenas um componente do Windows.

Ele foi escrito com [C#](https://terminalroot.com.br/tags#csharp) e seu código fonte está [disponível no GitHub](https://github.com/PowerShell/PowerShell)

---

## Instalação
O PowerShell já está disponível para [Windows](https://terminalroot.com.br/tags#windows) 10 e 11, logo, não precisa instalar nada. Mas, se você estiver em outro [sistema operacional](https://terminalroot.com.br/tags#os), como [Ubuntu](https://terminalroot.com.br/tags#ubuntu), por exemplo, você pode usar o [snap]():

{% highlight bash %}
sudo snap install powershell --classic
{% endhighlight %}

Após instalado, basta confirmar a instalação verificando a versão, ex.:
{% highlight bash %}
pwsh --version
PowerShell 7.5.0
{% endhighlight %}

Abaixo alguns exemplos de uso.


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

## 01. Criando um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html)
Crie um arquivo com extensão `.ps1`, exemplo: `main.ps1` e insira o conteúdo abaixo:
{% highlight powershell %}
# Programa básico com PowerShell
Write-Host 'Hello, World!'
{% endhighlight %}
> Comentários podem ser feitos usando o *tralha*: `#`

Salve e rode com o comando:
{% highlight bash %}
pwsh main.ps1
{% endhighlight %}
> A saída deverá ser: **Hello, World!**.

---

## 02. Fazer download de arquivo da Web:
Exemplo download do arquivo [81by.txt](http://0x0.st/81by.txt) e salvar com o nome: `logo-ps.png`.
> Sempre é necessário direcionar para um arquivo local com `-OutFile`.

{% highlight powershell %}
Invoke-WebRequest -Uri "http://0x0.st/81by.txt" -OutFile "logo-ps.png"
{% endhighlight %}

---

## 03. Criar e utilizar variáveis e concatenar:
Precisa do *cifrão* estilo [PHP](https://terminalroot.com.br/tags#php) e [Perl](https://terminalroot.com.br/tags#perl).
{% highlight powershell %}
$url  = "http://0x0.st/81by.txt"
$file = "logo-ps.png"
Write-Host "A url é: " + $url + " e o arquivo: " $file
{% endhighlight %}
> O operador de concatenação: `+`(mais) é opcional, poderia ser também:
{% highlight powershell %}
Write-Host "A url é: " $url " e o arquivo: " $file
{% endhighlight %}

---

## 04. Utilizando `if else`
Verificar se o arquivo foi salvo com sucesso:

{% highlight powershell %}
$url  = "http://0x0.st/81by.txt"
$file = "logo-ps.png"

Write-Host "A url é: " + $url + " e o arquivo: " $file
Invoke-WebRequest -Uri $url -OutFile $file

if(Test-Path $file 2>$null && (Get-Content $file 2>$null)){
    Write-Host "Arquivo foi baixado com sucesso!"
}else{
    Write-Host "Falha ao baixar o arquivo ou o arquivo está vazio."
}
{% endhighlight %}

Note também o uso de:
+ `&&` operador lógico
+ `2>$url` similar ao `2>/dev/null`
+ Além das declarações: `Test-Path` e `Get-Content`

---

## 05. Criando funções
Adicionando funções para otimizar rotinas. Tudo que fizemos anteriormente, mas agora dentro de uma função que podemos mudar a URL e o nome do arquivo sempre precisar reescrever sempre que quisermos reutilizar para outros fins.

{% highlight powershell %}
$url  = "http://0x0.st/81by.txt"
$file = "logo-ps.png"

Function SaveFile {
  param($url, $file)
    Write-Host "A url é: " + $url + " e o arquivo: " $file
    Invoke-WebRequest -Uri $url -OutFile $file

    if(Test-Path $file 2>$null && (Get-Content $file 2>$null)){
      Write-Host "Arquivo foi baixado com sucesso!"
    }else{
      Write-Host "Falha ao baixar o arquivo ou o arquivo está vazio."
    }
}

SaveFile $url $file
{% endhighlight %}

Alguns detalhes nesse código:
+ Os parâmetros de função precisam usar a função: `param()` que está dentro do bloco de chaves
+ Nesse caso específico precisamos chamar estilo [Bash](https://terminalroot.com.br/tags#bash) parâmetros lado-a-lado do nome da função: `SaveFile $1 $2` e não: `SaveFile($1, $2)`, mas em alguns outros casos, como *inteiros* podemos usar estilo a maioria das linguagens de programação, exemplo:
{% highlight powershell %}
Function IncNumber {
  param($x)
    ++$x
  Write-Host $x
}

IncNumber(2) # 3
{% endhighlight %}

Nesse outro exemplo, note também o uso do operador `++` do lado esquerdo para incrementar.


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

## 06. Obtendo conteúdo de um arquivo
Nesse caso, vamos ver o conteúdo do próprio arquivo: `main.ps1`, estilo comando [cat](https://terminalroot.com.br/2025/02/conheca-o-comando-kat.html):
> Comentamos a chamada da função: `SaveFile` e adicionamos mais uma linha com:
{% highlight powershell %}
Get-Content "main.ps1"
{% endhighlight %}

A saída será:
{% highlight powershell %}
$url  = "http://0x0.st/81by.txt"
$file = "logo-ps.png"

Function SaveFile {
  param($url, $file)
    Write-Host "A url é: " + $url + " e o arquivo: " $file
    Invoke-WebRequest -Uri $url -OutFile $file

    if(Test-Path $file 2>$null && (Get-Content $file 2>$null)){
      Write-Host "Arquivo foi baixado com sucesso!"
    }else{
      Write-Host "Falha ao baixar o arquivo ou o arquivo está vazio."
    }
}

#SaveFile $url $file
Get-Content "main.ps1"
{% endhighlight %}


---

## 07. Interagindo com o usuário
Pedindo confirmação para ver se ele realmente deseja ver o arquivo:
{% highlight powershell %}
$resposta = Read-Host "Você deseja visualizar o arquivo? (sim/não)"

if ($resposta -eq "sim" -or $resposta -eq "s") {
  Get-Content "main.ps1"
} else {
  Write-Host "Você escolheu não exibir o arquivo."
}
{% endhighlight %}

Note também o uso do operador `-or`(equivalente a `||`) para se aresposta for `sim` ou `s`.

---

Para mais informações [baixe esse PDF](https://download.microsoft.com/download/2/1/2/2122f0b9-0ee6-4e6d-bfd6-f9dcd27c07f9/ws12_quickref_download_files/powershell_langref_v3.pdf) e acesse os links abaixo:
+ <https://learn.microsoft.com/en-us/powershell/>
+ <https://github.com/2KU77B0N3S/NatMappingManager>
+ <https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.5>



