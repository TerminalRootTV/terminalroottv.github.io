---
layout: post
title: "Multiplexando seu Terminal com GNU Screen"
date: 2019-10-26 20:01:56
image: '/assets/img/terminal/gnu-screen-min.png'
description: 'Se quiser crie até uma barra de status no terminal estilo Vim.'
tags:
- gnu
- screen
- terminal
- vim
- wm
---

[![Multiplexando seu Terminal com GNU Screen](/assets/img/terminal/gnu-screen-min.png "Multiplexando seu Terminal com GNU Screen")](/assets/img/terminal/gnu-screen-min.png)

Já faz tempo que nós mostramos em um vídeo [Como Utilizar o TMUX](https://www.youtube.com/watch?v=Z7YcXTMMhEQ) , pois é o GNU Screen possui ainda mais recursos que ele.

## Introdução

[GNU Screen](https://www.gnu.org/software/screen/) é um software livre multiplexador de terminal de linha de comando desenvolvido pelo [Projeto GNU](https://www.gnu.org). Permite que o usuário acesse múltiplas sessões separadas de **terminal** a partir de uma mesma janela ou mesmo remotamente. É muito útil para manipular vários programas em uma mesma janela ou mesmo para manter processos em execução de fundo. 

GNU Screen pode ser considerado como uma versão modo texto dos [gerenciadores de janelas](https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html) gráficas. Além de permitir que vários programas modo texto sejam executados ao mesmo tempo, provê funcionalidades tais como: 

+ **Persistência.** Similar ao [VNC](https://www.youtube.com/watch?v=wI7ek1ZHUxQ), GNU Screen permite que o usuário inicie uma aplicação em um computador e então se conecte remotamente e continue a utilizar o mesmo programa, facilitando assim integração entre os diversos ambientes computacionais utilizados pelo usuário. A abstração do tipo de terminal em uso facilita ainda mais tal tarefa, pois as aplicações podem ser utilizadas independentemente do tipo de terminal disponível para o acesso.
+ **Múltiplas janelas.** Múltiplas sessões de terminal podem ser criadas, cada uma numerada de modo a permitir a transição entre elas a partir do teclado.
+ **Compartilhamento de sessões.** Screen permite que múltiplos computadores se conectem a uma mesma sessão ao mesmo tempo, possibilitando assim a colaboração entre usuários. Outra forma seria a utilização de um mesmo computador ligado a vários monitores, compartilhando assim um mesmo recurso computacional entre os usuários.

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

## Instalação

Use o gerenciador de pacotes da sua distribuição, mas antes rode o comando `screen` para ver se não já está instalado, exemplo:
[![emerge screen](/assets/img/terminal/emerge-screen.png)](/assets/img/terminal/emerge-screen.png)

## Utilização

Você pode iniciar o GNU Screen com o comando:
{% highlight bash %}
screen
{% endhighlight %}

Agora saiba que a combinação de tecla que o screen escuta é **Ctrl + a**, e essa combinação é simplesmente resumida como **C-a** , ou seja, toda vez que você ler **C-a** quer dizer **Ctrl + a** . Exemplos:

+ Para dividir a janela na **horizontal** tecle **Ctrl + a** e em seguinda a letra **S** (maiúscula → **Shift + s**) => `C-a S`.
+ `C-a |` (pipe) → Para dividir na **vertical**.
+ `C-a TAB` para pular para destacar a nova janela e assim que estiver nela, a mesma não haverá um **prompt** , então você não criou, para criar tecle: `C-a c`.
+ `C-a SHIFT TAB` → Para voltar para a janela anterior.
> Lembrando que se você estiver na janela **1** e quiser passar, por exemplo, pra janela de número 9, você pode usar: `C-a 9`
+ Para *fechar* uma divisão, use: `C-a K` e para fechar uma janela `C-a Q`

> Resumindo: suporndo que você acabou de rodar o comando `screen`, supondo que você rodou `C-a |` então para passar para essa nova janela: `C-a TAB` e depois `C-a c`. 😃

Os atalhos podem ainda ser visualizados com: `C-a ?` ou usando o *help* e o manual:
{% highlight bash %}
screen --help
man screen
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

## Criando uma Barra de Status estilo Vim

Para isso você precisa criar um arquivo `~/.screenrc` e inserir nele o seguinte conteúdo:`hardstatus alwayslastline " %d-%m-%y %c:%s | %w"`, ou rode simplesmente o comando abaixo:
{% highlight bash %}
echo 'hardstatus alwayslastline " %d-%m-%y %c:%s | %w"' >> $HOME/.screenrc; screen
{% endhighlight %}
> Toda vez que você abrir o `screen` automaticamente essa barra fará presença. Se quiser removê-la, é só apagar o conteúdo ou o arquivo *~/.screenrc* .

Isso vai mostrar a data e hora e seu nome de usuário e o host , além no número da janela.

Se quiser que quando você abrir o terminal automáticamente crie essa barra, insira esse conteúdo no seu *.bashrc*:
{% highlight bash %}
if [ -z "$STY" ]; then
    exec screen
fi
{% endhighlight %}

Se ainda quiser que ele *mate* automáticamente qualquer outra sessão, incluindo o terminal, troque o `exec screen` por `exec screen -dR`.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Conclusão

O GNU Screen é bastante utilizado para conexões remotas de sessões . Por exemplo, se você deixou algo compilando ou instalando no seu trabalho ou qualquer outro lugar, daí você deseja conectar via [ssh]() , mas recuperar a sessão (como se estivesse lá na frente do computador), você pode usar o [GNU Screen]() . Exemplo:
{% highlight bash %}
ssh -t host.example.com screen -R -d
{% endhighlight %}

Espero que você tenha gostado e não esqueça de ver a documentação, manual, help, ajuda e se quiser esse [Cheat Sheet](https://gist.github.com/fredrick/1216878)

Abraços!
