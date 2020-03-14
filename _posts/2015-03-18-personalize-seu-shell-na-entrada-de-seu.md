---
layout: post
title: "Personalize seu shell na entrada de seu logon"
date: '2015-03-18T18:15:00.000-07:00'
image: '/assets/img/shell-script/bin-bash.jpg'
description: "Você pode deixar seu Shell mais interessante e até mesmo deixar lembretes nele."
tags:
- linux
- dicas
- terminal
---
![Blog Linux](/assets/img/shell-script/bin-bash.jpg "Blog Linux")

> Você pode deixar seu Shell mais interessante e até mesmo deixar lembretes nele, basta você editar seu .bashrc:

Crie um script com __informações/lembretes/...__ que você deseja

## Exemplo
{% highlight bash %}
vi /home/$USER/saudacao.sh
{% endhighlight %}

### Dae você pode pôr algo assim

{% highlight bash %}
#!/bin/bash
clear #limpa a telafiglet Terminal Root #comandos para identificar o turno
hora=`date +%k`
if [ $hora -ge 6 ] && [ $hora -lt 12 ];then
TURNO="Bom Dia"; fi;
if [ $hora -ge 12 ] && [ $hora -lt 18 ];then
TURNO="Boa Tarde"; fi;
if [ $hora -ge 18 ] && [ $hora -lt 24 ];then
TURNO="Boa Noite!"; fi;
if [ $hora -ge 0 ] && [ $hora -lt 6 ];then
TURNO="Boa Noite!"; fi;
#cumprimentos
echo "$TURNO $USER Seja bem vindo a $HOSTNAME"
echo "Hoje são `date +%A` `date +%d` de `date +%B` de `date +%Y`"
echo "A hora atual é `date +%k:%M`"Salvá-lo e dar permissão de excução:
{% endhighlight %}

### Dê permissão de execução
{% highlight bash %}
chmod +x /home/$USER/saudacao.sh
{% endhighlight %}

Depois é só pôr no seu __.bashrc__
 {% highlight bash %}
vi /home/$USER/.bashrc
{% endhighlight %}

Após a última linha você deve pôr o __caminho do script__ que executará o  que você deseja (também pode pôr o comando ali mesmo), no entanto, é mais recomendável chamar um script externo.

{% highlight bash %}
/home/$USER/./saudacao.sh
{% endhighlight %}

Pronto, toda vez que você abrir o Shell, haverá tais informações!

> Obs.: no Script informado eu coloquei o [Figlet](http://www.terminalroot.com.br/2015/03/como-gerar-desenhos-de-nomes-pelo.html)

Post baseado em: http://www.vivaolinux.com.br/artigo/Personalize-seu-shell-na-entrada-de-seu-logon

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

