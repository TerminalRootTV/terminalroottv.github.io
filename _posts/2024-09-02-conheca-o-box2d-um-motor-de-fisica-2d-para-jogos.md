---
layout: post
title: "Conheça o Box2D, Um motor de física 2D para jogos"
date: 2024-09-02 21:47:00
image: '/assets/img/gamedev/box2d.jpg'
description: "🚀 Open Source e gratuito!"
icon: 'ion:terminal-sharp'
iconname: 'Gamedev'
tags:
- gamedev
- fisica
- sfml
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[Box2D](https://box2d.org/) é um motor de física 2D para jogos Open Source e gratuito, sendo um dos mais utilizados por [gamedevs](https://terminalroot.com.br/tags#gamedev) tanto com bibliotecas como: [SFML](https://terminalroot.com.br/tags#sfml), [Raylib](https://terminalroot.com.br/tags#raylib), [SDL2](https://terminalroot.com.br/tags#sdl2) e outras tanto quanto por motores gráficos para desenvolvimento de jogos e animações tais como: [Godot](https://terminalroot.com.br/tags#godot), [Defold](https://terminalroot.com.br/tags#defold), [Unity](https://terminalroot.com.br/tags#csharp) e entre outros.

---

## Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/XdZlSfVLlsE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Código [SFML](https://terminalroot.com.br/sfml) com Box2D
{% highlight cpp %}
#include <SFML/Graphics.hpp>
#include <box2d/box2d.h>
#include <memory>

class Box2DSFML {
  static constexpr float scale = 30.0f;
  static constexpr float boxsize = 50.0f;

  // SFML types
  std::unique_ptr<sf::RenderWindow> window;
  sf::RectangleShape ground_shape;
  std::vector<sf::RectangleShape> shapes;

  // Box2D types
  b2Vec2 gravity;
  b2World world;
  b2BodyDef groundBodyDef;
  b2Body* groundBody;
  b2PolygonShape groundBox;
  std::vector<b2Body*> boxes;

  b2Body* create_box(b2World& world, float x, float y){
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(x / scale, y / scale);
    b2Body* body = world.CreateBody(&bodyDef);

    b2PolygonShape dynamicBox;
    dynamicBox.SetAsBox(boxsize / 2 / scale, boxsize / 2 / scale);

    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicBox;
    fixtureDef.density = 1.0f;
    fixtureDef.friction = 0.3f;
    body->CreateFixture(&fixtureDef);

    return body;
  }

  public:
    // Constructor
    Box2DSFML(): gravity(0.f, 9.8f), world(gravity){

      // Initialize SFML types
      window = std::make_unique<sf::RenderWindow>(
        sf::VideoMode(1280, 720), "SFML::Box2D"
      );
      ground_shape.setSize(sf::Vector2f(800.0f, 20.0f));
      ground_shape.setOrigin(400.0f, 10.0f);
      ground_shape.setPosition(400.0f, 550.0f);
      ground_shape.setFillColor(sf::Color::White); 
      shapes = {};

      groundBodyDef.position.Set(400.0f / scale, 550.0f / scale);
      groundBody = world.CreateBody(&groundBodyDef);
      groundBox.SetAsBox(400.0f / scale, 10.0f / scale);
      groundBody->CreateFixture(&groundBox, 0.0f);
      boxes = {};
    }

    void run(){
      while (window->isOpen()) {
        sf::Event event;
        while (window->pollEvent(event)) {
          if (event.type == sf::Event::Closed) {
            window->close();
          }
        }

        if (sf::Mouse::isButtonPressed(sf::Mouse::Left)) {
          sf::Vector2i mousePos = sf::Mouse::getPosition(*window);
          b2Body* box = create_box(world, mousePos.x, mousePos.y);
          boxes.push_back(box);

          sf::RectangleShape shape(sf::Vector2f(boxsize, boxsize));
          shape.setOrigin(boxsize / 2, boxsize / 2);
          int rand_color1 = std::rand() % 240 + 10;
          int rand_color2 = std::rand() % 240 + 10;
          int rand_color3 = std::rand() % 240 + 10;
          shape.setFillColor(sf::Color(rand_color1, rand_color2, rand_color3));
          shapes.push_back(shape);
        }

        world.Step(1.0f / 60.0f, 6, 2);

        for (size_t i = 0; i < boxes.size(); ++i) {
          b2Vec2 position = boxes[i]->GetPosition();
          float angle = boxes[i]->GetAngle();
          shapes[i].setPosition(position.x * scale, position.y * scale);
          shapes[i].setRotation(angle * 180.0f / b2_pi);
        }

        window->clear();
        window->draw(ground_shape);
        for(const auto& shape : shapes){
          window->draw(shape);
        }
        window->display();
      }

    }
};

int main(){
  auto bsf = std::make_unique<Box2DSFML>();
  bsf->run();
  return EXIT_SUCCESS;
}
// g++ example.cpp -lsfml-graphics -lsfml-window -lsfml-system -lbox2d && ./a.out
{% endhighlight %}


