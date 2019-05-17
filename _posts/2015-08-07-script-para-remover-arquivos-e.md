---
layout: post
title: "Script para remover arquivos e diretórios com segurança"
date: '2015-08-06T22:49:00.000-07:00'
image: '/assets/img/shell-script/remove.jpg'
description: "Muitas vezes perdemos arquivos ou diretórios que não queríamos excluir com o comando rm."
main-class: 'bash'
tags:
- Shell Script
- Dicas
- Terminal
- Comandos
---
![Script para remover arquivos e diretórios com segurança](/assets/img/shell-script/remove.jpg "Script para remover arquivos e diretórios com segurança")


Muitas vezes perdemos arquivos ou diretórios que não queríamos excluir com o comando rm. Muitos tem a ideia de usar um alias para o __rm__ e o __rm -rf__ ou só __rm -f__ para __rm -i__ , no entanto , mesmo depois de dizer sim , nos arrependemos de excluir. Logo , criei essa outra solução de mover para lixeira , aumentado ainda mais a possibilidade da desistência . Você pode criar um script com esse código , ou mesmo editar seu __.bashrc__ e incluir essa função junto com o __alias__ . Lembrando que quando criamos uma função dentro do __.bashrc__ , automaticamente ela virará também um comando , desta forma você pode usar , caso deseje , o comando remover em vez de __rm__ também.

## Primeiramente vou explicar cada linha

> No primeiro comando da função __remover()__, temos uma validação no caso do usuário ter usado qualquer opção: __-rf , -r , -f ,...__ Limpando a opção e pegando somente o arquivo , para isso usei o comando __shift__ , ou seja , o __$2__ (que é o arquivo ou o diretório , nesse caso) e passando para o __$1__.
{% highlight bash %}
if [ ! -f "$1" ] && [ ! -d "$1" ]; then
 shift
fi
{% endhighlight %}
 
> Logo depois temos declarações de variáveis , onde a origem será o arquivo "__$1__" e o destino o caminho da lixeira __/home/$USER/.local/share/Trash/files/__ e então movemos o arquivo para lixeira , caso posteriormente , deseje realmente excluir , esvaziar a lixeira ou só os arquivos/diretórios que deseje.
{% highlight bash %}
origem="$1";
destino="/home/$USER/.local/share/Trash/files/"; 
mv "$origem" "$destino";
echo "Movido para lixeira!";
{% endhighlight %}

> No final uma mensagem de interação só para lembrar de que não foi excluído!
Como disse , você pode editar seu __~/.bashrc__ e incluir no final do arquivo o código abaixo:
  
# Valeu!
