---
layout: post
title: "Bang.sh - Framework para Shell Script"
date: '2014-09-02T20:20:00.000-07:00'
image: '/assets/img/shell-script/bangsh.jpg'
description: "Iniciar uma aplicações em bash script geralmente é uma tarefa trabalhosa, mas o Bang.sh pode lhe ajudar."
main-class: 'bash'
tags:
- Shell Script
- Dicas
---

![Bang.sh - Framework para Shell Script](/assets/img/shell-script/bangsh.jpg "Bang.sh - Framework para Shell Script")

Iniciar uma aplicações em bash script geralmente é uma tarefa trabalhosa, mas o [Bang.sh](https://github.com/bellthoven/bangsh) pode lhe ajudar. O __framework__ , tentar trazer uma forma mais organizada de se programar em __Shell Script__ . Muitos dos scripts que são vistos por aí, acabam sendo códigos mal identados e confusos.

O framework está disponível num repositório no [GitHub](https://github.com/bellthoven/bangsh). Se você se sentir a vontade, pode contribuir ! Todas contribuições são bem vindas. __Se algum bug for encontrado, reporte!__ Assim poderemos tornar o framework mais estável e útil.

O uso dele é bem simples. Por hora, ainda não faz muitas coisas, mas já quebra o galho !
A funcionalidade mais importante dele agora é o parseador de parâmetros.

Vamos fazer um exemplo
{% highlight bash %}
#!/bin/sh
# app.sh
source ./bang.sh
# Help flag
bang_addflag --help "Show this help"
bang_addalias --help -h
# Message
bang_addopt --msg "Message to be printed!"
bang_addalias --msg -m
# Output
bang_addflag --stderr "Redirects the message to stderr"
bang_required_args "--msg"
bang_init "$@"
if bang_hasflag --help; then
 bang_show_usage
else
 bang_check_required_args
 msg="Your message is: $(bang_getopt --msg)"
 cmd="echo"
 bang_hasflag --stderr &amp;&amp; cmd="print_e"
 $cmd "$msg"
fi
{% endhighlight %}

No script acima são adicionadas 3 argumentos ao arquivo: 

+ --help ou -h, 
+ --msg ou -m
+ --strderr.

Veja agora o output segundo a combinação de alguns parâmetros

Sem argumentos, o programa deve verificar pelos argumentos requeridos
{% highlight bash %}
./app.sh
The program was aborted due an error:
Option '--msg' is required and was not specified
{% endhighlight %}

Mostrando o texto de ajuda automaticamente montado
{% highlight bash %}
./app.sh -h
{% endhighlight %}

### Ou
{% highlight bash %}
./app.sh --help
Showing script usage:
Options:
--msg|-m  (Required) Message to be printed!
Flags:
--help|-h Show this help
--stderr Redirects the message to stderr
{% endhighlight %}

Imprime a mensagem no __STDOUT__
{% highlight bash %}
./app.sh --msg "Hello World"
Your message is: Hello World
{% endhighlight %}

Imprime a mensagem no __STDERR__
{% highlight bash %}
./app.sh --msg "Hello World" --stderr 1>/dev/null
Your message is: Hello World
{% endhighlight %}

Além destas, há outras funções úteis, como o __bang_raise_error__ que dispara um erro (e mostra no __STDERR__) formatado com um padrão e dá __exit 2__.

> __bang_raise_error "Mensagem de erro"__

Há também a função para imprimir no __STDERR__.

> __print_e "Mensagem que irá para para o STDERR"__

Funções úteis como o __in_array e key_exists__ para se trabalhar com arrays.
{% highlight bash %}
A=(A B C)
in_array "B" "A" && echo "B está em \$A"
declare -A A=(["name"]="Gustavo Dutra")
key_exists "name" "A" && echo "name é chave de \$A"
{% endhighlight %}

# Por enquanto é isto! 

## Bons scripts! 

### Qualquer dúvida, pode comentar aqui !

Via: <http://gustavodutra.com>
