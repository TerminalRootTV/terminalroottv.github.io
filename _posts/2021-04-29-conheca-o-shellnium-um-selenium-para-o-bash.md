---
layout: post
title: "Conheça o Shellnium - um selenium para o Bash."
date: 2021-04-29 10:16:13
image: '/assets/img/shell-script/shellenium.gif'
description: 'Um ferramenta para automatizar seus trabalhos!'
icon: 'ion:terminal-sharp'
iconname: 'Shell Script'
tags:
- shellscript
- bash
---

![Conheça o Shellnium - um selenium para o Bash.](/assets/img/shell-script/shellenium.gif)

Automatize rotinas no navegador de maneira fácil!

Funciona com [Bash](https://terminalroot.com.br/bash) ou [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html)

# Instalação
Certifique-se de possuir as dependências instaladas:
+ [Chromedriver](https://chromedriver.chromium.org/downloads)
+ [git](https://terminalroot.com.br/git)

Clone e rode:
> Só funciona no [Google Chrome](https://terminalroot.com.br/2016/04/lista-com-28-navegadores-para-linux.html) ou no [Chromium](https://terminalroot.com.br/2016/04/lista-com-28-navegadores-para-linux.html)

{% highlight bash %}
git clone git@github.com:Rasukarusan/shellnium.git
cd shellnium
sh demo.sh
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Você também pode customizar o idioma e entre outros:
{% highlight bash %}
chromedriver
sh demo.sh --headless --lang=es
{% endhighlight %}

Crie seu scripts customizados, exemplo:
{% highlight bash %}
#!/usr/bin/env bash
source ./selenium.sh

main() {
    # Abre a URL
    navigate_to 'https://google.co.jp'

    # Seleciona o elemento pelo atributo HTML
    local searchBox=$(find_element 'name' 'q')

    # envia dados
    send_keys $searchBox "animal\n"
}

main
{% endhighlight %}

Conheça todos os métodos disponíveis:
+ is_ready
+ new_session
+ delete_session
+ navigate_to
+ get_current_url
+ get_title
+ back
+ forward
+ refresh
+ get_timeouts
+ set_timeouts
+ set_timeout_script
+ set_timeout_pageLoad
+ set_timeout_implicit
+ find_element
+ find_elements
+ find_element_from_element
+ find_elements_from_element

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


+ get_active_element
+ get_attribute
+ get_property
+ get_css_value
+ get_text
+ get_tag_name
+ get_rect
+ is_element_enabled
+ send_keys
+ click
+ element_clear
+ exec_script
+ screenshot
+ get_window_handle
+ get_window_handles
+ delete_window
+ new_window
+ switch_to_window
+ get_window_rect
+ set_window_rect
+ maximize_window
+ minimize_window
+ fullscreen_window

Para mais informações, acesse:
+ [Documentação](https://shellnium-site.vercel.app/doc)
+ [Repositório](https://github.com/Rasukarusan/shellnium)


