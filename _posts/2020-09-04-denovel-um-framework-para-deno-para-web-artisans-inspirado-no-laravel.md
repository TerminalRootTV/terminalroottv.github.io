---
layout: post
title: "Denovel - Um Framework para Deno para Web Artisans Inspirado no Laravel"
date: 2020-09-04 19:28:21
image: '/assets/img/laravel/denovel.jpg'
description: 'O projeto para ainda estar começando, mas já vale aquele velho teste!'
icon: 'cib:deno'
iconname: 'deno'
tags:
- laravel
- javascript
- nodejs
---

![Denovel - Um Framework para Deno para Web Artisans Inspirado no Laravel](/assets/img/laravel/denovel.jpg)

O [Deno](https://deno.land/) ainda não arrancou tanto quanto seu antecessor: o [Node.js](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) . Mas acredito que um dos motivos é qua a comundidade ainda não começou a desenvolver ferramentas em massa para ele.

Só que isso pode mudar e um dos novo projetos para o Deno é o Denovel!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalação
Clone o repositório:
{% highlight bash %}
git clone https://github.com/fauzan121002/denovel.git
cd denovel
{% endhighlight %}

Abra o arquivo `.env` e customize para acesso ao banco de dados, exemplo:
{% highlight bash %}
PORT=8000
BASE_URL=http://localhost:8000

DB_CONNECTION=mongod
DB_HOST=mongodb://localhost
DB_NAME=denovel
DB_USER=
DB_PASS=
DB_PORT=27017
{% endhighlight %}

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

Rode o servidor:
{% highlight bash %}
deno run -A --unstable denomand.ts --name </YourControllerName>
{% endhighlight %}

# O que fazer depois de criar um controller?
+ Abra `ControllerMap.ts` dentro de `$ROOT/app` para adicionar seu controller;
+ Abra `web.ts` dentro de `$ROOT/routes` para adicionar rotas ao seu controller;
+ Em seguida, use o seu `[Nome do seu controlador]`! (Veja `HomeController.ts` dentro de `$ROOT/app/controllers` para obter um exemplo)

---

O projeto para ainda estar começando, mas já vale aquele velho teste! Para mais informações, acesso o [GitHub](https://github.com/fauzan121002/denovel) do projeto.

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


# Fui!

