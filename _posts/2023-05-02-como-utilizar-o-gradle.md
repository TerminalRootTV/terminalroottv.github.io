---
layout: post
title: "Como utilizar o Gradle"
date: 2023-05-02 13:17:14
image: '/assets/img/java/gradle.jpg'
description: 'Tem suporte para as linguagens de programação: C++, Java, Kotlin, JavaScript, Scala, Swift e Groovy.'
icon: 'ion:terminal-sharp'
iconname: 'Java'
tags:
- java
- cpp
- kotlin
- javascript
- scala
- swift
- groovy
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Gradle** é uma ferramenta de automação de compilação baseada em [Groovy](https://groovy-lang.org/). Tem suporte para diversas linguagens de programação: [C++](https://terminalroot.com.br/tags#cpp), [Kotlin](https://terminalroot.com.br/tags#kotlin), [JavaScript](https://terminalroot.com.br/tags#javascript), [Scala](https://terminalroot.com.br/tags#scala), [Swift](https://terminalroot.com.br/tags#swift) e [Groovy](https://terminalroot.com.br/tags#groovy).

---

# Instalação
Você pode usar o gerenciador de pacotes do seu sistema operacional para pesquisar e instalar, exemplos: [Windows](https://terminalroot.com.br/tags#windows)(`winget`, `choco`, ...), [macOS](`brew`), [GNU/Linux](https://terminalroot.com.br/tags#gnu)(`apt`, `pacman`, ...).

No entanto, caso queira instalar binários diretamente basta fazer o download da versão mais recente direto da [página de releases](https://gradle.org/releases/), descompactar, instalar, assim:
> Tomando como exemplo a versão mais atual de acordo com a data de publicação desse artigo: `8.1.1`.

{% highlight bash %}
wget https://downloads.gradle.org/distributions/gradle-8.1.1-bin.zip
sudo mkdir /opt/gradle
unzip -d /opt/gradle gradle-8.1.1-bin.zip
sudo ln -s /opt/gradle/gradle-8.1.1/bin/gradle /usr/local/bin/gradle
{% endhighlight %}

Após instalado verique se está tudo certo rodando o comando mais o argumento para obter a versão:
{% highlight bash %}
gradle --version
{% endhighlight %}

Para usuários Windows descompacte e mova para a unidade `C:/` e copie o caminho da pasta `C:\gradle-8.1.1\bin` e adicione às **Variáveis de Ambiente do Sistema**, depois abra o [Powershell](https://terminalroot.com.br/tags#powershell) ou [Windows Terminal]() até mesmo o `CMD` e rode o mesmo comando para ver a versão. 


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

# Utilização
O Gradle é escrito em Groovy e para rodarmos um *Hello, World!* básico, basta criarmos um arquivo de nome `build.gradle` e insirir o conteúdo abaixo:

{% highlight groovy %}
task hello {
  doLast {
   println 'Olá, Gradle!'
  }
}
{% endhighlight %}

Agora dentro do mesmo diretório que está o `build.gradle` no [terminal](https://terminalroot.com.br/tags#terminal) rode o comando:
{% highlight bash %}
gradle -q hello
{% endhighlight %}
> Ele carregará o processo e em seguida exibirá a mensagem: `Olá, Gradle!`.

Para mais informações sobre Groovy [veja a documentação](https://groovy-lang.org/).

---

# Compilando arquivos Java
Existem toda uma estrutura para o Gradle compilar seus projetos com Gradle, a maneira correta é:

#### 01. Crie um projeto novo e entre no mesmo:
{% highlight bash %}
mkdir hello
cd hello
{% endhighlight %}

Dentro do seu projeto rode o comando:
{% highlight bash %}
gradle init
{% endhighlight %}

Será iniciado o *Wizard* com várias perguntas, veja a saída abaixo para as respostas que eu passei: 
> Lembrando que algumas eu deixei em branco, logo foi respondida como a resposta padrão(`default`)

{% highlight bash %}
gradle init

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 2

Select implementation language:
  1: C++
  2: Groovy
  3: Java
  4: Kotlin
  5: Scala
  6: Swift
Enter selection (default: Java) [1..6] 3

Generate multiple subprojects for application? (default: no) [yes, no] 

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 

Select test framework:
  1: JUnit 4
  2: TestNG
  3: Spock
  4: JUnit Jupiter
Enter selection (default: JUnit Jupiter) [1..4] 

Project name (default: hello): 

Source package (default: hello): 

Enter target version of Java (min. 7) (default: 17): 

Generate build using new APIs and behavior (some features may change in the next minor release)? (default: no) [yes, no] 


> Task :init
Get more help with your project: https://docs.gradle.org/8.1.1/samples/sample_building_java_applications.html

BUILD SUCCESSFUL in 39s
2 actionable tasks: 2 executed
<-------------> 0% WAITING
> IDLE
{% endhighlight %}

Após isso vários arquivos e pastas foram criados incluindo o `./gradlew`(Um script em shell) e o `./gradlew.bat`(Um script em Batch). E é com eles(`gradlew` para Linux e macOS; e `gradlew.bat` para Windows) que iremos rodar nosso exemplo.

Mas antes de tudo vamos editar o arquivo dentro do nosso projeto no caminho:
> `vim app/src/main/java/hello/App.java`

E altere como quiser, exemplo:

{% highlight java %}
package hello;

public class App {
  public String getGreeting() {
    return "Exemplo básico Gradle Java!";
  }

  public static void main(String[] args) {
    System.out.println(new App().getGreeting());
  }
}
{% endhighlight %}

Agora você pode construir usando o `./gradlew build` ou `./gradlew.bat build`, mas se quiser construir e já rodar automaticamente rode o comando:

{% highlight bash %}
./gradlew run
{% endhighlight %}

A saída será similar será:
{% highlight bash %}
> Task :app:run
Exemplo básico Gradle Java!

BUILD SUCCESSFUL in 1s
2 actionable tasks: 2 executed
{% endhighlight %}

---

Para mais informações use o `gradle --help` e acesse: <https://gradle.org/>.



