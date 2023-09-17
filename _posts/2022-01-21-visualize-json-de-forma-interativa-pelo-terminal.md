---
layout: post
title: "Visualize JSON de forma interativa pelo terminal"
date: 2022-01-21 13:35:52
image: '/assets/img/terminal/json-tui.jpg'
description: 'Fechando e abrindo objetos com clique do mouse e animação.'
icon: 'ion:terminal-sharp'
iconname: 'JSON'
tags:
- terminal
- cpp
- json
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**json-tui** é um mini aplicativo escrito em [C++](https://terminalroot.com.br/cpp) que exibe arquivos JSON de forma interativa facilitando a visualização do mesmo.

Ele foi desenvolvido pelo mesmo criador do [RGB-TUI](https://terminalroot.com.br/2021/12/selecione-cores-no-terminal-com-rgb-tui-cpp.html) que nós publicamos à pouco tempo.

---

# Instalação
Existem algumas formas de instalação e para diversos sistemas operacionais, inclusive compilar do zero.

Mas a forma mais simples é essa descrita abaixo que se resume em baixar o binário zipado, descompactar e instalar.

Para isso rode os comandos abaixo na ordem:

{% highlight sh %}
wget -q https://cutt.ly/json-tui -O json-tui.zip
unzip json-tui* 
cd json-tui*/bin
sudo install -v json-tui /usr/local/bin/
{% endhighlight %}


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Limpe a bagunça:
{% highlight sh %}
cd -
rm -rf json-tui*
{% endhighlight %}

Copie esse **JSON** de exemplo:
> `vim example.json`
{% highlight json %}
{
  "glossary": {
    "title": "example glossary",
    "GlossDiv": {
      "title": "S",
      "GlossList": {
        "GlossEntry": {
          "ID": "SGML",
          "SortAs": "SGML",
          "GlossTerm": "Standard Generalized Markup Language",
          "Acronym": "SGML",
          "Abbrev": "ISO 8879:1986",
          "GlossDef": {
            "para": "A meta-markup language, used to create markup languages such as DocBook.",
            "GlossSeeAlso": ["GML", "XML"]
          },
          "GlossSee": "markup"
        }
      }
    }
  }
}
{% endhighlight %}

E faça o teste:
{% highlight sh %}
json-tui example.json
{% endhighlight %}
> Para sair do modo interativo tecle a letra `q` .

A provável saída será exibir o código e você pode manipulá-lo clicando nas chave de abertura: `{` . Exemplo do gif abaixo:

![json-tui](https://github.com/ArthurSonzogni/json-tui/raw/main/demo.webp) 

Para mais informações e caso queira compilar do zero acesse o [repositório](https://github.com/ArthurSonzogni/json-tui) do projeto.

