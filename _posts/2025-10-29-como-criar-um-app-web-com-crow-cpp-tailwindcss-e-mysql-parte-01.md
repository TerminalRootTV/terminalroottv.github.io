---
layout: post
title: "Como Criar um App Web com Crow C++, TailwindCSS e MySQL do Zero :: Parte 01"
date: 2025-10-29 09:01:28
image: '/assets/img/cpp/crow/crow-todo-01.jpg'
description: "🐦‍⬛ Nesse vídeo vamos iniciar uma série onde iremos desenvolver um TODO."
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web/C++'
tags:
- crow
- cpp
- desenvolvimentoweb
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse vídeo iniciamos uma série onde iremos desenvolver um *TODO*, que é uma anotação para fazer ou marcar tarefas pendentes.

Vamos fazer isso com [Crow C++](https://terminalroot.com.br/tags#crow) que é um framework web, além disso vamos usar algumas outras tecnologias como: [MySQL](https://terminalroot.com.br/tags#mysql) e **TailwindCSS**.

Se você está no [Windows](https://terminalroot.com.br/tags#windows) ou qualquer sistema similar a [UNIX](https://terminalroot.com.br/tags#unix), como distribuições [GNU/Linux](https://terminalroot.com.br/tags#gnulinux), nós possuímos links que podem lhe guiar a preparar o seu ambiente para seguir essa série. Dentre eles:

+ [Primeiros passos com Crow C++](https://terminalroot.com.br/2022/09/crow-cpp-um-framework-web-facil-e-veloz.html)
+ [Como Instalar o Crow C++ no Windows](https://terminalroot.com.br/2025/06/como-instalar-o-crow-cpp-no-windows.html)

+ Como instalar o MySQL no Windows e no Ubuntu de acordo com esses links:
  - <https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html>
  - <https://terminalroot.com.br/2023/03/como-instalar-mariadb-mysql-no-ubuntu-2210.html>

+ Como conectar ao MySQL com C++ no Windows e também em distros GNU/Linux com esses links:
  - <https://terminalroot.com.br/2023/09/como-conectar-ao-mysql-com-c-cpp-no-windows.html>
  - <https://terminalroot.com.br/2023/10/como-conectar-mysql-com-c-cpp-no-ubuntu-e-qualquer-distro.html>

> Após consultar os links vc verá que é possível usar o Crow [C++](https://terminalroot.com.br/tags#cpp) diretamente sem ser pelo Apache, ou se quiser, principalmente quando for fazer deploy em servidores na nuvem ou VPS, tais como AWS, Heroku e entre outros. 

Você pode integrar o Crow ao Apache, para isso veja esse link:
+ [Como Rodar o Crow C++ com Apache](https://terminalroot.com.br/2025/08/como-rodar-o-crow-cpp-com-apache.html)

---

## 📹 Assista ao Vídeo

<iframe width="800" height="450" src="https://www.youtube.com/embed/8rUIkUj7fjk" title="Como Criar um App Web com Crow C++, TailwindCSS e MySQL do Zero" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 🔗 Links úteis
+ 👑 Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>

---

## 📝 Códigos feitos no vídeo

> `main.cpp`
{% highlight cpp %}
#include <crow.h>

int main(){
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        const std::string title = "Crow C++, MySQL, TaildwindCSS";
        auto page = crow::mustache::load("index.html");
        crow::mustache::context ctx({{ "title", title }});
        return page.render(ctx);
    });

    CROW_ROUTE(app, "/login")([](){
        const std::string name = "Marcos Oliveira";
        auto page = crow::mustache::load("login.html");
        crow::mustache::context ctx({{ "name", name }});
        return page.render(ctx);
    });

    app.port(18080).multithreaded().run();
}
{% endhighlight %}

> `templates/login.html`
{% highlight html %}
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ name }}</title>
    <link href="/crow/static/css/style.css" rel="stylesheet">
  </head>
  <body>

    <form action="/crow/login" method="POST">
      <label for="mid">ID:</label><br>
      <input type="text" name="mid" id="mid"><br><br>

      <label for="mpass">Senha:</label><br>
      <input type="password" name="mpass" id="mpass"><br><br>

      <input type="submit" name="mlogar" value="Logar">
    </form>

    <br>
    <a href="/crow">Deslogar</a>

  </body>
</html>
{% endhighlight %}

> `templates/index.html`
{% highlight html %}
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ title }}</title>
    <link href="/crow/static/css/style.css" rel="stylesheet">
  </head>
  <body>
    <h1>Todo++</h1>
    <a href="/crow/login">Logar</a>
  </body>
</html>
{% endhighlight %}

> `static/css/style.css`
{% highlight css %}
h1 { color: purple; }
{% endhighlight %}

Compilar e restartar o servidor:
{% highlight bash %}
g++ main.cpp && sudo pkill -f "a.out"
{% endhighlight %}

---

Até o próximo capítulo!

