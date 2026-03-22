---
layout: post
title: "Como Converter JavaScript para C++ facilmente"
date: 2024-05-04 01:23:20
image: '/assets/img/js/js-to-cpp.png'
description: 'Solucione até possíveis problemas do JS com C++'
icon: 'ion:terminal-sharp'
iconname: 'JS/C++'
tags:
- javascript
- cpp
- shorts
- tiktok
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---


# Assista como [#Shorts](https://www.youtube.com/shorts/zgIxEyw_LCc?feature=share)

<iframe width="436" height="775" src="https://www.youtube.com/embed/zgIxEyw_LCc" title="Como Converter JavaScript para C++ facilmente" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

# Assista como [Tik Tok](https://www.tiktok.com/@terminalroot/video/7364991360308350213)

<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@terminalroot/video/7364991360308350213" data-video-id="7364991360308350213" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@terminalroot" href="https://www.tiktok.com/@terminalroot?refer=embed">@terminalroot</a> <p>Como Converter JavaScript para C++ facilmente! Link: https:&#47;&#47;cutt.ly&#47;JsToCpp #javascript #javascripts #javascriptdeveloper #cpp #cppedit #convert 💯</p> <a target="_blank" title="♬ original sound  - terminalroot" href="https://www.tiktok.com/music/original-sound-terminalroot-7364992044354784006?refer=embed">♬ original sound  - terminalroot</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>


<!--
printf 'aHR0cHM6Ly93d3cuY29kZWNvbnZlcnQuYWkvamF2YXNjcmlwdC10by1jKystY29udmVydGVyCg' | base64 --decode
printf 'aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9zZWFyY2g/cT1qcyt0bytjJTJCJTJCCg' | base64 --decode
-->

---

# Tutorial escrito

Muita gente não sabe, mas é possível converter código C++ para JavaScript usando o EmScripten. Nós temos um vídeo que mostra como instalar e utilizar o EmScripten: 
### [Como Transformar seus Jogos C/C++ para Web com Emscripten (SDL2)](https://terminalroot.com.br/2023/02/como-transformar-seus-jogos-c-cpp-para-web-com-emscripten-sdl2.html).

No entanto, o processo exige um pouco mais de habilidades. Para mais informações acesse a Documentação no site do Emscripten sobre `bind.h`: 
+ <https://emscripten.org/docs/api_reference/bind.h.html>

Mas, o que muita gente também não sabe é que também é possível fazer o processo inverso e de forma bem fácil que é:


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

## Converter JavaScript para C++
Para isso basta acessar esse endereço:
### <https://products.codeporting.app/convert/ai/js-to-cpp/>

Lá você pode colar seu código JavaScript e converter para C++ e com somente um clique obter tal feito.

> Digite o código JavaScript:
{% highlight js %}
console.log("Terminal Root")
{% endhighlight %}

E obterá o código C++ equivalente:
{% highlight cpp %}
#include <iostream>

int main() {
    std::cout << "Terminal Root" << std::endl;
    return 0;
}
{% endhighlight %}

E, olha!!! Não se resume a códigos básicos não!!! Você pode converter códigos complexos, desde:
+ Funções
{% highlight js %}
function soma(x, y){
    return x + y;
}

console.log("A soma de x + y é: ", soma)
{% endhighlight %}


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

> Saída C++:
{% highlight cpp %}
#include <iostream>

int soma(int x, int y) {
    return x + y;
}

int main() {
    std::cout << "A soma de x + y é: " << soma(x, y) << std::endl;
    return 0;
}
{% endhighlight %}

+ HashMaps:
{% highlight js %}
const fruits = new Map([
  ["Maçãs", 500],
  ["Bananas", 300],
  ["Laranjas", 200]
]);

fruits.set("Melão", 200);

typeof fruits;

console.log(fruits)
{% endhighlight %}
> Saída C++:
{% highlight cpp %}
#include <iostream>
#include <unordered_map>
#include <string>

int main() {
    std::unordered_map<std::string, int> fruits = {
        {"Maçãs", 500},
        {"Bananas", 300},
        {"Laranjas", 200}
    };

    fruits["Melão"] = 200;

    std::cout << "Type of fruits: " << typeid(fruits).name() << std::endl;

    for (const auto& pair : fruits) {
        std::cout << pair.first << ": " << pair.second << std::endl;
    }

    return 0;
}
{% endhighlight %}

+ Classes:
{% highlight js %}
class Car {
  constructor(name, year) {
    this.name = name;
    this.year = year;
  }
}

const myCar1 = new Car("BYD", 2024);
const myCar2 = new Car("Audi", 2019);

console.log(myCar1.name)
console.log(myCar2.name)
{% endhighlight %}
> Saída C++:
{% highlight cpp %}
#include <iostream>
#include <string>

class Car {
public:
    Car(std::string name, int year) {
        this->name = name;
        this->year = year;
    }

    std::string name;
    int year;
};

int main() {
    Car myCar1("BYD", 2024);
    Car myCar2("Audi", 2019);

    std::cout << myCar1.name << std::endl;
    std::cout << myCar2.name << std::endl;

    return 0;
}
{% endhighlight %}

E muito mais!


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

Até confusões que você tem dificuldade de entender em JS é possível serem elucidadas com C++:
{% highlight js %}
console.log(1 + 1)
console.log("1" + 1)
{% endhighlight %}
> Saída C++:
{% highlight cpp %}
#include <iostream>

int main() {
    std::cout << 1 + 1 << std::endl;
    std::cout << "1" + 1 << std::endl; // This line will produce an error in C++
    
    return 0;
}
{% endhighlight %}
> 😃

Existem alguns outros sites que fazem a mesma coisa, inclusive para várias linguagens de programação e também para o processo inverso, mas são soluções pagas!

---


Fui!

