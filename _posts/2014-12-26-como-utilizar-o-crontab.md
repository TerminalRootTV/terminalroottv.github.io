---
layout: post
title: "Como utilizar o Crontab"
date: '2014-12-26T09:15:00.002-08:00'
image: '/assets/img/linux/crontab.jpg'
description: "O __cron__ é um programa de agendamento de tarefas."
tags:
- linux
- gnu
- lpi
---
![Como utilizar o Crontab](/assets/img/linux/crontab.jpg "Como utilizar o Crontab")

> O __cron__ é um programa de “agendamento de tarefas”. Com ele você pode programar para ser executado qualquer coisa numa certa periodicidade ou até mesmo em um exato dia, numa exata hora. Um uso bem comum do cron é o agendamento de tarefas administrativas de manutenção do seu sistema, como por exemplo, procura por links simbólicos quebrados, análise de segurança do sistema, backup, entre outros. Estas tarefas são programadas para todo dia, toda semana ou todo mês, serem automaticamente executadas através do crontab e um script shell comum. A configuração do cron geralmente é chamada de crontab.

Para configurar um crontab por usuário, utiliza-se o comando “crontab“, junto com um parâmetro, dependendo do que você quiser fazer. Abaixo uma relação.

<table border="1"><tbody>
<tr>    <th>Comando</th> <th>Função</th>  </tr>
<tr>    <td style="color: blue;">crontab -e</td> <td><i>Edita(ou cria) o crontab atual do usuário</i></td>   </tr>
<tr>     <td style="color: blue;">crontab -l</td><td><i>Exibe o atual conteúdo do crontab do usuário</i></td>   </tr>
<tr>     <td style="color: blue;">crontab -r</td> <td><i>Remove o crontab do usuário</i></td>   </tr>
</tbody></table>

## Jogo da velha no começo da linha é comentário
{% highlight bash %}
+---------------- minuto (0 - 59)
|  +------------- hora (0 - 23)
|  |  +---------- dia do mês (1 - 31)
|  |  |  +------- mês (1 - 12)
|  |  |  |  +---- dia da semana (0 - 7) (Domingo=0 or 7)
|  |  |  |  |
*  *  *  *  *  Comando para executar
{% endhighlight %}

> __^O(crtl+shift+O)__ para salvar, isso abaixo é exibido ao criar/editar um novo crontab, no rodapé.

Você irá ser perguntado onde salvar e o nome do crontab, exemplo de um padrão abaixo

{% highlight bash %}
Nome do Arquivo para Gravar: /tmp/crontab.vPSLto/crontab
{% endhighlight %}

Isso pode ser editado conforme sua necessidade, então é só apertar __ENTER__ e __Sair__ em seguida: __^X__
{% highlight bash %}
^G Ajuda ^O Gravar ^R Ler o Arq ^Y Pág Anter ^K Recort Txt ^C Pos Atual
^X Sair ^J Justificar ^W Onde está? ^V Próx Pág ^U Colar Txt ^T Para Spell
{% endhighlight %}

Nesse exemplo o Crontab está agendado para criar o arquivo (__arquivo_crontab.txt__) no dia __22 Nov(11) às 00:11hs numa terça-feira(2)__
{% highlight bash %}
11 00 22 11 2 touch /home/marcos/arquivo_crontab.txt
{% endhighlight %}

Nesse exemplo o Crontab está agendado para criar o arquivo (__arquivo_crontab.txt__) de __1 em 1 min das 0hs as 2hs todos os dias do mês, todos os meses e todos os dias da semana(* em minto quer dizer de 1 em 1 minuto, e para demais campos significa TODOS)__
{% highlight bash %}
* 0-2 * * * touch /home/marcos/arquivo_crontab.txt
{% endhighlight %}

Para especificar "ou", utilize uma vírgula, mesmo exemplo que nas __14 ou 16hs__.
{% highlight bash %}
* 14,16 * * * touch /home/marcos/arquivo_crontab.txt
{% endhighlight %}

Neste exemplo, vamos criar todos os dias porém de __5 em 5 min(verifique a divisão)__
{% highlight bash %}
00-59/5 * * * * touch /home/marcos/arquivo_crontab.txt
{% endhighlight %}

Por padrão, o crontab enviará um email à conta que o carrega se existe alguma saída no comando. Para cancelar o __email do crontab__, redirecione a saída para outro lugar. Por exemplo, para __/dev/null__
{% highlight bash %}
00 2 * * * python2.4 /home/usuario/script.py>/dev/null 2>&1
{% endhighlight %}

Para __VER seu Crontab é só usar no terminal
{% highlight bash %}
crontab -l
{% endhighlight %}

Para APAGAR seu Crontab é só usar no terminal
{% highlight bash %}
crontab -r
{% endhighlight %}

Bem é isso, agora é só adequar a sua necessidade!

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

