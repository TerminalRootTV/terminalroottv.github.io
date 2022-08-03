---
layout: post
title: "A Microsoft também está criando o sucessor do C++"
date: 2022-08-03 11:26:50
image: '/assets/img/windows/verona.jpg'
description: 'Microsoft: Estamos criando uma nova linguagem de programação para memória segura.'
icon: 'ion:terminal-sharp'
iconname: 'Microsoft'
tags:
- windows
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

A Microsoft não pode simplesmente jogar fora o código mais antigo do Windows, mas o **Projeto Verona** da empresa visa tornar os componentes de baixo nível mais antigos do [Windows 10](https://terminalroot.com.br/tags#windows) mais seguros. 

A empresa revelou recentemente que seus testes com Rust atingiram seus objetivos, no entanto, o desfecho será, na verdade, uma linguagem de programação própria. Um dos motivos disso é também pelo fato do Rust ter algumas características diferentes, tais como: binários muito grandes, código Assembly extenso e entre outros .

Todos os usuários do Windows sabem que na segunda terça-feira de cada mês, a Microsoft lança *patches* para corrigir falhas de segurança no [Windows](https://terminalroot.com.br/tags#windows).

A Microsoft revelou recentemente que a grande maioria dos bugs descobertos atualmente são falhas de segurança de memória .

---

# O que é Memória Segura ?
Quando o [C++](https://terminalroot.com.br/tags#cpp) foi lançado, muitas empresas gostaram do forma de abstração dos dados, principalmente o **RAII**(construtores e destrutores), que era justamente o que diferenciava o [C++](https://terminalroot.com.br/cpp) da linguagem [C](https://terminalroot.com.br/tags#linguagemc) que não possui RAII .

Com todo o sucesso do C++, apareceram também diversas críticas, a mais relacionada era o fato do C++ não possuir Garbage Collector(em português: **coleta de lixo**), que é uma forma de recuperar regiões da memória que foram previamente alocadas, mas não foram devolvidas para o sistema operacional poder reutilizar .

Então, para resolver esse problema, o próprio inventor do C++(Bjarne Stroustroup) criou uma técnica de contar referências(e desalocar de forma automática) e atingia o mesmo objetivo do Coletor de Lixo, mas com a vantagem de que isso não influenciava no desempenho dos programas que eram escritos em C++, pois o Garbage Collector influenciava de forma significativa no desempenho .

Até hoje, essa memória segura é opcional e é usada adicionando a biblioteca `<memory>` que oferece os **smart pointers** .

Mas, nessas modernas linguagens de programação, essa técnica popularizada pelo C++ não é opcional e sim: obrigatória, ou seja, todos os ponteiros não acessam a memória bruta e sim através de um *wrapper* .

Bem como outras técnicas, como por exemplo, impedir declaração de uma *variável* que não seja utilizada. Nos compiladores para C e C++ é necessário habilitar isso usando o argumento: `Werror=unused-variable`, além de outras .

Mas por que criar uma nova linguagem de programação em vez de usar os recursos do C++ ? 

Isso pode ser respondido de forma direta, que seria por motivos de: publicidade , e esse é um assunto que a Microsoft é *expert* .

---

# Sobre o Projeto Verona
O **Projeto Verona** da Microsoft pode se tornar apenas um experimento que não leva a lugar algum, mas a empresa progrediu o suficiente para detalhar algumas de suas ideias através da Knowledge Transfer Network, sem fins lucrativos, com sede no Reino Unido.  

Matthew Parkinson, pesquisador da Microsoft do Cambridge Computer Lab, no Reino Unido, que se dedica a "investigar o gerenciamento de memória para linguagens de programação gerenciadas", deu uma palestra na semana passada com foco no que a empresa está fazendo para resolver esses problemas de memória.

Na palestra, Parkinson discutiu o trabalho que a Microsoft fez com o *MemGC*, que é a abreviação de Memory Garbage Collector, para Internet Explorer (IE) e Edge. 

O MemGC abordou vulnerabilidades no recurso padrão do navegador conhecido como Document Object Model (DOM), uma representação dos dados usados pelos navegadores para interpretar páginas da web. Os hackers de elite do Project Zero do Google ficaram impressionados com o MemGC da Microsoft depois de pesquisar os principais navegadores .    

> "Nós construímos um coletor de lixo (GC) para o DOM. Essa grande protuberância no *use-after-free* foi basicamente pessoas encontrando maneiras de explorar o gerenciamento de memória no mecanismo DOM no IE", — disse Parkinson, referindo-se a um gráfico que ilustra a proeminência de bugs de segurança de memória. 

O **Projeto Verona** também possui uma sintaxe similar à linguagem de programação [OCaml](https://en.wikipedia.org/wiki/OCaml), assim como o [Carbon](https://terminalroot.com.br/tags#carbon) e o [Rust](https://terminalroot.com.br/2022/03/conheca-o-rustpython-um-python-escrito-em-rust.html)(principalmente ele, pois suas primeiras versões foram justamente escrita com OCaml, depois mudou para o Bootstrapping) que é a tendência para sintaxe, diferenciando das linguagens como: [Java](https://terminalroot.com.br/tags#java), [PHP](https://terminalroot.com.br/tags#php), [JavaScript](https://terminalroot.com.br/tags#javascript), [C++](https://terminalroot.com.br/tags#cppdaily) e entre outras que herdaram a sintaxe estilo [C](https://terminalroot.com.br/tags#linguagemc) .

No entanto, o Projeto Verona ainda manterá abstrações estilo **C++** como uso de: classes, polimorfismo e herança. E até o momento a linguagem de programação **Verona** está sendo escrita em C++ .

Abaixo um exemplo de um básico [Hello, World!](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) escrito com a linguagem de programação **Verona**:

{% highlight cpp %}
class Main {
    main() {
       Builtin.print2("Hello World!"); 
    }
}
{% endhighlight %}

O projeto está sendo apoiado pelo gerente de projeto [C#](https://terminalroot.com.br/tags#csharp): Mads Torgensen e pela engenheira de software de pesquisa da Microsoft Research Cambridge:  Juliana Franco .

---

# Como testar o Projeto Verona na sua máquina ?
O Verona também utiliza o [LLVM](https://terminalroot.com.br/tags#llvm) que serve para gerar o código Assembly final, além de otimizar e padronizar recursos. Mas você pode clonar com [Git](https://terminalroot.com.br/tags#git) de forma *rescursiva* e compilar em seguida, exemplo:

{% highlight bash %}
git clone --recursive https://github.com/microsoft/verona
mkdir build
cd build
cmake -DVERONA_DOWNLOAD_LLVM=ON ..
make
{% endhighlight %}

Esse é o procedimento em linhas gerais, mas já existe detalhamento para compilação tanto no [Windows](https://terminalroot.com.br/tags#windows) para o Visual Studio quanto também para o [Ubuntu](https://terminalroot.com.br/tags#ubuntu). Veja [aqui](https://github.com/microsoft/verona/blob/master/docs/building.md) todas as dependências necessárias e entre outros .

---

## Para mais informações, acesse o repositório oficial do Projeto Verona no GitHub:
## <https://github.com/microsoft/verona>

--

Veja também: 
## [Carbon, nova linguagem de programação do Google, pretende ser sucessora do C++](https://terminalroot.com.br/2022/07/carbon-nova-linguagem-de-programacao-do-google-pretende-ser-sucessora-do-cpp.html) .



