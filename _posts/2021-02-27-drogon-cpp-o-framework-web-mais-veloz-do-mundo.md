---
layout: post
title: "Drogon C++, O Framework Web Mais VELOZ do Mundo"
date: 2021-02-27 13:50:18
image: '/assets/img/cpp/drogon-cpp.jpg'
description: '🐉 Foi o primeiro colocado em testes com 105 frameworks, dentre eles: Rails, Django, NestJS, Laravel e entre outros.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- desenvolvimentoweb
---

![Drogon C++, O Framework Web para Back-end Mais VELOZ do Mundo](/assets/img/cpp/drogon-cpp.jpg)

**Drogon** é um [Framework Web](https://terminalroot.com.br/tags#desenvolvimentoweb) escrito com C++ que funciona nas versões C++14 e também C++17. 

O site [TechEmpower](https://www.techempower.com/benchmarks/#section=data-r19&hw=ph&test=composite)( [link do ranking](https://www.techempower.com/benchmarks/#section=data-r19&hw=ph&test=composite) ) possui alguns serviços de benchmarks que testa desempenho de algumas tecnologias e dentre esses testes, analisou o desempenho de Frameworks Web para Back-end e o Drogon foi o primeiro colocado em testes com 105 frameworks, dentre eles: [Rails](https://terminalroot.com.br/2020/02/como-instalar-corretamente-o-ruby-bundler-e-jekyll-no-ubuntu-linux.html), [Django](https://terminalroot.com.br/2019/12/as-30-melhores-bibliotecas-e-pacotes-python-para-iniciantes.html), [NestJS](https://terminalroot.com.br/2021/02/laravel-vs-nodejs-qual-o-melhor.html), [Laravel](https://youtu.be/TKH4S4_d9PA) e entre outros.

+ O nome Drogon vem do dragão chamado Drogon da série [Game of Thrones](https://pt.wikipedia.org/wiki/Game_of_Thrones).
+ Ele está disponível para [Linux](https://terminalroot.com.br/tags#linux), [macOS](https://terminalroot.com.br/tags#macos), [FreeBSD](https://terminalroot.com.br/2017/09/por-que-freebsd.html), [OpenBSD](https://terminalroot.com.br/tags#openbsd) e [Windows](https://terminalroot.com.br/tags#windows). 
+ Usa uma biblioteca de rede de E/S sem bloqueio baseada em epoll (e no caso para macOS e FreeBSD usa kqueue) .
+ Tem suporte para o protocolo HTTP 1.0 e 1.1 ( tanto para server-side como para client-side);
+ Tem suporte para cookies e sessões embutidas.
+ Também tem suporte para: HTTPS(com [OpenSSL](https://terminalroot.com.br/2019/12/gerar-senha-linux.html)), WebSocket, solicitação e resposta para formato [JSON](https://terminalroot.com.br/2020/01/javascript.html), muito utilizada para API Restful
+ Além de AOP com joinpoints e entre diversas outras funcionalidades.

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

# Dependências
Para instalar, antes você vai precisar de algumas dependências em tempo de compilação e em tempo de execução. Que são elas:

- [Git](https://terminalroot.com.br/git/)
- [GCC](https://terminalroot.com.br/2019/12/gcc-vs-llvm-qual-e-o-melhor-compilador.html)
- [G++](https://terminalroot.com.br/2021/02/conan-um-gerenciador-de-pacotes-para-c-cpp.html)
- [CMAKE](https://terminalroot.com.br/2019/12/como-compilar-seus-programas-com-cmake.html)
- [JSONCPP](https://github.com/open-source-parsers/jsoncpp)
- [OSSP-UUID](http://www.ossp.org/pkg/lib/uuid/)
- [OPENSSL](https://terminalroot.com.br/2019/12/gerar-senha-linux.html)
- [ZLIB](https://zlib.net/)

+ Para sistemas que utilizam APT: Debian, Ubuntu, Mint e derivados, basta rodar esse comando abixo:
{% highlight bash %}
sudo apt install git gcc g++ cmake libjsoncpp-dev uuid-dev openssl libssl-dev zlib1g-dev
{% endhighlight %}

+ Para sistemas que utilizam Portage: Gentoo, Funtoo e derivados:
{% highlight bash %}
sudo emerge dev-vcs/git jsoncpp ossp-uuid openssl
{% endhighlight %}
> Ou evitando ambiguidade: `sudo dev-vcs/git dev-util/cmake emerge dev-libs/jsoncpp dev-libs/ossp-uuid dev-libs/openssl`

+ Para sistemas que utilizam RPM: Fedora, Red Hat e derivados
{% highlight bash %}
sudo dnf install git gcc gcc-c++ cmake libuuid-devel openssl-devel zlib-devel 
{% endhighlight %}

# Banco de dados
Se futuramente você vai desenvolver aplicativos que usam banco de dados(que eu acredito que sim), é extremamente importante  você instalá-los antes de instalar o Drogon. Pode ser um dos listados abaixo:
+ [Postgres](https://terminalroot.com.br/2019/08/conheca-o-servico-online-para-executar-seus-comandos-sql.html)
+ [MySQL](https://terminalroot.com.br/php/) / [MariaDB](https://terminalroot.com.br/mysql/)
+ [SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html)

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

# Instalando o Drogon
{% highlight bash %}
git clone https://github.com/an-tao/drogon
cd drogon
git submodule update --init
mkdir build
cd build
cmake ..
make && sudo make install
{% endhighlight %}

# Utilização
Para esse exemplo básico vamos criar uma página estática sem consulta à [banco de dados](https://terminalroot.com.br/tags#mysql)

## 1. Exemplo 1(O básico do básico)
### 1.1 - Criando o projeto
{% highlight bash %}
cd $HOME
drogon_ctl create project meu-projeto
{% endhighlight %}

Agora nosso `meu-projeto` possui os seguintes arquivos:
{% highlight bash %}
meu-projeto/
├── build
├── CMakeLists.txt
├── config.json
├── controllers
├── filters
├── main.cc
├── models
│   └── model.json
├── plugins
└── views

6 directories, 4 files
{% endhighlight %}

### 1.2 - Alterando a porta do arquivo `main.cc`
O arquivo original `main.cc` está com a porta `80`, mas isso poderá haver um conflito no seu sistema. Então altere, por exemplo, para a porta `8080`.
> Se também tiver problema com a porta `8080`, use a porta `1024` ou tente uma porta maior que ela que não esteja sendo usada, para saber se está sendo usada use o [nmap](https://youtu.be/LFjMu993uAA), por exemplo, para descobrir. **Não** use portas inferiores à 1024 porque devem ser usadas somente para usuários com privilégios(`root`, por exemplo).
{% highlight bash %}
cd meu-projeto
vim main.cc
{% endhighlight %}
Com o seguinte conteúdo:
{% highlight cpp %}
#include <drogon/HttpAppFramework.h>
int main() {
    // Definir endereço e porta para escutar o HTTP
    drogon::app().addListener("0.0.0.0",8080);
    // Carregar arquivo de configuração
    // drogon::app().loadConfigFile("../config.json");
    // Execute a estrutura HTTP, o método será bloqueado no loop de evento interno
    drogon::app().run();
    return 0;
}
{% endhighlight %}

E compile:
{% highlight bash %}
cd build
cmake ..
make
{% endhighlight %}

Agora rode o arquivo binário que foi criado dentro do diretório que vocẽ está(`build`) . No meu caso, como chamei o projeto de `meu-projeto`, há um binário com esse nome, então é só executá-lo:
{% highlight bash %}
./meu-projeto
{% endhighlight %}

Acesse o endereço: <http://0.0.0.0:8080/> 

E acessando você já encontrará um belo [404](https://terminalroot.com.br/404.html):

![404 Drogon C++](/assets/img/cpp/404.png)

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

Para "derrubar" a execução do servidor, tecle: `Ctrl + C`.

Mas isso quer dizer que já está funcionando. Então basta você adicionar uma página HTML(ainda dentro do diretório `build`) e acessar novamente:
{% highlight bash %}
echo '<h1>Servidor com Drogon C++, rodando legal!</h1>' >> index.html
./meu-projeto
{% endhighlight %}

E acesse: <http://localhost:8080/>

E então verá sua página:

![Drogon C++ running](/assets/img/cpp/drogon-run.png)

# 2. Criando um Controller
Vamos criar um controller de nome `ListController` de teste só para exibir a frase: "Lista do meu controlador". Na raiz do seu projeto entre no diretório: `controller` e rode o comando a seguir para criar o controller.
{% highlight bash %}
cd controller/
drogon_ctl create controller ListController
{% endhighlight %}
> A saída deve ser: `create a http simple controller:ListController` .

Foram criados dois arquivos: `ListController.cc` e `ListController.h`

## 2.1 - Editando os arquivos
Primeiramente vamos editar o arquivo: `ListController.h` e adicionar essas duas linhas:
{% highlight cpp %}
PATH_ADD("/",Get,Post);
PATH_ADD("/list",Get);
{% endhighlight %}

O arquivo final fica desse jeito:
{% highlight cpp %}
#pragma once
#include <drogon/HttpSimpleController.h>
using namespace drogon;
class ListController:public drogon::HttpSimpleController<ListController>{
  public:
    virtual void asyncHandleHttpRequest(const HttpRequestPtr& req, std::function<void (const HttpResponsePtr &)> &&callback) override;
    PATH_LIST_BEGIN
    PATH_ADD("/",Get,Post);
    PATH_ADD("/list",Get);
    PATH_LIST_END
};
{% endhighlight %}

E o arquivo `ListController.cc` deverá ficar assim:
{% highlight cpp %}
#include "ListController.h"
void ListController::asyncHandleHttpRequest(const HttpRequestPtr& req, 
                                            std::function<void (const HttpResponsePtr &)> &&callback){
    auto resp=HttpResponse::newHttpResponse();
    resp->setStatusCode(k200OK);
    resp->setContentTypeCode(CT_TEXT_HTML);
    resp->setBody("Lista do meu controlador");
    callback(resp);
}
{% endhighlight %}

Recompile o projeto e acesse:
{% highlight bash %}
cd ../build
cmake ..
make
./meu-projeto
{% endhighlight %}

Agora tanto na raiz(<http://localhost:8080/> via get ou post) como no endereço <http://localhost:8080/list> obteremos conteúdo.

![Controllers Drogon C++](/assets/img/cpp/list.png)

Se você estiver usando o [Postman](https://terminalroot.com.br/2021/02/como-instalar-o-postman-no-ubuntu-e-em-qualquer-distro-linux.html) notará que a raiz devolverá a informação tanto para GET quanto para POST, mas o `/list` retornará somente para GET.

O endereço do [Drogon](https://github.com/an-tao/drogon) oficial no GitHub é: <https://github.com/an-tao/drogon>, lá você pode obter informação de toda documentação para instalar e desenvolver seus aplicativos web.

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

---

# Assista o vídeo
<iframe width="910" height="390" src="https://www.youtube.com/embed/5CYX_ZJVASk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- RETANGULO LARGO -->
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


