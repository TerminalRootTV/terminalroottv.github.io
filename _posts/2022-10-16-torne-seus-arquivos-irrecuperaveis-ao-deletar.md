---
layout: post
title: "Torne seus arquivos irrecuperáveis ao deletar"
date: 2022-10-16 11:53:19
image: '/assets/img/gnu/gnu-shred.jpg'
description: 'Nem precisa destruir o HD como Elliot Alderson fazia 😃 .'
icon: 'ion:terminal-sharp'
iconname: 'Comandos do GNU'
tags:
- gnu
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**shred** é um [comando](https://terminalroot.com.br/tags#comandos) em [sistemas operacionais](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq) do tipo [Unix](https://terminalroot.com.br/tags#unix) em Português significa: *triturar*. Ele é usado para <u>excluir arquivos e dispositivos com segurança</u>, tornando extremamente difícil recuperá-los, mesmo com hardware e tecnologia especializados; Faz parte do [GNU](https://terminalroot.com.br/tags#gnu) Core Utilities .

O processo de [apagar um arquivo](https://terminalroot.com.br/2017/11/blog-linux-remover-arquivos-duplicados-fdupes-fslint.html) do armazenamento usando o comando [rm](https://terminalroot.com.br/2015/08/script-para-remover-arquivos-e.html) geralmente apaga apenas a entrada do sistema de arquivos do arquivo , mantendo o conteúdo do arquivo intacto. Isso frequentemente permite que softwares comumente disponíveis recuperem os dados do arquivo "*apagado*". 

Se os dados do arquivo estiverem armazenados em mídia magnética , como um HDD , mesmo que o arquivo seja substituído, os campos magnéticos residuais podem permitir a [recuperação de dados](https://extundelete.sourceforge.net/) usando equipamento de hardware especializado . 

Para evitar isso, a fragmentação substitui o conteúdo de um arquivo várias vezes, usando padrões escolhidos para maximizar a destruição dos dados residuais.

---

# Como instalar o `shred`?
Se você possui um sistema [GNU/Linux](https://terminalroot.com.br/tags#linux) com certeza já há o `shred` instalado no seu sistema. Em muitos casos sistemas [BSD](https://terminalroot.com.br/tags#bsd) e similares, como o [macOS](https://terminalroot.com.br/tags#macos) também há uma grande chance de já ter instalado.

Mas se não tiver ou se você possui outro sistema operacional, como o [Windows](https://terminalroot.com.br/tags#windows) por exemplo, você pode clonar e compilar a partir desse endereço: <https://www.gnu.org/software/coreutils/> .

Em resumo o `shred` é somente um arquivo escrito em [C](https://terminalroot.com.br/tags#linguagemc): [shred.c](https://github.com/wertarbyte/coreutils/blob/master/src/shred.c) .


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Utilizando
A sintaxe básica é similar a diversos [comandos](https://terminalroot.com.br/tags#comandos) que se resume em:
{% highlight bash %}
shred [OPÇÃO]... ARQUIVO...
{% endhighlight %}
> O arquivo também pode ser um dispositivo.

### "Removendo" um arquivo básico:
{% highlight bash %}
shred file.txt
{% endhighlight %}
O arquivo ainda não será removido, no entanto, os dados contidos nele não existirão mais.

### Obtendo detalhes dessa "remoção", use o parâmetro `-v`
{% highlight bash %}
shred -v file.txt 
{% endhighlight %}

### O parâmetro `-z` atribui *zeros* aos dados, em união com `-v` você consegue ver isso:
{% highlight bash %}
shred -vz file.txt 
shred: file.txt: passagem 1/4 (random)...
shred: file.txt: passagem 2/4 (random)...
shred: file.txt: passagem 3/4 (random)...
shred: file.txt: passagem 4/4 (000000)...
{% endhighlight %}

### Remover os dados, zerar os dados e apagar o arquivo
Note que após rodar os comandos acima, o arquivo ainda existirá. Para após destruir e zerar os dados você desejar excluir o arquivo basta usar o comando `-u`, exemplo utilizando em conjunto com parâmetros anteriores:

{% highlight bash %}
shred -uvz file.txt 
shred: file.txt: passagem 1/4 (random)...
shred: file.txt: passagem 2/4 (random)...
shred: file.txt: passagem 3/4 (random)...
shred: file.txt: passagem 4/4 (000000)...
shred: file.txt: removendo
shred: file.txt: renomeado como 00000000
shred: 00000000: renomeado como 0000000
shred: 0000000: renomeado como 000000
shred: 000000: renomeado como 00000
shred: 00000: renomeado como 0000
shred: 0000: renomeado como 000
shred: 000: renomeado como 00
shred: 00: renomeado como 0
shred: file.txt: removido
{% endhighlight %}

---

Muito bom, né?! Para mais informações acesse a ajuda e o manual:
{% highlight bash %}
shred --help
man shred
{% endhighlight %}

---

# Links úteis
+ <https://www.gnu.org/software/coreutils/>
+ <https://www.freebsd.org/cgi/man.cgi?query=gshred&manpath=FreeBSD+12-current>




