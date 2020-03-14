---
layout: post
title: "Como Criar um Pull Request no Github"
date: 2017-12-05 19:29:03
image: '/assets/img/gitgithub/git-github-pull-request.jpg'
description: "Contribuir com Projetos Open Source é uma experiência gratificante!"
tags:
- git
- github
---

> Contribuir com Projetos Open Source é uma experiência gratificante!

__1__ - Fork um repositório (de outro usuário) que você deseja contribuir
{% highlight bash %}
https://github.com/[OUTRO-USUÁRIO]/[REPOSITÓRIO]
{% endhighlight %}

__2__ - Clone seu repositório 'forkado' com seu nome de usuário
{% highlight bash %}
git clone https://github.com/[SEU-USUÁRIO]/[REPOSITÓRIO]
{% endhighlight %}

__3__ - Crie uma nova <kbd>branch</kbd>
{% highlight bash %}
cd [REPOSITÓRIO]
git branch nova-branch
{% endhighlight %}

__4__ - Mude para a <kbd>nova-branch</kbd> usando o comando <kbd>checkout</kbd>
{% highlight bash %}
git checkout nova-branch
#Switched to branch 'nova-branch'
{% endhighlight %}

> __Observação__: Você poderia e criar e mudar pra nova-branch automáticamente usando <br><br>
a opção <kbd>-b</kbd> assim <kbd>git checkout -b nova-branch</kbd> se quiser voltar pra 
<br><br>branch <kbd>master</kbd> utilize também <kbd>git checkout master</kbd>.

__5__ - Após fazer qualquer alteração no _seu_ [REPOSITÓRIO] que você 'forkou', não se esqueça de completar as alterações de acordo com o [CURSO DE GIT E GITHUB PARA INICIANTES](http://terminalroot.com.br/git).
{% highlight bash %}
git add -A
git commit -m "alterei o arquivo x"
# o -m é para mensagens curtas, se fosse maior
# bastava digitar 'git commit' e o editor padrão iria se abrir
# Veja mais em http://terminalroot.com.br/git
{% endhighlight %}

__6__ - Use o comando <kbd>git push</kbd> pra _empurrar_ as alterações para seu repositório, a<br><br> opção <kbd>--set-upstream</kbd> é porque utilizamos uma nnova branch <kbd>nova-branch</kbd>.
{% highlight bash %}
git push --set-upstream origin nova-branch
{% endhighlight %}

__7__ - Vá no Github e clique em __Compare e Pull Request__ , se quiser adicione um _comentário_ e clique em __Create Pull Request__.


> __Observação__: Se outras pessoas também estão fazendo alteração nesse mesmo repositório, é necessário que você sincronize as mudanças com de outros usuários. Então verifique quais repositórios remotos você configurou, para isso utilize o comando abaixo para ver esses dados.

{% highlight bash %}
git remote -v
{% endhighlight %}
Para sincronize com o 'fork' use o comando abaixo para adicionar outros repositórios.

{% highlight bash %}
git remote add upstream https://github.com/original-[USUÁRIO]/original-[REPOSITÓRIO].git
{% endhighlight %}

Depois rode de novo o comando <kbd>git remote -v</kbd> para ver os _novos repositórios adicionados_.

__8__ - Para sincronizar com o 'fork' usaremos o comando <kbd>git fetch</kbd> para buscar as _branches_ junto com seus respectivos _commits_, de novo usaremos a opção _upstream_.
{% highlight bash %}
git fetch upstream
#From https://github.com/original-[USUÁRIOS]/original-[REPOSITÓRIO]
# * [new branch]      master     -> upstream/master
{% endhighlight %}

__9__ - Depois o [USUÁRIO-ORIGINAL] poderá fazer um __merge__ clicando em __Pull requests__, depois clicando no __commit__ e então em __Merge pull request__ e finalmente __Confirm merge__.

# Assista o Vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=dSUT0Y7suPI)


# Comente!

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

