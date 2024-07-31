---
layout: post
title: "GCC foi reescrito em C++"
date: 2024-07-31 00:02:23
image: '/assets/img/cpp/gcc-cpp.jpg'
description: "🦬 Assim como o Clang/LLVM que sempre foi escrito em C++."
icon: 'ion:terminal-sharp'
iconname: 'GCC/C++'
tags:
- gnu
- gcc
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O [GNU Compiler Collection (GCC)](https://terminalroot.com.br/tags#gcc) foi, desde o início, escrito em [C](https://terminalroot.com.br/c) e compilado por um compilador C. 
A partir de 2008, um esforço foi feito para mudar o GCC para que ele pudesse ser compilado por um compilador [C++](https://terminalroot.com.br/cpp) e tirar vantagem de um subconjunto de construções [C++](https://terminalroot.com.br/tags#cpp). 

Esse esforço foi impulsionado por [uma apresentação de Ian Lance Taylor [PDF]](http://airs.com/ian/cxx-slides.pdf) na cúpula do GCC de junho de 2008. Como acontece com qualquer grande mudança, esta teve seus opositores e seus problemas, bem como seus proponentes e sucessos.

---

## Razões para a mudança
Os slides de **Taylor** listam os motivos para se comprometer a escrever **GCC** em **C++**:
+ [C++](https://terminalroot.com.br/tags#cpp) é bem conhecido e popular.
+ É quase um superconjunto do **C90**, no qual o GCC foi escrito.
+ O subconjunto C de [C++](https://terminalroot.com.br/tags#cpp) é tão eficiente quanto [C](https://terminalroot.com.br/tags#tags#linguagemc).
+ [C++](https://terminalroot.com.br/tags#cpp) "suporta código mais limpo em vários casos significativos". Ele nunca requer código "*mais feio*".
+ [C++](https://terminalroot.com.br/tags#cpp) torna mais difícil quebrar limites de interface, o que leva a interfaces mais limpas.

A popularidade do [C++](https://terminalroot.com.br/tags#cpp) e sua relação de superconjunto com o C falam por si. Ao afirmar que o subconjunto [C](https://terminalroot.com.br/tags#tags#linguagemc) do [C++](https://terminalroot.com.br/tags#cpp) é tão eficiente quanto o C, Taylor quis dizer que se os desenvolvedores estão preocupados com a eficiência, limitar-se a construções C gerará código que é tão eficiente. 

Ter interfaces mais limpas é uma das principais vantagens do **C++**, ou de qualquer linguagem orientada a objetos. Dizer que o [C++](https://terminalroot.com.br/tags#cpp) nunca requer código "*mais feio*" é um julgamento de valor. No entanto, dizer que ele suporta "*código mais limpo em vários casos significativos*" tem uma história profunda, melhor demonstrada pelo *gengtype*.

---

## [De acordo com o GCC Wiki](http://gcc.gnu.org/wiki/gengtype):
> Como [C](https://terminalroot.com.br/tags#tags#linguagemc) não tem nenhum meio de reflexão [*...*] gengtype foi introduzido para suportar algumas anotações de tipo e variáveis específicas do **GCC**, que por sua vez suportam coleta de lixo dentro do compilador e cabeçalhos pré-compilados. Como tal, *gengtype* é um grande *kludge* de um analisador léxico e sintático C rudimentar.

O que aconteceu foi que os desenvolvedores estavam emulando recursos como *coleta de lixo*, uma classe vetorial e uma classe de árvore em C. Esse era o código "*feio*" ao qual Taylor se referia.

Em seus slides, Taylor também tentou abordar muitas das objeções iniciais: que [C++](https://terminalroot.com.br/tags#cpp) era complicado, que haveria um problema de bootstrap e que a Free Software Foundation (FSF) não gostaria disso. Ele abordou a questão da velocidade apontando que o subconjunto C de [C++](https://terminalroot.com.br/tags#cpp) é tão eficiente quanto C. Quanto à FSF, Taylor escreveu: "A FSF não está escrevendo o código."

A complexidade de uma linguagem está nos olhos de quem vê. Muitos desenvolvedores do GCC eram principalmente, ou exclusivamente, programadores C, então, necessariamente, haveria um período de tempo em que eles seriam menos produtivos e/ou poderiam usar [C++](https://terminalroot.com.br/tags#cpp) de maneiras que negassem todos os seus supostos benefícios. Para combater esse problema, Taylor esperava desenvolver padrões de codificação que limitassem o desenvolvimento a um subconjunto de C++.

O problema do bootstrap poderia ser resolvido garantindo que a versão **N-1** do GCC sempre pudesse construir a versão N do GCC e que eles pudessem vincular estaticamente com libstdc++ . A versão  N-1 do GCC deve ser vinculada com `libstdc++ N-1` enquanto estiver construindo **GCC N** e `libstdc++ N ; GCC  N` , por sua vez, precisará de `libstdc++ N`. A vinculação estática garante que cada versão do compilador seja executada com a versão apropriada da biblioteca.

Por muitos anos antes de 2008, houve um acordo geral para restringir o código GCC a um subconjunto comum de C e C++, de acordo com Taylor (por e-mail). No entanto, houve muita resistência à substituição do compilador C por um compilador C++. 

Na cúpula do GCC de 2008, Taylor fez uma pesquisa sobre o tamanho dessa resistência, e aproximadamente 40% se opuseram. Os defensores do [C++](https://terminalroot.com.br/tags#cpp) prestaram muita atenção em identificar e abordar as objeções específicas levantadas pelos oponentes do [C++](https://terminalroot.com.br/tags#cpp) (velocidade, uso de memória, inexperiência dos desenvolvedores e assim por diante), de modo que a cada ano depois disso o tamanho da oposição diminuiu significativamente. 

A maioria dessas discussões ocorreu nas cúpulas do GCC e por meio de chats IRC não registrados. Portanto, o único registro disponível está nos [arquivos da lista de discussão do GCC](http://gcc.gnu.org/ml/gcc).

---

## Primeiros passos
O primeiro passo, um verdadeiro passo de bebê, foi meramente tentar compilar a base de código C existente com um compilador C++. Enquanto Taylor ainda estava na conferência, ele criou uma [ramificação gcc-in-cxx](http://gcc.gnu.org/ml/gcc/2008-06/msg00385.html) para experimentar a construção do GCC com um compilador C++. Os desenvolvedores foram rápidos em anunciar sua intenção de trabalhar no projeto. As tentativas iniciais de construção encontraram muitos erros e avisos, que foram então limpos.

Em junho de 2009, quase exatamente um ano após propor essa troca, Taylor relatou que a fase um estava completa. Ele configurou o GCC com a opção enable-build-with-cxx para fazer com que o compilador principal fosse construído com C++. Um bootstrap em um único sistema de destino foi concluído. Por volta dessa época, a ramificação cxx separada foi mesclada ao tronco principal do GCC, e as pessoas continuaram seu trabalho, usando a opção enable-build-with-cxx . (No entanto, a ramificação separada foi revivida em pelo menos uma ocasião para experimentação.)

Em maio de 2010, houve um [Q&A do GCC Release Manager no IRC](http://gcc.gnu.org/wiki/Release%20Manager%20Q%26A?action=AttachFile&do=view&target=rmqa-20100527.txt). A conclusão dessa reunião foi solicitar permissão do GCC Steering Committee para usar recursos da linguagem [C++](https://terminalroot.com.br/tags#cpp) no próprio GCC, em vez de apenas compilar com um compilador C++. A permissão foi concedida, com concordância também vinda da FSF. Mark Mitchell [anunciou a decisão](http://gcc.gnu.org/ml/gcc/2010-05/msg00705.html) em um e-mail para a lista de discussão do GCC em 31 de maio de 2010.

Nesse tópico, [Jakub Jelinek](http://gcc.gnu.org/ml/gcc/2010-05/msg00746.html) e [Vladimir Makarov](http://gcc.gnu.org/ml/gcc/2010-05/msg00744.html) expressaram falta de entusiasmo pela mudança. No entanto, como Makarov disse, ele não tinha desejo de começar uma guerra de chamas sobre uma decisão que já havia sido tomada. Dito isso, ele recentemente compartilhou por e-mail que sua principal preocupação era que a comunidade do GCC se apressasse em converter a base de código do GCC para [C++](https://terminalroot.com.br/tags#cpp): 
> "...em vez de trabalhar em coisas mais importantes para os usuários do GCC (como melhorar o desempenho, novas funcionalidades e assim por diante). Felizmente, isso não aconteceu."

Richard Guenther estava preocupado em [criar uma hierarquia de classes em árvore](http://gcc.gnu.org/ml/gcc/2010-05/msg00745.html):
> É muito trabalho (a árvore se estende em todos os três Frontends, middle-end e backends). E meu medo é que só teremos uma transição pela metade - algo pior do que nenhuma transição.
Os esforços dos proponentes para acalmar as preocupações e as mensagens de "por favor, tenha cuidado" dos oponentes dão alguma indicação das outras preocupações. Além das questões levantadas por Taylor na apresentação de 2008, Jelinek mencionou o uso de memória. Outros, frequentemente como apartes de outros comentários, estavam preocupados que programadores [C++](https://terminalroot.com.br/tags#cpp) novatos usariam a linguagem de forma inapropriada e criariam código não sustentável.

Houve muita discussão sobre padrões de codificação no tópico. Vários argumentaram a favor de padrões existentes, mas outros apontaram que precisavam definir um subconjunto "seguro" de [C++](https://terminalroot.com.br/tags#cpp) para usar. Houve, a princípio, pouco acordo sobre quais recursos de [C++](https://terminalroot.com.br/tags#cpp) eram seguros para um desenvolvedor [C++](https://terminalroot.com.br/tags#cpp) novato. 

Taylor propôs um conjunto de padrões de codificação. Eles foram alterados por Lawrence Crowl e outros, e então foram [adotados](http://gcc.gnu.org/codingconventions.html). Cada requisito tem uma justificativa e discussão completas anexadas. No entanto, o princípio orientador sobre manutenibilidade não é o padrão de codificação, mas um que sempre existiu para o GCC: o mantenedor de um componente toma a decisão final sobre quaisquer alterações naquele componente.

---

## Status atual
Atualmente, aqueles que apoiaram as mudanças sentem que seus esforços forneceram os benefícios que esperavam. Ninguém expressou publicamente qualquer insatisfação com o esforço. Makarov ficou aliviado que seu medo de que o esforço de conversão seria um dreno de recursos não se concretizou. 

Além disso, ele cita os benefícios da modularidade aprimorada como uma maneira de tornar o GCC mais fácil de aprender e, portanto, mais propenso a atrair novos desenvolvedores.

No que diz respeito à velocidade, Makarov observou que um bootstrap em uma plataforma multi-CPU é tão rápido quanto era para [C](https://terminalroot.com.br/c). No entanto, em plataformas uniprocessador, um bootstrap C era 30% mais rápido. Ele não especulou sobre o porquê disso. 

Ele também encontrou impactos positivos, como a conversão para tabelas hash C++, que aceleraram o tempo de compilação em 1-2%. Este último trabalho é um processo contínuo, sobre o qual Lawrence Crowl relatou pela última vez em outubro de 2012. De acordo com as preocupações de Makarov, este trabalho é feito lentamente, conforme o tempo e os interesses das pessoas permitem.

Das conversões iniciais desejadas (`gengtype`, `tree` e `vector`), o suporte a vetores é fornecido usando construções [C++](https://terminalroot.com.br/tags#cpp) (ou seja, uma classe) e o gengtype foi reescrito para compatibilidade com **C++**. 

Árvores são um assunto diferente. Embora tenham sido muito discutidas e oferecidas voluntariamente por várias vezes, nenhuma alteração foi feita no código. Isso acrescenta credibilidade à alegação de 2010 de Guenther (que mudou seu sobrenome para Biener) de que seria difícil fazer corretamente. 

Contatado recentemente, Biener declarou que sentiu que era muito cedo para avaliar o impacto da conversão porque, comparado ao tamanho do **GCC**, houve poucas alterações nas construções C++. Do lado negativo, ele observou (como outros fizeram) que, por causa das mudanças, os colaboradores de longa data devem reaprender coisas com as quais estavam familiarizados no passado.

Em 2008, 2009 e 2010, (ou seja, no início e depois de cada marco) Taylor forneceu planos formais para as próximas etapas. Não há um plano formal daqui para frente. As pessoas usarão construções [C++](https://terminalroot.com.br/tags#cpp) em patches futuros conforme julgarem necessário, mas não apenas por fazer. 

Alguns limitarão suas alterações aos momentos em que estiverem corrigindo o código de qualquer maneira. Outros abordam o código C existente com o objetivo de converter o código para [C++](https://terminalroot.com.br/tags#cpp) sempre que isso tornar o código mais claro ou mais eficiente. Portanto, este é um esforço contínuo em um caminho sinuoso para o futuro previsível.

Conforme o projeto [C++](https://terminalroot.com.br/tags#cpp) progrediu, alguns medos foram dissipados, enquanto alguns desenvolvedores ainda estão em um padrão de espera. Para eles, é muito cedo para avaliar as coisas definitivamente, e muito tarde para mudar o curso. No entanto, a maioria parece estar satisfeita com as mudanças. Só o tempo dirá quais novos benefícios ou problemas surgirão.

---

Artigo originalmente publicado por **Linda Jacobson** para [lwn.net](https://lwn.net/Articles/542457/).



