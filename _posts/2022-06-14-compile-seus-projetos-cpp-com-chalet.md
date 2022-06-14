---
layout: post
title: "Compile seus projetos C++ com Chalet"
date: 2022-06-14 13:25:00
image: '/assets/img/cppdaily/chalet.jpg'
description: 'Mais uma alternativa moderna e simples de utilizar.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Chalet** é um aplicativo de linha de comando que lê um arquivo de projeto JSON (*chalet.json*) e compila seus projetos [C](https://terminalroot.com.br/tags#linguagemc)/[C++](https://terminalroot.com.br/tags#cpp). 

Nos bastidores, o Chalet gera um arquivo de compilação [Ninja](https://terminalroot.com.br/tags#ninja) ou [Make](https://terminalroot.com.br/tags#make) e executa algum armazenamento em cache. 

Os arquivos do projeto Chalet se concentram em uma linguagem intuitiva projetada para ser fácil de entender e, ao mesmo tempo, fornecer muito controle. Como os projetos são JSON, eles podem ser facilmente integrados a IDEs.

---

# Instalação
Para instalar em um sistema GNU/Linux 64-bit basta fazer o download da [versão mais recente](https://github.com/chalet-org/chalet/releases), descompactar e mover o binário para um diretório da `$PATH`, exemplo:

{% highlight bash %}
wget https://github.com/chalet-org/chalet/releases/download/v0.4.2/chalet-x86_64-linux-gnu.zip
unzip chalet-x86_64-linux-gnu.zip
cd chalet-x86_64-linux-gnu/
sudo install -v chalet /usr/local/bin/
{% endhighlight %}

Adicione também o autocomplete:

{% highlight bash %}
mkdir -p ~/.local/share/completions
install -v chalet-completion.sh ~/.local/share/completions
echo 'source ${HOME}/.local/share/completions/*' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}

Se quiser futuramente adicionar outros autocompletes locais, altere a linha adicionada ao seu `~/.bashrc` por esse loop:
{% highlight bash %}
for i in ${HOME}/.local/share/completions/*; do
  source ${i}
done
{% endhighlight %}

---

# Utilização
Para criar um projeto do zero, basta rodar:

{% highlight bash %}
chalet init myproject
{% endhighlight %}

Será inciado um *wizard* com perguntas relativas ao seu projeto, responda conforme desejado. E para construir e rodar use os comandos:
{% highlight bash %}
cd myproject
chalet build
chalet run
{% endhighlight %}

Para mais detalhes use o parâmetro `--help` e/ou acesse o [site oficial](https://www.chalet-work.space/) e o [repositório](https://github.com/chalet-org/chalet) .



