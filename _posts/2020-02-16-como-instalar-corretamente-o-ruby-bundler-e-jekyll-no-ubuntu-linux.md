---
layout: post
title: "Como Instalar Corretamente o Ruby, Bundler e Jekyll no Ubuntu Linux"
date: 2020-02-16 09:54:21
image: '/assets/img/dev-web/jekyll-install.jpg'
description: 'Jekyll é um gerador de site estático simples.'
tags:
- jekyll
- bundler
- ruby
- desenvolvimentoweb
- html
- css
- javascript
---

![Como Instalar Corretamente o Ruby, Bundler e Jekyll no Ubuntu Linux](/assets/img/dev-web/jekyll-install.jpg)

## Introdução
[Jekyll](https://jekyllrb.com/) é um gerador de site estático simples, com conhecimento de blog , para sites pessoais, de projetos ou de organização. Escrito em [Ruby](https://www.ruby-lang.org/) e foi criado por Tom Preston-Werner , co-fundador do [GitHub](https://github.com/) , ele é distribuído sob a licença [MIT](https://opensource.org/licenses/MIT) de [código aberto](https://opensource.org/) .

Jekyll é o mecanismo por trás das páginas do GitHub , um recurso do GitHub que permite aos usuários hospedar sites com base em seus repositórios do GitHub gratuitamente.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Instalando o [RVM](https://rvm.io/), [Ruby](https://www.ruby-lang.org/) e o Gem
Para instalar o Jekyll primeiramente você precisará do Ruby instalado no seu sistema, exemplo, no Ubuntu, Debian, Mint e similares, você pode usar o gerenciador de pacotes de acordo como há na documentação oficial do Ruby, inclusive para outras distribuições: <https://www.ruby-lang.org/pt/documentation/installation/>.
> Lembrando, que da forma apresentada na documentação, ele instalará diversos pacotes extras, incluindo o `rubygems-integration` para o comando `gem` que é um gerenciador de pacotes para aplicativos escritos em Ruby(o RubyGems) e servirá também para instalarmos o Bundler, que é um gerenciador de dependências.

No entanto, o procedimento da documentação é informado para casos gerais, mas ele também sugere casos específicos: "...ou ferramentas de terceiros (**rbenv** e **RVM**)." via <https://www.ruby-lang.org/pt/downloads/> . Ou seja, tanto o **rbenv** quanto o **RVM**, são formas mais adequadas para evitar *"dores de cabeça"* relacionadas a problemas de permissão, além de evitar problemas na configuração. As configurações do Jekyll "tem sido similar a Bolsa de Valores, mudam constantemente" , por se tratar de um aplicativo moderno e ainda está em desenvolvimento, logo, mudanças estão à todo vapor =) .

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

Para que as coisas fiquem mais simples para todo mundo, nesse tutorial vamos utilizar o **RVM(Ruby Version Manager)**.
> Esse procedimento é descrito em: <https://rvm.io/rvm/install>

---

1. Primeiramente certifique-se de remover tudo que pode já estar instalado no seu sistema:
> Aplicativos que não estiverem instalados o APT irá informar que o mesmo não existe, bem como, diretórios que não existirem o `rm` lhe avisará da não existência, logo, não entre em pânico :O .

{% highlight bash %}
sudo apt remove ruby bundler jekyll --purge
rm -rf ~/.gem ~/.ruby ~/.rvm
sudo apt clean && sudo apt autoremove && sudo apt autoclean
{% endhighlight %}

Após isso é interessante também você ter certeza que seu sistema está atualizado com `apt update && apt upgrade`.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Dica extra: Você pode criar um único comando para atualizar seu sistema sempre que precisar:
{% highlight bash %}
echo 'alias atualizar="sudo apt update && sudo apt uograde -y && sudo apt autoremove && sudo apt autoclean && sudo apt clean"' >> ~/.bashrc
source ~/.bashrc
atualizar
{% endhighlight %}

---

2. Agora vamos importar a chave gpg
> Lembre sempre de pegar a chave no endereço oficial(<https://rvm.io/rvm/install>), pois versões mais recentes podem ter a chave modificada.

{% highlight bash %}
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
{% endhighlight %}

---

3. E então, vamos instalar o RVM junto com o Ruby
> *Install RVM stable with ruby:* , segundo procedimento das linhas de código.

{% highlight bash %}
curl -sSL https://get.rvm.io | bash -s stable --ruby
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

Durante a instalação ele irá rodar o comando: `sudo apt --quiet --yes update` , logo, será necessário você informar sua senha de `sudo`. Agora é necessário esperar, pois essa parte pode demorar um pouco (ele vai instalar dependências e compilar o Ruby).

---

4. Agora, adicione o RVM ao `$PATH` para seu usuário, adicionando a linha: `source $HOME/.rvm/scripts/rvm` ao seu `~/.bashrc` e releia o mesmo, se quiser basta usar os dois comandos abaixo:
{% highlight bash %}
echo 'source $HOME/.rvm/scripts/rvm' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}

Depois disso, verifique se está tudo certo, consultando a versão d RVM: `rvm --version` . Para ver a versão dos pacotes existentes do Ruby, rode: `rvm list known` e para ver a versão do RubyGems, rode: `gem --version`.

Se tudo retornou corretamente, então estamos no caminho certo. Agora vamos ao [Bundler](https://bundler.io/) e finalmente ao Jekyll que é nossa meta aqui.


# Instalando o Bundler e o Jekyll
Bom, a partir de agora ficará tudo mais fácil. Agora vamos visitar o site do Jekyll: <https://jekyllrb.com/> e já na página inicial ele já mostra o procedimento para instalar o Jekyll:
> Observação, se não fizéssemos o procedimento acima com o RVM, nessa parte você iria precisa usar o `sudo gem`, e isso daria ainda mais dor de cabeça na hora de instalar o Jekyll via `gem`, então NÃO USE o ~~sudo~~ .

{% highlight bash %}
gem install bundler jekyll
{% endhighlight %}

Agora vamos criar um site básico e já entrar no diretório do nosso site:
{% highlight bash %}
jekyll new meu-site
# Aguarde ele criar todos os arquivos do site
cd meu-site
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

Agora vamos ver o nosso site funcionando no navegador, para isso rode o comando:
> Note que o nome do aplicativo é Bundler, mas o comando é somente `bundle` sem a letra **r** no final e tudo em minúsculo.

{% highlight bash %}
bundle exec jekyll serve
{% endhighlight %}

Para ver seu site funcionando, basta ir ao endereço: <http://localhost:4000> . Vai ter o tema básico do Jekyll e uma postagem também simples de **Welcome to Jekyll!**

Para tirar o site do ar, basta retornar ao terminal e pressionar **Ctrl+C** . Pode ser que ele acuse o erro de não ter encontrado o arquivo **favicon.ico** , mas é porque esse é um exemplo simples e ele não criou/gerou esse ícone para esse site/blog simples.

No próximo módulo vamos alterar o tema do Jekyll para o blog que criamos com [Bootstrap](https://terminalroot.com.br/2020/02/aprenda-bootstrap-4-curso-de-desenvolvimento-web-03.html) no vídeo anterior, e dessa forma saberemos sempre como implementar nossos próprios temas HTML ou de terceiros ao Jekyll . E posteriormente como hospedar gratuitamente nosso site/blog em plataformas específicas como [Gitlab](https://gitlab.com/terminalroot), [Github](https://github.com/terroo), [Netlify](https://marcos.netlify.com/) e entre outras, bem como usar um domínio próprio para nosso endereço, como criar facilmente posts, estrutura do Jekyll e diversas outras dicas.

Se ainda não viu os vídeos anteriores, clique nos links abaixo:

+ [HTML & CSS](https://terminalroot.com.br/2020/01/desenvolvimento-web.html)
+ [Javascript](https://terminalroot.com.br/2020/01/javascript.html)
+ [Bootstrap](https://terminalroot.com.br/2020/02/aprenda-bootstrap-4-curso-de-desenvolvimento-web-03.html)

# Assista ao vídeo

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

<iframe width="920" height="400" src="https://www.youtube.com/embed/RdFoGToeqFM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Links Úteis
+ Página oficial do Jekyll: <https://jekyllrb.com/>
+ Referências: <https://en.wikipedia.org/wiki/Jekyll_(software)>
+ BuntuWM: <https://terminalroot.com.br/2019/10/remaster-ubuntu-buntuwm-linux.html>
