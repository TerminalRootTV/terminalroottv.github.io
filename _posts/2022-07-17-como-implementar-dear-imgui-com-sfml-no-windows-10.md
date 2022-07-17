---
layout: post
title: "Como Implementar Dear ImGUi com SFML no Windows 10"
date: 2022-07-17 14:49:57
image: '/assets/img/windows/imgui-sfml-windows10.jpg'
description: 'Nesse vídeo detalhamos todos os passos para adicionar o supor à biblioteca Dear ImGui ao SFML no Windows 10 .'
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- sfml
- gamedev
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

🔊 Nesse vídeo detalhamos todos os passos para adicionar o supor à biblioteca Dear ImGui ao SFML no Windows 10 .

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/1r4Slhmkz_c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Código criado no vídeo

### `main.cpp`

{% highlight cpp %}
#include "imgui.h"

#include "imgui-SFML.h"

#include <SFML/Graphics.hpp>

int main() {
    sf::RenderWindow window(sf::VideoMode(1000, 600), "Dear ImGUI + SFML");
    ImGui::SFML::Init(window);
    sf::CircleShape shape(100.f, 50.f);
    shape.setFillColor(sf::Color(204, 77, 5));
    shape.setPosition(400.f, 200.f);

    sf::Clock clock;
    bool shape_exists = true;
    float radius = 100.f;
    int points = 100 ;
    float color[3] = { (float)204/255, (float)77/255, (float)5/255 };
   
    shape.setFillColor(sf::Color(
        (int)(color[0] * 255),
        (int)(color[1] * 255),
        (int)(color[2] * 255)
    ));


    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            ImGui::SFML::ProcessEvent(event);
            if (event.type == sf::Event::Closed) {
                window.close();
            }
        }

        ImGui::SFML::Update(window, clock.restart());

        ImGui::Begin("SFML with ImGui");
        ImGui::Text("Terminal Root");
        ImGui::Checkbox("Shape", &shape_exists);
        ImGui::SliderFloat("Radius", &radius, 50.f, 200.f);
        ImGui::SliderInt("Points", &points, 3, 150);
        ImGui::ColorEdit3("Color", color);
        ImGui::End();

        shape.setRadius(radius);
        shape.setPointCount(points);

       
        shape.setFillColor(sf::Color(
            (int)(color[0] * 255),
            (int)(color[1] * 255),
            (int)(color[2] * 255)
        ));

        window.clear(sf::Color(18, 33, 43));

       
        if (shape_exists) {
            window.draw(shape);
        }

        ImGui::SFML::Render(window);
        window.display();
    }

    ImGui::SFML::Shutdown();
    return 0;
}
{% endhighlight %}

---

# Repositório do Sistema de Partículas
## <https://github.com/terroo/particle-system>


