---
layout: post
title: "LibreOffice via Linha de Comando: Como Converter Multiplos Arquivos ODP para PDF"
date: 2020-09-30 08:57:20
image: '/assets/img/libreoffice/soffice.jpg'
description: 'Seus slides em PDF em segundos.'
icon: 'cib:libreoffice'
iconname: 'libreoffice'
tags:
- libreoffice
- comandos
---

![LibreOffice via Linha de Comando: Como Converter Multiplos Arquivos ODP para PDF](/assets/img/libreoffice/soffice.jpg)

Essa é uma forma que eu utilizo para disponibilizar os PDF dos [cursos](https://terminalroot.com.br/cursos/) que eu crio em slides no [LibreOffice Impress](https://pt-br.libreoffice.org/descubra/impress/).

E para não ficar exportando um por um através do: **Exportar como** → **Exportar como PDF**:

![Exportar como PDF](/assets/img/libreoffice//export.png)

Uso somente esse comando e tudo fica pronto para disponibilizar como material adicional.

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

# Introdução
[ODP (OpenDocument Presentation)](https://pt.wikipedia.org/wiki/OpenDocument) é um padrão aberto para o formato de documento digital comparável ao [Microsoft PPTX](https://pt.wikipedia.org/wiki/Microsoft_PowerPoint). Usamos o LibreOffice Impress para criar e abrir arquivos odp.

Usando a linha de comando soffice, você pode converter vários arquivos odp de uma vez. Imagine que você tem 1000 arquivos odp e precisa tê-los como pdf o mais rápido possível. Então, este comando é para você. 

# Comando
Bom, estando dentro do diretório onde esão salvos seus slides **.odp**, basta rodar esse *simples* comando:
{% highlight bash %}
soffice --headless --convert-to pdf *.odp
{% endhighlight %}
Pronto, agora todos os seus arquivos:
> slide-1.odp, slide-2.odp, ... slide-n.odp

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

Foram convertidos em:
> slide-1.pdf, slide-2.pdf, ... slide-n.pdf

> **IMPORTANTE: você deve fechar todas as janelas do LibreOffice em execução antes de executar este comando, caso contrário, ele não funcionará.

Temos um vídeo antigo, mas ainda de muita serventia sobre LibreOffice, se quiser dê uma olhada:

<iframe width="1234" height="694" src="https://www.youtube.com/embed/pAMtbwGySI0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

# Referências
+ [UbuntuBuzz](https://www.ubuntubuzz.com/2016/08/libreoffice-command-line-convert-multiple-files-odp-to-pdf.html)
+ [Templates](http://templates.libreoffice.org/template-center/libreoffice-presentation-templates)
+ [Hexagons](http://templates.libreoffice.org/template-center/hexagons)
+ [White Template](http://templates.libreoffice.org/template-center/white-template)


