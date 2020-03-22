---
layout: post
title: "10 Melhores Alternativas para Compartilhamento de Trechos de Código"
date: 2020-03-22 16:09:34
image: '/assets/img/code/instacode.png'
description: 'Simples e muito necessário! ♨️'
tags:
- desenvolvimento
- programacao
- dicas
---

![10 Melhores Alternativas para Compartilhamento de Trechos de Código](/assets/img/code/instacode.png)
Um utilitário simples, mas que ajuda muito para quem precisa disponibilizar constantemente trechos de código, eu por exemplo! 😀️ . Separei alguns pra vocês, vamos à lista!
> Para alguns dos nossos exemplos de uso vamos utilizar o seguinte arquivo:

> `vim mycode.sh`

{% highlight bash %}
#!/usr/bin/env bash
# Code example to shared snippets
# Author: Marcos <terminalroot.com.br>
send_msg(){
    tput cnorm
    echo -e "\n\e[31;1mBye!\e[m"
    exit 127
}
trap send_msg SIGINT
tput civis
while true;
do
    echo -en "\r\e[33;1mThis is \e[36mMy Code\e[34m at \e[37m$(date +%d/%m/%Y-%H:%M:%S)\e[m"
done
{% endhighlight %}

![mycode.sh](/assets/img/code/code.png)

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

# 01. [ix.io](http://ix.io/)
O compartilhamento do seu código é realizado via linha de comando, exemplo:
{% highlight bash %}
# Compatilhando um arquivo e obtendo o link
cat mycode.sh | curl -F 'f:1=<-' ix.io
{% endhighlight %}
A saída informará o link que você pode usar para compartilhar. Se quiser mais facilidade crie uma função em Shell para isso ou use o client deles disponível na mesma página, além de outras opções, como guardar os códigos e links ao rodar o comando.

![ix.io](/assets/img/code/ix.png)

