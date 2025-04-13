---
layout: post
title: "Gravidade de Partículas com C++ e SFML"
date: 2025-04-12 22:12:15
image: '/assets/img/animations/gravity-particles.jpg'
description: "🚀 Shorts, Reels e TikTok"
icon: 'ion:terminal-sharp'
iconname: 'Animação'
tags:
- animacao
- cpp
- sfml
- shorts
- reels
- tiktok
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

## Youtube Shorts

<iframe width="470" height="835" src="https://www.youtube.com/embed/QqY6sn8NXas" title="Gravidade de Partículas com C++ e SFML" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## TikTok

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7492605504074697990" data-video-id="7492605504074697990" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> <p>Gravidade de Partículas com C++ e SFML https:&#47;&#47;terminalroot.com.br&#47;2025&#47;04&#47;gravidade-de-particulas-com-cpp-e-sfml.html</p> <a target="_blank" title="♬ Speed - Monge" href="https://www.tiktok.com/music/Speed-7187094661805950977?refer=embed">♬ Speed - Monge</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>

---

## Código
{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <cmath>

struct Particle {
  sf::Vector2f position;
  sf::Vector2f velocity;
  float radius = 2.f;

  Particle(float x, float y){
    position = {x, y};
    velocity = {0, 0};
  }

  void update(const sf::Vector2f& mouse_pos, float dt){
    sf::Vector2f direction = mouse_pos - position;
    float distance = std::sqrt(direction.x * direction.x + direction.y * direction.y);

    if(distance < 100.f && distance > 1.f){
      direction /= distance;
      velocity += direction * (100.f / distance);
    }

    position += velocity * dt;
    velocity *= 0.98f;
  }

};

int main(){
  sf::RenderWindow window(sf::VideoMode(450,800), "Gravity Particles"); 
  window.setFramerateLimit(60);

  std::vector<Particle> particles;
  for(size_t i = 0; i < 500; ++i){
    particles.emplace_back(rand() % window.getSize().x, rand() % window.getSize().y);
  }

  while( window.isOpen() ){
    sf::Event event;
    while( window.pollEvent(event)){
      if( event.type == sf::Event::Closed ){
        window.close();
      }
    }

    sf::Vector2f mouse_pos = (sf::Vector2f)sf::Mouse::getPosition(window);

    for(auto &var : particles){
      var.update(mouse_pos, 0.1f);
    }

    window.clear();
    for(auto& var : particles){
      sf::CircleShape shape(var.radius);
      shape.setPosition(var.position);
      shape.setFillColor(sf::Color::White);
      window.draw(shape);
    }
    window.display();
  }

  return EXIT_SUCCESS;
}
// g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system
{% endhighlight %}


