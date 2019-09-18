---
layout: post
title: "Como Inserir Facilmente os Comentários do GitHub no seu Blog"
date: 2019-09-17 19:29:01
image: '/assets/img/gitgithub/comentarios-com-github.jpg'
description: 'Diga adeus ao Disqus, comentários do Facebook ou qualquer outro!'
main-class: 'github'
tags:
- github
- web
- dicas
---

![Como Inserir Facilmente os Comentários do GitHub no seu Blog](/assets/img/gitgithub/comentarios-com-github.jpg "Como Inserir Facilmente os Comentários do GitHub no seu Blog")

Eu sempre tive uma *birra* com comentários aqui no [blog](https://terminalroot.com.br/2016/11/blog-linux-novo-blog-github-jekyll.html) , no início eu utilizava o comentários do [Facebook](https://developers.facebook.com/docs/plugins/comments/) , mas achava meio estranho até porque nem todo mundo tem uma conta no *Facebook* e esse blog é um blog técnico em linhas finais.

Então eu mudei pro [Disqus](https://disqus.com/by/terminalroot/) , no início até tava legal , mas depois começou a ficar ruim porque eles passaram a inserir propagandas (nada mais justo se tratando de um serviço gratuito, a versão paga não exibe anúncios) . 

Ainda sim continuei porque antigamente o blog não era *monetizado* , mas como eu passei também a exibir anúncios ficou bizarro, pois o número de blocos publicitários ficou muito cheio, ficou até parecendo o site do [UOL](), propgandas por todos os cantos! 😀

Decidi voltar pro ~~Facebook~~ , mas quase ninguém estava usando o recurso, então veio algumas ideias na cabeça e pensei,💡 tcharaaamm! [GitHub](https://github.com/) !!! Ainda pensei em outras alternativas (veja final do artigo para ver as outras alternativas) , mas com certeza o mais ideal é do GitHub , pois esse é um blog de **Desenvolvedores** :

![Developers, Developers and developers - Steve Ballmer - Microsoft](https://media.tenor.com/images/ae6e7011c5de7cfe4168b2e6c7000c85/tenor.gif "Developers, Developers and developers")

## Introdução

Apesar de você poder fazer na *unha* , esse tutorial será mais simplificado (..**Facilmente**..) e então vamos utilizar um serviço que fará tudo pra gente da maneira mais intuitiva possível, estou me referindo ao [utteranc.es/](https://utteranc.es/).

O [utteranc.es/](https://utteranc.es/) é um widget de comentários leve e desenvolvido sobre os [issues do GitHub](https://developer.github.com/v3/search/#search-issues). 

#### Características do utteranc.es

+ Código aberto ( [Open Source](https://github.com/utterance) ). 🙌
+ Sem rastreamento, sem anúncios, sempre grátis. 📡🚫
+ Sem bloqueio. Todos os dados armazenados nos problemas do GitHub. 🔓
+ Alternativa ao uso de tema escuro. 🌘
+ Leve. Vanilla TypeScript. Não há downloads de fontes e estruturas JavaScript . 🐦🌲

Ainda tem direto à reações 

![Imagem reações](https://github.blog/wp-content/uploads/2016/03/d55b8b7e-e6ba-11e5-9b31-59a8db92e456.gif?resize=917%2C359)

E também comentar com **Emojis do GitHub** , tem: Pinguin, LOL, Octocat do GitHub e todos os que você já conhece e muito mais, veja um exemplo na imagem abaixo e [clique aqui para ver a lista completa](https://gist.github.com/rxaviers/7360908#file-gistfile1-md):

![Emojis GitHub](/assets/img/gitgithub/emojis-github.png)

Não é muito daora !!!

<!-- ![MEME MUITO FELIZ](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTjFInxsXnxKX21Fa-mJ8my04XngJpEce_3sVzdIbXKmSOnC7y)
![MEME FELIZ](https://media1.tenor.com/images/f0cbf47bc3254e4ea3a45d0bb8c6bac8/tenor.gif) -->

![Garoto MEME](https://media.giphy.com/media/rDEPmqCcPw8b6/giphy.gif)

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

## Como Inserir no seu Blog

### 1º Passo

Primeiramente é necessário você autorizar ( [OAuthflow](https://developer.github.com/v3/oauth/#web-application-flow) ) o uso desse aplicativo. E para fazer isso basta [clicar nesse link](https://github.com/apps/utterances) se já estiver logado no GitHub basta clicar em *Instalar* conforme imagem abaixo:

![Imagem de instalar](/assets/img/gitgithub/01-instalar.png)

Depois o GitHub vai perguntar para você se a autorização é referente à *todos os repositórios* ou somente para *somente os repositórios* que você selecionará , se desejar, clicando no *combo*(Select repositories) , veja as imagens abaixo:

![Imagens do app](/assets/img/gitgithub/02-03-repositories.png)

No meu caso, só escolhi o repositório que contém o blog criado , pois é justamente pra ele que será usado. Após decidir qual a sua escolha, basta clicar em *Install* , pronto, depois pode ser que você seja direcionado à página do [utteranc.es](https://utteranc.es) e lá vamos ao segundo passso.

### 2º Passo

Na página do [utteranc.es](https://utteranc.es) procure o campo que pede pra você informar um repositório e o dono(conta) do GitHub e insira **NOME_DA_SUA_CONTA**/**NOME_DO_REPOSITÒRIO** , conforme imagem abaixo.

![Imagem repositório](/assets/img/gitgithub/04-repositories.png)


Após preencher o código será gerado automáticamente(não botão de confirmar, é dinâmica a bagaça! 😀 ) num campo mais ao final dessa página (**Enable Utterances**) , copie o código e cole no seu código HTML da página que você deseja que seja exibida (No meu caso, lógico, a página que é *incluída* no arquivo `_layouts/post.html` ) , veja o exemplo de código abaixo:

![Código para colar](/assets/img/gitgithub/05-code.png)

Se você ainda pode customizar com escolha do: Tema, Issue Label e Issue Mapping como há antes desse campo de exibição do campo, mas se não souber escolher e/ou não quiser, pode deixar como *default/padrão* que irá funfar assim mesmo 😎 !

Pronto!

## Observação

Quando alguém for comentar, além de estar logado no [GitHub](https://github.com/) precisa também aceitar a autorização do aplicativo do *utterances* para conseguir comentar . Ao tentar comentar a pessoa será automáticamente direcionada para esse *aceite*(clicar em: **Authorize utterances by utterances** ) conforme imagem abaixo:

![Authorize utterances](/assets/img/gitgithub/06-authorize.png)

## Ainda ficou alguma dúvida ?!!

Comenta aí (com os comments do GitHub, 😜 ) que a gente vai tentar lhe ajudar. Mas se der certo não custa nada você comentar também e dizer o que achou! 🤭
. Abraços e até a pŕoxima !!!
    
