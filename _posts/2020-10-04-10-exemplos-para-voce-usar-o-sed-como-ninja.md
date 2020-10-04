---
layout: post
title: "10 EXEMPLOS para você usar o Sed como NINJA"
date: 2020-10-04 19:43:31
image: '/assets/img/sed/sed-10-dicas.jpg'
description: 'Sed é o mesmo que Stream EDitor ou editor de fluxo em sistemas tipo UNIX. No Linux a versão do editor é o GNU Sed com alguns recursos extras.'
icon: 'cib:gnu'
iconname: 'sed'
tags:
- sed
- gnu
- regex
- comandos
---

![10 EXEMPLOS para você usar o Sed como NINJA](/assets/img/sed/sed-10-dicas.jpg)

Sed é o mesmo que Stream EDitor ou editor de fluxo. Muito utilizado nos sistemas tipo Unix. No Linux a versão do editor é o GNU Sed com alguns recursos extras.

# Assista ao Vídeo

<iframe width="1234" height="694" src="https://www.youtube.com/embed/vduHKQRPwEQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

### Lista dos comandos
+ **01.** Exibir ou remover somente a última linha
```sh
sed '$!d' file.txt # Somente a última linha
sed '$ d' file.txt # Tudo mesno a última linha
```
+ **02.** Inserir em uma linha específica
```sh
sed -i '1i\LINHA X' file.txt
```
+ **03.** Trocando quebra de linha por espaço
```sh
sed ':a;$!N;s/\n/ /g;ta' file.txt
```
+ **04.** Usando outros caracteres de substituição
```sh
sed 's@//@/@g' file.txt
# Ou
sed 's|//|/|g' file.txt
```
+ **05.** Converter um hiperlink HTML para Markdown
```sh
sed -r 's@<a href=\"(.*)\">(.*)</a>@[\2](\1)@' file.txt
```
+ **06.** Casando strings com `&`
```sh
sed 's/.*/&-&/g' palavras.txt' file.txt
```

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


+ **07.** Alterar a linha subsequente
```sh
sed 'N;s/\n/\t/' file.txt
```
+ **08.** Alterar determinadas linhas
```sh
sed 's/x$/CONTENT/g' file.txt
```
+ **09.** Convertendo de Minúsculas para Maiúsculas
```sh
sed 's/.*/\U&/g' file.txt
```
+ **10.** Convertendo somente determinados caracteres de uma string
```sh
sed 's/^./\L&/3' file.txt
```
> Transforma o 3º caracterer em minúscula.

# Quer aprender mais sobre Sed e Expressões Regulares ?
### Curso Completo de Sed Editor de Fluxo: <https://terminalroot.com.br/sed/>
### Curso de Sed na Udemy: <http://bit.ly/sed-curso>
### Curso Completo de Expressões Regulares: <https://terminalroot.com.br/regex/>
### Curso de Regex na Udemy: <http://bit.ly/regex-udemy>

Veja também:
+ [30 exemplos do comando Sed - com Regex](https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html)


