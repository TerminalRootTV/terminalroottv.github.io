---
layout: post
title: "Programe em Blocos Visuais e Modulares em Python"
date: 2022-03-07 20:09:36
image: '/assets/img/python/pyflow.jpg'
description: 'Uma ferramenta de código aberto para desenvolvimento interativo.'
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**PyFlow** é uma ferramenta de desenvolvimento [Python](https://terminalroot.com.br/tags#python) interativa estruturada em nodes de [código aberto](https://terminalroot.com.br/tags#opensource).

Com o **PyFlow** é possível criar blocos de código nos quais você pode editar e executar código Python, é possível mover e redimensionar blocos em um plano 2D infinito. Basta vincular os blocos para destacar dependências e o Pyflow executará automaticamente seus blocos na ordem correta .

---

# Instalação
Para obter o PyFlow no seu sistema é necessário utilizar o [pip](https://pypi.org/project/pip/) e rodar o seguinte comando:
```sh
pip install --user byc-pyflow
```

Após terminada a instalação, para executar o PyFlow, basta rodar:
```sh
python -m pyflow
```

Será aberta a janela do PyFlow, clique em **File** e depois em **New** para criar um esquema de blocos.

![PyFlow File New](/assets/img/python/pyflow-file-new.jpg) 


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

Em seguida clique com o botão direito do mouse sob o plano e escolha o tipo de bloco: [Markdown](https://terminalroot.com.br/tags#markdown) ou `Code` .

![PyFlow Code ou Markdown](/assets/img/python/pyflow-code.jpg) 

---

Exemplo de um bloco de código:

![PyFlow Code](/assets/img/python/pyflow-run-code-1.jpg) 

---

Exemplo de um bloco Markdown:

![PyFlow Markdown](/assets/img/python/pyflow-markdown.jpg) 

---

Clicando no triângulo ou quadrado é possível criar um nó e unir à outro bloco. Veja nesse exemplo, criei a variável `exemplo` em um bloco e imprimi no outro:

[![PyFlow Nós](/assets/img/python/pyflow-run-code-2.jpg)](/assets/img/python/pyflow-run-code-2.jpg) 

---

Nesse outro exemplo criei uma função que imprime uma mensagem e no outro nó uma variável com uma URL e no terceiro nó imprimo a mensagem e já abro a URL no navegador padrão assim que clico em `>>` para executar o código:
> Clique na imagem para ampliar e visualizar o código melhor(será aberta em um novo guia do seu navegador).

[![PyFlow Nós](/assets/img/python/pyflow.jpg)](/assets/img/python/pyflow.jpg) 

Para salvar seu projeto tecle <kbd>Ctrl + s</kbd> .

Veja os gifs abaixo para saber mais sobre muitos dos recursos:

![PyFlow](https://github.com/Bycelium/PyFlow/raw/dev/media/mnist_example.gif) 


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

---

![PyFlow Exemplo 2](https://github.com/Bycelium/PyFlow/raw/dev/media/block_example.gif)

---

![PyFlow Exemplo 3](https://github.com/Bycelium/PyFlow/raw/dev/media/resize_example.gif)

---

# Teclas de atalhos

---

## Navegação

| Atalho | Descrição |
|---|---|
| <kbd>Espaço</kbd> | Zoom na seleção (vista central se não houver seleção) |
| <kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd> | Navegar entre blocos / Dentro de um editor |
| <kbd>Enter</kbd> | Digite um editor de blocos |
| <kbd>Alt</kbd> + <kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd> | Navegue entre editores de blocos |
| <kbd>Echap</kbd> | Limpar a seleção e bloquear o foco |
| <kbd>Ctrl</kbd> + <kbd>+</kbd> <kbd>-</kbd> | Ampliar/diminuir |

---

## Edição

| Atalho | Descrição |
|---|---|
| <kbd>Ctrl</kbd> + <kbd>N</kbd> | Criar um novo gráfico |
| <kbd>Ctrl</kbd> + <kbd>C</kbd> | Copiar blocos selecionados para a área de transferência da cena |
| <kbd>Ctrl</kbd> + <kbd>X</kbd> | Corte os blocos selecionados para a área de transferência da cena |
| <kbd>Ctrl</kbd> + <kbd>V</kbd> | Colar a área de transferência da cena no local do mouse |
| <kbd>Ctrl</kbd> + <kbd>D</kbd> | Duplicar blocos selecionados |
| <kbd>Shift</kbd> + <kbd>↑</kbd> | Crie rapidamente um bloco pai |
| <kbd>Shift</kbd> + <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd> | Crie rapidamente um bloco filho |

---

## Execução

| Atalho | Descrição |
|---|---|
| <kbd>Shift</kbd> + <kbd>Enter</kbd> | Executar bloco (e suas dependências) |

---

Para mais informações e documentação acesse o [repositório](https://github.com/Bycelium/PyFlow) .



