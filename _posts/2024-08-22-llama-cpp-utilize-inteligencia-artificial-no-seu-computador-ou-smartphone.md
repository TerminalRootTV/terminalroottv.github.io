---
layout: post
title: "LLaMA C++ - Utilize Inteligência Artificial no seu computador ou smartphone"
date: 2024-08-22 09:16:29
image: '/assets/img/ai/llama-cpp.jpg'
description: "🚀 Um inferência LLM feita com C++"
icon: 'ion:terminal-sharp'
iconname: 'AI/C++'
tags:
- ia
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**llama.cpp** é uma biblioteca de software de código aberto escrita em [C++](https://terminalroot.com.br/tags#cpp) que realiza inferência em vários modelos de grandes linguagens, como [Llama](https://llama.meta.com/). Junto com a biblioteca, um [CLI](https://terminalroot.com.br/tags#cli) e um servidor web estão inclusos. Foi desenvolvida junto com o projeto [GGML](https://github.com/ggerganov/ggml), uma biblioteca tensora de uso geral.

Foi desenvolvida por **Georgi Gerganov**, formado em Física, no final de 2022 e inspirada pela `LibNC` que foi criado por **Fabrice Bellard** inventor do [FFmpeg](https://terminalroot.com.br/2021/09/15-exemplos-de-uso-diferente-do-ffmpeg.html) e do [QuickJS](https://terminalroot.com.br/2022/03/instale-o-quickjs-uma-alternativa-ao-nodejs-e-denojs.html).

O diferencial do `LLaMA C++` é que não possui depedências e funciona em computadores sem GPU e smartphones. LLaMA.cpp utiliza o formato de arquivo `GGUF` que é um formato binário que armazena tensores e metadados em um único arquivo.


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
Você pode utilizar binários pré-compilados para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) e [FreeBSD](https://terminalroot.com.br/tags#freebsd).

Basta fazer o download na página de releases. Exemplo para [Ubuntu](https://terminalroot.com.br/tags#ubuntu)(funciona e serve em qualquer distro, mas precisa ter a lib [cURL](https://terminalroot.com.br/2021/05/utilizando-curl-com-cpp.html) instalada):
> Exemplo para a versão de build: `3615`.

{% highlight bash %}
curl -LO https://github.com/ggerganov/llama.cpp/releases/download/b3615/llama-b3615-bin-ubuntu-x64.zip
unzip llama-b3615-bin-ubuntu-x64.zip
cd build
./llama-cli --help
{% endhighlight %}

Você também pode compilar do zero, foi assim que eu fiz, pois desta forma há optimizações na construção para seu hardware. Basta clonar o repositório do GitHub e compilar com [make](https://terminalroot.com.br/tags#make):

{% highlight bash %}
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
./llama-cli --help
{% endhighlight %}

---

## Utilização
Você precisará de algum modelo de exemplo, existem modelos para diversos propósitos: Criar conversa para Chat, Gerar código de linguagens de programação,... E você pode procurar e fazer download no site: [Hugging Face](https://huggingface.co/). Exemplo de download para um Modelo para Chat: `Qwen1.5-4B-Chat-GGUF`

{% highlight bash %}
curl -LO 'https://huggingface.co/Qwen/Qwen1.5-4B-Chat-GGUF/resolve/main/qwen1_5-4b-chat-q4_k_m.gguf?download=true'
{% endhighlight %}
> Para mais informações acesse a aba *Files and versions* no link: <https://huggingface.co/Qwen/Qwen1.5-4B-Chat-GGUF>.

Agora basta usar o `llama-cli` e rodar com os seguintes parâmetros:
> Nesse exemplo, vamos supôr que queremos que a [I.A.](https://terminalroot.com.br/tags#inteligenciaartificial) no responda: *O que é C++?*(em inglês):

{% highlight bash %}
./llama-cli -m qwen1_5-4b-chat-q4_k_m.gguf -p "Whats is C++?" -n 128
{% endhighlight %}
+ `-m` para indicar o caminho do modelo;
+ `-p` para fazer a pergunta;
+ e `-n` é usado para especificar o número de tokens que o modelo deve gerar em resposta a uma entrada. Neste caso, o valor `128` indica que o modelo deve gerar até `128 tokens`.

Aguarde, em alguns casos, dependendo do seu hardware, pode demorar.


<!-- RECTANGLE LARGE -->
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

## Conclusão
Eu achei o projeto excelente, principalmente porque você pode usá-lo na sua máquina sem nenhum custo e nem regra de contas *free*. No entanto, apesar de toda a melhoria significativa, aqueles que possuem somente CPU e com 2 núcleos não terá muita facilidade de uso, sem dizer que essa simples pergunta consumiu quase 15GB da minha RAM.

Mas, isso é porque meu hardware realmente está bem defasado, porém, mesmo assim, rodou!

Existem alguns front-end para o LLaMA C++, incluindo server web e desktop, dentre eles:
+ [Open Playground](https://github.com/nat/openplayground), com UI feita com [TypeScript](https://terminalroot.com.br/tags#typescript) e geração de escritos e conexão com o servidor do LLaMA através de [Python](https://terminalroot.com.br/tags#python);
+ [LM Stuudio](https://lmstudio.ai/) o aplicativo para desktop, feito com [Electron.js](https://terminalroot.com.br/2023/11/como-criar-um-mini-projeto-com-electronjs.html) disponível para Windows, macOS e GNU/Linux(via AppImage).

Além de diversos outros citados no [próprio repositório](https://github.com/ggerganov/llama.cpp) do [llama.cpp](https://github.com/ggerganov/llama.cpp), além de várias outras informações que você pode obter por lá!



