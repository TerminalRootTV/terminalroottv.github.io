---
layout: post
title: "Como Converter seu Shell Script em BASH para FISH"
date: 2021-11-22 12:12:16
image: '/assets/img/shell/bash-to-fish.jpg'
description: 'Com uma tabela comparativa que lhe ajudará a portar facilmente.'
icon: 'ion:terminal-sharp'
iconname: 'Shell Script'
tags:
- shellscript
- bash
---

![Como Converter seu Shell Script em BASH para FISH](/assets/img/shell/bash-to-fish.jpg)

Algumas pessoas gostariam realmente de migrar seus [shell scripts](https://terminalroot.com.br/shell) em [BASH](https://terminalroot.com.br/bash) para algum outro interpretador.

Apesar do [ZSH](https://terminalroot.com.br/2018/02/como-instalar-e-usar-o-shell-zsh-e-o-oh-my-zsh.html) ser o mais amado e o [BASH](https://terminalroot.com.br/tags#bash) o mais utilizado, o [FISH](https://terminalroot.com.br/2019/09/oh-my-fish.html) é o mais desejado! 😃 

A gente possui um conteúdo muito vasto sobre BASH, inclusive 2 cursos:
+ [Shell Script de Iniciante ao Avançado](https://terminalroot.com.br/bash)
> Que inclusive pretendo atualizar todos os vídeos ainda esse ano
+ [Shell Script Intensivo Avançado](https://terminalroot.com.br/bash)
+ [Artigos Sobre Bash](https://terminalroot.com.br/tags#shellscript)
+ [Videos sobre Bash](https://www.youtube.com/watch?v=sIYW_jYVfmY&list=PLUJBQEDDLNcmHrKy_1sjd98Md-bfmtQOL)

E entre outros por aqui no blog que são bem antigos, logo, não consigo encontrá-los por *tags*. Além de muitas outras coisas!!!

Sobre **FISH** possuimos esse vídeo: [Fish Shell, mais produtividade no seu Shell Script](https://www.youtube.com/watch?v=uCLmjMErXXU) e também esse artigo: [Instale o Oh My Fish no seu Linux ou Unix-like](https://terminalroot.com.br/2019/09/oh-my-fish.html).


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

Suponhamos que você possui o seguinte script em BASH:
> Um script que gera números randômicos entre 1 e 2 e obtém o elemento de um array de acordo com esse número e compara com uma variável declarada e definida.

### Em **BASH** :
> `nvim get.sh`

{% highlight bash %}
#!/usr/bin/env bash
var="Fish"
rand=$(( $RANDOM % 2 + 1 ))
vararr=("C++" "Bash" "Fish" "Python" "Lua")

verificar(){
  if [[ ${vararr[$rand]} == "${var}" ]]; then
    echo "São iguais, ${vararr[$rand]}!!! 'rand' é ${rand} ."
  else
    echo "'${var}' é diferente de '${vararr[$rand]}' porque 'rand' é $rand"
  fi
}

verificar

{% endhighlight %}
Rode como: `bash get.sh`

O mesmo script:
### Em **FISH** :
> `nvim get.sh`

{% highlight lua %}
#!/usr/bin/env fish
set var "Fish"
set rand (random 2 3)
set vararr C++ Bash Fish Python Lua

function verificar;
  if [ $vararr[$rand] = $var ];
    echo "São iguais, $vararr[$rand]!!! 'rand' é '$rand'"
  else 
    echo "'$var' é diferente de '$vararr[$rand]' porque 'rand' é $rand"
  end
end

verificar

{% endhighlight %}
> Rode como: `fish get.sh`

Dá pra complicar um poquinho, né?!

---

# Traduzindo seus scripts de BASH para FISH
A documentação do FISH oferece essa tabela comparativa que ajuda muito para você portar seus scripts. Eu dei uma incrementada em algumas coisas, mas a tabela por si só vai lhe ajudar muito, segue:


Ação | BASH | FISH | Observações
------------ | ---- | ---- | -------
Rodar um comando na Subshell | `"$(command)"` | `(command)` | ... 
Substituição de comando em uma string | `"foo bar $(command)"` | `"foo bar "(command)` | ... 
Substituição de processo | `command <(command)` | `command (command \| psub)` | ... 
Lógica AND entre comandos | `command1 && command2` | `command1; and command2` ou `command1 && command2` (FISH 3.0)| ...
Código de saída do último comando | `$?` | `$status` | ... 
Logica com NOT | `! command` | `not command` ou `! command` (FISH 3.0)| ... 
Obter o PID | `$$` | `$fish_pid` | antigamente `%self` (disponível a partir da versão 3.3.1)
Obter o último PID | `$!` | `$last_pid` | antigamente `%last`
Redirecionar para STDERR | `command 2>/dev/null` | `command 2>/dev/null`  | `command ^/dev/null` está desativado por padrão em 3.3.0, ainda pode ser reativado usando flags 
Anexar o STDERR para o STDOUT | `command 2>&1` | `command 2>&1` | ... 
Redirecionar para STDOUT | `command >/dev/null` | `command >/dev/null` | ... 
Rodar um comando na Subshell | `command &` | `command &` | ... 
Rodar comando definindo Variável de Ambiente | `VARIABLE=value command` | `VARIABLE=value command` | ...
Declarar uma variável | `foo=bar` | `set foo bar` | Por padrão, as variáveis BASH são globais, as variáveis FISH têm escopo de função 
Apagando uma variável | `unset foo` | `set -e foo` | ... 
Verificar se uma variável está definida | `[[ ${var+_} ]]` ou `[[ -v var ]]` (desde BASH 4.2) | `set -q foo` | ... 
Definindo uma função | `fn_name() {...}` | `function fn_name ... end` | ...
Verificar se uma função está definida | `typeset -f function >/dev/null` | `functions -q function` | ... 
Exportar uma variável | `export foo` | `set -x foo $foo` | `export` no FISH também já está disponível por questões de compatibilidade 
Exibir todos elementos de um array separados | `"${var[@]}"` | `$var` | O BASH faz a divisão de palavras novamente em uma matriz não citada, FISH não
Exibir todos elementos de uma array como 1 só | `"${var[*]}"` | `"$var"` | ... 
Remover elemento de um array | `unset foo[1]` | `set -e foo[2]` | ... 
Contar quantos elementos há em um array | `"${#var[@]}"` | `count $var` | ... 
Retornar o primeiro elemento do array | `"${var[0]}"` ou `$var` | `$var[1]` | No FISH, arrays começam a partir do **1**
`if` | `if CONDITION; then COMMAND; fi` | `if CONDITION; COMMAND; end` | Note que o FISH não usa o `then` e substitui o `fi` pelo `end` 
`for` | `for VAR in LIST; do COMMAND; done` | `for VAR in LIST; COMMAND; end` | ... 
`while` | `while CONDITION; do COMMAND; done` | `while CONDITION; COMMAND; end` | ... 
Passas argumentos para função | `$*`(Como somente `$1`) ou `$@`(Como `$1`, `$2`, ...) | `$argv` | ... 
Expansão de parâmetros | `foo=${bar-word}` | `set -q bar && set foo $bar \|\| set foo word`
Expansão de parâmetros | `foo=${bar:-word}` | `test -n $bar && set foo $bar \|\| set foo word`

---

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

## Referências e Dicas de Leitura
* <https://en.wikipedia.org/wiki/Comparison_of_command_shells>
* <http://hyperpolyglot.org/shell>
* <http://hyperpolyglot.org/unix-shells>
* <https://en.wikipedia.org/wiki/Command-line_interface#Command-line_interpreter>
* <http://www.robvanderwoude.com/command.php>
* <https://en.wikipedia.org/wiki/PowerShell#Comparison_of_cmdlets_with_similar_commands>
* <https://blogs.msdn.microsoft.com/powershell/2006/04/25/comparative-examples-in-msh-and-ksh/>
* <https://www.reddit.com/r/sysadmin/comments/30n5ib/is_powershell_really_this_bad/>
* <https://github.com/fish-shell/fish-shell/wiki/Shell-Translation-Dictionary>



