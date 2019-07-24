---
layout: post
title: 'Loop while na Linguagem C'
date: '2012-11-24T15:30:00.000-08:00'
image: '/assets/img/c/while_c.jpg'
description: 'Mais um ensinamento básico para fixação de Linguagem C'
main-class: 'c'
tags:
- Linguagem C
---

![Loop while na Linguagem C](/assets/img/c/while_c.jpg "Loop while na Linguagem C")

> Mais um ensinamento básico para fixação de Linguagem C

{% highlight c %}
#include <stdio.h>

//while básico.
int main(){
    int i = 0;
   
    while(i<=22){
        printf("%d\n",i);
        i++;
    }
   
//Enquanto vc não digitar a letra 'p' e pressionar ENTER o loop não para.
    char Ch;   
    Ch='\0';
    while(Ch != 'p'){
        scanf("%c", &Ch);
    }
    return(0);
}
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

