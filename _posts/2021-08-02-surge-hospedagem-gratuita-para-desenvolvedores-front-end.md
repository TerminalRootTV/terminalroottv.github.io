---
layout: post
title: "Surge - Hospedagem gratuita para desenvolvedores front-end"
date: 2021-08-02 09:30:24
image: '/assets/img/dev-web/surge.jpg'
description: 'Publique facilmente seu site estático!'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web'
tags:
- html
- css
- javascript
---

![Surge - Hospedagem gratuita para desenvolvedores front-end](/assets/img/dev-web/surge.jpg)

Se você deseja hospedar seu site estático feito com [HTML](https://terminalroot.com.br/2020/01/desenvolvimento-web.html), [CSS](https://terminalroot.com.br/2020/10/os-41-melhores-frameworks-css.html) e [JavaScript](https://terminalroot.com.br/2021/04/sistema-solar-feito-com-html-css-e-javascript-puro.html) de maneira fácil e rápida, somente usando o [terminal](https://terminalroot.com.br/tags#terminal), então **Surge** é a melhor opção.

Para publicar é bem simples. Primeiramente você precisa ter o [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) instalado no seu sistema. Depois é só instalar o Surge com o seguinte comando:
{% highlight bash %}
sudo npm install --global surge
{% endhighlight %}

Entre no seu projeto ou crie um de exemplo só para testar:
> Criando um simples HTML

{% highlight bash %}
mkdir terminalroot
cd terminalroot
vim index.html
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Conteúdo HTML de exemplo:
{% highlight html %}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Terminal Root :: Surge</title>
</head>
<body>
  <h1>Olá, Surge!</h1>
</body>
</html>
{% endhighlight %}

E então rode o comando `surge` e voc^de deverá preencher os campos:
+ `email` - se você ainda não tiver uma conta, então quando você preencher seu e-mail e senha(`password`) será criada;
+ `project: /home/usuario/caminho/para/o/projeto` - Nesse caso: `project: /home/marcos/terminalroot/` , basta pressionar ENTER para confirmar, se realmente for o caminho do seu projeto;
+ `domain: puzzle-sur.surge.sh` - O próprio surge criará um nome fictício de domínio, se não for o que você deseja, delete e informe o nome, para esse exemplo: `domain: terminalroot.surge.sh`

E ao final aparecerá a mensage: `Success! - Published to terminalroot.surge.sh`

Simples, né?! Para mais detalhes consulte o endereço oficial do [Surge](https://surge.sh/).


