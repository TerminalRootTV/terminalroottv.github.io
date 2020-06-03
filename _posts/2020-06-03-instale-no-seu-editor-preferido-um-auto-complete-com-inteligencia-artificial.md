---
layout: post
title: "Instale no seu Editor Preferido, um Auto-Complete com Inteligência Artificial"
date: 2020-06-03 20:22:48
image: '/assets/img/programacao/tabnine.jpg'
description: 'Um auto-complete de código que usa Machine Learning.'
icon: 'cib:vim'
iconname: 'vim'
tags:
- vim
- visualstudiocode
- programacao
- desenvolvimento
- editores
---

![Instale no seu Editor Preferido, um Auto-Complete com Inteligência Artificial](/assets/img/programacao/tabnine.jpg)

Já faz um tempo que eu estava navegando pelo [Youtube](https://www.youtube.com/TerminalRootTV?sub_confirmation=1) e um anúncio antes do início dos vídeos me chamava atenção, pois era um programador digitando um código e o auto-complete eram alternativas com linhas enormes, decidi clicar para saber mais e acabei instalando.

Ao utilizar no dia-a-dia, percebi que ele era realmente *poderoso*, até as partes que eu ia digitar, antes de começar ele já sugeria pra mim, tanto criando código como criando um artigo pro blog, esse auto-complete é o **TabNine**.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Introdução
[Tabnine](https://www.tabnine.com/) é um auto-complete de código que usa [Machine Learning](https://pt.wikipedia.org/wiki/Aprendizado_de_máquina) para ajudá-lo a escrever código mais rapidamente. TabNine usa a documentação da linguagem para inferir o nome dessa função, tipo de retorno e argumentos e se você estiver escrevendo texto, ele usa formas geralmente utilizada por textos e por você mesmo para lhe ajudar com as alternativas mais precisas.

TabNine está disponível para:
+ [Visual Studio Code](https://terminalroot.com.br/2019/04/vscodium-um-vs-code-open-source-que-nao-te-rasrtreia.html)
+ [Pycharm](https://terminalroot.com.br/2019/10/os-20-melhores-ide-python-para-linux.html) e todos os editores da IntelliJ Plataform;
+ [Sublime Text](https://terminalroot.com.br/2016/05/os-8-melhores-editores-de-texto-para.html);
+ [Vim](https://terminalroot.com.br/vim) com opções que podem ser baseados no [Deoplete](https://github.com/tbodt/deoplete-tabnine) e em [Coc](https://github.com/neoclide/coc-tabnine);
+ [Emacs](https://terminalroot.com.br/2018/07/spacemacs-um-editor-para-desenvolvimento-profissional.html);
+ [Atom](https://terminalroot.com.br/2019/11/top-10-melhores-editores-de-codigo-para-linux.html);
+ e [Jupyter Notebook](https://pt.wikipedia.org/wiki/Projeto_Jupyter);

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

Você pode utilizá-lo GRATUITO por 14 dias com a [Versão Trial](https://www.tabnine.com/trial/) . No entanto, após os 14 dias ele continuará funcionando normalmente, a diferença é que funções adicionais, qeu eu particularmente nem notei, não estarã disponíveis. Essa diferenças podem ser consultadas [aqui](https://www.tabnine.com/pricing).

# Instalando no Vim
A versão para o [Vim](https://www.youtube.com/watch?v=nFWQJiLvjnk) é baseada no [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) e para adicioná-lo, você pode usar o [Vundle](https://github.com/VundleVim/Vundle.vim):
+ Adicione ao seu [.vimrc](https://www.youtube.com/watch?v=XXGk3n1uzPg): 
```viml
Plugin 'zxqfl/tabnine-vim'
```
+ E instale:
```sh
:PluginInstall
```

Ou você pode instalar também da forma *vanilla*:
+ Clone com [Git](https://terminalroot.com.br/git): 
```sh
git clone --depth 1 https://github.com/zxqfl/tabnine-vim
```
+ E adicionar ao seu `~/.vimrc`: 
```sh
set rtp+=~/tabnine-vim
```
> Substitua o caminho completo pelo caminho que você clonou.

Veja abaixo o TabNine em ação:

![TabNine](/assets/img/programacao/tabnine.gif)

# Conclusão
Eu realmente pretendo obter a versão paga, pois achei que o auto-complete do meu **Vim** ficou até mais rápido e bem mais completo. Lembrando que esse artigo não é um post pago, eu rejeito diariamente propostas de posts pagos quando eu não acredito no produto . Mas o TabNine, além de ser u produto de qualidade, lembramos que você pode usar ele normalmente mesmo após o período de trial.

Abraços e compartilhe esse post nas suas redes sociais!

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



