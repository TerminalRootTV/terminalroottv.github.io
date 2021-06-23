---
layout: post
title: "4 Geradores de Sites Estáticos para C++"
date: 2021-06-23 11:30:13
image: '/assets/img/web/static-website-cpp.jpg'
description: 'Ordem dos que eu acredito possuir mais recursos.'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web e C++'
tags:
- cppdaily
- cpp
- desenvolvimentoweb
---

![4 Geradores de Sites Estáticos para C++](/assets/img/web/static-website-cpp.jpg)

Criar sites estáticos é uma das tecnologias mais modernas tanto para fins de documentação como criar um blog, site ou até mesmo um portal. Eu particularmente uso o [Jekyll](https://www.youtube.com/watch?v=7lI5BfHK-kA) que feito com [Ruby on Rails](https://terminalroot.com.br/2020/02/como-instalar-corretamente-o-ruby-bundler-e-jekyll-no-ubuntu-linux.html), mas algumas pessoas me perguntaram se há opções feitas com [C++](https://terminalroot.com.br/cpp) , então resolvi criar essa mini lista para o [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje.

Então vamos conhecer 4 opções na ordem que acredito ser mais completas. Caso queira saber sobre framework web feito com **C++** sugiro você assistir à [esse vídeo](https://youtu.be/5CYX_ZJVASk).

---

# 1º [Nift](https://nift.dev/)
![Nift](/assets/img/web/nift.jpg)

**Nift** ou **nsm**, abreviação de **n**ifty **s**ite **m**anager, é um gerenciador de sites semelhante ao [git](https://terminalroot.com.br/git) e ao [LaTeX](https://en.wikipedia.org/wiki/LaTeX) de plataforma cruzadai escrito em [C++](https://terminalroot.com.br/cpp) . Você pode criar qualquer site que quiser (estático e não estático/dinâmico) usando o Nift, embora precise de algum tipo de servidor web, como [Apache](https://terminalroot.com.br/tags#apache), [NGINX](https://en.wikipedia.org/wiki/Nginx), etc. para hospedar não estático/dinâmico sites, enquanto sites estáticos podem ser facilmente hospedados em plataformas como BitBucket, [GitHub](https://terminalroot.com.br/tags#github), [GitLab](https://terminalroot.com.br/2020/02/como-hospedar-gratuitamente-no-github-gitlab-e-netlify.html) e [Netlify](https://youtu.be/ahkpilbOtpE).

+ Site oficial: <https://nift.dev/>
+ GitHub: <https://github.com/nifty-site-manager/nsm>

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

# 2º [sudo_site](https://github.com/sharadcodes/sudo_site)
![sudo_site](/assets/img/web/sudo_site.jpg)

**sudo_site** é o gerador de site estático mais simples e leve que existe, sem dependências e com todas as bibliotecas já fornecidas com o repositório, você não precisa instalar nenhuma outra dependência.

Com aproximadamente 120 linhas de código, ele se torna o menor gerador de sites estáticos que é capaz de gerar várias páginas e blogs.

O repositório também tem um arquivo de configuração de ações do GitHub com a ajuda do qual você pode automatizar o processo de construção no próprio github. Ele pode enviar para qualquer repositório de sua preferência, basta adicionar um *TOKEN DE ACESSO PESSOAL* aos segredos com a caixa de seleção repo marcada ao criar o TOKEN.

A documentação está em andamento, embora você não precise porque é tão simples. Depois de clonar ou baixar o repositório, basta executar

{% highlight bash %}
g++ -o sudo_site sudo_site.cpp -lstdc++fs && ./sudo_site
{% endhighlight %}
> ... e o site será gerado.

Você não precisa compilá-lo novamente. Da próxima vez, basta executar `./sudo_site` somente.

+ Site de demonstração: <https://sudositedemo.netlify.app/>
+ GitHub: <https://github.com/sharadcodes/sudo_site>

---

# 3º [BlogC++](https://blogcpp.org/)
![BlogC++](/assets/img/web/blogcpp.jpg)

**BlogC++** é mais um gerador de blog estático, escrito em [C++17](https://terminalroot.com.br/cpp).

Utiliza as bibliotecas:
+ [cxxopts](https://github.com/jarro2783/cxxopts)
+ [inja](https://github.com/pantor/inja)
+ [json](https://github.com/nlohmann/json)
+ [TinyXML2](https://github.com/leethomason/tinyxml2)
+ [ConfigParser](https://github.com/underww/ConfigParser)
+ [dukglue](https://github.com/Aloshi/dukglue/) com [duktape](http://duktape.org/)
+ [icu](http://icu-project.org/)
+ [libcurl](https://terminalroot.com.br/2021/05/utilizando-curl-com-cpp.html) se compilado com a opção: `WITH_OEMBED`

O objetivo é fornecer um conjunto de recursos decente sem exigir muita configuração.

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

+ Site oficial: <https://blogcpp.org/>
+ GitHub: <https://github.com/dertuxmalwieder/blogcpp>

---

# 4º [Bake](http://ctrl-c.club/~philips/90s/)
![Bake](/assets/img/web/bake.jpg)

**Bake** é a opção *canarinho* dessa lista. Criado por um brasileiro, é uma ferramenta para gerar blogs como se você estivesse usando o [make](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html). Crie um template, um bakefile e suas postagens em [markdown](https://terminalroot.com.br/tags#markdown) e você está pronto para usar!

+ Site: <http://ctrl-c.club/~philips/90s/>
+ GitHub: <https://github.com/felipetavares/bake>

---

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!


