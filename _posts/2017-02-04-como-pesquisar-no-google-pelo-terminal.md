---
layout: post
title: "Como Pesquisar no Google Pelo Terminal"
date: 2017-02-04 21:10:30
image: '/assets/img/dicas/googler.jpg'
description: "O Googler permite que você use a pesquisa do Google na linha de comando do Linux."
color: '#7d669e'
tags:
- terminal
- google
categories:
---

![Googler](/assets/img/dicas/googler.jpg)

> O [Googler](https://github.com/jarun/googler) permite que você use a pesquisa do Google na linha de comando do Linux. Este utilitário de linha de comando do Linux pode ser usado como uma ferramenta autônoma ou em combinação com um navegador de texto. Desenvolvido usando o Python, o Googler pode ser encontrado no repositório GitHub do seu desenvolvedor.

## Instalaçao

Atualmente, o [Googler](https://github.com/jarun/googler) não está disponível em repositórios de distros [Linux](http://terminalroot.com.br/tags/#linux) famosos como o [Debian](http://terminalroot.com.br/tags/#github). Mas você pode instalá-lo a partir do seu repositório [GitHub](http://terminalroot.com.br/tags/#linux). Você precisa executar os comandos escritos abaixo. Mas antes disso, você precisa atualizar o [Python](http://terminalroot.com.br/tags/#python) para a versão 3.3 ou superior, se não tiver. Verifique a sua versão do Python:

{% highlight bash %}
python3 --version
{% endhighlight %}

#### Instalando o Git

Se tiver o sudo, use-o, caso contrário, execute os próximos comandos com o __root__
{% highlight bash %}
apt-get install git
{% endhighlight %}

#### Procedimentos
{% highlight bash %}
cd /tmp
git clone https://github.com/jarun/googler.git
cd googler
make installcd auto-completion/bash/
cd auto-completion/bash/
cp googler-completion.bash /etc/bash_completion.d/
{% endhighlight %}

Após instalado é só abrir um novo terminal e executar (já não precisa mais ser o __root__)
{% highlight bash %}
googler
{% endhighlight %}

Para ver o manual de utilização
{% highlight bash %}
man googler
{% endhighlight %}


Via: FossBytes


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



