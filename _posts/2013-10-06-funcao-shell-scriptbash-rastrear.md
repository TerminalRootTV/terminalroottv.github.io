---
layout: post
title: "Função Shell Script(Bash): Rastrear objetos via Correios"
date: '2013-10-06T13:51:00.002-07:00'
image: '/assets/img/shell-script/correios-shell.jpg'
description: "Verificar andamento do processo de um objeto pelos Correios"
main-class: 'bash'
tags:
- Shell Script
- SED
---

![Função Shell Script(Bash): Rastrear objetos via Correios](/assets/img/shell-script/correios-shell.jpg "Função Shell Script(Bash): Rastrear objetos via Correios")

Verificar andamento do processo de um objeto pelos Correios

> Veja o CABEÇALHO DO CÓDIGO  e os COMENTÁRIOS para entendimento do Script/Função

## Código

{% highlight bash %}
#!/bin/bash
# --------------------------------------
# ./rastreamento.sh
#
# Função Shell Script(Bash): Rastrear objetos via Correios.
#
# Uso: ./rastreamento.sh [código da encomenda]
#
# Ex.: ./rastreamento.sh DI781874650BR
#
# Autor: Marcos da B. M. Oliveira , http://www.terminalroot.com.br/
# Desde: Dom 06 Out 2013 17:34:05 BRT 
# Licença: GPL
# --------------------------------------
rastreamento(){
url='http://websro.correios.com.br/sro_bin/txect01$.QueryList'
# imprime em amarelo
echo -e "\033[1;33m"
for codigo
 do
  # baixa a url
  lynx -source "$url?P_LINGUA=001&amp;P_TIPO=001&amp;P_COD_UNI=$codigo" |
  
  # deixa só as linhas que contém a string rowspan (que contém os dados do rastreamento), as demais são apagadas
  sed '/rowspan/!d' | 
  
  # substitui tudo entre  por espaço em branco
  sed 's// /g' |
  
  # insere o texto abaixo na primeira linha
  sed -e "1s/^/\n\nO RASTREAMENTO DO SEU OBJETO $1 É:\n\n/" |
  
  # limpa todas as tags e imprime uma linha em branco com echo
  sed -e 's/]*>//g' &amp;&amp; echo
  
  
 done
 
# finaliza a cor
echo -e "\033[0m"
}
rastreamento $1
{% endhighlight %}

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

