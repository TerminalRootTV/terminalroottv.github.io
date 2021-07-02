---
layout: post
title: "Como deletar uma branch localmente e remotamente no Git"
date: 2021-07-02 00:41:38
image: '/assets/img/git/branch-git.jpg'
description: 'Resolvendo problemas de conversão.'
icon: 'ion:terminal-sharp'
iconname: 'git e github'
tags:
- git
- github
---

![Como deletar uma branch localmente e remotamente no Git](/assets/img/git/branch-git.jpg)

Muita gente tem relatado problemas em fazer deploy no [GitHub](https://terminalroot.com.br/2020/11/conheca-o-codespaces-um-ide-do-github-direto-no-navegador.html) depois que houve a mudança da branch default de `master` para `main`, nessa dica rápida vamos como fazer isso.

---

Lembrando que antes de qualquer coisa você pode simplesmente renomear sua branch `master` para main. Para isso:
+ Logue no GitHub
+ Selecione o repositório que deseja alterar a branch e clique em: **Settings**
+ Depois selecione na lateral esquerda da tela a opção: **Branches**
+ Depois é só renomear de `master` para `main`, como na imagem abaixo:

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Rename master to main](/assets/img/git/rename-branch.png)

Mas se você já tiver feito um pull request com `main`, você terá duas branches, então, se quiser deletar a branch remotamente, basta rodar o comando(dentro do seu repositório local):

> Para deletar a branch localmente
{% highlight bash %}
git branch -d master
{% endhighlight %}

E depois para o GitHub não notificar mais pull request de master para main, basta remover remotamente com o seguinte comando:

> Para deletar a branch remotamente
{% highlight bash %}
git push origin --delete master
{% endhighlight %}

Simple, né? Para ver as branches disponíveis, você já sabe, né? → `git branch` somente! 😃 