Link do código gerado: <http://ix.io/2eZc>

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 02. [sprunge.us](http://sprunge.us/)
Da mesma forma que o anterior, só que ainda mais simples, exemplo de uso:
{% highlight bash %}
cat mycode.sh | curl -F 'sprunge=<-' http://sprunge.us
{% endhighlight %}

![ix.io](/assets/img/code/ix.png)

Link do código gerado: <http://sprunge.us/M3zF8m>

---

# 03. [Hastebin](https://hastebin.com/)
![Hastebin](/assets/img/code/hastebin.jpg)
Ele funciona online, você precisa inserir(digitar/colar) seu código e clicar em **Save 💾 `Ctrl + s`**. Se quiser compartilhar seu código, basta clicar em **Just Text 📋️** ou teclar `Ctrl + shift + r`.

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

Vocẽ ainda pode usar o cliente deles via linha de comando, instalando-o via [gem](https://terminalroot.com.br/2020/02/como-instalar-corretamente-o-ruby-bundler-e-jekyll-no-ubuntu-linux.html):
{% highlight bash %}
gem install haste
{% endhighlight %}

E usando da seguinte maneira:
{% highlight bash %}
cat mycode.sh | haste
{% endhighlight %}

Link do código gerado: <https://hastebin.com/morovoxegu.bash>

> Há a possibilidade de você usar seu próprio server, veja mais detalhes [aqui](https://github.com/seejohnrun/haste-client).

---

# 04. [Gist GitHub](https://gist.github.com/)
Essa opção e uma das mais conhecidas, pois tem a marca/publicidade do [GitHub](https://github.com/terroo). Você pode compartilhar anonimamente também ou se estiver logado, fica gravado para seu usuário.

Tem até clientes para ele: [Lepton](https://hackjutsu.com/Lepton/) e também: [Gisto](https://www.gistoapp.com/) . Outro serviço deles, não relacionado, é um encurtador de url: [git.io](https://git.io/), só encurta URLs do site/endereços relacionados ao GitHub, mas serve caso você queira encutar seus snippets e até mesmo URL longa do GitHub. 

Dá pra encurtar via linha de comando de forma personalizada, exemplo:
> Edite **SUA_URL_LONGA** e **LETRAS_CUSTOMIZADAS** para nomes específicos caso queira.

<!-- RETANGULO LARGO -->
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

{% highlight bash %}
curl https://git.io/ -i -F "url=SUA_URL_LONGA" -F "code=LETRAS_CUSTOMIZADAS"
# curl https://git.io/ -i -F "url=https://gist.github.com/terroo/5bafbcb1cc6f4ab922b70fa165e39468" -F "code=mycode.sh"
{% endhighlight %}

Link do código gerado: git.io/mycode.sh

![Gist](/assets/img/code/gist.png)

---

# 05. [GitLab Snippets](https://docs.gitlab.com/ee/user/snippets.html)
![GitLab Snippets](/assets/img/code/gitlab_snippet.png)
Similar ao Gist, no entanto, não há possibilidade de criar snippets anônimos, é preciso estar logado na sua conta do [GitLab](https://gitlab.com/terminalroot). Uma interface muito show!

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Os códigos que os programadores disponibilizaram como público podem ser consultados [aqui](https://gitlab.com/explore/snippets).

Para criar você precisa estar logado e ir no botão de [+](https://gitlab.com/snippets/new) ou no botão [New Snippet](https://gitlab.com/snippets/new){: class=btn btn-success }:
![New Snippet GitLab](/assets/img/code/snippet-gitlab.png)

<https://gitlab.com/snippets/1955776>

---

# 06. [paste.sh](https://paste.sh/)
Também funciona online e ele encripta sua URL, basta acessar o endereço e digitar/colar seu código e ele salva automaticamente e disponibiliza o `raw` no canto inferior direito da tela: <https://paste.sh/>.

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 07. [Termbin](http://termbin.com/)
Esse é show de bola, ele roda via comando `nc`(precisa ter o [netcat](http://nc110.sourceforge.net/) instalado) e a inserção é bem simples, exemplo:
{% highlight bash %}
cat mycode.sh | nc termbin.com 9999
{% endhighlight %}

---

# 08. [InstaCode](http://instaco.de/)
Esse é loko, o compartilhamento é via imagem e você pode criar Wallpaper e editar sua imagem: rotate, blur, colorschemes e entre outras opções! Vale o clique.

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

![InstaCode](/assets/img/code/instacode.png)

Link do código gerado: <http://instaco.de/119823>

# 09. [Ubuntu PasteBin](https://paste.ubuntu.com/)
Nem precisa dizer que é da [distribuição](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=distro) [Linux](https://terminalroot.com.br/linux) [Ubuntu](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=ubuntu) com uma interface limpa e profissional:
![Ubuntu PasteBin paste](/assets/img/code/ubuntu-snippet-1.jpg)
![Ubuntu PasteBin code](/assets/img/code/ubuntu-snippet-2.jpg)

Link do código gerado: <https://paste.ubuntu.com/p/bwqY6XHpqm/>

# 10. [0x0.st](http://0x0.st/)
![0x0.st](/assets/img/code/0x0.jpg)
Esse é completo, não se trata somente de um code snippet e sim se um compartilhador de arquivos, url e tudo que você deseja no limite de 512MB. É uma alternativa ao [transfer.sh](https://terminalroot.com.br/2019/08/transfersh-guarde-seu-arquivos-na-nuvem-gratuitamente-via-linha-de-comando.html) que nós temos um artigo [aqui no blog](https://terminalroot.com.br/2019/08/transfersh-guarde-seu-arquivos-na-nuvem-gratuitamente-via-linha-de-comando.html). Exemplo de uso:
{% highlight bash %}
curl -F'file=@mycode.sh' http://0x0.st
{% endhighlight %}

---

Opções é que não falta, fique à vontade para escolher nesse mundo de alternativa! 😀️ Um que eu definitivamente não recomendaria seria o ~~PasteBin.com~~ , esse gera ['bad interpreter'](https://terminalroot.com.br/2014/09/resolvendo-bad-interpreter-no-bash.html) no seu código, se você baixar e usar no [Linux](https://terminalroot.com.br/linux), [saiba mais aqui](https://terminalroot.com.br/2014/09/resolvendo-bad-interpreter-no-bash.html).

# Abraços

### Links úteis:
+ <https://alternativeto.net/software/github-gist/>
+ <https://www.saashub.com/github-gist-alternatives>
+ <https://www.slant.co/topics/7247/~code-snippets-manager>

