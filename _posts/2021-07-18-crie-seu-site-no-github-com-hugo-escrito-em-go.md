---
layout: post
title: "Crie seu Site no GitHub com HUGO escrito em GO"
date: 2021-07-18 22:10:40
image: '/assets/img/go/hugo.jpg'
description: 'Também criamos um arquivo de DEPLOY com SHELL SCRIPT utilizando WORKFLOWS para serem gerenciados pelo ACTIONS do GitHub.'
icon: 'ion:terminal-sharp'
iconname: 'Ferramentas'
tags:
- go
- github
---

![Crie seu Site no GitHub com HUGO escrito em GO](/assets/img/go/hugo.jpg)

[Hugo](https://gohugo.io/) é um dos mais populares geradores de sites estáticos de código aberto. Com sua incrível velocidade e flexibilidade, Hugo torna a construção de sites muito divertida e fácil de criar.

🔊 Nesse vídeo instalamos e configuramos o [HUGO](https://gohugo.io/) um [Static Site Generator](https://terminalroot.com.br/tags/#jekyll) escrito na Linguagem de Programação [Go](https://terminalroot.com.br/tags/#go) (do [Google](https://google.com)), além de criarmos um arquivo de **DEPLOY** com [SHELL SCRIPT](https://terminalroot.com.br/shell) utilizando **WORKFLOWS** para serem gerenciados pelo **ACTIONS** do [GitHub](https://terminalroot.com.br/tags/#github).

# Assista ao Vídeo

<iframe width="910" height="390" src="https://www.youtube.com/embed/UFk90eSZwIw" frameborder="-1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

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

## 01. Dependências
> [Git](https://terminalroot.com.br/git) e [Go](https://golang.org/)

{% highlight bash %}
sudo apt install git
sudo snap install go --classic # Ou: sudo apt install golang-go
go version
{% endhighlight %}

---

## 02. Construir o binário
{% highlight bash %}
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
{% endhighlight %}

---

## 03. Instalação
{% highlight bash %}
sudo mv ~/go/bin/hugo /usr/local/bin/
hugo version
{% endhighlight %}

---

## 04. Pós instalação
> Limpando

{% highlight bash %}
cd
sudo rm -rf go src
{% endhighlight %}

---

## 05. Crie um repositório com nome do seu usuário se não existir:
+ <https://github.com/SEU_USUARIO/SEU_USUARIO> onde ficará o código fonte do seu blog.
> Se quiser ainda adicione um `README.md` customizado para aparecer como apresentação do seu perfil do GitHub como [nesse artigo](https://terminalroot.com.br/2021/07/customize-a-pagina-inicial-do-seu-github.html).

---

## 06. Crie também um repositório de nome <https://github.com/SEU_USUARIO/SEU_USUARIO.github.io> para ser o seu blog.

---

## 07. Clone somente o repositório `SEU_USUARIO`
{% highlight bash %}
git clone https://github.com/SEU_USUARIO/SEU_USUARIO
{% endhighlight %}

---

## 08. Gere seu site hugo dentro de `SEU_USUARIO` forçando;
{% highlight bash %}
hugo new site SEU_USUARIO --force
{% endhighlight %}

---

## 09. Adicione um tema como submódulo, encontre um tema aqui: <https://themes.gohugo.io/>:
{% highlight bash %}
git submodule add https://github.com/niklasbuschmann/contrast-hugo.git themes/contrast-hugo
{% endhighlight %}
> Use como submódulo para não ter problemas futuros.

## 10. Configure seu `config.toml` na raiz de `SEU_USUARIO` com os seguintes dados:
+ `baseURL` precisa estar configurado para o seu blog online
+ `languageCode` o idioma do seu blog

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

+ `title` o título do seu blog
+ `theme` o nome do tema que você clonou
+ `[permalink]` como deseja que as url do seu blog apareça, saiba mais [aqui](https://gohugo.io/content-management/urls/#permalinks-configuration-example)

Exemplo:
{% highlight toml %}
baseURL = "https://SUA_URL/"
languageCode = "en-us"
 title = "My new blog made with Hugo: The Pinguim"
theme = "contrast-hugo"
[permalinks]
  posts = "/:filename/"
{% endhighlight %}

---

## 11. Verifique temporariamente seu site:
{% highlight bash %}
hugo server
{% endhighlight %}
> E acesse o endereço: <http://localhost:1313/>, digite **Ctrl + C** para parar o servidor.

---

## 12. Crie e edite sua primeira postagem
{% highlight bash %}
hugo new posts/primeiro-post-exemplo.md
/home/user/SEU_USUARIO/content/posts/primeiro-post-exemplo.md
{% endhighlight %}

> Exemplo de postagem, remova a linha `draft: true`:

{% highlight markdown %}
---
 title: "Primeiro Post Exemplo"
date: 2021-07-07T00:01:00-03:00
---

## Lorem ipsum dolor sit amet
consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

```cpp
#include <iostream>

int main( int argc , char ** argv ){
  std::cout << "Olá, Mundo!" << '\n';
  return 0;
}
```

+ Lorem ipsum dolor sit amet
+ consectetur adipisicing elit
+ sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
+ Ut enim ad minim veniam, quis nostrud exercitation ullamco
{% endhighlight %}

---

## 13. Teste para ver se está tudo funcionando normalmente
{% highlight bash %}
hugo server
{% endhighlight %}

---

## 14. Adicione seu <https://github.com/SEU_USUARIO/SEU_USUARIO.github.io> como submódulo e de nome `public`
{% highlight bash %}
git submodule add https://github.com/SEU_USUARIO/SEU_USUARIO.github.io public
{% endhighlight %}
> Atenção ao nome da branch, a master não é mais a default e sim a `main`. [Saiba mais aqui](https://terminalroot.com.br/2021/07/como-deletar-uma-branch-localmente-e-remotamente-no-git.html).

---

## 15. Construa seu site estático rodando o comando `hugo`
{% highlight bash %}
hugo
{% endhighlight %}

---

## 16. Entre no diretório **public/** e adicione, commit e suba seu site:
{% highlight bash %}
cd public
git add .
git commit -m "first deploy"
git push origin main
{% endhighlight %}

---

## 17. Acesse: <https://SEU_USUARIO.github.io/> e veja se está tudo certo.

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

## 18. Utilizando Workflow para Actions e deploy
Crie um diretório e um subdiretório na raiz de `SEU_USUARIO` e dentro deles um arquivo de nome `gh-pages.yml` e insira [esse conteúdo](https://gohugo.io/hosting-and-deployment/hosting-on-github/#build-hugo-with-github-action) ao mesmo
{% highlight bash %}
mkdir -p .github/workflows
vim .github/workflows/gh-pages.yml
{% endhighlight %}

---

## 19. Adicione, commit e suba todos os arquivos
{% highlight bash %}
git add .
git commit -m "my source blog"
git push origin main
{% endhighlight %}

---

## 20. Monitore o Workflow
Vá no Actions do GitHub: <https://github.com/SEU_USUARIO/SEU_USUARIO/actions> e veja se o deploy foi gerado corretamente.

---

## 21. Automatizando tudo para novas postagens
Crie um arquivo de nome `vim deploy.sh` e insira esse conteúdo nele:
{% highlight bash %}
#!/usr/bin/env bash
hugo
commit="No comment for this commit"
[[ ! -z "${1}" ]] && commit="${1}"
cd public
git add -A
git commit -m "${commit}"
git push origin main

cd ..
git add -A
git commit -m "${commit}"
git push origin main
{% endhighlight %}

---

## 22. Dê permissão de execução:
{% highlight bash %}
chmod +x deploy.sh
{% endhighlight %}

---

## 23. Crie um postagem nova:
{% highlight bash %}
hugo new posts/meu-segundo-post.md
{% endhighlight %}
> E preencha seu artigo como desejar

---

## 24. Publique
{% highlight bash %}
./deploy.sh "Minha nova postagem"
{% endhighlight %}

## 25. Acompanhe se deu certo
Em <https://github.com/SEU_USUARIO/SEU_USUARIO/actions> e veja o novo artigo no seu site: <https://SEU_USUARIO.github.io/>.

## 26. Configurações
Se você criar uma nova postagem ou editar a que já existe, verificará que o Hugo ignorará suas tags HTML, por exemplo, um vídeo incorporado.

{% highlight html %}
<iframe width="915" height="515" src="https://www.youtube.com/embed/SDtFO6ZZtMk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
{% endhighlight %}
Se formos ver o código fonte da página, aparecerá somente essa linha no lugar do nosso HTML: `<!-- raw HTML omitted -->`

Para resolver isso: adicione [esse toml](https://gohugo.io/getting-started/configuration-markup/) ao seu `config.toml` e pesquise(Vim: `/unsafe`) a opçao: `unsafe` deixe como `true` .

---

Em outros vídeos ou postagens veremos mais dicas de Hugo, como criar páginas, templates próprios, inserir campo de comentários e outras coisas!

Acompanhe as novidades em: <https://terminalroot.com.br/newsletter>.



