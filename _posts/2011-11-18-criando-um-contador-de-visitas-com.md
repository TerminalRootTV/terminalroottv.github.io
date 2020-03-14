---
layout: post
title: 'Criando um Contador de Visitas com Cookie'
date: '2011-11-17T18:39:00.000-08:00'
description: 'Nesse exemplo setamos um cookie no computador do usuário pra controle, o cookie existirá até ele fechar o navegador.'
tags:
- php
---

Nesse exemplo setamos um __cookie__ no computador do usuário pra controle, o __cookie__ existirá até ele fechar o navegador.

Bem verifique o exemplo e leia os comentários para entender o funcionamento, lembrando que você também pode usar sessões(__$_SESSION['sessao']__) ao invés de __$_COOKIE['nomedocookie']__, e dará no mesmo, vai do seu gosto, lembrando que alguns testes que eu fiz com sessão, teve alguns informações errôneas.

## contador.php
{% highlight php %}
<?php
 /* variavel para informar o nome do cookie*/
 $nome = 'contadordevisitas';
 /* o valor do cookie */
 $valor = 'marcospinguim';
 /* o arquivo TXT que armazenará o número de visitantes */
 $arquivo = 'mp_visitas.txt';
 /* o número de visitantes, pega os dados que estão gravados no TXT em inteiro(pra não haver erro)*/
 $conta = intval(file_get_contents($arquivo));
 /* se não houver um cookie gravado preparamos pra gravar ele */
 if(!isset($_COOKIE[$nome])){
  /*bool setcookie ( string $nome [, string $valor [, int $expira [, string $caminho [, string $domínio [, bool $seguro [, bool $somente http ]]]]]] )*/
  
 /* dados a ser informados nesse cookie: setcookie('nomedocookie', 'valordocookie', 'tempopraexpirar', 'caminhodocookie'), quando  o tempo pra expirar decidimos em 0, só expirará quando o navegador for fechado */
  
 setcookie($nome,$valor,0,'/');
 /* modo de gravação no TXT, +r é pra escrever */
 $modo = 'r+';
 /* abrir o arquivo */
 $abrir = fopen($arquivo, $modo);
 /* perceba que $conta aqui ta com +1, pois como não havia cookie aumentamos, pois é mais 1 usuario */
 $conta = intval(file_get_contents($arquivo)) + 1;
 /* gravamos com o novo valor de $conta */
 fwrite($abrir, $conta);
 /* fechamos o arquivo */
 fclose($abrir); 
 /* confirmamos o valor do cookie */
 $_COOKIE['marcospinguim'] = TRUE;
 } 
 /* imprimimos a $conta atualizada ou não */
echo 'Visitaram '; 
?>
{% endhighlight %}

## Pronto, eu acredito que seja fácil e eficiente!

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

