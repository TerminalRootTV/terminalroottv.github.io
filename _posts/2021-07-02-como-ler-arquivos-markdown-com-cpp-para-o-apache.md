---
layout: post
title: "Como ler arquivos Markdown com C++ para o Apache"
date: 2021-07-02 16:16:32
image: '/assets/img/cppdaily/cpp-js-md-html-apache.jpg'
description: 'E utilizando Marked.js para renderizar em HTML.'
icon: 'ion:terminal-sharp'
iconname: 'C++ Web'
tags:
- cpp
- cppdaily
- javascript
- markdown
- html
- apache
- css
---

![Como ler arquivos Markdown com C++ para o Apache](/assets/img/cppdaily/cpp-js-md-html-apache.jpg)

Antes de qualquer coisa precisamos habilitar o [cgi](https://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html) no Apache para ler arquivos binários compilados em [C++](https://terminalroot.com.br/cpp) .

Nós mostramos como fazer isso de forma detalhada no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp), se você não adquiriu e não sabe, sugiro você ver [esse artigo](https://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html) que apesar de https://terminalroot.com.br/ feito para [Shell Script](https://terminalroot.com.br/shell), você pode seguir e alterar o `.sh` por `.cpp`.

Após isso basta criar o nosso código em C++ que irá ler o arquivo [Markdown](https://terminalroot.com.br/2019/12/habilitando-renderizacao-de-markdown-no-apache-web-server.html), da seguinte forma:

Vamos chamar ele de `readfile.cpp`. No meu caso que estou no [Gentoo](https://terminalroot.com.br/tags#gentoo), ele fica dentro do diretório `/var/www/localhost/cgi-bin` . Dentro desse diretório, criei outro diretório de nome `cpp` .
> Lembrando que em alguns casos precisa de permissão de `root`, exemplo: `sudo mkdir -p /var/www/localhost/cgi-bin/cpp`

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <iostream>
#include <fstream>

template<typename T>
class ReadFile {
  public:
    ReadFile(){
      std::cout << "Content-Type: plain/text\n\n";
    }
    const std::string readfile( const T * myfile ){
      std::string lines, content;
      std::ifstream file( *myfile );

      if ( file.is_open() ) {
        while( getline( file, lines ) ){
          content += lines + "\n";
        }
        file.close();
      }else{
        return "Falha ao ler arquivo.";
      }

      return content;
    }
};



int main( int argc , char ** argv ){
  const std::string myfile = "/var/www/localhost/htdocs/file.md";
  ReadFile<std::string> r;
  std::cout << r.readfile( &myfile ) << '\n';
  return 0;
}
{% endhighlight %}

Perceba que o nome do arquivo que iremos ler é `file.md`(estou usando esse [exemplo de arquivo markdown](https://gist.github.com/rt2zz/e0a1d6ab2682d2c47746950b84c0b6ee) ), mas você pode fazer isso dinamicamente, esse é só um exemplo.

Agora é só compilar, exemplo: `g++ readfile.cpp -o readfile`. Pronto, agora temos um arquivo binário com mime-type ** de nome `readfile` somente.

---

Próximo passo é fazermos o download do [Marked](https://marked.js.org/) que é um parser em [JavaScript](https://terminalroot.com.br/2020/01/javascript.html) que irá converter nosso [Markdown](ihttps://terminalroot.com.br/2020/08/como-abrir-arquivos-markdown-com-extensao-md-no-firefox.html) em [HTML](https://terminalroot.com.br/2020/01/desenvolvimento-web.html):

{% highlight bash %}
wget https://cdn.jsdelivr.net/npm/marked/marked.min.js -O marked.js
{% endhighlight %}

Você pode fazer a requisição via GET ou POST de outras maneiras: com [fetch](https://developer.mozilla.org/pt-BR/docs/Web/API/Fetch_API/Using_Fetch), [axios](https://github.com/axios/axios), ... ou até mesmo com JavaScript puro! Mas nesse caso vamos usar [jQuery](https://terminalroot.com.br/tags/#jquery) por se tratar de uma lib de fácil manuseio e por conta da sua alta disponibilidade na internet. E também vamos baixar o jQuery:

{% highlight bash %}
wget https://terminalroot.com.br/assets/js/jquery-3.4.1.slim.min.js -O jquery.js
{% endhighlight %}
> Note: que eu baixei a versão 3.4.1 que é a justamente a que eu uso no site [Terminal Root](https://terminalroot.com.br/).

Dentro do diretório que criei e escolhi baixar e salvar os arquivos, já há:
{% highlight bash %}
marked.js
jquery.js
file.md
{% endhighlight %}

Agora basta criarmos um arquivo no seu servidor [Apache](https://terminalroot.com.br/2020/11/como-instalar-corretamente-o-lamp-com-laravel-no-debian-gnulinux.html), exemplo `index.html` com o seguinte conteúdo:

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


{% highlight html %}
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Lendo arquivo Markdown com C++</title>
      <script src="jquery.js"></script>
      <script>
        $(function(){
           $.post("http://localhost/cgi-bin/cpp/readfile", function(mostrar){
            document.getElementById('app').innerHTML = marked( mostrar );
            });
        });
      </script>
   </head>
   <body>
      <div id="app" class="ui text container"></div>
       <script src="marked.js"></script>
   </body>
</html>
{% endhighlight %}
> Note que o endereço do meu `readfile` está em: <http://localhost/cgi-bin/cpp/readfile> (no meu computador).

Pronto, agora é só acessar meu `index.html` que está na raiz do meu servidor e o `file.md` será exibido:

[![Lendo arquivo Markdown com C++](/assets/img/cppdaily/md-cpp.jpg)](/assets/img/cppdaily/md-cpp.jpg)

*clique na imagem para ver em alta resolução*

Lembrando que adicionei um [CSS](https://terminalroot.com.br/2020/10/os-41-melhores-frameworks-css.html) para ficar mais legal! 😃 

Fácil, né?

---

A lista é grande porque a maioria dos aplicativos de sucesso usam [C++](https://terminalroot.com.br/cpp).

Por hoje é só!

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


