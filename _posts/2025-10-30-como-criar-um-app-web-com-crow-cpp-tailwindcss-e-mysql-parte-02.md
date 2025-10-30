---
layout: post
title: "Como Criar um App Web com Crow C++, TailwindCSS e MySQL do Zero :: Parte 02"
date: 2025-10-29 09:01:28
image: '/assets/img/cpp/crow/crow-todo-02.jpg'
description: "🐦‍⬛ Nesse vídeo criamos a rotina de login usando cookies e os métodos de requisição POST e GET via Crow C++."
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

Capítulo anterior:
+ <https://terminalroot.com.br/2025/10/como-criar-um-app-web-com-crow-cpp-tailwindcss-e-mysql-parte-01.html>

Nesse vídeo criamos a rotina de login usando cookies e os métodos de requisição POST e GET via Crow C++.

Link sobre rotas, métodos, código de erros e entre outros:
+ <https://crowcpp.org/master/guides/routes/#methods>

---

## 📹 Assista ao Vídeo

<iframe width="800" height="450" src="https://www.youtube.com/embed/1ThyMFnan0M" title="Como Criar um App Web com Crow C++, TailwindCSS e MySQL :: PARTE 2" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 🔗 Links úteis
+ 👑 Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>

---

## 📝 Códigos feitos no vídeo (PARTE 2)

> `main.cpp`
{% highlight cpp %}
#include <crow.h>

std::string url_decode(const std::string& str){
  std::ostringstream decoded;
  for(size_t i = 0; i < str.size(); ++i){
    if(str[i] == '%' && i + 2 < str.size()){
      std::istringstream hex(str.substr(i + 1, 2));
      int value;
      if(hex >> std::hex >> value){
        decoded << static_cast<char>(value);
        i += 2;
      }
    }else if (str[i] == '+'){
      decoded << ' ';
    }else{
      decoded << str[i];
    }
  }
  return decoded.str();
}

std::unordered_map<std::string, std::string> parse_form_data(const std::string& body){
  std::unordered_map<std::string, std::string> result = {};
  std::istringstream ss(body);
  std::string pair = {};

  while(std::getline(ss, pair, '&')){
    const auto pos = pair.find('=');
    if(pos != std::string::npos){
      const std::string key = url_decode(pair.substr(0, pos));
      const std::string value = url_decode(pair.substr(pos + 1));
      result[key] = value;
    }
  }

  return result;
}

int main(){
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        const std::string title = "Crow C++, MySQL, TaildwindCSS";
        auto page = crow::mustache::load("index.html");
        crow::mustache::context ctx({{ "title", title }});
        return page.render(ctx);
    });

    CROW_ROUTE(app, "/login").methods("GET"_method, "POST"_method)([](const crow::request& req){
        const std::string name = "Marcos Oliveira";
        auto page = crow::mustache::load("login.html");

        const std::string user = parse_form_data(req.body)["mid"];
        const std::string pass = parse_form_data(req.body)["mpass"];

        std::string error = {};

        if(user == "marcos" && pass == "teste123@"){
          auto response = crow::response(302);
          response.set_header("Location", "/crow/");
          return response;
        }else{
          if(req.body != ""){
            error = "Falha ao logar.";
          }
        }

        crow::mustache::context ctx({{ "error", error } });
        return crow::response(400, page.render(ctx));
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
    <title>Todo++</title>
    <link href="/crow/static/css/style.css" rel="stylesheet">
  </head>
  <body>

    <h1 class="error">{{ error }}</h1>

    <form action="/crow/login" method="POST">
      <label for="mid">ID:</label><br>
      <input type="text" name="mid" id="mid" value="marcos"><br><br>

      <label for="mpass">Senha:</label><br>
      <input type="password" name="mpass" id="mpass" value="teste123@"><br><br>

      <input type="submit" name="mlogar" value="Logar">
    </form>

    <br>

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
    <a href="/crow/login">Deslogar</a>
  </body>
</html>
{% endhighlight %}

> `static/css/style.css`
{% highlight css %}
h1.error { color: red; }
{% endhighlight %}

Compilar e restartar o servidor:
{% highlight bash %}
g++ main.cpp && sudo pkill -f "a.out"
{% endhighlight %}

---

Até o próximo capítulo!

