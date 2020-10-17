---
layout: post
title: "Baixe suas músicas com script em Python"
date: 2020-07-07 15:02:45
image: '/assets/img/python/enne.png'
description: 'Faça download de suas músicas direto pela linha de comando'
author: 'Vitor Sht'
image_author: '/assets/img/users/vitor.jpg'
url_author: 'https://github.com/viktorsht/'
icon: 'carbon:logo-python'
iconname: 'python'
tags:
- python
- desenvolvimento
- linux
- programacao
---

![Baixe suas músicas com script em Python](/assets/img/python/enne.png)

# ENNE
O enne é um utilitário via linha de comando escrito em [Python3](https://terminalroot.com.br/tags#python). Sua função primordial é realizar o download de músicas a partir de vídeos do [YouTube](https://youtube.com/).
O programa está na sua inicial, então, muitos *bugs* e adaptações serão feitas no futuro. Espero contar com você, caro leitor, para contribuir com o desenvolvimento desta ferramenta.
Para contribuições(dicas, relatos de bugs, feedback, etc) deixo o link do projeto [GitHub](https://github.com/viktorsht/enne).

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## INSTALAÇÃO
Para a utilização do programa é necessário ter ter instalado na sua máquina:

- [Python3](https://www.python.org/downloads/)
- [pip](https://pypi.org/project/pip/)
- [pafy](https://pypi.org/project/pafy/)

Agora que você instalou todas os pacotes necessários para o funcionamento do programa, clone o repositório em sua máquina [enne](https://github.com/viktorsht/enne.git).  
Pronto, agora você está com todas as ferramentas para baixar suas músicas.  

## UTILIZAÇÃO
Para utilizar o programa é bem simples.
- Vá ,usando a linha de comando, até o diretório do repositório do programa e digite:
```python
python3 enne.py [url-da-musica]
```

- O programa salva o nome e o url dos downloads em um arquivo `.txt` a fim de não realizar repetidos downloads da mesma música.  
- Caso o url já exista no `arquivo.txt` o programa será fechado.  
- O usuário deve passar o `PATH` onde o arquivo deverá ser salvo. O programa identifica a sua pasta de usuário.
- O usuário pode escolher realizar outro download ou não.

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

### Exemplo
Digite  
```python
python3 enne.py https://www.youtube.com/watch?v=S-xb1miTjoE
```

Aparecerá uma mensagem na tela: 'Salvar em: '   

> Ex: Música  

E você baixará a Free Software Song(música do movimento do software livre) no formato `.mp3` na pasta Música.

## ATUALIZAÇÕES PARA O FUTURO

- Possuir um banco de dados próprio e simples.
- Funções de busca direto do programa.
- Virar um pacote para arquiteturas mais comuns.

## Observações finais
Além de otimizar minhas tarefas e mostrar os resultados dos meus estudos em Python. , este programa é uma forma de mostrar o funcionamento prático da biblioteca *Pafy*, além de tentar contribuir com a comunidade do [Software Livre](https://terminalroot.com.br/tags#softwarelivre). Não há intenção alguma de prejudicar pessoas, grupos ou empresas.

## Agradecimentos
Agradeço ao Blog Terminal Root pela oportunidade de mostrar minha evolução no mundo da programação e contribuição no mundo [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/linux).


