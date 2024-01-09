---
layout: post
title: "Renderize Mermaid no GitHub"
date: 2024-01-09 14:34:20
image: '/assets/img/github/mermaid.jpg'
description: 'Uma ferramenta nativa para o GitHub que permite criar diagramas e visualizações usando texto e código.'
icon: 'ion:terminal-sharp'
iconname: 'Mermaid'
tags:
- markdown
- github
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**Mermaid** permite criar diagramas e visualizações usando texto e código.

É uma ferramenta de diagramação e gráficos baseada em [JavaScript](https://terminalroot.com.br/tags#javascript) que renderiza definições de texto inspiradas em [Markdown](https://terminalroot.com.br/tags#markdown) para criar e modificar diagramas dinamicamente.

---

# Utilização
Para criar diagramas com Mermaid basta criar um arquivo de extensão `.md`(Markdown) e criar um bloco de código onde será inserida a sintaxe para seus diagramas, exemplo:

<pre>
```mermaid
```
</pre>
> Note que precisa definir a sintaxe para `mermaid`.

Exemplo básico, um fluxograma entre: A, B, C e D:

<pre>
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
</pre>

A saída será:

![Mermaid fluxograma](/assets/img/github/mermaid-fluxograma.png) 


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

# Suporte nativo para o GitHub
O GitHub possui suporte nativo para o GitHub. Isso significa que se você criar uma sintaxe Mermaid no seu [README.md](https://github.com/terroo/terroo) de algum repositório, será renderizado automaticamente, incluindo *controle* para manipular os diagramas, exemplo:

<pre>
# Recursos
- FastAPI
- Banco de Dados 

```mermaid
graph LR;
  A["API (FastAPI) fa:fa-globe"]
  B[("Banco de Dados (PG) fa:fa-cubes")]
  A --> B
```

</pre>

Será renderizado como:

![Mermaid exemplo](/assets/img/github/mermaid.png) 
> Note os controles, se quiser ver renderizado [clique aqui](https://github.com/terroo/langs-test-loop).

---

Para mais informações e detalhes acesse: <https://mermaid.js.org/>



