---
layout: post
title: "Efeito Digitação com C++ e SFML"
date: 2025-06-22 22:40:24
image: '/assets/img/sfml/typing-effect.jpg'
description: "📱 Youtube Shorts, TikTok e Reels."
icon: 'ion:terminal-sharp'
iconname: 'SFML'
tags:
- sfml
- shorts
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

## Youtube Shorts

<iframe width="470" height="835" src="https://www.youtube.com/embed/5goaRBvqhfE" title="Efeito Digitação C++ e SFML" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## TikTok

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7518958423870852358" data-video-id="7518958423870852358" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> <p>Efeito digitação com C++ e SFML Código: https:&#47;&#47;terminalroot.com.br&#47;2025&#47;06&#47;efeito-digitacao-com-cpp-e-sfml.html #cpp #sfml #typing</p> <a target="_blank" title="♬ som original  - terminalroot" href="https://www.tiktok.com/music/som-original-terminalroot-7518958445670599430?refer=embed">♬ som original  - terminalroot</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---

## Reels
### <https://www.instagram.com/p/DLOcxv1xuoq/>

---

## Código


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <iostream>

int main(){
  sf::RenderWindow window(sf::VideoMode(450,800), "Typing Effect"); 

  sf::Font font;
  if(!font.loadFromFile("./arial.ttf")){
    std::cerr << "Failed to load font.\n";
    return EXIT_FAILURE;
  }

  std::wstring full_text = L"#include <iostream>\n"
  " std::cout << \"Efeito digitação!\\n\";\n"
  " std::cout << \"C++ e SFML\\n\";\n"
  " std::cout << \"Deixe o LIKE\\n\";\n"
  " std::cout << \"Se inscreva!\\n\";\n"
  " std::cout << \"@TerminalRootTV\\n\";\n"
  " return EXIT_SUCCESS;\n"
  "}\n";

  std::vector<std::wstring> words;
  std::wstring current_word;

  for(wchar_t c : full_text){
    if(c == L' ' || c == L'\n' || iswpunct(c)){
      if(!current_word.empty()){
        words.push_back(current_word);
        current_word.clear();
      }
      words.push_back(std::wstring(1, c));
    }else{
      current_word += c;
    }
  }

  if(!current_word.empty()){
    words.push_back(current_word);
  }

  std::vector<sf::Text> text_parts;
  float x = 50, y = 50;
  size_t word_index = 0, char_index = 0;
  sf::Clock clock;
  float typing_speed = 0.05f;


  while( window.isOpen() ){
    sf::Event event;
    while( window.pollEvent(event)){
      if( event.type == sf::Event::Closed ){
        window.close();
      }
    }


    if(word_index < words.size()){
      if(clock.getElapsedTime().asSeconds() > typing_speed){
        
        wchar_t c = words[word_index][char_index];

        sf::Text new_text;
        new_text.setFont(font);
        new_text.setCharacterSize(24);
        new_text.setFillColor(sf::Color::White);
        new_text.setString(std::wstring(1, c));
        new_text.setPosition(x, y);

        text_parts.push_back(new_text);

        if(c == L'\n'){
          x = 50;
          y += 30;
        }else{
          x += new_text.getGlobalBounds().width + 2;
        }

        char_index++;
        if(char_index >= words[word_index].size()){
          word_index++;
          char_index = 0;
        }
        clock.restart();
      }
    }

    window.clear(sf::Color::Black);

    for(const auto& target : text_parts){
      window.draw(target);
    }

    window.display();
  }

  return EXIT_SUCCESS;
}
// g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system
{% endhighlight %}
