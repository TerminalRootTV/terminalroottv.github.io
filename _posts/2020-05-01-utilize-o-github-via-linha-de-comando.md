---
layout: post
title: "Utilize o GitHub via linha de comando"
date: 2020-05-01 14:16:34
image: '/assets/img/github/gh.jpg'
description: 'Disponível para Linux, macOS e Windows.'
icon: 'bytesize:github'
iconname: 'github'
tags:
- github
- comandos
- git
---

![Utilize o GitHub via linha de comando](/assets/img/github/gh.jpg)

Uma maneira mais fácil de trabalhar com o [GitHub](https://terminalroot.com.br/tags#github) a partir da linha de comando - [CLI do GitHub](https://cli.github.com/) . Milhões de desenvolvedores confiam no GitHub para tornar a construção de software mais divertida e colaborativa, e o `gh `traz a experiência do GitHub diretamente para o seu terminal.

Você pode instalar a CLI do GitHub hoje no [macOS](https://terminalroot.com.br/tags#macos), [Windows](https://terminalroot.com.br/tags#windows) e [Linux](https://terminalroot.com.br/tags#linux).

# Instalação

No Linux , escolha a forma de acordo com sua distribuição ou independente da distribuição. Faça o download dos [releases](https://github.com/cli/cli/releases/latest) e escolha o comando de acordo com sua distro:
{% highlight bash %}
sudo apt install ./gh_*_linux_amd64.deb # Debian, Ubuntu, Mint
sudo dnf install gh_*_linux_amd64.rpm # Fedora
sudo yum localinstall gh_*_linux_amd64.rpm # CentOS
sudo zypper in gh_*_linux_amd64.rpm # OpenSUSE
yay -S github-cli # Arch Linux 
{% endhighlight %}

Ou compile da fonte(Necessário possuir o **Go** `go version`):
{% highlight bash %}
git clone https://github.com/cli/cli.git ~/.githubcli
cd ~/.githubcli && make
echo 'export PATH="$HOME/.githubcli/bin:$PATH"' >> ~/.bash_profile
{% endhighlight %}
> Se seu shell for ZSH ou FISH, o último comando acima precisa ser de acordo com o arquivo de configuração.

# Uso

Encontre um projeto de código aberto para o qual você deseja contribuir e clone o repositório. E então, para ver onde os mantenedores querem contribuições da comunidade, use `gh` para filtrar os **issues** e mostrar apenas aqueles rotulados com `help`, exemplo:

![gh help](/assets/img/github/gh1.png)

Encontre um *issue* que descreva um bug que parece ser algo que você pode corrigir e use o `gh` para abri-lo rapidamente no navegador para obter todos os detalhes necessários para começar.

![gh issue](/assets/img/github/gh2.png)

 Crie um **Pull Request**

 ![gh pull request](/assets/img/github/gh3.png)

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Verifique o status do pull request 

![gh status](/assets/img/github/gh4.png)

Verifique de há alguma solicitação de pull request

![pull request solicitação](/assets/img/github/gh5.png)


Para mais informações consulte o [manual](https://cli.github.com/manual/).

# Links Úteis
+ <https://cli.github.com/manual/>
+ <https://github.com/cli/cli>
+ <https://cli.github.com/>
+ <https://github.blog/2020-02-12-supercharge-your-command-line-experience-github-cli-is-now-in-beta/>
