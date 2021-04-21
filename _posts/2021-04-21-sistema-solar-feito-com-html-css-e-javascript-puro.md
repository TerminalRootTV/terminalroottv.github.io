---
layout: post
title: "Sistema Solar feito com HTML, CSS e Javascript puro"
date: 2021-04-21 08:38:19
image: '/assets/img/dev-web/solarsystem.jpg'
description: 'Código pronto para você rodar no seu navegador.'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web'
tags:
- html5
- css
- javascript
- desenvolvimentoweb
---

![Sistema Solar feito com HTML, CSS e Javascript puro](/assets/img/dev-web/solarsystem.jpg)

Salve, rapa! Dia desse eu vi um tutorial bacana no Youtube e guardei nos favoritos para dar uma olhada mais tarde. E ontem terminei minhas tarefas diárias um pouco mais cedo e resolvi assistir e reproduzir o conteúdo do vídeo.

É o Sistema Solar feito com [HTML](https://terminalroot.com.br/html), [CSS](https://terminalroot.com.br/css) e [Javascript](https://terminalroot.com.br/javascript) puro!

Apesar do autor do vídeo não disponibilizar os arquivos e o código ele fez questão de frisar todo o procedimento no vídeo, exibindo a lógica dos cálculos por mensagens escritas.

No final dessa postagem há o vídeo e você notará que precisa terum conhecimento avançado de [Matemática](https://terminalroot.com.br/2017/02/mathml-mathematical-markup-language.html) mais precisamente de [Geometria](https://pt.wikipedia.org/wiki/Geometria):
- Seno
- Cosseno
- Radiano

Eu fiz e vou disponibilizar os arquivos por aqui mesmo, são 3 arquivos(código):
+ [index.html](#indexhtml)
+ [main.css](#maincss)
+ [script.js](#scriptjs)

As imagens(eu selecionei em vários sites da internet e não lembro os endereços) estão logo ao final do código, você pode salvar como no mesmo diretório onde irá criar/salvar ocódigo. Fiz desse jeito porque o autor lançou um "disclaimer" e eu não entendi muito bem. Então, para não desmerecer o trabalho **codeTonight** além de postar o vídeo dele, os arquivos serão disponibilizados separadamente.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Segue os códigos:
Crie uma pasta de nome exemplo: **solarsystem**, `mkdir solarsystem` . E salve todos os arquivos, inclusive as imagens dentro dessa pasta.

> `index.html`
{% highlight html %}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta charset="utf-8">
  <title>Solar System</title>
  <link rel="stylesheet" href="main.css">
</head>
<body>
  <img class="object" src="sun.png" alt="" id="sun">
  <img class="object planet" src="mercury.png" alt="" id="mercury">
  <img class="object planet" src="venus.png" alt="" id="venus">
  <img class="object planet" src="earth.png" alt="" id="earth">
  <img class="object planet" src="mars.png" alt="" id="mars">
  <img class="object planet" src="jupiter.png" alt="" id="jupiter">
  <img class="object planet" src="saturn.png" alt="" id="saturn">
  <img class="object planet" src="uranus.png" alt="" id="uranus">
  <img class="object planet" src="neptune.png" alt="" id="neptune">
  <div class="object" id="moon"></div>

  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object p-orbit"></div>
  <div class="object" id="m-orbit"></div>

  <img src="asteroid.png" class="object" alt="" id="belt">
</body>
  <script src="script.js"></script>
</html>
{% endhighlight %}

---

<!-- RETANGULO LARGO 2 -->
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

---

> `main.css`
{% highlight css %}
body {
  background: black;
  margin: 0;
  padding: 0;
  height: 200vmin;
}

.object {
  border-radius: 50%;
  position: absolute;
  margin: auto;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  transform: translateY( 50vmin );
}

.p-orbit, #m-orbit{
  border: 0.1vmin solid lightgrey;
  opacity: 0.5;
  background: transparent;
}

#belt {
  height: 97vmin;
  width: 97vmin;
  animation: spin 50s infinite linear;
  margin-top: 50vmin;
}

@keyframes spin{
  0%{ transform: rotate(0deg) }
  100%{ transform: rotate(360deg) }
}

#m-orbit {
  height: 8vmin;
  width: 8vmin;
}

.planet, #moon {
  z-index: 100;
}

#sun {
  height: 12vmin;
  width: 12vmin;
}

