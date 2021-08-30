---
layout: post
title: "Conheça o Framework CSS do Ubuntu"
date: 2021-08-30 10:13:46
image: '/assets/img/css/ubuntu-css.jpg'
description: 'Deixa seu site/blog com um visual muito agradável!'
icon: 'ion:terminal-sharp'
iconname: 'CSS'
tags:
- css
- ubuntu
---

![Conheça o Framework CSS do Ubuntu](/assets/img/css/ubuntu-css.jpg)

Nós já publicamos anteriormente o [CSS](https://terminalroot.com.br/tags#css) da [Red Hat](https://terminalroot.com.br/tags#redhat) que pode ser acessado [aqui](https://terminalroot.com.br/2020/10/os-41-melhores-frameworks-css.html#04-patternfly) e nesse página ainda há mais de 40 frameworks CSS.

Mas o [Ubuntu](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu) não fica para trás. A Canonical a empresa responsável por essa [distribuição](https://terminalroot.com.br/tags#distro) [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux) também seu framework para você utilizar os mesmo recursos que eles utilizam no [site deles](https://ubuntu.com/).

Trata-se do **Vanilla CSS**, um framework versátil, bonito e fácil de usar.

# Instalação
Você pode instalar via [linha de comando](https://terminalroot.com.br/tags#comandos) para projetos interdependentes e utilizar um dos gerenciadores de pacotes abaixo:

> Via [yarn](https://yarnpkg.com/)
{% highlight bash %}
yarn add vanilla-framework
{% endhighlight %}

> Ou via [npm](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos)
{% highlight bash %}
sudo npm install -g vanilla-framework
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

Também há a opção de usar via CDN, basta iformar o endereço e número da versão:
{% highlight html %}
<link rel="stylesheet" href="https://assets.ubuntu.com/v1/vanilla-framework-version-x.x.x.min.css" />
{% endhighlight %}

Exemplo para a versão atual de acordo com a data de publicação desse artigo:
{% highlight html %}
<link rel="stylesheet" href="https://assets.ubuntu.com/v1/vanilla-framework-version-2.34.0.min.css" />
{% endhighlight %}

Você ainda pode fazer o download e *linkar* localmente, exemplo:
{% highlight bash %}
wget https://assets.ubuntu.com/v1/vanilla-framework-version-2.34.0.min.css -O vanilla.css
{% endhighlight %}

---

# Utilização
A [documentação](https://vanillaframework.io/docs) do vanilla é muito boa e dispões de ferramentas de pesquisa e separada por elementos, estilo a do [Bootstrap](https://terminalroot.com.br/2020/02/aprenda-bootstrap-4-curso-de-desenvolvimento-web-03.html)

Eu fiz um exemplo básico que é justamente a imagem no topo desse artigo e aqui está o código HTML:
{% highlight html %}
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Conheça o Framework CSS do Ubuntu</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://assets.ubuntu.com/v1/vanilla-framework-version-2.34.0.min.css" rel="stylesheet">
      <style>.a-footer {color: #E95420;}</style>
   </head>
   <body>
      <header id="navigation" class="p-navigation is-dark">
         <div class="p-navigation__row">
            <nav class="p-navigation__nav is-dark" aria-label="Example main navigation">
               <ul class="p-navigation__items">
                  <li class="p-navigation__item is-selected">
                     <a class="p-navigation__link" href="#">Terminal Root</a>
                  </li>
                  <li class="p-navigation__item">
                     <a class="p-navigation__link" href="#">Home</a>
                  </li>
                  <li class="p-navigation__item">
                     <a class="p-navigation__link" href="#">Promoção</a>
                  </li>
                  <li class="p-navigation__item">
                     <a class="p-navigation__link" href="#">Cursos</a>
                  </li>
                  <li class="p-navigation__item">
                     <a class="p-navigation__link" href="#">Blog</a>
                  </li>
                  <li class="p-navigation__item">
                     <a class="p-navigation__link" href="#">Pesquise</a>
                  </li>
               </ul>
            </nav>
         </div>
      </header>
      <div class="container u-fixed-width">
         <div class="p-heading-icon u-align--center">
            <div class="p-heading-icon__header is-stacked">
               <br>
               <h1 class="p-heading-icon__title">Conheça o Framework CSS do Ubuntu</h1>
            </div>
            <p style="text-align:center;margin:auto;">LXD, the Linux container hypervisor, merges the speed and density of containers with the manageability and security of traditional virtual machines. Economics are directly tied to density, and no other virtualisation technology is as fast or dense as LXD.</p>
         </div>
         <br>
         <section class="p-strip u-image-position" style="border: 1px solid #cdcdcd;">
            <div class="row">
               <div class="col-6">
                  <h2>Fast, secure and simple, Ubuntu powers millions of PCs worldwide</h2>
                  <p>Download the latest version of Ubuntu, for desktop PCs and laptops.</p>
               </div>
               <div class="col-6">
                  <img src="https://assets.ubuntu.com/v1/c6504e94-Dell_XPS_Laptop_Front-Desktop.png?h=200" alt="" class="u-image-position--bottom">
               </div>
            </div>
         </section>
         <hr>
         <div class="p-notification--positive">
            <div class="p-notification__content">
               <h5 class="p-notification__title">Success</h5>
               <p class="p-notification__message">The camera is a middle. The landmine of an architecture becomes a racist bit. The permissions could be said to resemble xanthous gases. Though we assume the latter, before fenders, strings were only titles. They were lost without the extant rod that composed their tree. </p>
            </div>
         </div>
         <table aria-label="Table featuring elements that stretch into the cell padding">
            <tbody>
               <tr>
                  <td><button class="u-table-cell-padding-overlap p-button--negative">Select</button></td>
                  <td>Text</td>
               </tr>
               <tr>
                  <td><button class="is-dense u-table-cell-padding-overlapi p-button--positive">Select</button></td>
                  <td>Text not wrapped in a tag</td>
               </tr>
               <tr>
                  <td><button class="u-table-cell-padding-overlap">Select</button></td>
                  <td>
                     <p class="u-no-margin--bottom u-table-cell-padding-overlap">Text in a paragraph</p>
                  </td>
               </tr>
            </tbody>
         </table>
         <hr>
      </div>
      <footer class="l-footer--sticky p-strip--dark">
         <nav class="row" aria-label="Footer navigation">
            <div class="has-cookie">
               <p>© 2021 Terminal Root Ltd. <a class="a-footer">C++</a> and <a class="a-footer">GNU/Linux</a> are registered trademarks .</p>
               <ul class="p-inline-list--middot">
                  <li class="p-inline-list__item">
                     <a class="a-footer"><small>Legal information</small></a>
                  </li>
                  <li class="p-inline-list__item">
                     <a class="a-footer"><small>Report a bug on this site</small></a>
                  </li>
               </ul>
               <span class="u-off-screen"><a class="a-footer">Go to the top of the page</a></span>
            </div>
         </nav>
      </footer>
   </body>
</html>
{% endhighlight %}


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

Caso você queira saber como implementar e utilizar um Framework CSS, sugiro assistir à esse vídeo:

<iframe width="910" height="390" src="https://www.youtube.com/embed/mRlkt7P2gZI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# [Acesse a Documentação do Vanilla Framework](https://vanillaframework.io/docs)

---

### Liks úteis
+ <https://github.com/canonical-web-and-design/vanilla-framework>
+ <https://ubuntu.com/blog/introducing-vanilla>
+ <https://ubuntu.com/blog/the-lifecycle-of-components-in-your-design-system>
+ <https://github.com/canonical-web-and-design/vanilla-framework/releases>


