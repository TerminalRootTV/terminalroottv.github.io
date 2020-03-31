---
layout: post
title: "Customize suas notificações Javascript"
date: 2020-03-31 14:18:18
image: '/assets/img/js/toastrjs.jpg'
description: 'Simple e elegante!'
tags:
- javascript
- js
- html
- css
- desenvolvimentoweb
---

![Customize suas notificações Javascript](/assets/img/js/toastrjs.jpg)

Assim como já mostramos opções de customizar seus alertas [aqui](https://terminalroot.com.br/2020/02/customize-o-alert-do-seu-javascript.html) , você pode deixar ainda mais interesssante suas notificações com [Toastr](https://github.com/CodeSeven/toastr).

Para usá-lo, existem diversas maneiras, para isso, recomendo você consultar o [site] do projeto. Mas vamos mostrar um exemplo básico:

1. Adicione o [CSS](https://terminalroot.com.br/css/) ao cabeçalho no seu documento [HTML](https://terminalroot.com.br/html/):
```css
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
```
> Se estiver usando [Bootstrap](https://terminalroot.com.br/2020/02/aprenda-bootstrap-4-curso-de-desenvolvimento-web-03.html), recomendo inserir essa linha após o CSS do Bootstrap.

2. Depois adicione o [JS](https://terminalroot.com.br/2020/01/javascript.html):
```js
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
```
> Lembrando que ele utiliza a biblioteca [jQuery](https://jquery.com/), logo, é recomendado inserir após o jQuery.

3. Depois é só criar um exemplo para vê-lo funcionar:
```html
<!DOCTYPE html>
<!--
vim: et ts=2 sw=2 ft=html:
-->
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Teste Toastr</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
      $(document).ready( function(){
        $('.my').click( function(){
          //alert("Tá funfandoo!");
          toastr.success("Tá funfandoo!");
        } );

      } );
    </script>

  </head>
  <body>
    <button class="my">Clique aqui para exibir a notificação</button>
  </body>
</html>
```
> **AVISO**: Tive alguns problemas em fazer funcionar com versões recentes de [jQuery](http://code.jquery.com/jquery-1.9.1.js) , por isso usei a versão **1.9.1** como exibido acima, que funcionou de boa!

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
    

Existem outros tipos de mensagens tipo:
+ De cor vermelha(e com ícone de erro): `toastr.error("Mensagem");`
+ De cor amarela(e com ícone de aviso): `toastr.warning("Mensagem");`
+ De cor verde(e com ícone de ok): `toastr.warning("Mensagem");`

Também é possível customizar o tempo de exibição entre outros, exemplo:
> Insira isso no seu código JS

```js
toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
```

Para mais detahes consulte o [demo](https://codeseven.github.io/toastr/demo.html).
