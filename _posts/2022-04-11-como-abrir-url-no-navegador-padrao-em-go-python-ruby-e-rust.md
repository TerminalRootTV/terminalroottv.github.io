---
layout: post
title: "Como abrir URL no navegador padrão em: Go, Python, Ruby e Rust"
date: 2022-04-11 09:36:20
image: '/assets/img/programacao/openurl.jpg'
description: 'Saiba como fazer essa mesma tarefa em 4 linguagens de programação diferentes.'
icon: 'ion:terminal-sharp'
iconname: 'Programação'
tags:
- programacao
- python
- go
- ruby
- rust
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Fazer a mesma tarefas em variadas linguagens de programação faz melhorar nosso conceito de lógica. Ou seja, o mesmo resultado, mas com sintaxes diferentes.

Nesse artigo vamos ver como abrir uma URL no navegador padrão em 4 linguagens de programação diferentes:
+ [Python](https://terminalroot.com.br/tags#python)
+ [Go](https://terminalroot.com.br/tags#go)
+ [Ruby](https://terminalroot.com.br/tags#ruby)
+ [Rust](https://terminalroot.com.br/tags#rust)

---

## [Aprenda Python do Zero](https://terminalroot.com.br/python)
### [Curso de Python do Iniciante ao Avançado](https://terminalroot.com.br/python)
> <https://terminalroot.com.br/python>

---

Vamos lá!

---

# [Python](https://terminalroot.com.br/tags#python)
Em Python basta importarmos a biblioteca `webbrowser` e usarmos a função `open()` indicando a URL, exemplo: 

> `vim openurl.py`
{% highlight python %}
import webbrowser
url="https://terminalroot.com.br/"
webbrowser.open(url)
{% endhighlight %}
> Para rodar: `python openurl.py`

Moleza, né?!

---

# [Go](https://terminalroot.com.br/tags#go)
Em Golang poderíamos usar o pacote: [open-golang](https://github.com/skratchdot/open-golang) e usar os comandos: `go mod init github.com/skratchdot/open-golang/open` e `go mod tidy` e compilar.

Mas você pode criar uma função para isso, que verificará o comando em cada sistema operacional diferente(`open`, `xdg-open` e `start`), logo o código ficaria assim:

> `vim openurl.go`
{% highlight go %}
package main

import (
  "fmt"
  "os/exec"
  "runtime"
  "log"
)

func openbrowser(url string) {
  var err error
  switch runtime.GOOS {
  case "linux":
    err = exec.Command("xdg-open", url).Start()
  case "windows":
    err = exec.Command("rundll32", "url.dll,FileProtocolHandler", url).Start()
  case "darwin":
    err = exec.Command("open", url).Start()
  default:
    err = fmt.Errorf("unsupported platform")
  }
  if err != nil {
    log.Fatal(err)
  }
}

func main (){
  openbrowser("https://terminalroot.com.br/")
}
{% endhighlight %}
> Para rodar: `go build openurl.go && ./openurl`

Quase fácil, digamos assim! 😃 


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

# [Rust](https://terminalroot.com.br/tags#rust)
Em Rust é quase similar ao caso de Go, ou seja, há um [crate](https://github.com/amodm/webbrowser-rs) que você pode baixar e usar ou você pode criar uma função e de acordo com o sistema operacional e rodar o processo com o devido comando, vamos fazer a segunda opção:

Use o `std::process::Command`!

Para simplificar vamos mostrar como fazer isso em sistemas tipo UNIX:

> `vim openurl.rs`
{% highlight rust %}
use std::process::Command;

fn main() {
    let url = "https://terminalroot.com.br/";
    let mut openurl = Command::new("xdg-open");
    openurl.arg(url);
    openurl.status().expect("process failed to execute");
}
{% endhighlight %}
> Para rodar: `rustc openurl.rs && ./openurl`

Mais ou menos fácil também! 😎 

---

# [Ruby](https://terminalroot.com.br/tags#ruby)
Em Ruby não foge da lógica para Go e Rust. Ou seja, utilizaremos o `RbConfig::CONFIG['host_os']` para detectar o sistema operacional e criar um case para o comando adequado. Assim: 

> `vim openurl.rb`
{% highlight ruby %}
cmd = case  RbConfig::CONFIG['host_os']
  when  /mswin|mingw|cygwin/ then "start "
  when  /darwin/ then "open "
  when  /linux|bsd/ then "xdg-open "
  else raise "No OS detected"
end
    
b = system cmd + "https://terminalroot.com.br/"
{% endhighlight %}
> Para rodar: `ruby openurl.rb`

Se não fose o `case` seria mais moleza, exemplo em sistema tipo UNIX bastava rodar via linha de comando: 
{% highlight sh %}
ruby -e 'system "xdg-open " + "https://terminalroot.com.br/"'
{% endhighlight %}

Quase um [BASH](https://terminalroot.com.br/shell)! Mais moleza que isso só rodando diretamente no prompt! 😛 

Algumas pessoas poderão perguntar:
> **— E em [C](https://terminalroot.com.br/linguagemc)/[C++](https://terminalroot.com.br/tags#cpp) ?**

Haha, é só usar o `system()`! 🍺 

Fui!

---

# Links úteis
+ <https://docs.python.org/3.7/library/webbrowser.html>
+ <https://gist.github.com/hyg/9c4afcd91fe24316cbf0>
+ <https://doc.rust-lang.org/std/process/struct.Command.html>

