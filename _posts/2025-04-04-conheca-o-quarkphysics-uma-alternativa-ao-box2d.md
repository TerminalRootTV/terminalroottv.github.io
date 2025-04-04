---
layout: post
title: "Conheça o QuarkPhysics, uma alternativa ao Box2D"
date: 2025-04-04 14:49:33
image: '/assets/img/gamedev/QuarkPhysics.jpg'
description: "🚀 Ideal para gamedevs SFML e Godot"
icon: 'ion:terminal-sharp'
iconname: 'GameDev'
tags:
- gamedev
- sfml
- fisica
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**QuarkPhysics** é um [motor de física 2D](https://terminalroot.com.br/2024/09/conheca-o-box2d-um-motor-de-fisica-2d-para-jogos.html) desenvolvido para jogos, com o objetivo de simular corpos rígidos e macios de forma integrada. 

Ele oferece suporte a formas primitivas (*círculo, polígono, retângulo*), propriedades físicas (*massa, área, restituição*), raycasting, máscaras de colisão, e um sistema de eventos avançado. 

Além disso, utiliza pixels como unidade padrão, possui API simples e consistente, e suporta mapeamento UV com `QMesh` para operações de renderização.

---

## Compilação e Exemplo
Antes de compilar o QuarkPhysics, é necessário ter o [SFML](https://terminalroot.com.br/tags#sfml) e o [CMake](https://terminalroot.com.br/tags#cmake) instalados no sistema. Após instalar essas dependências, siga os passos abaixo:

Clone o repositório:
{% highlight bash %}
git clone https://github.com/erayzesen/QuarkPhysics
{% endhighlight %}

Acesse o diretório do projeto:
{% highlight bash %}
cd QuarkPhysics
{% endhighlight %}

Dê permissão de execução ao arquivo que irá compilar e rodar o exemplo:
{% highlight bash %}
chmod +x run_linux_fast.sh
{% endhighlight %}

E execute o script:
{% highlight bash %}
./run_linux_fast.sh -r
{% endhighlight %}

A saída será similar a imagem abaixo:

![QuarkPhysics run.png](/assets/img/gamedev/QuarkPhysics-tr-run.png)

Se não conseguir compilar tente instalar também o [nlohmann's json](https://terminalroot.com.br/2022/03/json-cpp-para-criacao-e-parsing-de-json-com-cpp.html).


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

Para integrar o QuarkPhysics ao seu projeto, copie a pasta "QuarkPhysics" para o diretório do seu projeto e utilize-a conforme necessário.

No caso do [Godot](https://terminalroot.com.br/tags#godot) [veja essa integração](https://github.com/erayzesen/godot-quarkphysics).

Para mais informações acesse o [repositório oficial](https://github.com/erayzesen/QuarkPhysics).

---

## Veja também:
### [Conheça o Box2D, Um motor de física 2D para jogos](https://terminalroot.com.br/2024/09/conheca-o-box2d-um-motor-de-fisica-2d-para-jogos.html)

