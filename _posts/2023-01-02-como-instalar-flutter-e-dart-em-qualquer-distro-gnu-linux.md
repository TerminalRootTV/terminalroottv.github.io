---
layout: post
title: "Como Instalar Flutter e Dart em Qualquer Distro GNU/Linux"
date: 2023-01-02 14:11:04
image: '/assets/img/dart/flutter-dart.jpg'
description: 'Flutter é um Framework/ToolKit e Dart um linguagem de script, ambos do Google.'
icon: 'ion:terminal-sharp'
iconname: 'Flutter/Dart'
tags:
- dart
- flutter
- programacao
- gnu
- linux
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# O que é o [Flutter](https://flutter.dev/)?
Flutter (denominado durante o desenvolvimento pelo codinome "*Sky*") é um kit de desenvolvimento de interface de usuário (UI toolkit e framework), de código aberto, criado pela empresa Google em 2015, baseado na linguagem de programação Dart, que possibilita a criação de aplicativos compilados nativamente, para os sistemas operacionais Android, iOS, Windows, Mac, Linux e, Fuchsia e Web.

Os principais componentes do Flutter incluem:
+ Linguagem de programação Dart
+ Flutter Engine
+ Biblioteca Foundation
+ Design-specific Widgets com implementações prontas para Android (Google Material) e iOS (Cupertino)

As principais vantagens do toolkit/framework:
+ Alta produtividade, proveniente de uma plataforma cruzada, você pode usar a mesma base de código para seu aplicativo iOS e Android. ...
+ Alta performance;
+ Desenvolvimento rápido;
+ Simplicidade;
+ Compatibilidade.

Os aplicativos Flutter são escritos na linguagem de programação Dart e fazem uso de muitos dos recursos mais avançados da linguagem.

---

# O que é o [Dart](https://dart.dev/)?

Dart (originalmente denominada Dash) é uma linguagem de script voltada à web desenvolvida pela Google. O objetivo da linguagem Dart foi inicialmente a de substituir a JavaScript como a linguagem principal embutida nos navegadores. Programas nesta linguagem podem tanto serem executados em uma máquina virtual quanto compilados para JavaScript.

Em novembro de 2013, foi lançada a primeira versão estável, Dart 1.0. Em agosto de 2018 foi lançado o Dart 2.0, um reboot da linguagem, otimizado para o desenvolvimento client-side para Web e dispositivos móveis.


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

# Instalação
> O Dart SDK é fornecido com o Flutter; não é necessário instalar o Dart separadamente. O SDK do Flutter inclui o SDK do Dart completo e possui o comando `dart` .

## 01. Faça o download do pacote que há tudo(`flutter` e `dart`):
> Verifique [aqui](https://docs.flutter.dev/get-started/install/linux) se há uma versão mais recente!

{% highlight bash %}
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.10-stable.tar.xz
{% endhighlight %}

## 02. Extraia o pacote:
{% highlight bash %}
tar xf flutter_linux_3.3.10-stable.tar.xz
{% endhighlight %}

## 03. Mova para o diretório opcional:
{% highlight bash %}
sudo mv flutter/ /opt/
{% endhighlight %}

## 04. Exporte o `bin/` do Flutter para sua `$PATH`:
{% highlight bash %}
echo 'export PATH="${PATH}:/opt/flutter/bin"' | sudo tee -a /etc/profile
source /etc/profile
{% endhighlight %}

## 05. Teste os comandos: `flutter` e `dart`:
{% highlight bash %}
flutter --version
dart --version
{% endhighlight %}

---

# Criando um [Hello, World!](https://terminalroot.com.br/tags#programacao) em Dart
Crie um arquivo com o nome que você desejar e extensão: `.dart`, exemplo: `vim main.dart` e insira o conteúdo abaixo:

{% highlight dart %}
void main(){
  print("Hello, World!");
}
{% endhighlight %}

Para rodar o código:
{% highlight bash %}
dart main.dart
{% endhighlight %}

Para compilar e executar o binário:
{% highlight bash %}
dart compile exe main.dart -o hello
./hello
{% endhighlight %}


<!-- RECTANGLE LARGE -->
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

---

# Criando um [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) com Flutter
> <https://docs.flutter.dev/reference/flutter-cli>

{% highlight bash %}
flutter create my_app
cd my_app
flutter run
{% endhighlight %}

Existem várias formas de exibir, leia as saídas, no entanto, a mais simples é usando [Google Chrome](https://terminalroot.com.br/tags#chrome). Se o `flutter run` não listar essa opção, faça assim:
> Exemplo do caminho do binário do Google Chrome no [Gentoo](https://terminalroot.com.br/tags#gentoo).

{% highlight bash %}
CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export CHROME_EXECUTABLE
{% endhighlight %}

Para mais praticidade, adicione isso ao seu `/etc/profile`
{% highlight bash %}
echo 'CHROME_EXECUTABLE=/usr/bin/google-chrome-stable' | sudo tee -a /etc/profile
echo 'export CHROME_EXECUTABLE' | sudo tee -a /etc/profile
source /etc/profile
{% endhighlight %}
> Quando você roda o comando `flutter doctor`, ele descreve isso!

É um aplicativo que você clica no botão `+` e ele soma/adiciona à contagem:

![Flutter App Count Hello World](/assets/img/dart/fluuter-app.png) 


O arquivo para editar é: `./my_app/vim lib/main.dart`

Se você escolher a opção 1(precisa ter o `clang` e `gtk` instalado), abrirá em uma nova janela, como no exemplo abaixo:

[![Flutter/Dart Gentoo BSPWM](/assets/img/dart/flutter-dart-gentoo-bspwm.png)](/assets/img/dart/flutter-dart-gentoo-bspwm.png)

---

Alternativamente você pode usar o [snapd](http://snapcraft.io/) para instalar:
{% highlight bash %}
sudo snap install flutter --classic
{% endhighlight %}
> Apesar de nativo para o [Ubuntu](https://terminalroot.com.br/tags#ubuntu), está disponível para diversas distros! 
> 
> Por exemplo no Gentoo: `emerge snapd`.

---


<!-- RECTANGLE 2 - OnParagragraph -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

+ <https://docs.flutter.dev/get-started/install/linux>
+ <https://dart.dev/get-dart>
+ <https://pt.wikipedia.org/wiki/Flutter>
+ <https://pt.wikipedia.org/wiki/Dart_(linguagem_de_programação)>

