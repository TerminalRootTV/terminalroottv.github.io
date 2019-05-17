---
layout: post
title: "Curso Certificação Linux LPI-1: Documentação e Notificação de Usuários"
date: '2012-09-02T13:51:00.000-07:00'
image: '/assets/img/lpi/doc.jpg'
description: "O Linux já representa um mercado anual de mais de 18 bilhões de dólares e, de acordo com especialistas, deve atingir um patamar superior a 50 bilhões."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Blog Linux](/assets/img/lpi/doc.jpg "Blog Linux")
 
O [Linux](http://www.terminalroot.com.br/tags#linux) já representa, hoje, um mercado anual de mais de __18 bilhões de dólares__ e, de acordo com especialistas, deve atingir um patamar superior a __50 bilhões__ em menos de três anos. Além disso, cerca de 50% dos departamentos de TI das empresas já usam Linux e [Open Source](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=open source) em suas áreas mais importantes.
 
O __LPI__ certifica profissionais de Linux em 3 níveis: __LPIC-1__, __LPIC-2__ e __LPIC-3__, cada uma com duas provas. O LPI conta cerca de 40.000 profissionais certificados no mundo todo, e o Brasil participa com cerca de 5 a 6% deste total. Em nosso país, a certificação profissional está crescendo e ganhando corpo à medida que as empresas estão percebendo tal importância nos processos de recrutamento, seleção e promoção. Os empregados já sentem que a certificação profissional aumenta a empregabilidade e, consequentemente, o reconhecimento profissional.
 
## Documentação

Se há algo de que os entusiastas e profissionais envolvidos com [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux) não podem reclamar é a oferta de documentação oferecida pela maioria dos programas desenvolvidos para o sistema. São milhares de páginas explicando minuciosamente cada aspecto da configuração do sistema, englobando desde um simples comando para lidar com arquivos de texto até um complexo servidor de email.
 
Algumas definições sobre termos usados para documentação são necessárias
 
- HOWTOs (Documentos complementares)
- Man (Manuais)
- Info (Documentação pela Free Software Foundation para o GNU)
- FAQ (Frequently Asked Questions - Perguntas Mais Frequentes)
- Mailing Lists (Listas de discussão)
- LDP (Linux Documentation Project)

## O diretório

{% highlight bash %}
/usr/share/doc
{% endhighlight %}

possui grande parte da documentação de uma distribuição Linux e diversos 
aplicativos na forma de HOWTOs, FAQs, arquivos README, HELP, guias de instalação e manuais de usuários.

## Exemplos

{% highlight bash %}
info test
man passwd
man 5 passwd #exibe o manual do arquivo /etc/passwd
ls --help
{% endhighlight %}


## Os comandos

{% highlight bash %}
#procura por programas e comandos através da descrição
apropos
{% endhighlight %}

e

{% highlight bash %}
# procura pelo comando no manual e retorna sua breve descrição
whatis
{% endhighlight %}

### Podemos também procurar por ajuda na Internet, nos links

+ [www.tdlp.org](www.tdlp.org)
+ [www.linux.org](www.linux.org)
+ [www.counter.li.org](www.counter.li.org)
+ [www.metalab.unc.edu](www.metalab.unc.edu)

# Notificação de Usuários

> Serve para notificar os usuários sobre alguma situação especial do sistema, para esta tarefa são utilizados três arquivos

* __motd__
{% highlight bash %}
# utilizado para exibir mensagens para usuários após o login, seu conteúdo é texto e pode ser alterado com o vim
/etc/motd
{% endhighlight %}

* __issue__ 
{% highlight bash %}
# utilizado para exibir mensagens para usuários antes de efetuarem o login, também pode ser alterado com o vim
/etc/issue
{% endhighlight %}

* __issue.net__
{% highlight bash %}
# mesmo que o issue, porém para acessos remotos
/etc/issue.net
{% endhighlight %}

![Linux Blog](/assets/img/lpi/doc.jpg "Linux Blog")
