---
layout: post
title: "Onda de Palavras com C++ e SFML"
date: 2025-08-05 16:55:38
image: '/assets/img/shorts/wave-words-cpp-sfml.jpg'
description: "〰️ Um vídeo curto mostrando do zero como criar um efeito estilo ondas com fade de palavras. Código incluso."
icon: 'ion:terminal-sharp'
iconname: 'Vídeo Curto'
tags:
- shorts
- youtube
- tiktok
- reels
- cpp
- sfml
- gamedev
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

## ⚡ Youtube Shorts

<iframe width="1271" height="715" src="https://www.youtube.com/embed/GqU-ILoHLWs" title="Onda de Palavras com C++ e SFML #cplusplus #sfml #cpp #coding" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


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

## 🎼 TikTok

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7535196304918482181" data-video-id="7535196304918482181" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> Onda de Palavras com C++ e SFML <a title="coding" target="_blank" href="https://www.tiktok.com/tag/coding?refer=embed">#coding</a> <a title="cpp" target="_blank" href="https://www.tiktok.com/tag/cpp?refer=embed">#cpp</a> <a title="cplusplus" target="_blank" href="https://www.tiktok.com/tag/cplusplus?refer=embed">#cplusplus</a> <a title="sfml" target="_blank" href="https://www.tiktok.com/tag/sfml?refer=embed">#sfml</a> <a title="programacao" target="_blank" href="https://www.tiktok.com/tag/programacao?refer=embed">#programacao</a> <a title="desenvolvimento" target="_blank" href="https://www.tiktok.com/tag/desenvolvimento?refer=embed">#desenvolvimento</a> <a target="_blank" title="♬ som original  - terminalroot" href="https://www.tiktok.com/music/som-original-terminalroot-7535196304437070597?refer=embed">♬ som original  - terminalroot</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---

## 📷 Reels
### <https://www.instagram.com/p/DM_I8zWSCpL/>

---

## 🉐 Código

{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <cmath>
#include <string>

const std::string letters = "É hora de aprender Programação e Desenvolvimento. Um pouco de muito sobre C++, Programação, Desenvolvimento de Games e Web.";

struct Letter {
  sf::Text text;
  float lifetime;
};

struct Position {
  float x, y;
};

float distance(const Position& p1, const Position& p2){
  float dx = p2.x - p1.x;
  float dy = p2.y - p1.y;
  return std::sqrt(dx * dx + dy * dy);
}

int main(){
  sf::Font font;
  if(!font.loadFromFile("./arial.ttf")){
    return -1;
  }
  sf::RenderWindow window(sf::VideoMode(450,800), "SFML Palavras"); 
  window.setFramerateLimit(60);

  Position position = {400, 300};
  std::vector<Letter> lettersOnScreen;
  bool mouseDown = false;
  int counter = 0;

  while( window.isOpen() ){
    sf::Event event;
    while( window.pollEvent(event)){
      if( event.type == sf::Event::Closed ){
        window.close();
      }
      if(event.type == sf::Event::MouseButtonPressed){
        mouseDown = true;
      }
      if(event.type == sf::Event::MouseButtonReleased){
        mouseDown = false;
      }
    }

    if(mouseDown){
      sf::Vector2i mousePos = sf::Mouse::getPosition(window);
      Position mouse = {static_cast<float>(mousePos.x), static_cast<float>(mousePos.y)};
      float d = distance(position, mouse);
      float fontSize = 5 + d / 2;

      if(counter >= letters.size()){
        counter = 0;
      }

      sf::Text text;
      text.setFont(font);
      text.setString(letters[counter]);
      text.setCharacterSize(static_cast<unsigned int>(fontSize));
      text.setFillColor(sf::Color::Black);
      float stepSize = text.getLocalBounds().width;

      if(d > stepSize){
        float angle = std::atan2(mouse.y - position.y, mouse.x - position.x);
        text.setPosition(position.x, position.y);
        text.setRotation(angle * 180.f / 3.14f);
        lettersOnScreen.push_back({text, 255});

        position.x += std::cos(angle) * stepSize;
        position.y += std::sin(angle) * stepSize;

        ++counter;
      }
    }

    window.clear(sf::Color::White);
    for(auto it = lettersOnScreen.begin(); it != lettersOnScreen.end();){
      it->text.setFillColor(sf::Color(0, 0, 0, static_cast<sf::Uint8>(it->lifetime)));
      window.draw(it->text);
      it->lifetime -= 2;
      if(it->lifetime <= 0){
        it = lettersOnScreen.erase(it);
      }else{
        ++it;
      }
    }
    window.display();
  }

  return EXIT_SUCCESS;
}
// g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system
{% endhighlight %}

---

## 💻 Links Úteis

+ 👑 Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/sfml>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>

