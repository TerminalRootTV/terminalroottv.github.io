---
layout: post
title: "Como Hospedar Gratuitamente no GitHub, GitLab e Netlify"
date: 2020-02-26 10:44:58
image: '/assets/img/dev-web/github-gitlab-netlify.jpg'
description: 'Qual a melhor plataforma? Fizemos comparativos.'
tags:
- netlify
- gitlab
- github
- hospedagem
- host
- docker
- kubernetes
- deploy
---

![Como Hospedar Gratuitamente no GitHub, GitLab e Netlify](/assets/img/dev-web/github-gitlab-netlify.jpg)

[GitHub](https://github.com/) é uma plataforma de hospedagem de código-fonte com controle de versão usando o [Git](https://terminalroot.com.br/git). Ele permite que programadores, utilitários ou qualquer usuário cadastrado na plataforma contribuam em projetos privados e/ou Open Source de qualquer lugar do mundo. [➕](https://pt.wikipedia.org/wiki/GitHub)

[GitLab](https://gitlab.com/) é um gerenciador de repositório de software baseado em git, com suporte a Wiki, gerenciamento de tarefas e [CI/CD](https://docs.gitlab.com/ee/ci/) . GitLab é similar ao GitHub, mas o GitLab permite que os desenvolvedores armazenem o código em seus próprios servidores, ao invés de servidores de terceiros. [➕](https://pt.wikipedia.org/wiki/GitLab)

[Netlify](https://www.netlify.com/) é uma empresa de computação em nuvem sediada em São Francisco que oferece serviços de hospedagem e back-end sem servidor para sites estáticos . Seus recursos incluem implantação contínua do Git, suporte para funções do AWS Lambda e integração completa com  [Let's Encrypt](https://letsencrypt.org/) . [➕](https://en.wikipedia.org/wiki/Netlify)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 🎬 Grade do Vídeo
- ➡️ 01. Comparativos das Plataformas [00:00](https://www.youtube.com/watch?v=ahkpilbOtpE&t=0s)
- ➡️ 02. Como Hospedar Gratuitamente no GitHub [03:05](https://www.youtube.com/watch?v=ahkpilbOtpE&t=185s)
- ➡️ 03. Como Hospedar Gratuitamente no GitLab [17:08](https://www.youtube.com/watch?v=ahkpilbOtpE&t=1028s)
- ➡️ 04. Como Hospedar Gratuitamente no Netlify [26:16](https://www.youtube.com/watch?v=ahkpilbOtpE&t=1576s)
- ➡️ 05. Como Criar um Domínio Próprio [38:47](https://www.youtube.com/watch?v=ahkpilbOtpE&t=2327s)
- ➡️ 06. Dicas Adicionais [43:11](https://www.youtube.com/watch?v=ahkpilbOtpE&t=2591s)

---

# Assista ao Vídeo

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

<iframe width="920" height="400" src="https://www.youtube.com/embed/ahkpilbOtpE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Download dos arquivos:
{% highlight bash %}
wget bit.ly/JekyllFiles -O thepinguim.zip
{% endhighlight %}

Ou clicado abaixo e baixando o mesmo arquivo com nome diferente: `thepinguim-jekyll.zip`

<a href="https://terminalroot.com.br/downs/thepinguim-jekyll.zip">
    <button class="btn btn-danger">Clique Aqui para Baixar</button>
</a>

## Comando/Função Shell Script Usado no Vídeo
> Para automatizar `commit` e `push`

`vim ~/.bashrc`
{% highlight bash %}
novopost(){
    [[ -z "$*"]] && _com="commit vazio" || _com="$*"
    git add -A
    git commit -m "$_com"
    git push origin master
}
{% endhighlight %}

## Configuração de arquivo de preenchimento automático
> Para automatizar `push`

`vim ~/.netrc`
{% highlight bash %}
machine [url] login [seu-usuario] password [sua-senha]
{% endhighlight %}

## [Endereço do Jekyll no GitLab](https://pages.gitlab.io/jekyll/)
> Caminho do repositório <https://gitlab.com/pages/jekyll>

{% highlight bash %}
git clone https://gitlab.com/pages/jekyll
{% endhighlight %}
Copie os arquivo: `Gemfile` `Gemfile.lock` `.gitattributes` `.gitignore` `.gitlab-ci.yml` para seu projeto local do Jekyll:
{% highlight bash %}
cd jekyll/
cp Gemfile Gemfile.lock .gitattributes .gitignore .gitlab-ci.yml ../seu-dominio.gitlab.io/
{% endhighlight %}

## Comandos para instalar o NPM
{% highlight bash %}
sudo emerge npm # Gentoo, Funtoo,...
sudo apt install npm # Debian, Ubuntu, Mint,...
sudo dnf install npm # Fedora
sudo pacman -S npm # Arch Linux, Manjaro,...
{% endhighlight %}

## Criar uma alias no seu `~/.bashrc`
{% highlight bash %}
echo 'alias netlify="$HOME/node_modules/netlify-cli/bin/run"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}
> Alternativamente , você pode mover seu `node_modules` para qualquer diretório não visível, caso não deseje mantê-lo no diretório pessoal do seu usuário.

{% highlight bash %}
mkdir -p ~/.local/bin
mv node_modules ~/.local/bin/
{% endhighlight %}
> Lembre depois de alterar o caminho do alias se opção por essa dica.

## Deploy no Netlify
{% highlight bash %}
cd [seu-website]
bundle exec jekyll serve
netlify deploy -d _site
{% endhighlight %}

## Código para uso de comentários
> Site do Disqus: <https://disqus.com/>

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

{% highlight html %}
<div id="comments" class="mt-5">
    <div id="disqus_thread">
    </div>
    <script type="text/javascript">
        var disqus_shortname = '{{site.disqus}}';
        var disqus_developer = 0;
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = window.location.protocol + '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>
    Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a>
    </noscript>
</div>
{% endhighlight %}
Depois inclua `comentarios.html` ao seu `_layouts/post.html`
> Lembre também de criar um objeto no seu `_config.yml`

{% highlight bash %}
disqus: [seu-usuario-no-disqus]
{% endhighlight %}

## Documentações para URL Própria
- <https://registro.br/>
- <https://nic.com/>
- Configurar um domínio personalizado para o site do GitHub: <https://help.github.com/pt/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site>
- Configurar um domínio personalizado para o site do Netlify: <https://docs.netlify.com/domains-https/custom-domains/>
- Configurar um domínio personalizado para o site do GitLab: <https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/>

## Links Úteis
🎁 Todos os Cursos na Udemy: <http://bit.ly/UdemyTerminalRoot>
- ⚓ Página do Git: <https://terminalroot.com.br/git>
- ⚓ Assista ao VIDEO de INSTALAÇÃO: <https://www.youtube.com/watch?v=RdFoGToeqFM>
- ⚓ Assista ao MÓDULO 01 - HTML e CSS: <https://www.youtube.com/watch?v=SGA6nQqYH7A>
- ⚓ Assista ao MÓDULO 02 - JAVASCRIPT: <https://www.youtube.com/watch?v=HI6YZJxoaIQ>
- ⚓ Assista ao MÓDULO 03 - BOOTSTRAP: <https://www.youtube.com/watch?v=mRlkt7P2gZI>
- ⚓ Assista ao MÓDULO 04 - JEKYLL: <https://www.youtube.com/watch?v=7lI5BfHK-kA>
- ⚓ Como Inserir Facilmente os Comentários do GitHub no seu Blog: <https://terminalroot.com.br/2019/09/como-utilizar-os-comentarios-do-github-no-seu-blog.html>

# Abraços!
