---
layout: post
title: "10 Comandos Úteis ou Interessantes para Shell Script"
date: 2022-05-13 10:17:12
image: '/assets/img/bash/shell-bash.jpg'
description: 'Agilizar tarefas e renovar ideias!'
icon: 'ion:terminal-sharp'
iconname: 'Bash'
tags:
- shellscript
- bash
- gnu
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

No dia-a-dia utilizando o terminal às vezes esquecemos de algum comando que facilitará a extração de algum dados ou solução de algum problema. Ou quando queremos incrementar algum recurso diferente para algo que estamos fazendo.

Nesse artigo vamos conhecer alguns comandos úteis e/ou interessantes que podem nos ajudar de acordo com aquilo que desejamos!

---

# 01. Procurar um arquivo e já abrir assim que encontrá-lo
Caso você tenha esquecido onde guardou um arquivo ou um arquivo gerado pelo sistema e você deseja encontrá-lo e já abrir automaticamente o `-exec` pode lhe ajudar, exemplo:

{% highlight sh %}
find /var/log/ -name "app-2022-05-13.log" -exec nvim {} \;
{% endhighlight %}

Ou se quiser já removê-lo:
{% highlight sh %}
find Downloads/ -name "app-2022-05-13.log" -exec rm {} \;
{% endhighlight %}

Ou até mesmo copiá-lo para seu diretório pessoal
{% highlight sh %}
find Downloads/ -name "app-2022-05-13.log" -exec cp {} . \;
{% endhighlight %}

Eu uso esse bastante para [optimizar imagens](https://terminalroot.com.br/2017/11/como-optimizar-imagens-pelo-terminal.html) do site e entre outros
{% highlight sh %}
find /assets/img -name "*.jpg" -exec jpegoptim -f --size=42% {} . \;
{% endhighlight %}

---

# 02. Insira um relógio no canto superior esquerdo do terminal

{% highlight sh %}
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
{% endhighlight %}


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

# 03. Vim Bash
Já pensou em fazer um Mini [Vim](https://terminalroot.com.br/vim) digitar conteúdo direto no prompt ? 

{% highlight sh %}
PS2=" ";alias vim="cat <<:wq >> $1"
{% endhighlight %}

Após rodar o comando acima, basta criar seu arquivo com o comando `vim meu-arquivo.txt`, exemplo:

![Mini Vim Command](/assets/img/bash/minivim.png) 

---

# 04. Rode seu último comando rapidamente

{% highlight sh %}
!!
{% endhighlight %}
Se quiser rodar como `sudo`:
{% highlight sh %}
sudo !!
{% endhighlight %}
Essa é mágica por trás do comando [fuck](https://terminalroot.com.br/2019/09/the-fuck-o-comando-que-corrige-automaticamente-comandos-digitados-incorretamente.html) 😃 

---

# 05. Colunas Lado a lado
Suponha que você tem esse arquivo `meu-arquivo.txt` e deseja replicar em x vezes essa coluna lado à lado, basta usar o comando `paste`
{% highlight sh %}
Lorem ipsum
dolor sit a
met, qui mi
nim laborea
dipisicingm
inim sint c
illum sintc
onsecteturc
{% endhighlight %}

Agora crie 3 colunas dela
{% highlight sh %}
paste meu-arquivo.txt meu-arquivo.txt meu-arquivo.txt
{% endhighlight %}

Resultado:
{% highlight sh %}
Lorem ipsum	Lorem ipsum	Lorem ipsum
dolor sit a	dolor sit a	dolor sit a
met, qui mi	met, qui mi	met, qui mi
nim laborea	nim laborea	nim laborea
dipisicingm	dipisicingm	dipisicingm
inim sint c	inim sint c	inim sint c
illum sintc	illum sintc	illum sintc
onsecteturc	onsecteturc	onsecteturc
{% endhighlight %}

---

# 06. Filtrar só a primeira coluna
Ainda de acordo com o exemplo anterior, imagine que você quer o contrário, você tem um arquivo com várias colunas:
{% highlight sh %}
Lorem ipsum	Lorem ipsum	Lorem ipsum
dolor sit a	dolor sit a	dolor sit a
met, qui mi	met, qui mi	met, qui mi
nim laborea	nim laborea	nim laborea
dipisicingm	dipisicingm	dipisicingm
inim sint c	inim sint c	inim sint c
illum sintc	illum sintc	illum sintc
onsecteturc	onsecteturc	onsecteturc
{% endhighlight %}

E você deseja filtrar somente a primeira coluna, use o comando `colrm`

{% highlight sh %}
colrm 12 < meu-arquivo.txt

Lorem ipsum
dolor sit a
met, qui mi
nim laborea
dipisicingm
inim sint c
illum sintc
onsecteturc
{% endhighlight %}

---

# 07. Gerar uma senha forte rapidamente
Tá naquele site chato que toda hora diz que sua senha é *fraca* e não confia em geradores de senhas online ? Crie sua senha forte rapidamente com o comando abaixo:

{% highlight sh %}
date | md5sum | awk '{print $1}'
{% endhighlight %}
> [Conheça mais formas aqui](https://terminalroot.com.br/2019/12/gerar-senha-linux.html)

---

# 08. Descobrir o dia que você instalou sei sistema
Queria lembrar à quanto tempo seu sistema foi instalado? Basta rodar o comando abaixo:

{% highlight sh %}
stat -c %w /
{% endhighlight %}

---

# 09. Saber se seu sistema é 32 ou 64-bit
Essa é bem simples, mas pode ser usada de forma muito útil quando está desenvolvendo um [Shell Script](https://terminalroot.com.br/shell) .

{% highlight sh %}
getconf LONG_BIT
{% endhighlight %}

---

# 10. Simular digitação
E por final, um *teleprompter* no terminal, eu usei muito isso para narrar alguns textos que eu escrevia para o canal do youtube.

{% highlight sh %}
echo "Esse aqui é meu teleprompter, ele digita um caractere de cada vez" | pv -qL 10
{% endhighlight %}

---

# Quer ficar mais NINJA no terminal ?
Eu decidi atualizar todos os cursos de Terminal: Bash, Shell, Sed e Regex. Sendo que o de BASH vou regravar todos os vídeos e incrementar novas ideias e dicas exclusivas.

Então, criei uma promoção até os vídeos ficarem prontos, pois depois vou aumentar o valor. Se deseja, obter tudo por **R$ 79,90** ou cada um deles por preços abaixo do valor, corre lá!

Veja os valores de cada curso:

+ [Curso Intensivo de Shell Script Avançado](https://terminalroot.com.br/shell) :: **R$ 49,90**
+ [Curso de Shell Script do Iniciante ao Avançado](https://terminalroot.com.br/bash) :: **R$ 24,90**
+ [Curso Completo de Expressões Regulares](https://terminalroot.com.br/regex) :: **R$ 24,90**
+ [Curso Completo de Sed Editor de Fluxo](https://terminalroot.com.br/sed) :: **R$ 24,90**

## Valor do Pacote Completo
**R$ 74,90**
> Mais de 50 reais de desconto!

<a href="https://cutt.ly/temppromo" class="btn btn-success btn-lg btn-block">ADQUIRA AGORA</a>  


---


