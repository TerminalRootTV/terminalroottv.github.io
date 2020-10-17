---
layout: post
title: "Resolvendo 'bad interpreter' no Bash"
date: '2014-09-25T16:59:00.003-07:00'
image: '/assets/img/bash/terminal.jpg'
description: "bad interpreter: No such file or directory"
tags:
- shellscript
- dicas
---

![Resolvendo "bad interpreter" no Bash](/assets/img/bash/terminal.jpg "Resolvendo 'bad interpreter' no Bash")

> Ao executar um script que você pegou ou baixou da internet, muitas vezes foi um script criado num ~~Windows~~ , ou baixou do *PasteBin*, e ao executá-lo, você recebe a seguinte mensagem:

{% highlight bash %}
./script.sh
bad interpreter: No such file or directory
{% endhighlight %} 

{% highlight bash %}
cat script.sh
#!/bin/bash
echo "oi"
{% endhighlight %} 


- Hein? Mas está tudo certo, eu tenho um /bin/bash, o que está acontecendo?

Bom, vamos ver mais de perto

{% highlight bash %}
cat -v script.sh # 'show nonprinting'
#!/bin/bash^M
echo "oi"^M
{% endhighlight %} 



Ahá! Tem um __^M__ no final das linhas atrapalhando.

- Mas o que é isso?

Muito provavelmente a origem desde script é uma maquina windows. A explicação é o caracter newline. O windows precisa de 2 caracteres para simbolizar o fim de uma linha em um arquivo texto puro, a dupla __\r\n__ , porém os __*nix__ não precisam do __\r__ que o cat gentilmente mostrou como um __^M__ . Este caracter a mais atrapalha o interpretador, que não recebe um __/bin/bash__ e sim __/bin/bash\r__ e isso realmente não existe.

Como resolver? Existem dois programas para este fim: __unix2dos__ e __dos2unix__ (as vezes aparecem como __unixtodos__ e __dostounix__) que convertem os finais de linha em casos como este. Se vc abrir um arquivo texto do __*nix__ em um bloco de texto vai ver todas as quebras de linha substituidas por um quadrado preto e todas as linhas em uma só.

Caso vc não tenha um programa conversor, pode usar o SED

{% highlight bash %}
sed -i 's/\r$//' script.sh
./script.sh
oi
{% endhighlight %}



> O tr também poderia ser usado, mas não é tão amigável.

{% highlight bash %}
tr -d '\r' < script.sh > novo_script.sh
{% endhighlight %}


Fonte: [http://peczenyj.blogspot.com.br/2007/07/resolvendo-problemas-comuns-2-bad.html](http://peczenyj.blogspot.com.br/2007/07/resolvendo-problemas-comuns-2-bad.html)



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



