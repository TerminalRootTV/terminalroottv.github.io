---
layout: post
title: "Uma Coleção de Temas Prontos para seu Polybar"
date: 2019-07-24 10:27:21
image: '/assets/img/polybar/polybar-themes.jpg'
description: 'Ajuda os usuários a criar barras de status altamente personalizáveis para o ambiente desktop.'
main-class: 'unix'
tags:
- polybar
- bspwm
- i3
---

![Polybar Themes](/assets/img/polybar/polybar-themes.jpg)

O [Polybar](https://terminalroot.com.br/2018/11/como-customizar-o-polybar-rofi-e-outros.html) visa ajudar os usuários a criar barras de status altamente personalizáveis para o ambiente de [desktop](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=desktop).

O objetivo principal do Polybar é ajudar os usuários a criar barras de status impressionantes. Possui funcionalidade interna para exibir informações sobre os serviços mais usados. Alguns dos serviços incluídos até agora ...

+ Ícones do Systray
+ Título da janela
+ Controles de reprodução e exibição de status para o MPD usando libmpdclient
+ Controles de volume ALSA
+ Área de trabalho e painel de área de trabalho para o [bspwm](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=bspwm) e [i3](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=i3)
+ Módulo do espaço de trabalho para gerenciadores de janelas compatíveis com o EWMH
+ Layout do teclado e status do indicador
+ Indicador de carga da CPU e memória
+ Exposição da bateria
+ Detalhes da conexão de rede
+ Nível de luz de fundo
+ Rótulo de data e hora
+ Execução de script de [shell](https://terminalroot.com.br/shell) baseada no tempo
+ Saída de comando
+ Árvore de menu definida pelo usuário
+ Mensagens entre processos

Usar um [gerenciador de janelas](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=gerenciador de janelas) consome menos recursos do seu PC e também é ideal para desenvolvedores pela facilidade de sobrepôr janelas e principalmente para separar mais facilmente os ambientes de trabalho e navegar facilmente em cada aplicação aberta no seu respectivo desktop. 

No entanto, tem um lado negativo é que gasta muito do seu tempo configurando tudo que você deseja até chegar ao ponto que você se sinta confortável com seu ambiente.

Se tratando da barra Polybar também. No nosso canal do Youtube, existe inclusive, um vídeo que automatiza a customização do seu Polybar de maneira fácil e rápida. [Clique aqui para ver o vídeo](https://terminalroot.com.br/2019/07/como-customizar-seu-linux-mint-com-i3-polybar-rofi.html).

Mas caso você queira um modelo diferente para sua barra Polybar, sugerimos você usar essa coleção de temas pré-prontos: <https://github.com/adi1090x/polybar-themes> . Lá você encontrará diversos temas e poderá escolher e/ou combinar à sua maneira, de maneira mais rápido e fácil.


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

A instalação é bem simples, vou tentar usar um passo a passo:

### 1º - Instalar Fonts

Recomendo você possuir as fonts que as barras precisarão para funcionar no seu PC . Dentro de cada diretório do tema existe a font dependente, no entanto, sugiro você instalar todas de uma só vez e usar o repositório de fonts do [Terminal Root](https://github.com/terroo/fonts) que já possui todas as fonts que qualquer tema que você escolher. Para isso basta clonar do repositório, copiar para o diretório de fonts e atualizar o cache de fonts na sua máquina:

> Nesse repositório ainda há uma coleção de **Wallpapers**, além de caracteres **Unicode** e entre outros arquivos.

{% highlight bash %}
git clone https://github.com/terroo/fonts
cd fonts/
# Dentro há outro diretório de mesmo nome
sudo mv fonts/ /usr/share/fonts/

# Se quiser, em vez de copiar para o diretório
# do sistema, copie para seu diretório local
# lembrando que a diferença que as fonts só funcionarão, nesse caso,
# somente para o seu usuário
cp fonts/ .local/share/fonts/

# Depois, independente para onde você copiou, é necessário atualizar o cache
fc-cache -fv
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


### 2º - Clonar o repositório de temas que deseja

Após clonar, escolha o tema que deseja para testar na sua máquina, existem diversos, nesse exemplo vamos supôr que você instalará o tema **polybar-4** que fica no caminho `polybar-themes/polybar-4/` . Em resumo, todos os comandos desse passo ficaria:

{% highlight bash %}
git clone https://github.com/adi1090x/polybar-themes
cd polybar-themes/polybar-4/ # Usando o tema polybar-4
cp * ~/.config/polybar/
{% endhighlight %}

Agora, você pode reiniciar seu polybar para ver se as alterações funcionaram

> **IMPORTANTE**: Tenha certeza que seu arquivo de configuração está chamando o arquivo `launch.sh` para lançar o Polybar, caso contrário o mesmo não será exibido.

Se não souber como ver isso, use esse comando para testar:

+ Para i3wm

Se a saída for: **Aparentemente Tudo Certo!** você não precisa fazer mais nada, mas se a saída for **Não há ...** , use justamente o comando que a saída orienta para o mesmo.

{% highlight bash %}
[[ $(grep 'launch.sh' ~/.config/i3/config) ]] && echo "Aparentemente Tudo Certo!" || echo -e '\nNão há, use esse comando para torná-lo possível:\necho "exec_always --no-startup-id $HOME/.config/polybar/launch.sh &" >>  ~/.config/i3/config'
{% endhighlight %}

Para bspwm e outros WMs use a mesma lógica e mude o caminho dos arquivos.

Se der tudo certo, corra para dar aquele abraço e posta seu ambiente lá no [unixporn](https://terminalroot.com.br/2019/04/5-ferramentas-para-voce-usar-no-seu-wm.html) . Mas se não der, posta um comentário aqui pra gente lhe auxiliar!

Existem diversas forma de ajustar o tema de acordo da sua maneira, leia a documentação: <https://github.com/adi1090x/polybar-themes>

## Links Úteis

+ <https://github.com/adi1090x/polybar-themes>
+ <https://github.com/terroo/fonts>
+ <https://terminalroot.com.br/2018/11/como-customizar-o-polybar-rofi-e-outros.html>
+ <https://terminalroot.com.br/2019/07/como-customizar-seu-linux-mint-com-i3-polybar-rofi.html>
+ <https://terminalroot.com.br/shell>

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

