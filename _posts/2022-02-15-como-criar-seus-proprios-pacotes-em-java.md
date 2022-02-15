---
layout: post
title: "Como criar seus próprios pacotes em Java"
date: 2022-02-15 10:15:40
image: '/assets/img/java/pacote.jpg'
description: 'Um pacote em Java é usado para agrupar classes . Nesse tutorial vamos ver como criar e adicionar múltiplas classes .'
icon: 'ion:terminal-sharp'
iconname: 'Java'
tags:
- java
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Já sabemos que o [Java](https://terminalroot.com.br/tags#java) possui pacotes da [sua API](https://docs.oracle.com/javase/8/docs/api/) e geralmente importamos classes do pacote `java.util` .

Nesse tutorial vamos mostrar como você criar seus próprios pacotes no: [GNU](https://terminalroot.com.br/tags#gnu)/[LINUX](https://terminalroot.com.br/linux), [\*BSD](https://terminalroot.com.br/tags#bsd), [macOS](https://terminalroot.com.br/tags#macos) e no [WSL/Windows](https://terminalroot.com.br/tags#windows) e importá-los para seus próprios projetos .

---

# Criando um pacote básico
Suponhamos que você crie uma classe com um único método e deseja disponibilizá-lo para quem quiser importar:
> `vim MinhaClasse.java`

Na primeira linha use a palavra reservada `package` seguido de espaço e o nome que você deseja para seu pacote, exemplo: `MeuPacote;` e depois crie sua classe com o(s) métodos que deseja compartilhar, exemplo `public void meuMetodo()`, que só retorna uma frase qualquer:
{% highlight java %}
package MeuPacote;

public class MinhaClasse {
  public void meuMetodo(){
    System.out.println("Esse é o meu pacote!");
  }
}
{% endhighlight %}

Agora vamos criar o diretório do pacote já com essa classe com o comando:
{% highlight sh %}
javac -d . MinhaClasse.java
{% endhighlight %}


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

Note que dentro do seu projeto(nesse caso: *sandbox*) agora há um diretório de nome `MeuPacote/` com os seguintes arquivos dentro e fora dele:
> [tree](http://mama.indstate.edu/users/ice/tree/) `sandbox/`
{% highlight sh %}
sandbox/
├── MeuPacote
│   └── MinhaClasse.class
└── MinhaClasse.java

1 directory, 2 files
{% endhighlight %}

Se quiser já podemos até remover o arquivo `sandbox/MinhaClasse.java` e agora o projeto(*sandbox*) só haverá um diretório e dentro dele um arquivo `MinhaClasse.java` que não foi o que removemos e sim o arquivo dentro do diretório MeuPacote:
{% highlight sh %}
sandbox/
└── MeuPacote
    └── MinhaClasse.class

1 directory, 1 file
{% endhighlight %}

Agora vamos importar nosso pacote em outro arquivo, um outro projeto que você esteja criando:
> `vim MeuPrograma.java`
{% highlight java %}
import MeuPacote.MinhaClasse;

public class MeuPrograma {
  public static void main(String[] args) {
   MinhaClasse obj = new MinhaClasse();
   obj.meuMetodo();
  }
}
{% endhighlight %}

Ou seja, ao instanciar a classe do pacote e chamar o método, o mesmo é executado com sucesso:
{% highlight sh %}
javac MeuPrograma.java
java MeuPrograma
{% endhighlight %}
> Possível e provável saída: `Esse é o meu pacote!` .

---

# Adicionando mais uma classe ao seu pacote
Vamos supôr que você tem uma nova classe e deseja adicionar ao seu pacote: `MeuPacote`
{% highlight java %}
package MeuPacote;

public class NovaClasse {
  public String novoMetodo(){
    String name = "Só para exemplo";
    return name;
  }
}
{% endhighlight %}

Agora rode:
{% highlight sh %}
javac -d . NovaClasse.java
{% endhighlight %}
> Se quiser depois de rodar o comando, remova o arquivo: `rm ./NovaClasse.java`

Agora no seu código `MeuPrograma.java` importe também essa classe `NovaClasse`:
{% highlight java %}
import MeuPacote.MinhaClasse;
import MeuPacote.NovaClasse;

public class MeuPrograma {
  public static void main(String[] args) {
   MinhaClasse obj = new MinhaClasse();
   NovaClasse obj2 = new NovaClasse();
   obj.meuMetodo();
   System.out.println(obj2.novoMetodo());
  }
}
{% endhighlight %}
> Após compilar e rodar a possível saída será:
{% highlight sh %}
Esse é o meu pacote!
Só para exemplo
{% endhighlight %}

Se quisésse importar todas as classes do seu pacote, basta usar: `import MeuPacote.*;`:
> `MeuPrograma.java`
{% highlight java %}
import MeuPacote.*;

public class MeuPrograma {
  public static void main(String[] args) {
   MinhaClasse obj = new MinhaClasse();
   NovaClasse obj2 = new NovaClasse();
   obj.meuMetodo();
   System.out.println(obj2.novoMetodo());
  }
}
{% endhighlight %}

---

# Links Úteis
+ <https://docs.oracle.com/javase/8/docs/api/>
+ <https://docs.oracle.com/javase/tutorial/java/package/packages.html>
+ <http://mama.indstate.edu/users/ice/tree/>



