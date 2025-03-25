---
layout: post
title: "Como Instalar e Utilizar o LaTeX"
date: 2025-03-25 17:11:26
image: '/assets/img/dicas/latex.jpg'
description: "🚀 Procedimento para Ubuntu e Windows."
icon: 'ion:terminal-sharp'
iconname: 'LaTeX'
tags:
- latex
- dicas
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

[LaTeX](https://latex-project.org/) é um sistema de preparação de documentos de alta qualidade, especialmente utilizado para textos científicos, técnicos e matemáticos. Ele permite a criação de documentos com formatação precisa, equações complexas, referências bibliográficas automáticas e estruturação profissional.

LaTeX é uma abreviação de **La**mport **TeX**) foi desenvolvido na década de 1980 por [Leslie Lamport](https://www.youtube.com/watch?v=tsSDvflzJbc). Ao escrever, o escritor usa texto simples, ao invés do *texto formatado encontrado em processadores de texto* [WYSIWYG](https://pt.wikipedia.org/wiki/WYSIWYG) como [Microsoft Word](https://www.microsoft.com/pt-br/microsoft-365/word), [LibreOffice](https://terminalroot.com.br/2020/09/libreoffice-via-linha-de-comando-como-converter-multiplos-arquivos-odp-para-pdf.html) Writer e Apple Pages. 

O escritor utiliza convenções de *tagging* de marcação para: definir a estrutura geral do documento (como artigo, [livro](https://terminalroot.com.br/tags#livros) ou carta), para formatar o texto em todo um documento (como **negrito** e *itálico*) e, para adicionar citações e referências cruzadas.

Um sistema de tipografia **TeX**, tal como *TeX Live* ou *MiKTeX*, é usada para produzir um artigo de saída (publicação eletrônica como *PDF* ou `DVI`) adequado para impressão ou distribuição digital. Também é utilizado para produção de cartas pessoais, artigos e livros sobre assuntos diversos.

Dentro do sistema de tipografia, seu nome é estilizado como LaTeX. Atualmente na versão denominada: `LaTeX 2e`.

Em resumo, serve para:
- Criar artigos acadêmicos, relatórios, teses e livros.  
- Escrever fórmulas matemáticas e símbolos complexos.  
- Gerar índices, sumários e bibliografias automaticamente.  
- Garantir consistência na formatação.  


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

## Instalação 
No [Ubuntu](https://terminalroot.com.br/tags#ubuntu) instale o **TeX Live** usando o APT:
{% highlight bash %}
sudo apt install texlive-latex-base
{% endhighlight %}

Se quiser uma instalação completa com fontes e extras, rode:
{% highlight bash %}
sudo apt install texlive-latex-base texlive-fonts-recommended \
                 texlive-fonts-extra texlive-latex-extra
{% endhighlight %}
> Isso vai instalar quase 1GB de dados, para iniciantes não é tão interessante assim.

Você também pode optar em instalar o editor **TeXstudio**(editor gráfico para LaTeX):
{% highlight bash %}
sudo apt install texstudio
{% endhighlight %}
> Para mais informações acesse o endereço: <https://www.texstudio.org/>.


No [Windows](https://terminalroot.com.br/tags#windows):
- Baixe e instale o **MiKTeX** ([miktex.org](https://miktex.org/)) ou **TeX Live** ([tug.org/texlive](https://www.tug.org/texlive/)).  
- Ou **TeXstudio** ([texstudio.org](https://www.texstudio.org/)) ou **Overleaf** (versão online).

Você também pode usar o [WinGet](https://winget.run/pkg/TeXstudio/TeXstudio) no [PowerShell](https://terminalroot.com.br/tags#powershell):
{% highlight powershell %}
winget install -e --id TeXstudio.TeXstudio
{% endhighlight %}


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

## Exemplo básico de uso do LaTeX
Crie um arquivo de extensão `.tex`, exemplo: `file.tex` e insira esse comteúdo abaixo:

{% highlight latex %}
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage[brazil]{babel}

\title{Meu Primeiro Documento}
\author{Seu Nome}
\date{\today}

\begin{document}

\maketitle

\section{Introdução}
Olá, mundo! Este é meu primeiro documento em LaTeX.

\section{Matemática}
A fórmula quadrática é:
\[ x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} \]

\end{document}
{% endhighlight %}

Para compilar basta usar o comando `pdflatex`:
{% highlight bash %}
pdflatex file.tex
{% endhighlight %}
> Pode ser que ele lhe faça algumas perguntas e no final haverá o símbolo de interrogação: `?`, basta pressionar **ENTER**(várias vezes) que ele terminará, de qualquer forma, de criar o documento.

Depois é só abrir o `file.pdf` no seu visualizador de PDF clicando no mesmo ou rodando no terminal:
{% highlight bash %}
xdg-open file.pdf
{% endhighlight %}
> Isso no Ubuntu e similares.

Ele também irá gerar arquivos intermediários como: `file.aux` e `file.log`, basta removê-los, caso queira, nas próximas vezes o `pdflatex` irá sobreescrever de qualquer forma.
{% highlight bash %}
rm file.aux file.log
{% endhighlight %}

Se estiver no TeXstudio, pressione o botão **Compilar** (geralmente uma seta verde no TeXstudio):
- O LaTeX gerará um arquivo PDF com o resultado.  

Diferenças entre compiladores:
- **PDFLaTeX**: Gera PDF diretamente (recomendado para textos simples).  
- **LaTeX + DVI**: Gera um arquivo intermediário (.dvi) antes do PDF.  
- **BibTeX**: Usado para gerenciar referências bibliográficas.  

---

## Estrutura Básica de um Documento
- `\documentclass{article}`: Define o tipo de documento (pode ser `book`, `report`, etc.).  
- `\usepackage{}`: Adiciona pacotes extras (ex: `amsmath` para matemática).  
- `\begin{document}` e `\end{document}`: Delimitam o conteúdo do arquivo.  

---

## Como Usar LaTeX no Dia a Dia?
- **Equações:** Use `$...$` (inline) ou `\[...\]` (destaque).  
- **Tabelas:** Utilize ambientes como `tabular`.  
- **Imagens:** Adicione com `\includegraphics` (pacote `graphicx`).  
- **Referências:** Use `\cite{chave}` e BibTeX para bibliografias.  

---

### Dicas para Iniciantes
1. Use o **Overleaf** ([overleaf.com](https://www.overleaf.com/)) para praticar online.  
2. Consulte a **Wikibooks LaTeX** ([en.wikibooks.org/wiki/LaTeX](https://en.wikibooks.org/wiki/LaTeX)) para tutoriais.  
3. Comece com templates prontos e modifique gradualmente.  

---

Com prática, LaTeX se torna uma ferramenta poderosa para produção de documentos profissionais! 🚀

---

## Links úteis
+ <https://latex-project.org/>
+ <https://pt.wikipedia.org/wiki/LaTeX>
+ <https://www.overleaf.com/>
+ <https://en.wikibooks.org/wiki/LaTeX>

