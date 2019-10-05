---
layout: post
title: "Falha de segurança no VLC pode permitir que hackers invadam seu computador"
categories: [ News ]
image: 'assets/images/vlc.jpg'
---

Devido à sua natureza gratuita e de código aberto, o VLC é um dos mais populares media players multiplataforma do mundo. Infelizmente, uma falha de segurança recém-descoberta e potencialmente muito séria descoberta no VLC significa que talvez você queira desinstalá-lo até que o pessoal do VideoLAN Project consiga corrigir o problema. Apesar de estar trabalhando em correções, o VideoLAN alega que a falha se encontrava apenas em uma versão anterior e desatualizada do VLC.

Descoberta pela agência de segurança alemã CERT-Bund (via [WinFuture](https://winfuture.de/news,110171.html) ), a nova falha no VLC (listada como [CVE-2019-13615](https://nvd.nist.gov/vuln/detail/CVE-2019-13615)) recebeu uma pontuação básica de vulnerabilidade de 9,8, o que a classifica como “crítica”.

A vulnerabilidade permite uma RCE (execução remota de código), que potencialmente autoriza agentes mal-intencionados a instalarem, modificarem ou executarem um software sem autorização, e também pode ser utilizado para divulgar arquivos no sistema host. Tradução: A falha de segurança do VLC pode permitir que hackers invadam seu computador e vejam seus arquivos.

Felizmente, parece que ninguém tirou proveito da falha ainda, mas com o WinFuture relatando que as versões Windows, Linux e Unix do VLC foram todas afetadas (mas não a versão do macOS), há um grande número de sistemas potencialmente vulneráveis ​​por aí.

O VideoLAN também está ciente do problema e está atualmente [trabalhando em uma série](https://trac.videolan.org/vlc/ticket/22474) de mudanças, embora, neste momento, elas pareçam estar apenas 60% completas. Infelizmente, isso significa que enquanto as pessoas estão esperando por uma solução, seu único recurso para se proteger da falha é desinstalar o VLC e mudar para uma alternativa como o KMPlayer ou o Media Player Classic.

Ou você pode arriscar e acreditar que ninguém vai tentar te atacar enquanto você espera por uma solução. Mas, de qualquer forma, você foi avisado.

Nesta quarta-feira (23), o VideoLAN respondeu ao incidente por meio de um [tuíte](https://twitter.com/videolan/status/1153963312981389312), dizendo que o VLC pode não estar tão vulnerável quanto parecia inicialmente. O VideoLAN diz que o “problema de segurança” no VLC foi causado por uma biblioteca de terceiros chamada Libebml, que foi corrigida há 16 meses, e que as acusações eram baseadas em uma versão anterior (e desatualizada) do VLC.

Via: [Gizmodo](https://gizmodo.uol.com.br/falha-seguranca-vlc-hackers/)
