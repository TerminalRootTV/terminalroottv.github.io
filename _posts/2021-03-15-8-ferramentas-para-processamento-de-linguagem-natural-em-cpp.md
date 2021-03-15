---
layout: post
title: "8 Ferramentas para Processamento de linguagem natural em C++"
date: 2021-03-15 16:26:22
image: '/assets/img/img/ai/nlp-cpp.jpg'
description: 'PLN é uma subárea da computação e inteligência artificial.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- artificialinteligence
- machinelearning
---

![8 Ferramentas para Processamento de linguagem natural em C++](/assets/img/ai/nlp-cpp.jpg)

Processamento de linguagem natural(PLN) é uma subárea da ciência da computação, inteligência artificial e da linguística que estuda os problemas da geração e compreensão automática de línguas humanas naturais.

Nós dominamos o básico da linguagem falada e escrita, no entanto, a grande maioria de nós não avança além de algumas regras básicas de processamento quando aprendemos como lidar com texto em nossos aplicativos. 

PNL(ou NPL em inglês) é a tecnologia para lidar com nosso produto abrangente: a linguagem humana, conforme aparece nas mídias sociais, e-mails, páginas da web, tweets, descrições de produtos, histórias de jornais e artigos científicos, em milhares de idiomas e variantes.

Nesse artigo vamos explorar 8 ferramentas de PNL baseadas em [C++](https://terminalroot.com.br/cpp) . 

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 1. [MITIE: MIT Information Extraction](https://github.com/mit-nlp/MITIE)
O MITIE apesar de escrito em [C++](https://terminalroot.com.br/cpp), possui extensões para várias outras linguagens de programação, incluindo [Python](https://terminalroot.com.br/tags#python), [R](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html#19-r), [Java](https://terminalroot.com.br/tags#java), [C](https://terminalroot.com.br/tags#linguagemc) e MATLAB, permitem que um usuário integre rapidamente o MITIE em seus próprios aplicativos.

Dentre suas características há:

+ Usa várias técnicas de última geração, incluindo o uso de embeddings de palavras distributivas e máquinas de vetor de suporte estrutural.
+ Vários modelos pré-treinados fornecendo níveis variados de suporte para inglês, espanhol e alemão usando uma variedade de recursos linguísticos.
+ Vem com uma ferramenta básica de **Named Entity Recognition**(**NER**) de streaming. 

Endereço oficial: <https://github.com/mit-nlp/MITIE>

---

# 2. [text2vec](http://text2vec.org/)
**text2vec** é amigável à memória. Algumas partes (como **GloVe**) são totalmente paralelizadas usando o pacote **RcppParallel**.

**text2vec** é inspirado em **gensim**. O software é lançado sob uma licença de [código aberto](https://terminalroot.com.br/opensource).

Características incluem:

+ Vetorização rápida de texto (criação de matrizes de termos de documentos) em n-gramas arbitrários, usando vocabulário ou hash de recursos.
+ GloVe palavra embeddings.
+ Modelagem de tópicos
+ API de streaming significa que os usuários não precisam carregar todos os dados na RAM.

Endereço oficial: <http://text2vec.org/>

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

---

# 3. [Moses](https://www.statmt.org/moses/)
**Moses** é um sistema de tradução automática que permite treinar automaticamente modelos de tradução para qualquer idioma. Esta é a abordagem dominante no campo no momento e é empregada pelos sistemas de tradução on-line implantados por empresas como **Google** e **Microsoft**.

Tudo que você precisa é uma coleção de textos traduzidos (corpus paralelo). Depois de ter um modelo treinado, um algoritmo de busca eficiente encontra rapidamente a tradução de maior probabilidade entre o número exponencial de escolhas.

Características incluem:

+ Dois tipos de modelos de tradução: baseado em frase e baseado em árvore.
+ Modelos de tradução fatorados, que permitem a integração linguística e outras informações no nível da palavra.
+ Decodificação de redes de confusão e redes de palavras, permitindo fácil integração com ferramentas upstream ambíguas, como reconhecedores automáticos de voz ou analisadores morfológicos.
+ Oferece suporte a modelos que se tornaram conhecidos como modelos hierárquicos baseados em frases e modelos baseados em sintaxe. Esses modelos usam uma gramática que consiste em regras SCFG (Synchronous Context-Free Grammar).
+ O Experiment Management System torna o uso de Moses muito mais fácil.
+ O decodificador é executado em Linux (32 e 64 bits), Windows, Cygwin, Mac OSX (Intel e PowerPC). Os scripts de treinamento e ajuste são executados regularmente no Linux (32 e 64 bits) e, ocasionalmente, no Mac (Intel).

Endereço oficial: <https://www.statmt.org/moses/>

---

# 4. [TiMBL](https://languagemachines.github.io/timbl/)
O **Tilburg Memory Based Learner**, *TiMBL*, é uma ferramenta de código aberto para pesquisa de PNL e para muitos outros domínios onde as tarefas de classificação são aprendidas a partir de exemplos. É um componente central de vários sistemas de software de PNL como **MBT**(gerador de tagger baseado em memória), **Frog**(analisador morfo-sintático holandês), [Valkuil.net](https://webservices.cls.ru.nl/valkuil/) (corretor ortográfico sensível ao contexto holandês) e **SoothSayer** (completamento de palavras holandês).

**TiMBL** é um produto do Grupo de Pesquisa **ILK** (**Universidade de Tilburg**, Holanda) e do **Centro de Pesquisa CLiPS** (Universidade de Antuérpia, Bélgica).

Características incluem:

+ Suporte a multi-CPU.
+ Implementação rápida baseada em árvore.
+ Implementações dos algoritmos IB1 e IB2, IGTree, TRIBL e TRIBL2.
+ Métricas de similaridade: Sobreposição, MVDM, Jeffrey Divergence, Produto interno, Coseno.
+ Métricas de similaridade por valor: Levenshtein, coeficiente de dados.
+ Métricas de ponderação de recursos: ganho de informação, razão de ganho, qui quadrado, variância compartilhada.
+ Métricas de ponderação de distância: inversa, linear inversa, decaimento exponencial.
+ Opções extensas de detalhamento para inspecionar os conjuntos de vizinhos mais próximos.
+ Funcionalidade de servidor e API abrangente.
+ Teste rápido de deixar um de fora e validação cruzada interna.
+ Lida com ponderação de exemplo definida pelo usuário.

Endereço oficial: <https://languagemachines.github.io/timbl/>

---

# 5. [MeTA](https://meta-toolkit.org/)
**MeTA** é um kit de ferramentas de ciências de dados escrito com [C++](https://terminalroot.com.br/cpp) moderno. É um conjunto de processamento de linguagem natural, classificação, recuperação de informações, mineração de dados e outras aplicações de processamento de texto.

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


A ênfase da **MeTA** concentra-se na estreita integração de recursos de pesquisa (na verdade, recursos de acesso a texto em geral) com funções de análise de texto, permitindo-lhe fornecer suporte completo para a construção de um poderoso aplicativo de análise de texto.

Características incluem:

+ Tokenização de texto, incluindo recursos semânticos profundos, como árvores de análise.
+ Índices invertidos e avançados com compressão e várias estratégias de cache.
+ Uma coleção de funções de classificação para pesquisar os índices.
+ Modelos de tópico.
+ Algoritmos de classificação.
+ Algoritmos de gráfico.
+ Modelos de linguagem.
+ Implementação de CRF (marcação POS, análise superficial).
+ Wrappers para liblinear e libsvm (incluindo analisadores de conjunto de dados libsvm).
+ Suporte UTF8 para análise em vários idiomas.
+ Algoritmos multithread.

Endereço oficial: <https://meta-toolkit.org/>

---

# 6. [CRF++](https://taku910.github.io/crfpp/)
**CRF++** é uma implementação simples, personalizável e de código aberto de **Campos Aleatórios Condicionais** (**CRFs**) para segmentar/rotular dados sequenciais.

Características incluem:

+ Projetado como uma ferramenta de uso geral.
+ Pode redefinir conjuntos de recursos.
+ Escrito em [C++](https://terminalroot.com.br/cpp) com STL.
+ Treinamento rápido baseado em LBFGS, um algoritmo "quase newton" para problemas de otimização numérica em larga escala.
+ Menos uso de memória em treinamento e teste.
+ Codificação/decodificação em tempo prático.
+ Usa exatamente o mesmo formato de dados que YamCha, um chunker de texto genérico, personalizável e de código aberto orientado para muitas tarefas de PNL, como marcação de POS, reconhecimento de entidade nomeada, base NP chunking e Text Chunking. O YamCha está usando um algoritmo de aprendizado de máquina de última geração chamado Support Vector Machines (SVMs), apresentado pela primeira vez por Vapnik em 1995.

CRF++ é escrito em [Shell](https://terminalroot.com.br/shell) e [C++](https://terminalroot.com.br/cpp).

Endereço oficial: <https://taku910.github.io/crfpp/>

---

# 7. [BLLIP Parser](https://github.com/BLLIP/bllip-parser)
**BLLIP** é um analisador constituinte generativo (primeiro estágio) e um reranker discriminativo de entropia máxima (segundo estágio). Ele também é conhecido como **Charniak-Johnson** ou **Brown reranking parser**.

Dependendo do texto que você gostaria de analisar, existem diferentes modelos de análise ideais. Aqui estão as recomendações atuais:

+ Texto da notícia: WSJ + Gigaword-v2.
+ Texto da Web: SANCL2012-Uniform.
+ Texto biomédico (PubMed): GENIA + PubMed.

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

Endereço oficial: <https://github.com/BLLIP/bllip-parser>

---

# 8. [Colibri Core](https://proycon.github.io/colibri-core/)
**Colibri Core** é um software para contar e extrair padrões de dados de grandes corpus de forma rápida e eficiente, para extrair várias estatísticas sobre os padrões extraídos e para calcular as relações entre os padrões extraídos.

A noção empregada de padrão ou construção abrange as seguintes categorias:

+ n-gram - n palavras consecutivas.
+ skipgram - Um padrão abstrato de comprimento predeterminado com uma ou várias lacunas (de tamanho específico).
+ flexgram - Um padrão abstrato com uma ou mais lacunas de tamanho variável.

O Colibri Core roda em sistemas operacionais modernos compatíveis com POSIX, incluindo [Linux](https://terminalroot.com.br/linux), [FreeBSD](https://terminalroot.com.br/tags#freebsd) e [macOS](https://terminalroot.com.br/tags#macos).

Endereço oficial: <https://proycon.github.io/colibri-core/>

---

Para mais informações de como funciona o PNL sugiro [esse link](https://pt.wikipedia.org/wiki/Processamento_de_linguagem_natural) .

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!


