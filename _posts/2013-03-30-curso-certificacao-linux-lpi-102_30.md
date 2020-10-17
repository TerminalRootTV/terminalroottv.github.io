---
layout: post
title: "Curso Certificação Linux LPI-102: Arquivos de LOG"
date: '2013-03-30T11:15:00.000-07:00'
image: '/assets/img/lpi/log.jpg'
description: "O Linux possui um serviço especial chamado syslog que faz todo o trabalho sujo de filtrar e gravar mensagens importantes"
tags:
- linux
- lpi
---

![Arquivos de LOG](/assets/img/lpi/log.jpg "Arquivos de LOG")

> O __Linux__ possui um serviço especial chamado __syslog__ que faz todo o trabalho sujo de filtrar e gravar mensagens importantes não só do sistema local, mas de outros sistemas que suportam o __syslog__.

Além de gravar em arquivos, as mensagens podem ser enviadas para a tela de console e telas de terminal. O arquivo de configuração __/etc/syslog.conf__ controla "__o que__" vai ser gravado é chamado de __facilidade__.As facilidades são na verdade a origem das mensagens.Cada facilidade possui __nível de severidade__.

## Verificar o logs no syslog
{% highlight bash %}
tail /var/log/syslog
{% endhighlight %}
 
## Facilidade do Syslog

* __° auth__ - Mensagens de segurança/autorização (privativas).
* __° authpriv__ - Mensagens de segurança/autorização (privativas).
* __° cron__ - Daemons de agendamento de tarefas (cron e at).
* __° daemon__ - Outros daemons do sistema que não possuem facilidades específicas.
* __° kern__ - Mensagens do Kernel
* __° lpr__ - Subsistema de impressão
* __° mail__ - Subsistema de e-mail
* __° news__ Subsistema de notícias da USENET
* __° syslog__ - Mensagens internas geradas pelo syslogd
* __° user__ - Mensagens genéricas de nível do usuário
* __° local0 até local7__ - Reservados para uso local por outros programas que desejem escrever seus logs no syslog.
 
## Níveis de Severidade


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


* __° debug (7)__ - Informações de debug (depuração)
* __° info (6)__ - Mensagens apenas para informação
* __° notice (5)__- Condições normais, mas significativas
* __° warning (4)__- Condições de alerta
* __° err (3)__ - Condições de erro
* __° crit (2)__ - Condições críticas
* __° alert (1)__ - Ações imediatas são requeridas
* __° emerg (0)__ - Sistema indisponível
 
Para cada facilidade podemos especificar um nível de severidade, que vai definir o grau de importância da mensagem.

O arquivo __/etc/syslog.conf__ possui o seguinte formato
 

> __facilidade.nivel ação__

 
## Ações do Syslog

A ação específica o que deverá ser feito com a mensagem.Pode ser um arquivo de __LOG__, um __PIPE__ (direcionado para um utilitário ou aplicativo) um outro sistema remoto, determinados usuários ou todos os usuários.
 
* __° Arquivo__ - As mensagens são gravadas em arquivos no sistema.
* __° PIPE__  - As mensagens são enviadas para um arquivo especial chamado file descriptor.
* __° Terminal e Console__ - Podemos especificar uma tela local do computador (console) através do caminho /dev/console ou um terminal remoto tty para onde as mensagens serão enviadas.
* __° Computador Remoto__ - Podemos enviar as mensagens do syslog para uma máquina remota precedendo a ação com o símbolo "@" seguido do nome do host.Em questões de segurança, enviar a mensagens para outra máquina pode ser especialmente importante.
* __° Usuários__ - Podemos especificar um determinado usuário ou uma lista de usuários (separados por vírgula) para onde as mensagens serão enviadas no terminal quando estes estiverem logados no sistema.



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


 
## Caracteres especiais

> Sempre use TBS ao invés de espaços.

> Os caracteres ("__*__", "__=__", "__!__" e "__-__") têm __funções especiais__.
 
Para visualizar o syslog
{% highlight bash %}
/etc/syslog.conf
{% endhighlight %}
 
A rotação dos arquivos de __LOG__ é feita no seu arquivo principal
{% highlight bash %}
cat /etc/logrotate.conf
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



