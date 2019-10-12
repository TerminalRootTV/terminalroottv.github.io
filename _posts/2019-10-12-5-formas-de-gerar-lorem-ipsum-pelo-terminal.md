---
layout: post
title: "5 Formas de Gerar Lorem Ipsum pelo Terminal"
date: 2019-10-12 18:58:50
image: '/assets/img/dev/lorem-ipsum.jpg'
description: 'Em design gráfico e editoração, lorem ipsum é um texto utilizado para preencher o espaço de texto em publicações.'
tags:
- loremipsum
- desenvolvimento
- web
---

![5 Formas de Gerar Lorem Ipsum pelo Terminal](/assets/img/dev/lorem-ipsum.jpg)

Em design gráfico e editoração, lorem ipsum é um texto utilizado para preencher o espaço de texto em publicações (jornais, revistas, e sites) e testar aspectos visuais (cores, fontes etc.), com a finalidade de verificar o layout, a tipografia e formatação antes de utilizar conteúdo real. Muitas vezes este texto também é utilizado em catálogos de tipografia para demonstrar textos e títulos escritos com as fontes.

## História do Lorem Ipsum ?

Ao contrário da crença popular, o lorem ipsum não é um texto qualquer. Richard McClintock, professor de Latim na Hampden-Sydney College na Virginia, pesquisou uma das mais obscuras palavras em latim, "consectetur", da passagem do texto do lorem ipsum e, em suas pesquisas nas citações da literatura clássica, descobriu que o texto vem das seções 1.10.32 e 1.10.33 do "De Finibus Bonorum et Malorum" (Os extremos do bem e do mal) escrito por Cícero em 45 a.C. Este livro trata da teoria de ética, muito popular durante a Renascença. A primeira linha, "Lorem ipsum dolor sit amet...", encontra-se na seção 1.10.32.

## 1º Forma via [npm]()

Essa é uma das formas mais simples, mas lembre-se que você precisa antes possuir o [npm]() instalado na sua máquina.

Instale o [lorem-ipsum](https://www.npmjs.com/package/lorem-ipsum)
{% highlight bash %}
sudo npm i -g lorem-ipsum
{% endhighlight %}

Principais comandos:
+ `lorem-ipsum 2 paragraphs` - gera 2 parágrafos
+ `lorem-ipsum 2 paragraphs --format html` - gera 2 parágrafos com a tag `p` em HTML

## 2º Forma

É uma melhoria da forma anterior, até porque ficar digitando *paragraphs, words, sentences* sem [auto-complete]() é ruim demais, além de deixar os espaços entre os parágrafos ainda mais separados. Crie esse script `vim lorem`
{% highlight bash %}
#!/usr/bin/env bash
lorem(){
        while getopts ':w:p:s:h' flag; do
                case "$flag" in
                        p) [[ ! -z ${OPTARG} ]] && lorem-ipsum ${OPTARG} paragraphs | sed 's/\.$/\n/g';;
                        w) [[ ! -z ${OPTARG} ]] && lorem-ipsum ${OPTARG} words;;
                        s) [[ ! -z ${OPTARG} ]] && lorem-ipsum ${OPTARG} sentences;;
                        *|h) echo "use: $0 [-p,-w,-s] NUM → [paragraphs,words,sentences] numbers" && exit 1;;
                esac
        done
	exit 0
}

lorem "$@"
{% endhighlight %}

Salve , dê permissão de execução e mova para um diretório do sistema:
{% highlight bash %}
chmod +x lorem
sudo mv /usr/local/bin/
{% endhighlight %}

E use de forma mais fácil, exemplo gerar 4 parágrafos: 
{% highlight bash %}
lorem -p 4
{% endhighlight %}

Outros exemplos: 
- gerar duas palavras: `lorem -w 2`;
- gerar 6 sentenças: `lorem -s 6`;
- ajuda rápida: `lorem -h`.

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

## 3º Forma

Também um [Shell Script]() só que além de mais simples, ainda usa um "API"(URL) da <http://metaphorpsum.com/> , logo fica um pouco mais lento: `vim loremipsum`
{% highlight bash %}
#!/bin/bash
loremipsum () {
	if [[ "${1}" = "" ]] || [ "${2}" = "" ]; then
		echo "Usage: loremipsum [paragraphs, sentences] [integer]"
	else
		curl -s http://metaphorpsum.com/"${1}"/"${2}"
		echo
	fi
}
loremipsum "$@"
{% endhighlight %}

Se quiser mova para um diretório do sistema pra ficar como comando rápido do [shell]()

### 4º Forma

Se você estiver a biblioteca `lorem-perl` instalada, exemplo no [Ubuntu]() : `sudo apt install libtext-lorem-perl` , basta usar assim, similar a solução que eu criei:
{% highlight bash %}
lorem -p 4 # Cria 4 parágrafos
lorem -w 2 # Cria 4 palavras
lorem -p 5 # Cria 4 sentenças
{% endhighlight %}

O ruim é que a saída fica colada no *prompt* , mas você pode criar um alias no seu `~/.bashrc` de forma que solucione isso! =)

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

## 5º Forma

Usando outra ferramenta instalável via [npm](): <https://getlorem.com/>

Para instalar:
{% highlight bash %}
sudo npm install -g getlorem
{% endhighlight %}

Exemplo de uso, gerando um parágrafo com 50 palavras: `getlorem --units words --count 50`

## Conclusão

Eu preferir ficar com a **2º solução** que é a que eu utilizo aqui, mas fica à sua escolha a melhor para seu caso. Para mais informações consulte os links úteis.

### Veja também outros Ipsums ENGRAÇADOS como alternativa! =)
+ <http://metaphorpsum.com/>
+ <http://compadreipsum.com.br/>
+ <http://mussumipsum.com/>
+ <http://baconipsum.com/>
+ <http://www.jbipsum.com/>
+ <https://loremipsum.io/>

Abraços!

### Links úteis

+ <https://pt.wikipedia.org/wiki/Lorem_ipsum>
+ <https://lipsum.com/>
+ <https://github.com/lorem-ipsum/>
+ <https://www.npmjs.com/package/lorem-ipsum>
+ <https://unix.stackexchange.com/questions/97160/is-there-something-like-a-lorem-ipsum-generator>
+ <https://coderwall.com/p/2uqzmq/command-line-lipsum-text>
+ <https://getlorem.com/>
    
