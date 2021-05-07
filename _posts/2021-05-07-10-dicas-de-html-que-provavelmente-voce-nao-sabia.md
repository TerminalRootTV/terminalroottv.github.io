---
layout: post
title: "10 Dicas de HTML que provavelmente você não sabia"
date: 2021-05-07 08:40:55
image: '/assets/img/html/html-tips.jpe'
description: 'E mais uma dica bônus!'
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web'
tags:
- html
- css
- javascript
---

![10 Dicas de HTML que provavelmente você não sabia](/assets/img/html/html-tips.jpe)

[HTML](https://terminalroot.com.br/2020/01/desenvolvimento-web.html) não é só uma linguagem de formatação, é também uma terapia e a porta de entrada do conhecimento de como o mundo do desenvolvimento funciona ou como devia funcionar: simples, funcional e organizado!

Nós possuímos um vídeo sobre [HTML](https://terminalroot.com.br/html) e [CSS](https://terminalroot.com.br/css) além de uma [série/curso completo e gratuito de desenvolvimento web](https://cutt.ly/PlayWeb) com diversas tecnologias como:
- [HTML](https://youtu.be/SGA6nQqYH7A) e [CSS](https://youtu.be/SGA6nQqYH7A)
- [Javascript](https://youtu.be/HI6YZJxoaIQ?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly)
- [Bootstrap](https://youtu.be/mRlkt7P2gZI?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly)
- [Jekyll](https://youtu.be/7lI5BfHK-kA?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly)
- [GitHub](https://youtu.be/ahkpilbOtpE?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly), [Gitlab](https://youtu.be/ahkpilbOtpE?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly) e [Netlify](https://youtu.be/ahkpilbOtpE?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly)
- e [Shell Script Web](https://youtu.be/q-nDkg1PauE?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly)

Além de muitos outros tutoriais que podem servir de complemento para algum projeto particular ou para obter conhecimento para aquela tão sonhada vaga na empresa que você deseja. Tais como: [Docker](https://youtu.be/bsGkIKP1OZ4), [PHP e MySQL](https://terminalroot.com.br/php), [Laravel](https://youtu.be/TKH4S4_d9PA?list=PLUJBQEDDLNcmn_qxFhZYa02Y_gHDBXfly) e entre outros.

Mas nesse artigo vamos conhecer **10 Dicas de HTML que provavelmente você não sabia** , vamos às dicas!

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

# 01. Carregamento imagens só quando o usuário for vê-la
Dica de desempenho. Você pode usar o atributo `loading=lazy` para adiar o carregamento da imagem até que o usuário role até eles.
{% highlight html %}
<img src="imagem.jpg" loading="lazy" alt="Texto para o padrão W3C">
{% endhighlight %}

---

# 02. E-mail, Telefone e SMS
Você pode atribuir ao título e ao corpo do e-mail, sms ou telefone o conteúdo com pré preenchimento dos dados ao usuário clicar:
{% highlight html %}
<a href="mailto:{email}?subject={subject}&body={content}">
  Envie-nos um e-mail
</a>

<a href="tel:{phone}">
  Me ligue
</a>

<a href="sms:{phone}?body={content}">
  Envie-nos uma mensagem
</a>
{% endhighlight %}

---

# 03. Lista ordenada a partir de um determinado número
Caso queira que sua lista comece em um número diferente, basta usar o atributo `start` para alterar o ponto de partida para suas listas ordenadas.

![Lista ordenada a partir do número 11](/assets/img/html/start.png)

---

# 04. O elemento `meter`
Você pode usar o elemento `<meter>` para exibir as quantidades de forma gráfica sem precisar de [Javascript]()/[CSS]().

<p class="codepen" data-height="265" data-theme-id="light" data-default-tab="js,result" data-user="marcoscpp" data-slug-hash="VwpYWag" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="VwpYWag">
  <span>See the Pen <a href="https://codepen.io/marcoscpp/pen/VwpYWag">
  VwpYWag</a> by Marcos (<a href="https://codepen.io/marcoscpp">@marcoscpp</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

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

# 05. Pesquisa nativa
Outra dica é usar o autocomplete nativo do HTML para exibir as alternativas

<p class="codepen" data-height="350" data-theme-id="dark" data-default-tab="html,result" data-user="denic" data-slug-hash="WNpbOOo" style="height: 350px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Pesquisa nativa do HTML">
</p>

---

# 06. Fieldset com input radio
Se for fazer um questionário, fica mais bem formatado usando o `radio` dentro do `fieldse`t

<p class="codepen" data-height="350" data-theme-id="dark" data-default-tab="html,result" data-user="denic" data-slug-hash="eYvmRvy" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Fieldset com input radio">
</p>

---

# 07. Habilitar a verificação ortográfica
Use o atributo `spellcheck` para definir se o elemento pode ser verificado quanto a erros de ortografia.

<p class="codepen" data-height="350" data-theme-id="dark" data-default-tab="html,result" data-user="denic" data-slug-hash="JjWoJba" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Atributo para verificação ortográfica">
</p>

---

# 08. Slide nativo

<p class="codepen" data-height="350" data-theme-id="dark" data-default-tab="html,result" data-user="denic" data-slug-hash="wpYWag" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Slide nativo do HTML">
</p>

---

# 09. HTML Accordion
Você pode usar o elemento `details` para criar um accordion nativo do HTML.

<p class="codepen" data-height="350" data-theme-id="dark" data-default-tab="html,result" data-user="denic" data-slug-hash="wvJBePW" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Accordion nativo do HTML">

---

# 10. O atributo `download`
Use o atributo `download` em seus links para baixar o arquivo em vez de navegar até ele.

{% highlight html %}
<a href="caminho/para/o/arquivo" download>
  download
</a>
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

## Dica bônus
Use o atributo `poster` para especificar uma imagem a ser mostrada durante o download do vídeo ou até que o usuário pressione o botão de reprodução.

{% highlight html %}
<video poster="caminho/para/a/imagem">
{% endhighlight %}

---

Espero que você tenham gostado das dicas. Caso deseje mais informações sobre HTML e Desenvolvimento Web, sugiro esse vídeo abaixo ou logo [essa Playlist](https://cutt.ly/PlayWeb) completa!

<iframe width="910" height="390" src="https://www.youtube.com/embed/SGA6nQqYH7A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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

*Essas dicas foram retiradas do site: [markodenic.com](https://markodenic.com/html-tips/)*


