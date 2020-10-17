---
layout: post
title: "Comparando BSD e Linux"
date: '2016-05-26T18:55:00.000-07:00'
image: '/assets/img/bsd/linux_vs_bsd.jpg'
description: "Então qual é realmente a diferença entre, digamos, o Debian GNU/Linux e o FreeBSD ?"
tags:
- linux
- bsd
---

![Comparando BSD e Linux](/assets/img/bsd/linux_vs_bsd.jpg "Comparando BSD e Linux")

> Então qual é realmente a diferença entre, digamos, o [Debian GNU/Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=debian) e o [FreeBSD](https://www.freebsd.org/)? Pra maioria dos usuários, as diferenças são surpreendentemente pequenas: Ambos são sistemas operacionais UNIX® like. Ambos são desenvolvidos por projetos não comerciais (é claro que isso não se aplica a muitas outras distribuições Linux). Na próxima seção, vamos dar uma olhada no [BSD](https://pt.wikipedia.org/wiki/BSD) e compará-lo com o [Linux](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=linux). As descrições se aplicam mais ao [FreeBSD](https://www.freebsd.org/), que somatiza uma média estimada de 80% das instalações de sistemas [BSD](https://pt.wikipedia.org/wiki/BSD), mas as diferenças pro [NetBSD](https://www.netbsd.org/) , pro [OpenBSD](https://www.openbsd.org/) e pro [DragonFlyBSD](https://www.dragonflybsd.org/) são pequenas.

### Quem é dono do BSD?

Nenhuma pessoa ou corporação é dona do __BSD__. Ele é criado e distribuído por uma comunidade de contribuidores altamente técnicos em todo o mundo. Alguns dos componentes do [BSD](https://pt.wikipedia.org/wiki/BSD) são projetos __Open Source__ independentes e gerenciados por mantenedores de projetos distintos.

### Como o BSD é desenvolvido e atualizado?

Os __kernels__ do [BSD](https://pt.wikipedia.org/wiki/BSD) são desenvolvidos e mantidos seguindo o modelo de desenvolvimento do Open Source. Cada projeto mantém uma “__árvore de código fonte__” publicamente acessível sob o __Sistema de Versões Concorrentes (CVS)__, que contém todos os arquivos fontes do projeto, incluindo documentação e outros arquivos acidentais. O __CVS__ permite que usuários façam “check out” (em outras palavras, extrair uma cópia) de qualquer versão desejada do sistema.

Um grande número de desenvolvedores ao redor do mundo contribui para as melhorias do __BSD__. Eles são divididos em __3 tipos__

- __Contribuidores__ escrevem código e documentação. Eles não têm permissão de commit (adicionar código) diretamente na árvore de código fonte. Para que seu código seja incluso no sistema, é necessário que seja revisado e aprovado por um desenvolvedor registrado, os quais são conhecidos como committer.
 
- __Committers__ são desenvolvedores com acesso de escrita na árvore do código fonte. Para se tornar um commiter, o indivíduo deve mostrar habilidade na área em que ele é ativo.

Faz parte da responsabilidade individual de cada desenvolvedor considerar quando devem obter autorização antes de fazer um commit na árvore. No geral, desenvolvedores experientes podem fazer modificações que são obviamente corretas sem precisar de consenso. Por exemplo, um commiter do projeto de documentação pode corrigir erros tipográficos ou gramaticais sem a necessidade de uma revisão. 

Por outro lado, espera-se que desenvolvedores que fazem alterações muito abrangentes ou complicadas enviem suas mudanças para revisão antes de adicioná-las. Em casos extremos, um membro do Grupo Central (Core Team) cuja função seja, o Arquiteto Principal pode ordenar que as modificações sejam retiradas da árvore do código fonte, em um processo conhecido como backing out. Todos os desenvolvedores recebem mensagens de correio eletrônico sobre cada alteração individual, portanto é impossível fazer alguma modificação secretamente.

- __O Grupo Central__. O [FreeBSD](https://www.freebsd.org/) e o [NetBSD](https://www.netbsd.org/) cada qual, tem um grupo central que gerencia o projeto. Tais grupos centrais foram criados no decorrer dos projetos e seu papel não é sempre bem definido. Não é preciso ser um desenvolvedor para se tornar membro do grupo central, apesar de que, normalmente esse é o caso. As regras para o grupo central variam de um projeto para o outro, mas no geral eles têm mais voz na hora de dizer as direções que o projeto deve seguir, do que outros membros fora do grupo.

### Esse modelo se diferencia do Linux em inúmeras maneiras

- Não existe uma pessoa em especial que controla o conteúdo do sistema. Na prática, essa diferença é sobretaxada, considerando que o Arquiteto Principal pode solicitar que códigos sejam retirados do sistema, e que até mesmo o projeto Linux tem várias pessoas autorizadas a fazer modificações.
- Por outro lado, existe um repositório central, um lugar único onde os fontes inteiros do sistema operacional podem ser encontrados, incluindo todas as versões anteriores.
- Os projetos [BSD](https://pt.wikipedia.org/wiki/BSD) mantém um “Sistema Operacional” completo, não apenas o kernel. Essa distinção é marginalmente proveitosa: nem o [BSD](https://pt.wikipedia.org/wiki/BSD) nem o Linux são úteis sem aplicações. As aplicações usadas sob [BSD](https://pt.wikipedia.org/wiki/BSD) são frequentemente as mesmas aplicações usadas sob Linux.
- Como resultado da manutenção formalizada de uma única árvore CVS do código fonte, o desenvolvimento do [BSD](https://pt.wikipedia.org/wiki/BSD) é limpo, e é possível acessar qualquer versão do sistema por seu número de lançamento (release) ou por data. O CVS ainda oferece manutenção incremental ao sistema: por exemplo, o repositório do [FreeBSD](https://www.freebsd.org/) é atualizado em média 100 vezes por dia. A maioria dessas alterações é de pequena ordem.

### Quais são as versões disponíveis do BSD?

Em contraste com as numerosas distribuições Linux, existem apenas quatro __BSDs__ de código livre. Cada projeto [BSD](https://pt.wikipedia.org/wiki/BSD) mantém sua própria árvore de código fonte e seu próprio __kernel__. Na prática, as divergências entre o código à nível de usuário parece ser ainda menor entre os projetos [BSD](https://pt.wikipedia.org/wiki/BSD) do que entre os vários __Linux__.

> É difícil categorizar os objetivos de cada projeto: as diferenças são bastante subjetivas. Basicamente,

- O [FreeBSD](https://www.freebsd.org/) clama por alta performance e facilidade de uso para usuários finais, e é o favorito de provedores de conteúdo da rede mundial de computadores. Ele pode ser usado em um grande número de plataformas, incluindo sistemas baseados em i386™ (“PCs”), sistemas baseados em processadores AMD 64-bit, sistemas baseados em UltraSPARC®, sistemas baseados em processadores Compaq Alpha e sistemas baseados em torno da especificação NEC PC-98. O projeto [FreeBSD](https://www.freebsd.org/) possui significativamente mais usuários do que os outros projetos.
- O [NetBSD](https://www.netbsd.org/) clama pelo máximo de portabilidade: “é lógico que roda NetBSD”. Ele roda de máquinas palmtop à grandes servidores, e vem sendo usado até em missões espaciais da NASA. É particularmente uma boa escolha para rodar em equipamentos antigos que não sejam Intel®.
- O [OpenBSD](https://www.openbsd.org/) clama por segurança e pureza de código: ele usa uma combinação dos conceitos de código livre com rigorosas revisões de seu código para criar um sistema demonstravelmente correto, tornando-o a escolha de organizações conscientes com a segurança como bancos e departamentos do governo. Como o NetBSD, ele roda em várias plataformas.
- O DragonFlyBSD clama por alta performance e escalabilidade acima de tudo, não importa se estamos falando de um sistema composto por um único nó ou um sistema massivamente clusterizado. O DragonFlyBSD tem muitos objetivos técnicos de longo prazo, mas o seu foco concentra-se em prover uma infra estrutura de SMP (multiprocessamento simétrico) que seja fácil de entender, manter e desenvolver.
Existem ainda dois sistemas operacionais [BSD](https://pt.wikipedia.org/wiki/BSD) UNIX® adicionais que não são de código livre, o BSD/OS e o Mac OS® X da Apple:
- O BSD/OS era o mais velho dos derivados do 4.4BSD. Ele não era de código livre, embora as licenças de seu código fonte estivessem disponíveis por um preço relativamente baixo. Ele assemelhava-se ao [FreeBSD](https://www.freebsd.org/) de diversas formas. Dois anos depois da aquisição da BSDI pela Wind River Systems, o BSD/OS falhou em sobreviver como um produto independente. O suporte e o código fonte podem ainda estar disponíveis pela Wind River, mas os novos desenvolvimentos estão todos focados no sistema operacional embarcado VxWorks.
- O Mac OS® X é a mais recente versão do sistema operacional da linha Macintosh® da Apple Computers Inc. O core [BSD](https://pt.wikipedia.org/wiki/BSD) deste sistema operacional, o Darwin, está disponível como um sistema operacional completamente funcional para computadores x86 e PPC. Contudo, o sistema gráfico Aqua/Quartz e muitos outros aspectos proprietários do Mac OS® X continuam como código fechado. Vários desenvolvedores do Darwin também são desenvolvedores do [FreeBSD](https://www.freebsd.org/) e vice versa.

### Como a licença [BSD](https://pt.wikipedia.org/wiki/BSD) se diferencia da licença Pública GNU?

O Linux está disponível sob a Licença Pública Geral GPL (GPL), que foi planejada para eliminar o software proprietário (de fonte fechada). Em particular, qualquer trabalho derivado de um produto lançado sob a GPL também deve oferecer seu código fonte, caso seja requerido. Em contraste, a licença [BSD](https://pt.wikipedia.org/wiki/BSD) é menos restritiva: distribuições apenas binárias são permitidas. Isso é particularmente atrativo para aplicações acopladas (embedded).

### O que mais eu deveria saber?

Considerando que um número menor de aplicações está disponível para o [BSD](https://pt.wikipedia.org/wiki/BSD) do que para o Linux, os desenvolvedores do [BSD](https://pt.wikipedia.org/wiki/BSD) criaram um pacote de compatibilidade Linux, que permite que programas Linux sejam executados sob BSD. O pacote inclui modificações no kernel, de forma a possibilitar as corretas chamadas de sistemas Linux, e arquivos de compatibilidade Linux, como a biblioteca C. Não existe diferença notável na velocidade de execução entre aplicações Linux rodando em uma máquina Linux e aplicações Linux rodando em uma máquina [BSD](https://pt.wikipedia.org/wiki/BSD) de mesma velocidade.
A natureza “tudo do mesmo fornecedor” dos sistemas [BSD](https://pt.wikipedia.org/wiki/BSD) implica na maior facilidade de atualização do que frequentemente acontece no caso do Linux. Os [BSD](https://pt.wikipedia.org/wiki/BSD) oferecem atualizações de versões de bibliotecas oferecendo módulos de compatibilidade com versões mais antigas de bibliotecas, dessa forma é possível rodar binários que existem há vários anos sem o menor problema.

### Qual eu devo usar, BSD ou Linux?

O que isso tudo significa na prática? Quem deve usar BSD? Quem deve usar Linux?

Essa é uma pergunta muito difícil para se responder. Aqui estão algumas considerações

> “Se não está quebrado, não conserte”: Se você já usa algum sistema operacional de código livre, e está feliz com ele, provavelmente não existe uma boa razão para mudar.

- Sistemas BSD, em particular o FreeBSD, podem ter performance notavelmente superior ao Linux. Mas isso não é uma regra. Em muitos casos a diferença pode ser pouca ou até mesmo nem existir. Em alguns casos o Linux pode funcionar melhor que o FreeBSD.
 No geral, sistemas [BSD](https://pt.wikipedia.org/wiki/BSD) tem melhor reputação por sua confiabilidade, principalmente por ser resultado de uma base de códigos mais madura.
- Os projetos [BSD](https://pt.wikipedia.org/wiki/BSD) têm uma melhor reputação em relação a qualidade e abrangência da sua documentação. Os vários projetos de documentação têm por objetivo prover ativamente documentos atualizados, em muitos idiomas e cobrindo todos os aspectos do sistema.
 A licença [BSD](https://pt.wikipedia.org/wiki/BSD) pode ser mais atrativa do que a GPL.
- O [BSD](https://pt.wikipedia.org/wiki/BSD) pode executar a maioria dos binários do Linux, enquanto o Linux não pode executar binários do BSD. Muitas das implementações; [BSD](https://pt.wikipedia.org/wiki/BSD) podem inclusive executar binários de outros sistemas derivados do UNIX®. Como resultado, o [BSD](https://pt.wikipedia.org/wiki/BSD) pode ser uma opção de migração a partir de outros sistemas mais fácil do que o Linux seria.

## Quem oferece suporte, serviços e treinamento para o BSD?

A [BSDI/FreeBSD Mall, Inc.](https://www.freebsdmall.com/) têm fornecido contratos de suporte [FreeBSD](https://www.freebsd.org/) no mercado a quase uma década.

> Em adição, cada um dos projetos tem uma lista de consultores que podem ser contratados: __FreeBSD__, __NetBSD__, e __OpenBSD__.

FONTE: <https://www.freebsd.org/doc/pt_BR/articles/explaining-bsd/comparing-bsd-and-linux.html>

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



