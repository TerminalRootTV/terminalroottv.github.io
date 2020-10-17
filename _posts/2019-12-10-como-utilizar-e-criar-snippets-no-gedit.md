---
layout: post
title: "Como Utilizar e Criar Snippets no Gedit"
date: 2019-12-10 09:19:56
image: '/assets/img/gedit/gedit-snippets.jpg'
description: 'Essa será a semana do Gedit #GeditWeek , atendendo à pedidos. 📖️'
tags:
- gedit
- editor
- cpp
---

![Como Utilizar e Criar Snippets no Gedit](/assets/img/gedit/gedit-snippets.jpg)

Um **snippet** é um *trecho* de código que é ativado por atalhos de teclado ou por uma sequência de letras. São muito úteis para tornar as tarefas com menos trabalhos, ou seja, ao em vez de digitar: `std::cout << "Messagem" << '\n';` , basta você escrever: `cout` e depois pressionar a tecla **[TAB]** que tudo será completado como uma mágica!

Você pode usar para qualquer linguagem ou tipo de textos que você queira, nesse caso vamos mostrar em 4 passos, como usar e criar um snippet para C++.

## 1. Acesse as preferências do Gedit

![Preferências do Gedit](/assets/img/gedit/preferencias.png)

Ou

![Preferências do Gedit](/assets/img/gedit/preferencias-right.png)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Instalação
O [Gedit](https://wiki.gnome.org/Apps/Gedit) já está disponível na maioria dos sistemas que possuem o [GNOME](https://gnome.org/) instalado, mas caso você não esteja usando o GNOME ou se não possui já instalado, use o gerenciador de pacotes da sua distribuição para instalar, exemplos:
> Nesse caso vamos instalar também o pacote gedit-plugins para que tenha alguns recursos disponíveis

{% highlight bash %}
emerge gedit gedit-plugins # Gentoo, Funtoo,...
sudo apt install gedit gedit-plugins # Debian, Ubuntu, Linux Mint, ...
sudo pacman -S gedit gedit-plugins # Arch Linux, Manjaro,...
{% endhighlight %}

## Utilizando snippets pré instalados
Se você criar um arquivo exemplo de nome: `teste.cpp` , SALVE , FECHE o Gedit e abra novamente esse arquivo, se quiser autocompletar um trecho de código, por exemplo da função `main ()` , basta digitar **main** e em seguida pressionar a tecla **TAB** (`main[TAB]`) a função irá ser autocompletada e ficará assim:
{% highlight cpp %}
int main (int argc, char const* argv[])
{

      return 0;
}
{% endhighlight %}

Legal, né?! Você ainda pode editar esse snippet, eu por exemplo gosto da chave de abertura da função ao lado do fechamento dos parênteses e também gosto do `argv` sendo apontado para um ponteiro de um ponteiro. Então para editar, vá para:

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

1. **Preferências**:

![Preferências do Gedit](/assets/img/gedit/preferencias.png)

Ou

![Preferências do Gedit](/assets/img/gedit/preferencias-right.png)

2. Na aba **Plugins** habilite o plugin **Trechos**:

![Snippets Gedit](/assets/img/gedit/trechos.png)

3. Agora vá em **Manage Snippets** , em alguns caso ele pode estar com o nome **Configurar Trechos**:

![Manage Snippets Gedit](/assets/img/gedit/snippets.png)

4. Selecione a linguagem que deseja modificar o snippet, nesse caso o C++:

![C++ Snippets Gedit](/assets/img/gedit/cpp-snippet.png)

A linha irá se abrir exibindo os snippets, nesse caso vou selecionar o snippet **main** e ele irá exibir o códido do snippet na lateral esquerda dessa janelinha:

![C++ Main Snippets Gedit](/assets/img/gedit/cpp-snippet-main.png)

Então editei e deixei do jeito que eu havia dito:

![C++ Main My Snippet Gedit](/assets/img/gedit/cpp-my-snippet-main.png)

Agora é só fechar a janelinha e testar o **main** e note que já irá carregar a nova forma!
> A variável **$0** é onde o cursor irá parar ao autocompletar o snippet, se você removê-lo, ao autocompletar, o cursor irá para após o fechamento das chaves da função main . O Gedit tem essa e outras variáveis de números para snippets: **$0**, **$1**, **2** e assim por diante. No final desse artigo darei mais detalhes dessas variáveis.
{% highlight cpp %}
int main ( int argc, char** argv ){

      return 0;
}
{% endhighlight %}

<!-- RETANGULO LARGO 2 -->
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

## Criando um snippet
Para criar um novo, basta você ir no mesmo local do snippets, selecionar a linguagem que deseja e depois clicar no sinal de **+** bem no rodapé do menu no canto inferior esquerdo (**Criar um novo trecho**):

![Criar um novo trecho](/assets/img/gedit/criar-um-novo-trecho.png)

Vai aparecer um *Novo snippet* com o nome **New Snippet** e você pode/deve renomeá-lo.

![Snippet Gedit](/assets/img/gedit/new-snippet.png)

No meu caso eu renomeie para **cout**

![Snippet Gedit](/assets/img/gedit/rename-cout.png)

Após isso, com esse novo snippet que acabei de criar, insiro o código que eu desejo que o Gedit autocomplete

![Snippet Gedit](/assets/img/gedit/cout-snippet.png)

Agora ao digitar **cout**[TAB] o código surge em seguida:
> Não esqueça de informar o **nome do disparador**, ou seja, a palavra que ao digitar e depois pressionar TAB.
{% highlight cpp %}
std::cout << "/* Mensagem */" << '\n';
{% endhighlight %}

Assim como a variável `$0`(deixa o cursor na posição da variável) a variável `$1` para palavra *Mensagem* , ao autocompletar, ela seria automaticamente selecionada, para uma deleção posterior, exemplo:

<!-- RETANGULO LARGO -->
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

{% highlight cpp %}
std::cout << "${1:Mensagem}" << '\n';
{% endhighlight %}

![Variável Snippet Gedit](/assets/img/gedit/var-snippet.png)

Se houver uma `$2` ela será a pŕoxima a ser automaticamente selecionada e assim por diante.

Se quiser, você ainda pode criar uma *tecla de atalho* e tem a opção também de *Alvo de destino*.

Bem simples, né ?! Forte abraço e até a próxima.


