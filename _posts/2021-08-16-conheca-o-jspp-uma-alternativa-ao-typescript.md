---
layout: post
title: "Conheça o JS++ uma alternativa ao TypeScript"
date: 2021-08-16 08:14:03
image: '/assets/img/js/jspp.jpg'
description: 'Utilizado por: Yahoo! Finance, ComputerWeek, InfoWorld e SDTimes.'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
---

![Conheça o JS++ uma alternativa ao TypeScript](/assets/img/js/jspp.jpg)

# O que é o JS++?
JS ++ é uma linguagem de programação para desenvolvimento web que estende o JavaScript com [Type System](https://en.wikipedia.org/wiki/Type_system). Inclui recursos de programação imperativos, orientados a objetos, funcionais e genéricos.

JS++ apareceu pela primeira vez em 8 de outubro de 2011. A implementação moderna foi anunciada na DeveloperWeek 2016 e lançada em 31 de maio de 2016. A linguagem foi desenvolvida por Roger Poon e Anton Rapetov.

---

# Por quê usar JS++?
Segundo o criador do JS++, Roger Poon( que é engenheiro de software baseado no Vale do Silício, fundador da Onux ), há as seguintes afirmações:
+ JS++ é a melhor opção se você precisa escrever uma biblioteca simples ou se você precisa de compatibilidade com versões anteriores com uma grande e complexa base de código corporativa legada.
+ JS++ é perfeitamente compatível com todas as bibliotecas, estruturas e APIs de JavaScript
+ Gera um código melhor que o Microsoft [TypeScript](https://terminalroot.com.br/2021/05/converta-facilmente-seus-script-em-typescript-para-lua.html) que tem mais de 72.000 resultados no Stack Overflow relacionados apenas aos `TypeErrors` que ocorrem em tempo de execução.

Para acessar o link completo da entrevista dele, consulte a referência ao final desse artigo.


<!-- QUADRADO -->
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
{% highlight bash %}
wget https://onux.r.worldssl.net/jspp/downloads/JS++-0.9.2-linux_x64.tar.gz
tar zxvf JS++-0.9.2-linux_x64.tar.gz
cd JS++/
sudo install -v js++ /usr/local/bin/
{% endhighlight %}

Limpando os arquivos
{% highlight bash %}
cd ..
rm -rf JS++/ JS++-0.9.2-linux_x64.tar.gz
{% endhighlight %}

Rodando
{% highlight bash %}
js++ --version
js++ --help
{% endhighlight %}

---

# Primeiro JS++
> `vim hello.jspp`
{% highlight js %}
import System;
Console.log("Hello World!");
{% endhighlight %}
Rode: `js++ -e hello.jspp` . A saída será:
{% highlight bash %}
Compiling: /home/$USER/hello.jspp
OK  (0) errors and (0) warnings
Hello World!
{% endhighlight %}

Convertendo para [JavaScript](https://terminalroot.com.br/tags#javascript)
{% highlight bash %}
js++ hello.jspp -o hello.js
node hello.js
{% endhighlight %}

---


<!-- RETANGULO LARGO 2 -->
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

# Verificando o código JavaScript gerado
Note que o código não haverá indentação correta, mas para analisar você pode usar o <https://beautifier.io/> para formatar, o código ficará assim:
{% highlight js %}
// Compiled with JS++ v.0.9.2
!function() {
    var f = function() {
        if (typeof console !== "undefined" && typeof console.log === "function") {
            return (console.log);
        } else if (typeof print === "function") {
            return (print);
        } else {
            return ((function() {}));
        }
    }();
    var g = function() {
        if (typeof console !== "undefined" && typeof console.log === "function") {
            return (console);
        } else {
            return (void 0);
        }
    }();
    ! function() {
        f.apply(g, ['Hello World!']);
    }();
}();
{% endhighlight %}

---

# Utilizando no seu editor preferido
Há suporte de sintaxe para quase todos [editores de textos](https://terminalroot.com.br/2019/11/top-10-melhores-editores-de-codigo-para-linux.html) e IDE . Para mais informações, consulte: <https://www.onux.com/jspp/ide-editors>

No [Vim](https://terminalroot.com.br/vim) por exemplo, rode esses comandos:

+ Edite o arquivo: `sudo vim /usr/share/vim/vim[0-9][0-9]/filetype.vim`
+ Procure a linha que possui o conteúdo: `au BufNewFile,BufRead *.js,*.javascript,*.es,*.jsx   setf javascript`
+ E abaixo dela insira esse conteúdo: `au BufNewFile,BufRead *.jpp,*.jspp,*.js++              setf jspp`
+ Agora salve [esse arquivo](https://raw.githubusercontent.com/onux/jspp/master/Editor Integration/vim/jspp.vim) no diretório `syntax`:
> Substitua o **XX** pelo número da pasta que há no seu sistema.
{% highlight bash %}
sudo wget https://raw.githubusercontent.com/onux/jspp/master/Editor%20Integration/vim/jspp.vim \
-O /usr/share/vim/vimXX/syntax/jspp.vim
{% endhighlight %}

---

# Trabalhando com Tipos JS++
Exemplo de arquivo:
{% highlight js %}
import System;
     
string frase = "Isso é JS++";
int numero = 936;
double valor = 8.04;
bool bin = true;

if( bin == true ){
  Console.log( "FRASE: " + frase );
  Console.log( "NÚMERO: " + numero.toString() );
  Console.log( "VALOR: " + valor.toString() );
  Console.log( "BIN: " + bin.toString() );
}
{% endhighlight %}

---

# Trabalhando com dicionários
{% highlight js %}
import System;
 
Dictionary<string?> dicionario = {
    "Terminal": "Root",
    "Oliveira": "Marcos",
};

Dictionary<bool?> bin = {
  "verifica": true
};
  
if( bin["verifica"] ){
  Console.log( dicionario["Oliveira"] + " " + dicionario["Terminal"] );
}
{% endhighlight %}

---

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Trabalhando com outras bibliotecas numa página Web
> Utilizando com [jQuery](https://terminalroot.com.br/tags#jquery), por exemplo.

Código JS++ exemplo:
{% highlight js %}
external $;

string hello = "Olá, JS++!";

$("#content").text( hello );
{% endhighlight %}

Compilamos:
{% highlight bash %}
js++ pagina.jspp -o pagina.js
{% endhighlight %}

---

# Utilizando em um [HTML](https://terminalroot.com.br/tags#html) :
{% highlight html %}
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <title>Olá, JS++!</title>
</head>
<body>
  <h1 id="content"></h1>
  <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="pagina.js"></script>
</body>
</html>
{% endhighlight %}

### Para mais informações consulte a documentação [aqui](https://www.onux.com/jspp/tutorial/hello-world#hello_world_explained).


---

# Referências
+ <https://www.onux.com/jspp/>
+ <https://en.wikipedia.org/wiki/JS++>
+ <https://javascript-conference.com/blog/typescipt-vs-js-plus-plus-javascript-done-right/>

