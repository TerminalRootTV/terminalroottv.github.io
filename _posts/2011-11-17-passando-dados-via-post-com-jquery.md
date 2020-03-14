---
layout: post
title: 'Passando dados via POST com JQuery'
date: '2011-11-17T04:58:00.000-08:00'
description: 'Nesse exemplo tem o básico só para causar o entendimento mesmo.servirá para suas aplicações em que você deseja que não haja carregamento de página.'
tags:
- javascript
---

Nesse exemplo tem o básico só para causar o entendimento mesmo.servirá para suas aplicações em que você deseja que __não haja carregamento de página__. Dividi em __3 arquivos__, preste atenção nos comentários para entender melhor.

- index.php
- carregar.js
- dados.php


> No index.php contém uma: __[DIV id=FORM],[DIV id=MOSTRAR, display:none;]__ e os inputs com __CLASSes__ definidas.

{% highlight html %}
<div id="form">
  <input type="hidden" name="nome" value="Marcos" class="nome" />
  <input type="submit" name="exibir" value="Minhas Informações" class="exibir" />         
</div><!--FORM-->
<div id="mostrar" style="display:none;"></div>
{% endhighlight %}


No head do __index.php__ deve existir o link pro __JQuery__ e pro __carregar.js__ que mostro logo abaixo

{% highlight js %}

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>


<script type="text/javascript" src="carregamento.js"></script>

{% endhighlight %}

## carregar.js

{% highlight js %}
/*prestar atenção na utilização dos parenteses e chaves*/
/*iniciamos com $ pra chamar o JQuery e dentro dele iniciamos uma função*/
$(function(){
/*se clicar na tag de class exibir, iniciamos um uma "sub-função"*/
 $(".exibir").click(function(){
 /*escondemos com fadeOut a tag com id form, podiamos usar tb o hide("fast ou slow"), o 10 é a velocidade a escondê-la*/
   $("#form").fadeOut(10);
   /*definimos as variaveis e informaos as class de CSS contém um valor .val*/
   var nome = $(".nome").val();
   var exibir = $(".exibir").val();
   /*setamos o método POST informamos o arquivo PHP que irá retornar as informaçoẽs, para isso criamos a function retorno, e passmos variavel que criamos e informamos o nome dela*/
   $.post("/assets/html/subhtml/dados.php", {nome: nome, exibir: exibir}, function(mostrar){
   /*a div mostrar que estava com display none agora será exibida, pois nela estará os dados do dados.php*/
   $("#mostrar").fadeIn(2000).html(mostrar)       

      });
  });

});
{% endhighlight %}

## dados.php

{% highlight php %}
<?php
  extract($_POST);
  if(isset($exibir)){
    echo "O valor do nome é: ".$nome;
  }else{
    echo "Sem valor no isset";
  }
?>
{% endhighlight %}

Esse é o básico, mas só com isso pode-se ir "__Ao infinito e Além__", só depende de você essa evolução!

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

