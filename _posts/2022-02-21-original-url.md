---
layout: post
title: "Como Alterar URL com JavaScript"
date: 2022-02-21 11:07:52
image: '/assets/img/js/url.jpg'
description: 'Alterar a URL sem recarregamento da página'
icon: 'ion:terminal-sharp'
iconname: 'JavaScript'
tags:
- javascript
- webhacker
- web
- desenvolvimentoweb
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Esse recurso é muito utilizado por aqueles sites que disponibilizam filmes p1r4ta5 online. Caso o usuário queira compartilhar a URL na [rede social](https://twitter.com/TerminalRootTV), o dono do site altera o URL para quando o usuário copiar a URL e postar, aparecer outro link e não a URL da página, evitando assim uma possível punição por direitos autorais .

Também é utilizado naqueles blogs que utilizam artigos *enquanto rolar a página para baixo*, ou seja, os artigos são carregados e automaticamente há alteração da URL caso o usuário queira compartilhar também .

---

# Implementando
Se você possuir essa função [JavaScript](https://terminalroot.com.br/tags#javascript) na sua página, ao clicar, por exemplo, em um botão a URL é alterada para outra sem recarregar a página:
```js
function alterar_url(nova){
  history.pushState({}, null, nova);
}
```

Agora crie um botão só para alterar:
> **OBSERVAÇÃO**: Isso não funciona com `file:///`, tente em <http://localhost/>.

Crie um arquivo no seu servidor web de nome: `pagina.html`, insira o código abaixo e depois acesse: <http://localhost/pagina.html>
> Quando você clicar no botão **Clique aqui para mudar a URL** a URL será alterada para **http://localhost/mudei-a-url-para-isso/** .

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Veja a URL sendo alterada</title>
    <meta charset="UTF-8">
  </head>
  <script>
    function alterar_url(nova){
          history.pushState({}, null, nova);
          document.getElementById("url").innerHTML = window.location;
    }
  </script>
  <body>
      <hr>
      <button onclick="alterar_url('mudei-a-url-para-isso')">Clique aqui para mudar a URL</button> 
  </body>
</html>
```
> Ou seja, se você notar a barra de endereços do seu navegador, perceberá que foi alterada.

Exemplo aqui nessa página:<br>
<script>
function alterar_url(nova){
  history.pushState({}, null, nova);
}
</script>
<button class="btn btn-primary" onclick="alterar_url('mudei-a-url-para-isso')">Clique aqui para mudar a URL</button> 
<blockquote><i>✱ Veja a URL sendo alterada no browser do seu navegador</i></blockquote>


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

Se quiser retornar para a URL original, crie esse botão com o atributo `onclick="history.back()"`:
```js
<button onclick="history.back()">Clique aqui para retornar a original</button>
```

Exemplo de botão nessa página:<br> 
<button class="btn btn-danger" onclick="alterar_url('original-url.html')">Clique aqui para retornar a URL original</button> 

---

E finalmente se quiser que a URL seja alterada conforme carregamento da página, basta inserir o código fora de uma função dentro das tags `<script></script>`:

```js
history.pushState({}, null, 'essa-url-nao-eh-a-original-foi-alterada-durante-carregamento-da-pagina');
```

Que foi justamente a URL carregada desde o início desse artigo e você talvez nem tenha notado.

---

Se não notou <a class="btn btn-danger" href="./original-url.html">Clique aqui</a> .

E veja na barra de endereços a URL:<br>
<sub><b class="text-warning">{{ site.url }}/2022/02/essa-url-nao-eh-a-original-foi-alterada-durante-carregamento-da-pagina</b></sub>

Sendo que a original é:<br>
<{{ site.url }}/2022/02/original-url.html> .

---

Caso queira um código completo para você testar e notar mais facilmente tudo dito aqui, copie o código abaixo, cole em um arquivo de nome `pagina.html` e salve na raiz do seu servidor web .

```html
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Veja a URL sendo alterada</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <script>
    function alterar_url(nova){
          history.pushState({}, null, nova);
          document.getElementById("url").innerHTML = window.location;
    }

    function retorna_original(url){
          history.back();
          document.getElementById("url").innerHTML = "http://" + window.location.hostname + "/pagina.html";
    }

    history.pushState({}, null, 'essa-url-nao-eh-a-original-foi-alterada-durante-carregamento-da-pagina');
    document.getElementById("url").innerHTML = window.location;
  </script>
  <body>
    <div class="container">
      <hr>
      <button class="btn btn-primary" onclick="alterar_url('mudei-a-url-para-isso')">Clique aqui para mudar a URL</button> 
      <button class="btn btn-danger" onclick="retorna_original()">Clique aqui para retornar a original</button> 
      <a class="btn btn-info" href="pagina.html">Recarregue a página</a> 
      <hr>
      <h4><em id="url"></em></h4>
      <blockquote>*</i>Veja a URL sendo alterada no browser do seu navegador<i></blockquote>
    </div>
    <script>document.getElementById("url").innerHTML = window.location;</script>
  </body>
</html>
```

### Compartilhe esse artigo, mas use essa URL: <https://terminalroot.com.br/2022/02/url-original.html> 😃 !

<script>
//alert(window.location.href);
history.pushState({}, null, 'essa-url-nao-eh-a-original-foi-alterada-durante-carregamento-da-pagina');
//alert(window.location.href);
</script>

