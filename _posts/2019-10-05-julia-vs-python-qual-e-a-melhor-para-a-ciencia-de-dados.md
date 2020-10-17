---
layout: post
title: "Julia vs Python: Qual é a melhor para a ciência de dados?"
date: 2019-10-05 00:24:29
image: '/assets/img/dev/julia-vs-python.jpg'
description: 'As duas linguagens de programação reservam características vantajosas para aqueles que buscam uma carreira como cientista de dados.'
tags:
- julia
- python
- desenvolvimento
---

![Julia vs Python: Qual é a melhor para a ciência de dados?](/assets/img/dev/julia-vs-python.jpg "Julia vs Python: Qual é a melhor para a ciência de dados?")

Entre as diversas funções do Python, a análise de dados parece ter se tornado a mais significativa. O ecossistema é carregado com ferramentas que tornam o trabalho de ciência computacional e da análise de dados rápido e eficiente.

Para os desenvolvedores por trás da Julia, voltada especificamente para a computação científica, aprendizado de máquina, mineração de dados, álgebra linear em larga escala e computação paralela e distribuída, o Python pode não ser suficientemente adequado. Nesse caso, a linguagem representa um trade-off, bom para alguns aspectos e ruim para outros.

## Linguagem Julia

Criado por uma equipe de quatro pessoas em 2009 e apresentado ao público em 2012, a Julia pretende abordar as deficiências do Python e de outras linguagens e aplicativos usados para a ciência computacional e processamento de dados. "Somos gananciosos", disse o time na época.

> "Queremos uma linguagem que seja open source, com uma licença liberal. Queremos a velocidade do C com o dinamismo do Ruby. Queremos uma linguagem que tenha homoiconicidade, com macros de verdade como o Lisp, mas com notação matemática óbvia e familiar como o Matlab. Queremos algo tão útil para a programação em geral como o Python; tão fácil para estatística como o R; tão natural para o processamento de string como o Perl; e tão poderoso para a álgebra linear como o Matlab… Algo que seja bem simples de aprender, mas que ainda satisfaça os hackers mais sérios. Queremos que ela seja interativa e facilmente compilada."

Focando no plano ambicioso, de fato, a Julia atende a essas aspirações:

+ **1.** Julia é compilada. Para um desempenho de tempo de execução mais rápido, a Julia é just-in-time (JIT) baseado em LLVM.

+ **2.** Julia é interativa. Inclui um REPL ou uma linha de comando interativa, semelhante ao que o Python oferece.

+ **3.** Julia tem sintaxe direta. É semelhante ao Python, com sintaxe concisa, mas também expressiva e poderosa.

+ **4.** Julia combina os benefícios da tipagem dinâmica e estática.

+ **5.** Julia pode interagir diretamente com bibliotecas externas escritas em C e Fortran. Também é possível fazer interface com o código Python por meio da biblioteca PyCall e até compartilhar dados entre o Python e a Julia.

+ **6.** Julia suporta metaprogramação.

+ **7.** Julia tem um pacote de depuração completo.

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

Excelente para TI, o Python simplifica diferentes tipos de trabalho, desde a automação até o machine learning. No entanto, a Julia foi projetada desde o início para a computação científica e numérica. Dessa forma, não é surpresa que a linguagem tenha muitos recursos vantajosos para esse uso:

+ **1.** Julia é rápida. O compilador JIT e suas funcionalidades permitem que o Julia supere o Python "puro", não otimizado. O Python pode se tornar mais rápido por meio de bibliotecas externas, compiladores JIT de terceiros (PyPy) e otimizações com ferramentas como o Cython, mas a Julia foi projetada para ser mais rápido desde o início.

+ **2.** Julia tem sintaxe matemática. Um grande público alvo da Julia é o de usuários de linguagens e ambientes de computação científica como Matlab, R, Mathematica e Octave. A sintaxe da Julia para operações matemáticas se parece mais com a maneira como as fórmulas matemáticas são escritas fora do mundo da computação, facilitando o aprendizado de não-programadores.

+ **3.** Julia tem gerenciamento automático de memória. Como o Python, a Julia não sobrecarrega o usuário com os detalhes de alocar e liberar memória. A ideia é que, se o usuário mudar para a Julia, não perca algumas das conveniências do Python.

+ **4.** Julia oferece paralelismo superior. Computação matemática e científica prosperam quando o programador pode fazer uso dos recursos completos disponíveis em uma determinada máquina. Tanto o Python quanto a Julia podem executar operações em paralelo. No entanto, os métodos do Python para paralelizar operações geralmente exigem que os dados sejam serializados e desserializados entre threads ou nós, enquanto a paralelização de Julia é mais refinada.

## Vantagens do Python

Apesar da Julia ter sido desenvolvido especificamente para a ciência de dados, o Python oferece algumas vantagens para os profissionais da área:

+ **1.** Julia usa indexação. Na maioria das linguagens, incluindo Python e C, o primeiro elemento de um array é acessado com um zero. A Julia usa o 1 para o primeiro elemento em uma matriz. Esta não é uma decisão arbitrária; muitos outros aplicativos de matemática e ciências, como o Mathematica, usam a indexação 1 e a intenção da Julia é atrair esse público. É possível suportar a indexação zero em Julia com um recurso experimental, mas a indexação 1 por padrão pode ficar no caminho da adoção por parte do público em geral.

+ **2.** Python é experiente. A Julia está em desenvolvimento apenas há dez anos e passou por diversas mudanças ao longo do tempo. Em comparação, o Python existe há quase três décadas.

+ **3.** Python tem mais pacotes de terceiros. A amplitude de pacotes de terceiros do Python continua sendo uma das maiores atrações da linguagem. Novamente, a jovialidade da Julia significa que a cultura de softwares em torno dele ainda é pequena. Parte disso é compensada pela capacidade de usar bibliotecas C e Python existentes, mas a Julia ainda precisa de repositórios próprios para prosperar.

+ **4.** Python tem milhões de usuários. Uma linguagem não é nada sem uma comunidade grande, dedicada e ativa em torno dela. A comunidade em torno da Julia é entusiasta e crescente, mas ainda é muito pequena em comparação com o tamanho da comunidade Python.

+ **5.** Python está ficando mais rápido. Além de obter melhorias no processamento e paralelismo, o Python se tornou mais fácil de acelerar.

> Esse artigo foi originalmente escrito e publicado por [CIO](https://cio.com.br/julia-vs-python-qual-e-a-melhor-para-a-ciencia-de-dados/) e pode ser consultado no link: <https://cio.com.br/julia-vs-python-qual-e-a-melhor-para-a-ciencia-de-dados/> , não modifiquei nada, simplesmente trouxe para cá, pois gostei muito do artigo e gostaria de que ficasse disponível aqui quando os seguidores desse blog quiserem encontrar com mais facilidade e sem possibilidade de perda de link.
    


