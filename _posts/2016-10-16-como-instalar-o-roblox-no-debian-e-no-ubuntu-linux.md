---
layout: post
title: "Como instalar o Roblox no Debian e no Ubuntu Linux"
date: '2016-10-16T07:21:00.000-07:00'
image: '/assets/img/games/como-instalar-roblox-debian-ubuntu-linux.jpg'
description: "Passos para rodar o game no seu computador"
main-class: 'debian'
tags:
- Debian
- Ubuntu
- Games
---

![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/como-instalar-roblox-debian-ubuntu-linux.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")

Salve salve rapaziada, ontem eu tive que instalar o Roblox (Game estilo MineCraft , muito bom!) pro meu filho, na verdade ele mesmo já tinha instalado (ele tem 7 anos) :) , mas não dava certo, aparecia um erro ao tentar abrir:
 
> An unexpected error occurred and Roblox needs to quit
 
Então eu percebi de acordo com pesquisas na internet que o erro estava diretamente ligado ao caminho de arquivos setados no WINE . Então eu vi um vídeo gringo explicando pelo CrossOver , e testei no Debian e depois no Ubuntu do meu filho e deu certo. Dae separei alguns passos caso alguém se interesse ou tenha o mesmo problema.
 
###  - Baixe o CrossOver e o Laucher do Roblox
[Clique aqui pra baixar](https://www.codeweavers.com/products/crossover-linux/download)
 
###  - Descompacte o arquivo pelo descompactador gráfico ou pelo comando:
{% highlight bash %}
tar -zxvf crossover-roblox.tar.gz
{% endhighlight %}

###  - Um dos arquivos é o CrossOver e o outro o Laucher do Roblox, instale o CrossOver pelo GDebi ou com o root/sudo pelo comando:
 
>  Obs.: Observe algumas coisas antes de instalar o CrossOver:
  
- Pelo GDebi em descrição vc verá que o pacote é para 64bits , e ele mesmo da a dica na aba descrição de rodar esse comando antes se você estiver num sistema 32bits, se não tiver o sudo utilize o root:
{% highlight bash %}
sudo dpkg --add-architecture i386 ; sudo apt-get update
{% endhighlight %}
      
- No mesmo pacote há saídas pelo Lintian, se vc não tivé-lo instalado, é bom instalar também:
{% highlight bash %}
apt-get install lintian
{% endhighlight %}
      
- Se no status do pacote tiver: Todas as dependências satisfeitas, então está tudo certo, caso contrário, utilize o APT pra instalar as dependências que faltam. 

Estando tudo certo instale:
 
{% highlight bash %}
dpkg -i crossover.deb
{% endhighlight %}
 
###  - Após instalar o CrossOver , agora abra-o e clique em : Install Windows Software
 
     
![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/cross-over-print.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")
 
###  - Aparecerá um AVISO de amarelo pra vc atualizar, clique em Atualizar Agora e aguarde a atualização...
 
       
![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/co2.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")
 
###  - Após finalizada a atualização , clique em Browse Available Applications... Então abrirá um no menu e clique na setinha de Unknown e depois selecione Outra Aplicação e depois clique em Continuar se não houver passado automaticamente de selecionar o arquivo.
 
        
![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/coN.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")
 
###  - Selecione o Laucher do Roblox que você baixou e clicando em: Selecione o Arquivo do Instalador e ANTES de INSTALAR clique em Select Bootle e marque Nova Garrafa Windows 8 e depois clique em Instalar.
 
      
![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/co0.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")
![Como instalar o Roblox no Debian e no Ubuntu Linux](/assets/img/games/co4.jpg "Como instalar o Roblox no Debian e no Ubuntu Linux")
 
obs.: Se o CrossOver pedir para confirmar/comprar/registrar , clique em Try Now. 
 irá instalar o Roblox Player e o Roblox Studio, ambos ícones aparecerão na sua Área de Trabalho após instalação concluída, depois abra o Roblox Studio.
 
 
###  - Após o Roblox Studio aberto, vá em 

> FILE >> Settings >> Rendering e em Mode Graphic, clique em automatic e mude para OpenGL.
 
### Lembrando que para jogar é preciso ter uma conta no Site do Roblox!
 
### E esse jogo é recomendado pra quem possui 4GB de Memória ou mais e possui um sistema de 64bits, mas vc pode tentar se não tiver! :)
 
 
 

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

