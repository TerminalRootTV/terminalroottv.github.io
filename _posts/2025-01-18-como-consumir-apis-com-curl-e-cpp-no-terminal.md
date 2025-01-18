---
layout: post
title: "Como Consumir APIs com cURL e C++ no Terminal"
date: 2025-01-18 16:43:05
image: '/assets/img/cpp/curlpp.jpg'
description: "🚀 Juntamente com RegEx, Tabulate e JSON++"
icon: 'ion:terminal-sharp'
iconname: 'cURL'
tags:
- curl
- cpp
- json
- tui
- regex
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 Nesse vídeo mostramos como utilizar a [Curlpp](https://www.curlpp.org/) que é um wrapper para a [libcurl](https://terminalroot.com.br/tags#curl) consumindo *API*s em conjunto com [JSON++](https://terminalroot.com.br/2022/03/json-cpp-para-criacao-e-parsing-de-json-com-cpp.html) e [Tabulate](https://terminalroot.com.br/2022/04/crie-facilmente-tabelas-no-terminal-com-cpp.html).

Instale a [cURLpp](https://github.com/jpbarrette/curlpp/releases/latest):
> Pesquise no seu gerenciador de pacotes, exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu):
{% highlight bash %}
sudo apt install libcurlpp-dev libcurl4-openssl-dev libcurlpp0t64
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

---

## Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/youtu.be/KhZb_1nZ-L4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---


<!-- RECTANGLE 2 - OnParagragraph -->
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

## Código criado no vídeo
> `main.cpp`
{% highlight cpp %}
#include <iostream>
#include <sstream>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>
#include <curlpp/cURLpp.hpp>
#include <memory>
//#include <regex>
#include <nlohmann/json.hpp>
#include <tabulate/table.hpp>
using namespace tabulate;
#include <unordered_map>

/*constexpr auto change_ip = [](const std::string& str){
  //std::regex ip("\\b(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})\\b");
  std::regex ip("Follow.*");
  return std::regex_replace(str, ip, "");
};*/

constexpr auto unicode = [](const std::string& str){
  static const std::unordered_map<std::string, std::string> html = {
    {"&euro;", "\u20AC"},
    {"&pound;", "\u00A3"},
    {"&#36;", "$"},
  };

  for(auto var : html){
    if(var.first == str){
      return var.second;
    }
  }
  return std::string{};
};

int main(){
  try{
    auto cleanup  = std::make_unique<curlpp::Cleanup>();
    auto response = std::make_unique<std::ostringstream>();
    auto request  = std::make_unique<curlpp::Easy>(); 

    //request->setOpt<curlpp::options::Url>("https://gnu.terminalroot.com.br/ip.php");
    //request->setOpt<curlpp::options::Url>("https://v2d.wttr.in/Londrina");
    request->setOpt<curlpp::options::Url>("https://api.coindesk.com/v1/bpi/currentprice.json");
    request->setOpt<curlpp::options::UserAgent>("curl/7.68.0 GNU/Linux Ubuntu x86_64");

    request->setOpt<curlpp::options::WriteStream>(response.get());

    request->perform();

    //std::cout << change_ip(response->str()) << '\n';
    //std::cout << response->str() << '\n';
    nlohmann::json json = nlohmann::json::parse(response->str());
    //std::cout << std::setw(2) << json["bpi"]["USD"] << '\n';
    
    Table table;
    table.add_row({"CURRENCY", "DESCRIPTION", "RATE", "RATE_FLOAT", "SYMBOL"});
    
    for(auto& [key, value]: json["bpi"].items()){
      table.add_row({
        key,
        value["description"],
        value["rate"],
        std::to_string(value["rate_float"].get<double>()),
        unicode(value["symbol"]),
      });
    }

    table.format()
      .multi_byte_characters(true)
      .font_style({FontStyle::bold})
      .border_top("─")
      .border_bottom("─")
      .border_left("│")
      .border_right("│")
      .corner("∎");

    for(size_t i = {}; i <= table.size(); ++i){
      table[0][i].format()
        .font_background_color(Color::blue)
        .font_color(Color::white);
      table[1][i].format()
        .font_background_color(Color::red)
        .font_color(Color::white);
      table[2][i].format()
        .font_background_color(Color::green)
        .font_color(Color::white);
      table[3][i].format()
        .font_background_color(Color::magenta)
        .font_color(Color::white);
    }

    std::cout << table << std::endl;

  }catch(const curlpp::RuntimeError& e){
    std::cerr << "Runtime error: " << e.what() << '\n';
  }catch(const curlpp::LogicError& e){
    std::cerr << "Logic error: " << e.what() << '\n';
  }
  return EXIT_SUCCESS;
}
{% endhighlight %}

---

## Links adicionais
+ <https://terminalroot.com.br/2019/10/12-dicas-para-voce-usar-o-comando-curl-como-um-ninja.html>
+ <https://www.whatismybrowser.com/guides/the-latest-user-agent/chrome>
+ <https://wttr.in/Sao_Paulo>
+ <https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis.html?redirect=true>

---

### ✅ Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
### ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
### ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
### ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
### ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
### 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>


