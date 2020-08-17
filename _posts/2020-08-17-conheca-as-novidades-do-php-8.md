---
layout: post
title: "Conheça as novidades do PHP 8"
date: 2020-08-17 20:04:20
image: '/assets/img/php/php8.jpg'
description: 'Inclui declaração de tipos de dados e Just in Time Compiler.'
icon: 'fa-brands:php'
iconname: 'php'
tags:
- php
- desenvolvimento
- programacao
---

![Conheça as novidades do PHP 8](/assets/img/php/php8.jpg)

Se você não gosta e/ou não sabe [PHP](https://terminalroot.com.br/php/) , talvez seja pelo motivo que você é novo demais! Todos os programadores "dazantiga" sabem [PHP](http://php.net/) e até hoje é a forma mais fácil e econômica de criar e hospedar um site, loja virtual, sistema online e tantas outras coisas!

Todo mundo sabe que o [PHP](https://terminalroot.com.br/tags#php) e [Javascript](https://terminalroot.com.br/tags#javascript) foram os grandes responsáveis pela evolução da [World Wide Web](https://pt.wikipedia.org/wiki/World_Wide_Web) , e para quem não sabe elas possuem muitas similaridades, como as [arrow functions](https://www.php.net/manual/pt_BR/functions.arrow.php), por exemplo.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Mas as novidades do [PHP 8]() haverá muita coisa que lhe fará parecida também com outras linguagens de programação, haverá: 
+ JIT: Just in Time Compiler;
+ Declaração de tipos de dados(escalares);
+ Declarações de tipo de retorno;
+ Operador de coalescência nula;
+ Operador "nave espacial" (spaceship);
+ Arrays de constantes utilizando a função `define()`;
+ Classes anônimas;
+ Entre muita coisa nova!

Vamos ver algumas delas!

---

# Just In Time Compiler
É uma das mais esperadas novidades porque a performance será altamente superior ao PHP 7! Faz parte da [extensão Opcache](https://www.php.net/manual/en/book.opcache.php). Significa que com o JIT alguns Opcodes não precisarão ser interpretados pela Zend VM e estas instruções serão executadas diretamente a nível de CPU.

---

# Declaração de tipos
Declarações de tipos escalares vêm em dois sabores: coercivo (padrão) e estrito. Para parâmetros os seguintes tipos agora podem ser forçados (tanto coercivamente quanto estritamente): strings (string), inteiros (int), números de ponto flutuante (float) e booleanos (bool). Exemplo:
```php
<?php
// Modo coercivo
function sumOfInts(int ...$ints){
    return array_sum($ints);
}

var_dump(sumOfInts(2, '3', 4.1));
// A saída será: int(9)
```

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

# Union Types
A [RFC Union Types V2](https://wiki.php.net/rfc/union_types_v2) permitirá explicitar todos os possíveis tipos aceitos em vez do bom e velho mixed.Exemplo:
```php
function myFunction(int|float $number): int {
  return round($number);
}
```

---

# Atualização da DOM API para bater com o padrão DOM
Adiciona algumas interfaces e classes para tornar a API da `ext/dom` compatível com o [atual padrão DOM](https://dom.spec.whatwg.org/) que está constantemente sendo atualizado.

Para ver um exemplo [clique aqui](https://wiki.php.net/rfc/dom_living_standard_api).

---

Além de muita coisa altamente profissional e moderna. Você pode [consultar](https://thephp.website/br/edicao/andamento-php-8/) mais detalhes dos novos recursos, [clicando nesse link](https://wiki.php.net/rfc).

Se você ainda não sabe, ou se sente inseguro em [PHP](terminalroot.com.br/php/) sugiro você fazer nosso [Curso de Desenvolvimento Web do Zero - PHP & MySQL](https://terminalroot.com.br/php/) que além de PHP você vai entender utilizar o banco de dados mais utilizado no mundo: [MySQL](https://terminalroot.com.br/mysql)! Além de:
+ Programação Orientada a Objetos;
+ Wordpress;
+ Laravel;
+ Composer;
+ Psy Shell;
+ PHP-GTK;
+ Redirecionamento sem alterar a URL;
+ PHPMailer;
+ Deploy de PHP puro e de Laravel na Heroku;
+ E muito mais!

É recomendado também pra quem não sabe nada, pois o curso inclui: [HTML e CSS](https://www.youtube.com/watch?v=SGA6nQqYH7A), [Javascript](https://www.youtube.com/watch?v=HI6YZJxoaIQ), [Bootstrap](https://www.youtube.com/watch?v=mRlkt7P2gZI), [Jekyll](https://www.youtube.com/watch?v=7lI5BfHK-kA), [GitHub](https://terminalroot.com.br/git), [Gitlab e Netlify](https://www.youtube.com/watch?v=ahkpilbOtpE).

Corre que ainda dá tempo! [Clique aqui para saber mais sobre o curso](terminalroot.com.br/php/).

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
