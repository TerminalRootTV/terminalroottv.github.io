---
layout: post
title: "Customize a Página Inicial e Novas Abas no Google Chrome"
date: 2021-08-10 13:38:13
image: '/assets/img/chrome/start-page-chrome.jpg'
description: 'Deixando mais agradável com links e informações ao seu gosto.'
icon: 'ion:terminal-sharp'
iconname: 'Google Chrome'
tags:
- chrome
- html
- javascript
---

![Customize a Página Inicial e Novas Tabs no Google Chrome](/assets/img/chrome/start-page-chrome.jpg)

Eu sempre usei muito o [Firefox](https://terminalroot.com.br/tags#firefox), mas ultimamente notei que estava abrindo mais o [Google Chrome](https://www.google.com/chrome/) por notar que ele estava consumindo menos recursos do meu sistema.

Então, importei: favoritos, extensões e entre outros pro meu Google Chrome e passei a utilizá-lo de forma definitiva e com isso veio também descobertas legais de customizações.

Essa dica também serve pro Firefox ou qualquer outro navegador, mas vou frizar a respeito do Google Chrome.

Trata-se do **Bento** uma *start page* feita com HTML5, CSS3 e JavaScript.

Pra você pôr na sua página inicial primeiramente clone o repositório com [git](https://terminalroot.com.br/git):
{% highlight bash %}
git clone https://github.com/migueravila/Bento
{% endhighlight %}

Se quiser renomei a pasta `Bento` para o nome que deseja, por exemplo: `mv Bento chrome`, e então agora o diretório será o `chrome`.

Em seguida, customize o Bento como deseja, na raiz do diretório há um arquivo de nome `config.js` e nele há dados que seria bom você editar, como:
+ Informe seu nome, no arquivo haverá o nome `John`, mude para o seu;
+ Há também as saudações em inglês, se quiser altere para Português;
+ Nos *cards* há os links que você deseja que apareça que geralmente são aqueles que você acessa com mais frequência, os meus estão assim:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


{% highlight js %}
  // ┌─┐┌─┐┬─┐┌┬┐┌─┐
  // │  ├─┤├┬┘ ││└─┐
  // └─┘┴ ┴┴└──┴┘└─┘

  // Links
  cards: [
    {
      id: '1',
      name: 'Github',
      icon: 'github',
      link: 'https://github.com/terroo',
    },
    {
      id: '2',
      name: 'Twitter',
      icon: 'twitter',
      link: 'https://twitter.com/TerminalRootTV',
    },
    {
      id: '3',
      name: 'Feed',
      icon: 'rss',
      link: 'https://terminalroot.com.br/feed',
    },
    {
      id: '4',
      name: 'Facebook',
      icon: 'facebook',
      link: 'https://facebook.com/',
    },
    {
      id: '5',
      name: 'Youtube',
      icon: 'youtube',
      link: 'https://youtube.com/TerminalRootTV/videos',
    },
    {
      id: '6',
      name: 'Linkedin',
      icon: 'linkedin',
      link: 'https://linkedin.com',
    },

  ],
{% endhighlight %}

+ Depois há as listas que podem ser alterados, tanto os nomes quanto os ícones e endereços.

Também há o *Weather* no início disso tudo para exibir a temperatura da sua cidade, para exibir você deve:
+ Criar uma conta no site: <https://openweathermap.org/>.
+ Após logado, clique no seu nome na parte superior e depois em `My API Keys`
+ Copie a combinação de letras e números(sua API) e cole no arquivo `config.js` para a variável: `weatherKey: 'sua-api-aqui'`

Só que isso ainda não irá funcionar, somente depois de você informar sua Latitude e Longitude que funcionará. Então agora:
+ vá ao site: <https://www.latlong.net/> e lá não precisa de cadastro e nem nada
+ basta você digitar o nome da sua cidade no campo que tem escrito: *Type A Place Name* e clique em *find*
+ em seguida copie a Latitude e cole no seu arquivo `config.js` para a variável: `weatherLatitude: 'latitude-da-sua-cidade'` e faça o mesmo para Longitude.

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

# Como pôr na página inicial ?
Existem várias formas, você pode copiar os arquivos para um endereço online e configurar o Google Chrome para abrir a página inicial:
+ Clicando nos 3 pontinhos na barra do Chrome e sem seguida em Aparência e selecionar o campo de endereço e digitar o endereço.
+ Outra forma seria informar o caminho da pasta(Abrir o arquivo `index.html`) e o endereço: `file:///` pôr no endereço da página inicial
+ Eu utilizo um servidor web local([Apache](https://terminalroot.com.br/tags#apache)) então movi a pasta para meu servidor e pus o endereço para ele, exemplo: `http://localhost/chrome/`.

Nesse caso fica ao seu gosto.

# Configurar como novas abas
Para essa sua *página inicial* funcionar como novas abas, basta você instalar a extensão: [Custom New Tab URL](https://chrome.google.com/webstore/detail/custom-new-tab-url/mmjbdbjnoablegbkcklggeknkfcjkjia)

Após instalada você clica em Extensões do Chrome(geralmente aparece o ícone de quebra cabeça na barra do Chrome) e nos 3 pontinhos da extensão que você acabou  de instalar: *Custom New Tab URL* , selecione *Opções* e em seguida em *URL or local file path* informe o endereço da página inicial e clique em SAVE.

Moleza, né?! Se quiser tema escuro basta clicar no ícone da lua no canto superior direito da sua página inicial e para mais informações sugiro dar uma olhada na página do [Bento](https://github.com/migueravila/Bento).

Se quiser ver uma demo [clique aqui](https://migueravila.github.io/Bento/).



