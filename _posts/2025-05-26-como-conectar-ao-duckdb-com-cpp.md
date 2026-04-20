---
layout: post
title: "Como Conectar ao DuckDB com C++"
date: 2025-05-26 08:33:24
image: '/assets/img/sql/duckdb-cpp.jpg'
description: "🦆 Um banco de dados veloz e futurista para seus projetos."
icon: 'ion:terminal-sharp'
iconname: 'DuckDB/C++'
tags:
- duckdb
- cpp
- sql
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já fizemos um artigo inicial sobre [DuckDB](https://terminalroot.com.br/2025/03/conheca-um-duckdb-um-banco-de-dados-moderno.html) que explica conceitos iniciais, instalação e primeiros passos. Para mais informações acesse o link:
+ [Conheça o DuckDB, um banco de dados moderno](https://terminalroot.com.br/2025/03/conheca-um-duckdb-um-banco-de-dados-moderno.html)

Nesse artigo veremos como conectar ao DuckDB usando a API com [C++](https://terminalroot.com.br/tags#cpp)


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

## 01. Fazer download da lib e criar um código básico
A [API do DuckDB para C++](https://duckdb.org/docs/stable/clients/cpp) ainda não está estável, na própria página da API há esse aviso:

<figure>
  <blockquote class="blockquote p-3 bg-danger bg-opacity-10 rounded">
    <p>DuckDB's C++ API is internal. It is not guaranteed to be stable and can change without notice. If you would like to build an application on DuckDB, we recommend using the C API.</p>
  </blockquote>
</figure>

Por isso eles recomendam que você use a [API](https://duckdb.org/docs/stable/clients/c/connect) do [C](https://terminalroot.com.br/tags#linguagemc) que funciona perfeitamente. Para isso basta acessa a página: <https://duckdb.org/docs/installation/> e escolher os dados conforme seu sistema. No meu caso, escolhi:
+ [Stable Release:C/C++:Linux:Direct download:x86\_64](https://duckdb.org/docs/installation/?version=stable&environment=cplusplus&platform=linux&download_method=direct&architecture=x86_64)

Depois é só clicar no `.zip` que será displonibilizado e fazer o download, ou fazer download com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html):

{% highlight bash %}
wget -q https://github.com/duckdb/duckdb/releases/download/v1.3.1/libduckdb-linux-amd64.zip
{% endhighlight %}

Descompacte:
{% highlight bash %}
unzip libduckdb-linux-amd64.zip -d libduckdb-linux-amd64
{% endhighlight %}

Crie um banco de dados e uma tabela, exemplo: `duckdb terminalroot.db`
{% highlight sql %}
CREATE TABLE terminalroot (id INTEGER, name STRING);
INSERT INTO terminalroot VALUES(1, 'Marcos Oliveira');
INSERT INTO terminalroot VALUES(2, 'Mark Raasveldt');
INSERT INTO terminalroot VALUES(3, 'Hannes Muhleisen');
SELECT * FROM terminalroot;
.exit
{% endhighlight %}

Entre no diretório que você descompactou e crie um código básico: `cd libduckdb-linux-amd64/ && vim main.cpp`
{% highlight cpp %}
#include "duckdb.h"
#include <iostream>

int main(){
  duckdb_database db;
  duckdb_connection con;
  duckdb_result result;

  if(duckdb_open("terminalroot.db", &db) == DuckDBError){
    std::cerr << "Erro ao abrir o banco\n";
    return 1;
  }
  if(duckdb_connect(db, &con) == DuckDBError){
    std::cerr << "Erro ao conectar ao banco\n";
    return 1;
  }

  if(duckdb_query(con, "SELECT * FROM terminalroot;", &result) == DuckDBError){
    std::cerr << "Erro ao executar SELECT\n";
    duckdb_disconnect(&con);
    duckdb_close(&db);
    return 1;
  }

  for(idx_t row = 0; row <= result.deprecated_column_count; row++){
    int id = duckdb_value_int32(&result, 0, row);
    const char* name = duckdb_value_varchar(&result, 1, row);
    std::cout << id << " | " << name << '\n';
    duckdb_free((void*)name); // libera memória do varchar
  }

  duckdb_destroy_result(&result);
  duckdb_disconnect(&con);
  duckdb_close(&db);
}
{% endhighlight %}

Compile e rode:
{% highlight bash %}
g++ main.cpp libduckdb.so
LD_LIBRARY_PATH=. ./a.out
{% endhighlight %}

Provável saída:
{% highlight txt %}
1 | Marcos Oliveira
2 | Mark Raasveldt
3 | Hannes Muhleisen
{% endhighlight %}

---

## Instalar no sistema
Se quiser instalar no seu sistema e compilar com a flag `-lduckdb`, rode os comandos abaixo:

+ **01**. Mover `.h` para `include`:
{% highlight bash %}
sudo mkdir -p /usr/local/include/duckdb
sudo cp duckdb.h /usr/local/include/duckdb/
{% endhighlight %}

+ **02**. Mover a [biblioteca dinâmica](https://terminalroot.com.br/2024/09/diferenca-entre-bibliotecas-estatica-e-dinamica.html) para `lib`
> E atualizar o cache de bibliotecas compartilhadas do sistema.
{% highlight bash %}
sudo cp libduckdb.so /usr/local/lib/
sudo ldconfig
{% endhighlight %}


Após isso, basta testar com a flag e nem precisa estar na pasta com os arquivos baixados e nem usar a variável de ambiente ~~`LD_LIBRARY_PATH`~~:
> Mas precisa do `terminalroot.db`, se você pôr o caminho absoluto, ex.: `"/home/$USER/.db/terminalroot.db"` seu binário rodará independente do lugar onde você estiver no sistema!

{% highlight bash %}
g++ main.cpp -lduckdb
./a.out
{% endhighlight %}

Se quiser criar `.pc` para `pkg-config`, expanda o procedimento abaixo:

<details>
 <summary>Crie o arquivo <code>/usr/local/lib/pkgconfig/duckdb.pc</code> com este conteúdo:</summary>

{% highlight pc %}
prefix=/usr/local
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: DuckDB
Description: DuckDB embedded database
Version: 1.2.1
Libs: -L${libdir} -lduckdb
Cflags: -I${includedir}/duckdb
{% endhighlight %}

<p>Salve com:</p>

{% highlight bash %}
sudo mkdir -p /usr/local/lib/pkgconfig
sudo vim /usr/local/lib/pkgconfig/duckdb.pc
# cole o conteúdo acima
{% endhighlight %}

<p>Atualize o cache:</p>

{% highlight bash %}
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
{% endhighlight %}

</details>


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

Eu tentei a biblioteca estática `libduckdb_static.a`, mas tive problemas, mas se você preferir, tente:
{% highlight bash %}
g++ main.cpp libduckdb_static.a -I. -ldl -pthread -lm -lz -static-libstdc++ -static-libgcc
{% endhighlight %}

Se também tiver problemas, verifique dependências faltando:
{% highlight bash %}
nm libduckdb_static.a | grep " U "
{% endhighlight %}
> (`"U"` = *undefined symbol*)

Ou use `ldd ./a.out` para ver se ainda tem lib dinâmica pendurada.

No meu caso nenhuma dessa etapas funcionaram, mas veja se também de aplica a você.

---

## Links úteis
+ Para o `.hpp`: <https://stackoverflow.com/questions/71782764/how-to-add-duckdb-library-in-c-program>
+ <https://duckdb.org/docs/stable/clients/cpp>
+ <https://duckdb.org/docs/stable/clients/c/connect>

