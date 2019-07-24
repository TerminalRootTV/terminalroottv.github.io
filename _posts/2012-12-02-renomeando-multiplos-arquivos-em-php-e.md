---
layout: post
title: "Renomeando múltiplos arquivos em PHP e Shell Script"
date: '2012-12-02T11:05:00.000-08:00'
image: '/assets/img/shell-scripit/arquivos-php-shell.gif'
description: "Veja o código que é uma mesclagem de PHP e Shell"
main-class: 'bash'
tags:
- Shell Script
- PHP
---

![Renomeando múltiplos arquivos em PHP e Shell Script](/assets/img/shell-scripit/arquivos-php-shell.gif "Renomeando múltiplos arquivos em PHP e Shell Script")

> Veja o código que é uma mesclagem de PHP e Shell

{% highlight php %}
<?php
/* damos um valor incial ao i para renomear os arquivos numerados no loop */
$i = 1;
	/* Iniciamos o loop foreach para listar os arquivos utilizando a função glob() */
	foreach (glob("*.*") as $arquivo) {
	/* utilizamos a função substr() para não mexermos na extensão do arquivo */
	$ext = substr($arquivo, -4);
		/* criamos uma condição para caso que as extensões forem maior que 3 letras e um ponto, ex.: jpeg, java... */
		/* Ou seja na renomeação se for maior que 3 letras o arquivo.jpeg, ficaria arquivojpeg, o (.) seria substituido, 
		logo, se a função strchr não encontrar o (.) no arquivo é que ele foi substituído, então quer dizer que o extensão
		 provavelmente foi maior que 3 letras, há outras formas de fazer isso, essa eu achei melhor */
		if(!strchr($ext, ".")){
			$ext = substr($arquivo, -5);
		}
		/* incluir aqui os arquivos que vc não deseja renomear, pus esse 3 como exemplo */
		if($arquivo == "index.php" || $arquivo == "backup.php" || $arquivo == "renomear.php"){
			//nao faça nada
		}else{
			/* utilizamos a função rename para renomear em numeração */
			rename($arquivo, $i++.$ext);			
		}
		
	}
	/* rodando os comandos acima, após ler esta parte, informa que os arquivos foram renomeados */
	echo "Renomeados!\n";
?>
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

