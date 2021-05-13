---
layout: post
title: "Customize seu prompt facilmente"
date: 2021-05-13 09:16:34
image: '/assets/img/terminal/bash-prompt-generator.jpg'
description: 'Um serviço online que facilita a personalização da sua PS1.'
icon: 'ion:terminal-sharp'
iconname: 'Terminal'
tags:
- terminal
- bash
- shellscript
---

![Customize seu prompt facilmente](/assets/img/terminal/bash-prompt-generator.jpg)

Customizar o prompt é uma das coisas que todos os geeks adoram, deixar da forma que deseja vai além da organização!

Nós sabemos que há vários serviços que fazem isso pra gente e nós já publicamos diversos vídeos e artigos sobre isso, tais como:
+ [Conheça e Instale o Oh My Bash!](https://terminalroot.com.br/2019/05/conheca-e-instale-o-oh-my-bash.html)
+ [Instale o Oh My Fish no seu Linux ou Unix-like](https://terminalroot.com.br/2019/09/oh-my-fish.html)
+ [Como Instalar e Usar o Shell ZSH e o Oh My Zsh!](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html)
+ [6 Dicas Bem Interessantes para seu Shell Linux](https://www.youtube.com/watch?v=2IaQQ9MFYn0)

Só que as coisas estão ficando cada vez mais fácil, agora você pode customizar seu prompt online, isso mesmo!

Estou me referindo ao **Bash Prompt Generator** .

Trata-se de um serviço online onde você pode escolher somente com cliques quais itens você deseja que sejam exibidos na sua variável `$PS1`.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


Por exemplo, se quiser que seu prompt exiba:
+ Data
+ Hora(24H)
+ Versão do Bash
+ Número do comando

Basta clicar nas tags que estarão localizadas ao lado esquerdo da tela no site copiar o **Output**, exemplo:
{% highlight bash %}
PS1='\[\e[0m\]\d\[\e[0m\]\t\[\e[0m\]\v\[\e[0m\] ' 
{% endhighlight %}
> Exemplo de como ficará: ** Thu May 1309:26:005.0 **

E então colar no seu terminal e pra perdurar a customização, como já sabemos, só incluir no seu `~/.bashrc`:
{% highlight bash %}
echo "export PS1='\[\e[0m\]\d\[\e[0m\]\t\[\e[0m\]\v\[\e[0m\] '" >> ~/.bashrc
{% endhighlight %}

Você ainda pode incluir sua PS1 e customizar por lá mesmo!

O site é: <https://scriptim.github.io/bash-prompt-generator/>

Show, né?!

Inscreva-se no nosso <a href="https://terminalroot.com.br/newsletter" target="_blank" class="btn btn-danger btn-block">Receba novidades por e-mail!</a> para receber novidades sobre:
**C++, Sistemas Operacionais, Programação e Desenvolvimento Web**.

# T+!




