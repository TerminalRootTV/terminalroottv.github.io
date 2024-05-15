---
layout: post
title: "O que são os 3 pontos para métodos em Java?"
date: 2024-05-15 11:38:30
image: '/assets/img/java/var-args-java.jpg'
description: 'É importante para evitarmos sobrecargas de métodos.'
icon: 'ion:terminal-sharp'
iconname: 'Java'
tags:
- java
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Assim como em outras linguagens de programação: [C++](https://terminalroot.com.br/tags#cpp) e [C](https://terminalroot.com.br/tags#linguagemc), por exemplo, os três pontos (`...`) são usados na declaração de um método como parâmetro. 

Esses pontos permitem que NENHUM argumento seja passado, bem como vários argumentos sejam passados quando o método é chamado. Esses três pontos também são conhecidos como `var args`.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Exemplos
Suponhamos que você possui esse código abaixo com um método de nome `tresPontos` que retorna uma `String` e recebe também como `String` um `var args`:
{% highlight java %}
public class Code {

  public static String tresPontos(String...i){
    String frase = "";
    for (String s : i) {
      frase += s;
    }
    return frase;
  }

  public static void main(String[] args) {
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia"));
  }
}
{% endhighlight %}

Note que o método não especifica que recebe só 2 argumentos, mas nós passamos 2 argumentos e ela retorna a saída:
{% highlight bash %}
Resultado: Naquele dia
{% endhighlight %}

Se eu não passar argumentos ou passar mais que 2 ela entenderá normalmente, exemplo:
{% highlight java %}
public class Code {

  public static String tresPontos(String...i){
    String frase = "";
    for (String s : i) {
      frase += s;
    }
    return frase;
  }

  public static void main(String[] args) {
    System.out.println("Resultado: " + tresPontos());
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia"));
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia ", "eu estava"));
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia ", "eu estava ", "meio ansiosa."));
  }
}
{% endhighlight %}

A saída será:
{% highlight bash %}
Resultado: 
Resultado: Naquele dia
Resultado: Naquele dia eu estava
Resultado: Naquele dia eu estava meio ansiosa.
{% endhighlight %}

Podíamos ainda usar outro método, dessa vez do tipo `void` e que recebe `var args` do tipo `int`:
> Chamando: sem passar argumentos e com número variado de argumentos!

{% highlight java %}
public class Code {

  public static String tresPontos(String...i){
    String frase = "";
    for (String s : i) {
      frase += s;
    }
    return frase;
  }

  public static void tresPontosInt(int ... i){
    int soma = 0;
    for (int x : i) {
      soma += x;
    }
    System.out.println("A soma é: " + soma);
  }

  public static void main(String[] args) {
    System.out.println("Resultado: " + tresPontos());
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia"));
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia ", "eu estava"));
    System.out.println("Resultado: " + tresPontos("Naquele ", "dia ", "eu estava ", "meio ansiosa."));

    Code.tresPontosInt();
    Code.tresPontosInt(3);
    Code.tresPontosInt(3, 6);
    Code.tresPontosInt(0, 6, 3, 1, 9);
    Code.tresPontosInt(1, 2, 3, 4, 5, 6);
  }
}
{% endhighlight %}

Funcionará normalmente, além da saída do método dos `tresPontos()` ainda teremos:
{% highlight bash %}
A soma é: 0
A soma é: 3
A soma é: 9
A soma é: 19
A soma é: 21
{% endhighlight %}

---

Molezinha de entender, né?! 

Para mais informações acesse o [tópico da documentação oficial](https://docs.oracle.com/javase/tutorial/java/javaOO/arguments.html#varargs).



