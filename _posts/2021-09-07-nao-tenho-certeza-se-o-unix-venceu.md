---
layout: post
title: "Não tenho certeza se o UNIX® venceu"
date: 2021-09-07 08:40:01
image: '/assets/img/unix/unix-vs-linux.jpg'
description: 'Verdades difíceis de engolir.'
icon: 'ion:terminal-sharp'
iconname: 'UNIX®'
tags:
- unix
---

![Não tenho certeza se o UNIX ganhou](/assets/img/unix/unix-vs-linux.jpg)

Eu sou viciado em leitura e dia desse navegando pela internet encontrei um texto interessante e gostei tanto dele que resolvi publicar aqui. 

Pelo título você já sabe do que se trata e realmente é uma visão interessante e que eu já havia percebido isso. Os créditos e o link(em inglês) do autor estarão disponíveis ao final desse artigo, caso você deseje consultar mais publicações do mesmo.

Segue:
> Observação: A tradução foi feita pelo [Google Tradutor](https://translate.google.com/), mas fiz alguns ajustes.

---

![Open quotes](/assets/img/tools/open-quotes.png) Ultimamente tenho lido muitos artigos proclamando que o UNIX venceu e estou em dúvida se isso é verdade.

Deixando os fundamentos de Darwin da Apple de lado, a maioria desses artigos discute o Linux e como ele potencializa tudo, desde nuvens e máquinas virtuais a dispositivos, smartphones e sistemas embarcados. Até mesmo a Microsoft, a empresa anteriormente presidida por um cavalheiro elegante que afirmava que o Linux era um câncer maligno e financiava pesquisas duvidosas de TCO , agora tem o subsistema Windows para Linux com o nome inverso.

Exceto, GNU não é UNIX. O Real UNIX está em declínio há anos, de forma mais espetacular com a compra da Sun Microsystems e o subsequente fechamento de fontes e eliminação do Solaris. O IRIX da SGI foi descontinuado há duas décadas. SCO e suas várias phoenixes não podem estar empurrando muitos UnixWares e OpenServers novos. Empresas como IBM AIX e HP-UX são relegadas a tarefas de bastidores, com o Tux sendo o centro das atenções por seus fornecedores. E quem pode esquecer Xenix.

Isso deixa o Linux, um sistema que Dennis Ritchie descreveu em 1999 como “desenhando tão fortemente na base fornecida pelo UNIX”. Minha preocupação é o Linux e a comunidade em torno dele se afastou ainda mais do UNIX por um longo tempo, a ponto de as discussões do systemd incluir comentários como este com centenas de votos positivos:

As pessoas veem o Linux como um sistema operacional semelhante ao UNIX. Isso é o que era originalmente, mas agora está superando esse legado. E isso perturba algumas pessoas.

Essa atitude talvez seja mais reveladora do que o OP pretendia.

Minhas primeiras experiências industriais e educacionais em UNIX foram com SunOS. Esses sistemas tinham suas próprias limitações frustrantes em comparação com o que eu podia fazer em meu FreeBSD e Red Hat Linux boxen em casa na época, mas parte de usá-los era aprender sobre UNIX . Mesmo com os BSDs, lembro-me de ter lido aquela ótima citação de que aprender o FreeBSD tornou o cavalheiro um usuário Linux melhor. É importante entender por que decisões específicas foram tomadas e por que alertamos contra outras pessoas.

Como diz o ditado muito citado, aqueles que não entendem o UNIX estão condenados a reinventá-lo, mal. Infelizmente para nós, agora existem pessoas influentes na indústria para quem o Linux é sua única experiência UNIX ou semelhante ao UNIX. Alguns, como o OP acima, veem o UNIX como um vestígio.

O resultado inevitável disso é uma monocultura de foco restrito. O software está cada vez mais assumindo o Linux, e as idéias curiosas de compatibilidade e portabilidade POSIX são vistas como anacronismos que perdem tempo. Alguns dos erros freudianos mais engraçados nos relatórios de bugs do systemd decorrem de mal-entendidos fundamentais sobre o UNIX e da indiferença dos desenvolvedores em relação a ele. Isso deve preocupá-lo se você entende e valoriza as filosofias de desenvolvimento e design de sistema do UNIX.

Estou aliviado que o Linux está em uso generalizado; como usuários do FreeBSD e do macOS, nos beneficiamos de seu ecossistema e de seu conhecimento. Não se engane, se a Microsoft tivesse conseguido o que queria, estaríamos todos executando o Windows Server hoje e sua reviravolta com o Linux não teria acontecido. Você também está livre para pensar que o UNIX tradicional é antiquado e o Linux é o futuro. De qualquer forma, a vitória do UNIX é apenas uma meia-verdade; na melhor das hipóteses, foi suplantado por um sistema operacional que antes se parecia mais com ele em design, filosofia e atitudes do que agora. 
![Close quotes](/assets/img/tools/close-quotes.png) 


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

Espero que você tenha entendido a visão do autor. Postagem original: [Rubenerd](https://rubenerd.com/im-not-sure-that-unix-won/) .