#moon {
  height: 1vmin;
  width: 1vmin;
  background-color: white;
}

#mercury {
  height: 2vmin;
  width: 2vmin;
}

#venus {
  height: 3vmin;
  width: 3vmin;
}

#earth {
  height: 4vmin;
  width: 4vmin;
}

#mars {
  height: 3.5vmin;
  width: 3.5vmin;
}

#jupiter {
  height: 12vmin;
  width: 12vmin;
}

#saturn {
  height: 12vmin;
  width: 12vmin;
  border-radius: 0%;
}

#uranus {
  height: 5vmin;
  width: 5vmin;
}

#neptune {
  height: 4vmin;
  width: 4vmin;
}
{% endhighlight %}

---

<!-- MINI ANÚNCIO -->
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

> `script.js`
{% highlight js %}
const planets = document.querySelectorAll('.planet')
const p_radii = [22,33,50,70,112,138,165,190]
let p_radians = new Array(8).fill(0)
const p_velocities = [1.607, 1.174,1,0.802, 0.434, 0.323, 0.228, 0.182]

const moon = document.querySelector('#moon')
const m_radius = 8
let m_radians = 0
const m_velocity = 10

const p_orbits = document.querySelectorAll('.p-orbit')
const m_orbit = document.querySelector('#m-orbit')

p_orbits.forEach((p_orbit, index)=>{
  p_orbit.style.height = `${p_radii[index]}vmin`
  p_orbit.style.width = `${p_radii[index]}vmin`
})

setInterval( ()=> {
  planets.forEach( (planet, index)=>{
    planet.style.left = `${Math.cos(p_radians[index]) * p_radii[index]}vmin`
    planet.style.top = `${Math.sin(p_radians[index]) * p_radii[index]}vmin`
    p_radians[index] += p_velocities[index] * 0.02
  })

  moon.style.left = `${earthX() + (Math.cos(m_radians) * m_radius )}vmin`
  moon.style.top = `${earthY() + (Math.sin(m_radians) * m_radius )}vmin`
  m_radians += m_velocity * 0.02

  m_orbit.style.left = `${earthX()}vmin`
  m_orbit.style.top = `${earthY()}vmin`
}, 1000/60)

function earthX(){
  return Number( planets[2].style.left.split('vmin')[0] )
}

function earthY(){
  return Number( planets[2].style.top.split('vmin')[0] )
}
{% endhighlight %}

---

# Imagens

![Planet](/assets/img/dev-web/solarsystem/asteroid.png)
![Planet](/assets/img/dev-web/solarsystem/earth.png)
![Planet](/assets/img/dev-web/solarsystem/jupiter.png)
![Planet](/assets/img/dev-web/solarsystem/mars.png)
![Planet](/assets/img/dev-web/solarsystem/mercury.png)
![Planet](/assets/img/dev-web/solarsystem/neptune.png)
![Planet](/assets/img/dev-web/solarsystem/aturn.png)
![Planet](/assets/img/dev-web/solarsystem/sun.png)
![Planet](/assets/img/dev-web/solarsystem/uranus.png)
![Planet](/assets/img/dev-web/solarsystem/venus.png)

---

<!-- RETANGULO LARGO -->
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

# Vídeo do codeTonight

<iframe width="910" height="390" src="https://www.youtube.com/embed/ZmIHQBMhDiQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Quer aprender Desenvolvimento Web do Zero? 
Assista também essa [Playlist](https://www.youtube.com/watch?v=SGA6nQqYH7A&list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly), segue abaixo o vídeo introdutório:

<iframe width="910" height="390" src="https://www.youtube.com/embed/SGA6nQqYH7A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


