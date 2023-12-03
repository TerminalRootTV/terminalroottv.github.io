---
layout: post
title: "Como acessar partições Linux pelo Windows 10"
date: 2021-08-06 10:32:01
image: '/assets/img/windows/linux-reader.png'
description: 'Um utilitário gratuito que facilita essa comunicação.'
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- gnulinux
---

![Como acessar partições Linux pelo Windows 10](/assets/img/windows/linux-reader.png)

Se você tiver dual boot com Windows e Linux, provavelmente desejará acessar arquivos do Windows para Linux e vice-versa. Por padrão, o Linux pode ler as partições do Windows (FAT e NTFS), mas o Windows não pode ler as partições do Linux (EXT 3/4) sem qualquer software externo. Neste breve guia, mostrarei como acessar as partições Linux do Windows 10 e transferir os dados das partições Linux para o Windows usando um freeware chamado [Linux Reader](https://www.diskinternals.com/linux-reader/).

Ele permite que você acesse arquivos e pastas em sistemas de arquivos Ext, UFS, HFS, ReiserFS ou APFS do Windows. O Linux Reader vem em duas edições. A versão gratuita é suficiente para acessar e copiar arquivos dos sistemas de arquivos acima mencionados do sistema operacional Windows.

A versão paga tem muitos recursos adicionais, como recuperação de dados, recuperação RAID, recuperação de partição, recuperação VMFS, recuperação MySQL, recuperação NTFS e recuperação de fotos, etc.

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


# Acesse partições Linux a partir do Windows 10
+ Acesse o site do Linux Reader e baixe a versão gratuita e instale-a em seu sistema Windows: <https://www.diskinternals.com/linux-reader/>

+ Inicie o Linux Reader a partir do menu iniciar:
![Menu iniciar](/assets/img/windows/Launch-Linux-reader.png.webp)

+ A interface padrão do Linux Reader se parece com a abaixo.
![Interface](/assets/img/windows/Access-Linux-Partitions-From-Windows-10-Using-Linux-reader.png.webp)

+ Como você pode ver na imagem, o Linux Reader mostra todas as partições Linux e Windows. Abra uma partição Linux da qual você deseja copiar os dados. Clique com o botão direito em um arquivo ou pasta e clique no botão "Salvar".
![Salvar](/assets/img/windows/Right-click-on-a-folder-and-click-the-Save-button-in-Linux-reader-interface.png.webp)

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


+ Escolha "Salvar arquivos" e clique em Avançar.
![Next](/assets/img/windows/Choose-save-files-in-Linux-reader.png.webp)

+ Selecione o local da pasta de saída para salvar os arquivos/pasta. Além disso, certifique-se de ter escolhido a opção "Salvar estrutura de diretórios". Esta opção preservará a mesma estrutura de diretório pai na pasta de destino.
![Pastas](/assets/img/windows/Select-the-output-folder-in-Linux-reader.png.webp)

+ Depois o assistente listará os arquivos e diretórios recuperados. Escolha os arquivos ou pastas que deseja salvar no Windows e clique em Avançar.
![Recuperando](/assets/img/windows/Select-list-of-recovered-files-and-directories-in-Linux-reader.png.webp)

+ Agora os arquivos/pastas selecionados serão recuperados e salvos no local de destino.
![Salvos](/assets/img/windows/Recover-files-and-folders-using-Linux-reader.png.webp)


Isso levará algum tempo, dependendo do conteúdo dos arquivos/pastas selecionados na partição do Linux. Quando a recuperação for concluída, escolha outro arquivo/pasta e siga as mesmas etapas para recuperá-los.

Para mais informações acesse o site: <https://www.diskinternals.com/linux-reader/>

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

---

Esse artigo foi originalmente publicado em ingês por [OsTechNix](https://ostechnix.com/how-to-access-linux-partitions-from-windows-10/) com algumas modificações.
