---
layout: post
title: "Analise a qualidade de seu código PHP com PHP Insights"
date: 2020-08-27 12:49:56
image: '/assets/img/laravel/php-insights.png'
description: 'Tornar o código confiável, menos acoplado, simples e limpo.'
icon: 'cib:php'
iconname: 'insights'
tags:
- php
- laravel
- webhacker
---

![Analise a qualidade de seu código PHP com PHP Insights](/assets/img/laravel/php-insights.png)

[PHP Insights](https://phpinsights.com/) é uma ferramenta de análise estática que verifica a qualidade do código e estilo de codificação tornando possível ter uma visão geral da arquitetura de código e sua complexidade.

Está disponível para: 
+ [Laravel](https://laravel.com/)
+ [Symfony](https://symfony.com/)
+ [Yii](https://www.yiiframework.com/)
+ [WordPress](https://br.wordpress.com/)
+ [Magento2](https://magento.com/)
+ e muito mais.

Possui verificações integradas para tornar o código confiável, menos acoplado, simples e limpo.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Instalação
Para esse nosso exemplo, vou utilizar o Laravel, pois é o que eu uso no dia-dia-dia.

+ 01 - Primeiramente é altamente recomendável para versões iguais ou superiores à [7.3](https://php.net/releases/) do [PHP](https://terminalroot.com.br/php/) atualizar o [PHPUnit](https://phpunit.de/):
> Necessário possuir o [Composer](https://getcomposer.org/) devidamente instalado.

{% highlight bash %}
composer -vvv require --dev phpunit/phpunit:^9.0 --update-with-dependencies
{% endhighlight %}
> A opção `-vvv` é legal pra ver as saídas do composer, pois por padrão ele é estilo UNIX, não exibe tanta saída.

+ 02 - Depois instale o PHP Insights
{% highlight bash %}
composer -vvv require nunomaduro/phpinsights --dev
{% endhighlight %}

+ 03 - Após isso, é necessário publicar o arquivo de configuração:
{% highlight bash %}
php artisan vendor:publish --provider="NunoMaduro\PhpInsights\Application\Adapters\Laravel\InsightsServiceProvider"
{% endhighlight %}

+ 04 - O Laravel vai pedir que você rode o comando abaixo e escolha o *publish*:
> Nesse caso, escolha a opção do Insights(n meu caso, número **9**), como na imagem logo abaixo:

{% highlight bash %}
php artisan vendor:publish
{% endhighlight %}
![vendor publish](/assets/img/laravel/vendor-publish.png)

+ 05 - Depois de tudo preparado, basta rodar o comando:
{% highlight bash %}
php artisan insights
{% endhighlight %}

Verificar as saídas e corrigir seu código conforme o Insights informa ao **pressionar enter** e continuar.
> **Press enter to see code issues...**

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

![PHP Insights](/assets/img/laravel/artisan-insights.png)

---

Para outras soluções, confira o procedimento na documentação oficial: <https://phpinsights.com/get-started.html>

+ [GitHub do PHP Insights](https://github.com/nunomaduro/phpinsights)
+ [Página Oficial](https://phpinsights.com/)

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

