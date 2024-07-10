---
layout: post
title: "Como Criar um Código auto-relógio em JavaScript"
date: 2024-07-10 11:51:55
image: '/assets/img/js/clockjs.jpg'
description: "🗞️ O verdadeiro programador artista!"
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Uma vez eu encontrei um site que exibia o relógio com o próprio código [JavaScript](https://terminalroot.com.br/tags#javascript), acabei salvando o código, pois queria entendê-lo sem o formato de relógio e acabei perdendo o link com o código original, salvei e formatei e o código era esse:

{% highlight js %}
(r = () => setInterval(t => {
    for (j = o = "\n", y = 5; y--; document.body["inn" +
            "erHTML"] = "<pre>&lt" + (S = "script>\n") + o + "\n\n&lt/" + S)
        for (x = -01; 63 - !y > x++; o += `(r=${r})()` [j++].fontcolor(c ? "#FF0" : "#444")) c = x / 2 %
            4 < 3 && parseInt("odRFacb67o2vi5gmOZmwFNteohbOh3sw".slice(i = "9" < (
                D = Date()[16 + (x / 8 | 0)]) ? 30 : D * 3, i + 3), 36) & 1 << (x / 2 | 0) % 4 + 3 * y
}, 100))()
{% endhighlight %}

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

---

Note que ele exibe e modifica o próprio código.

Como eu havia limpado o histórico, acabei não encontrando mais o código, mas o formato original era esse:

{% highlight js %}
(r=()=>setInterval(t=>{for(j=o="\n",y=5;y--;document.body["inn"
+"erHTML"]="<pre>&lt"+(S="script>\n")+o+"\n\n&lt/"+S)for(x=-01;
63-!y>x++;o+=`(r=${r})()`[j++].fontcolor(c?"#FF0":"#444"))c=x/2
%4<3&&parseInt("odRFacb67o2vi5gmOZmwFNteohbOh3sw".slice(i="9"<(
D=Date()[16+(x/8|0)])?30:D*3,i+3),36)&1<<(x/2|0)%4+3*y},100))()
{% endhighlight %}

Ou seja, se você criar esse arquivo e abrir no seu navegador, você verá o relógio que utiliza o próprio código JS para exibí-lo:
> `clockjs.html`

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="UTF-8">
    <style>
      html {background: #000;}
    </style>
  </head>
  <body>
    <a href="https://aem1k.com/qlock/">Saiba mais</a><br><<hr>
    
 <script>

(r=()=>setInterval(t=>{for(j=o="\n",y=5;y--;document.body["inn"
+"erHTML"]="<pre>&lt"+(S="script>\n")+o+"\n\n&lt/"+S)for(x=-01;
63-!y>x++;o+=`(r=${r})()`[j++].fontcolor(c?"#FF0":"#444"))c=x/2
%4<3&&parseInt("odRFacb67o2vi5gmOZmwFNteohbOh3sw".slice(i="9"<(
D=Date()[16+(x/8|0)])?30:D*3,i+3),36)&1<<(x/2|0)%4+3*y},100))()

</script> 
  </body>
</html>
{% endhighlight %}

Se quiser tamanho e estilos diferentes, use o [CSS](https://terminalroot.com.br/tags#css) para formatar a tag `<pre>`, exemplo:
{% highlight css %}
pre {font-weight: bold; font-size: 30px;}
{% endhighlight %}

Legal, né?! Se souber o link, manda pra mim pra dar os créditos para a pessoa! Fui!

