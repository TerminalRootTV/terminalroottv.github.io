---
layout: post
title: "10 códigos úteis de JavaScript #2"
date: 2016-12-21 20:15:17
image: '/assets/img/js-imgs/js.jpg'
description: "Comandos prontos pra copiar e colar!"
main-class: 'html'
color: '#de4508'
tags:
- javascript
twitter_text: "Alguns códigos simples de JavaScript #2"
introduction: "Comandos prontos pra copiar e colar!"
---

![Javascript Linux](/assets/img/js-imgs/js.jpg "JavaScript Linux") 

1 - Gerar um relógio em tempo real
{% highlight js %}


<script type="text/javascript">
function startTime()
{
var today=new Date();
var h=today.getHours();
var m=today.getMinutes();
var s=today.getSeconds();
// add a zero in front of numbers<10
m=checkTime(m);
s=checkTime(s);
document.getElementById('txt').innerHTML=h+":"+m+":"+s;
t=setTimeout('startTime()',500);

}

function checkTime(i)
{
if (i<10)
  {
  i="0" + i;
  }
return i;
}
</script>


<div id="txt">
<script type="text/javascript">document.write(startTime())</script>
</div>
{% endhighlight %}

2 - Inputs modificando após clique

{% highlight js %}
<input type="text" value="usuario" onblur="if(this.value == ''){ this.value='usuario';}" onfocus="if(this.value == 'usuario'){ this.value='';}"/>
<input value="senha" onblur="if(this.value == ''){ this.value='senha'; this.type='text';}" onfocus="if(this.value == 'senha'){ this.value=''; this.type='password';}"/>
{% endhighlight %}

3 - Pegar a URL

{% highlight js %}

<script>document.write(window.location.href);</script>

{% endhighlight %}

4 - Encontar uma palavra numa String (case sensitive)

{% highlight js %}

<script>
var str = 'Terminal Root';

if(str.match(/Root/)){
  document.write('Encontrou');
}else{
	document.write('Palavra Não Encontrada');
}
</script>

{% endhighlight %}

5 - Retirar os 5 últimos caracteres e adicionar uma nova palavra

{% highlight js %}

<script>
var str = 'Terminal Root';

var str = str.slice(0, -5)+' Bash';

document.write(str);

</script>

{% endhighlight %}

6 -Substituir palavra numa string

{% highlight js %}

<script>
var str = 'Terminal Root';
var str = str.replace("Root", "Linux");
document.write(str);
</script>

{% endhighlight %}

7 - Redirecionamento (tem que inciar com http://)

{% highlight js %}

<script>window.location = "http://www.terminalroot.com.br";</script>

{% endhighlight %}

8 - Abrir Pop-Up no Centro da Página

{% highlight js %}

<script>
	var win = null;
	function NovaJanela(pagina,nome,w,h,scroll){
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'location=no,toolbar=no,directories=no,status=no,height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable';
	win = window.open(pagina,nome,settings);
	}
</script>


<a href="http://www.terminalroot.com.br/" onclick="NovaJanela(this.href,'nomeJanela','820','560','yes');return false">Abrir Pop-Up</a>
{% endhighlight %}

9 - Mostrar a Data

{% highlight js %}

<script type="text/javascript">document.write(Date());</script>

{% endhighlight %}

10 - Atrasando o tempo

{% highlight js %}

<script type="text/javascript">

function timeMsg(){
	var t=setTimeout("alertMsg()",3000);
}

function alertMsg(){
	document.write("Terminal Root");
}

</script>


<a href="#" onClick="timeMsg()">Clique aqui a mensagem só aparecerá depois de 3 segundos</a>
{% endhighlight %}

# Consulte a parte #1 dos códigos JS simples/úteis

[Alguns códigos simples de JavaScript](http://terminalroot.com.br/2011/11/alguns-codigos-simples-de-javascript.html)

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

