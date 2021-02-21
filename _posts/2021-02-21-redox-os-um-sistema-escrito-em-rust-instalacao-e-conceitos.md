---
layout: post
title: "Redox OS - Um sistema escrito em Rust - Instalação e Conceitos"
date: 2021-02-21 12:49:08
image: '/assets/img/rust/redox.jpg'
description:
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- rust
- opensource
---

![Redox OS - Um sistema escrito em Rust - Instalação e Conceitos](/assets/img/rust/redox.jpg)

[Redox](https://redox-os.org/) é um sistema operacional de microkernel semelhante ao [Unix](https://terminalroot.com.br/tags#unix) escrito na linguagem de programação [Rust](https://terminalroot.com.br/tags#rust) , que tem um forte foco em segurança, estabilidade e alto desempenho.

Redox é inspirado em kernels e sistemas operacionais anteriores, como SeL4 , MINIX , Plan 9 e [BSD](https://terminalroot.com.br/tags#bsd) . É semelhante ao [GNU](https://terminalroot.com.br/tags#gnu) e BSD, mas é escrito em Rust. É um software gratuito e de [código aberto](https://terminalroot.com.br/tags#opensource) distribuído sob uma licença MIT . 

Redox foi criado por Jeremy Soller e foi publicado pela primeira vez em 20 de abril de 2015 no GitHub .

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Componentes
Redox depende de um ecossistema de software escrito em Rust por membros do projeto.

+ **Kernel Redox** - em grande parte deriva do conceito de microkernels, com forte inspiração do MINIX
+ **Ralloc** - alocador de memória
+ **Sistema de arquivos TFS** - inspirado no sistema de arquivos ZFS
+ [Shell Ion](https://openbase.com/rust/ion-shell) - a biblioteca subjacente para shells e execução de comandos no Redox, e o shell padrão
+ **pkgutils** - gerenciador de pacotes
+ **Sistema de janelas orbitais** - monitor e gerenciador de janelas, configura o orbital: esquema, gerencia a exibição e lida com solicitações de criação de janela, redesenho e pesquisa de eventos
+ **relibc** - biblioteca padrão C

# Aplicativos de linha de comando
Redox oferece suporte a programas de interface gráfica do usuário (GUI), incluindo:

+ [NetSurf](https://www.netsurf-browser.org/) - um navegador leve que usa seu próprio mecanismo de layout
+ Calculadora - uma calculadora de software que fornece funções semelhantes ao programa Calculadora do Windows
+ Editor - editor de texto simples , semelhante ao bloco de notas da Microsoft
+ Navegador de arquivos - um gerenciador de arquivos que exibe ícones, nomes, tamanhos e detalhes dos arquivos; usa o comando do iniciador para abrir arquivos quando eles são clicados
+ Visualizador de imagens - visualizador de imagens para tipos de arquivo simples
+ Pixelcannon - renderizador 3D, pode ser usado para comparar o ambiente de trabalho Orbital
+ Orbterm - emulador de terminal tipo ANSI

# Endereços oficiais na internet
+ Endereço oficial: <https://www.redox-os.org/>
+ Atual repositório oficial: <https://gitlab.redox-os.org/redox-os/redox/>

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

# Instalação
Há 2 formas de instalar o **Redox OS**:
+ Compilando o código fonte, para esse procedimento consulte [esse link](https://doc.redox-os.org/book/ch02-04-preparing-the-build.html) e [esse link também](https://doc.redox-os.org/book/ch02-05-compiling-redox.html)
+ Ou fazendo o download do binário

Em ambos os casos você poderá testar o Redox OS:
+ Em uma máquina física
Apesar de poder funcionar, os próprios desenvolvedores ainda [não recomendam](https://doc.redox-os.org/book/ch02-03-real-hardware.html), pois o Redox ainda não está tão pronto para isso

+ Ou numa máquina virtual, nesse caso, o [QEMU](https://terminalroot.com.br/qemu.html), que é justamente o que iremos fazer aqui.

Antes de qualquer coisa recomendo vocês lerem [esse artigo](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html) no blog **Terminal Root** sobre [QEMU/KVM](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html) para saber como instalar e utilizar.

# Efetuando o download do Redox OS
Primeiramente vamos fazer o download do arquivo compactado em que há o binário para executarmos em nossa máquina, há 4 opçoes para download, entre elas:
+ `redox_0.6.0_harddrive-efi.bin.gz` - Como o próprio nome pressupõe, possui suporte a EFI e não é um LiveDisk
+ `redox_0.6.0_harddrive.bin.gz` - Não é LiveDisk e não possui suporte a EFI
+ `redox_0.6.0_livedisk-efi.iso.gz` - É um LiveDisk com suporte a EFI
+ `redox_0.6.0_livedisk.iso.gz` - Um LiveDisk sem suporte à EFI.

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

Escolha o que achar mais conveniente para seu caso, para esse vídeo eu escolhi a segunda opção:
### `redox_0.6.0_harddrive.bin.gz` - Não é LiveDisk e não possui suporte a EFI
Por se tratar da melhor forma de testar, acredito eu. Você pode fazer o download direto pelo navegador através [desse link](https://gitlab.redox-os.org/redox-os/redox/-/jobs/31100/artifacts/browse/build/img/) ou rodar esse comando:
{% highlight bash %}
wget https://gitlab.redox-os.org/redox-os/redox/-/jobs/31100/artifacts/raw/build/img/redox_0.6.0_livedisk-efi.iso.gz
{% endhighlight %}

Após isso é só extrair o `.gz`:
> A opção `-k` é para manter o arquivo original

{% highlight bash %}
gunzip -k redox_0.6.0_harddrive.bin.gz
{% endhighlight %}

Agora vamos renomear para usarmos um comando pronto oferecido pela documentação do Redox OS:
{% highlight bash %}
mv redox_0.6.0_harddrive.bin harddrive.bin 
{% endhighlight %}

Tudo pronto, agora vamos rodar o Redox OS!

# Testando o Redox OS
Com o [QEMU](https://terminalroot.com.br/2021/02/como-instalar-o-qemu-kvm-no-linux-mint-ubuntu-e-outras-distros.html) devidamente instalado e com os passos acima realizados, estando no diretório que você descompactou e renomeou, basta rodar esse comando disponibilizado pela própria [documentação](https://doc.redox-os.org/book/ch02-02-try-vm.html) do Redox OS .
{% highlight bash %}
qemu-system-x86_64 -serial mon:stdio -d cpu_reset -d guest_errors -smp 4 -m 1024 -s -machine q35 -device ich9-intel-hda -device hda-duplex -net nic,model=e1000 -net user -device nec-usb-xhci,id=xhci -device usb-tablet,bus=xhci.0 -enable-kvm -cpu host -drive file=harddrive.bin,format=raw
{% endhighlight %}

Durante o boot do sistema, aparecerá essa pergunta:
{% highlight bash %}
Is this OK?
{% endhighlight %}
Basta teclar `y` de **yes** para continuar.

+ O usuário para logar no sistema é: **root**
+ E a senha é: **password**

# Análises de Aplicativos
+ O navegador padrão é o [Netsuff]() - Como o teste foi em VM a largura da janela expandiu o tamanho da tela. Ele abre na página inicial do Redox OS: <https://www.redox-os.org/> . A renderização do site: <https://terminalroot.com.br/> não carregou como deveria, isso provavelmente por conta do [Javascript](https://terminalroot.com.br/tags#javascript) do navegador.

+ O emulador de terminal é o **Orbterm** e o Shell padrão é o [Ion](https://doc.redox-os.org/book/ch03-03-shell.html) você pode customizar o mesmo para melhorar sua utilização, veja abaixo informações que eu testei:
{% highlight bash %}
echo $SHELL
env
reset
{% endhighlight %}
> O histórico do `root` por padrão só fica salvo enquanto a janela Obterm estiver aberta, após fechar, perde-se o histórico . Você pode configurar o `initrc`, exemplo:

{% highlight bash %}
editor .config/ion/initrc
{% endhighlight %}
{% highlight bash %}
echo "Fala, $USER! Bem-vindo ao Ion do RedoxOS - Rust"
{% endhighlight %}
> Assim que fechar e abrir o terminal, a mensagem será automaticamente exibida.

Testando um `script.sh` com Ion: `editor script.sh`
{% highlight bash %}
#!/bin/ion
echo "Testando um script"

{% endhighlight %}
> `chmod +x script.sh` && `./script.sh`

+ Ao abrir o gerenciador de arquivos do Orbital(Ambiente Desktop do Rust) , basta um único clique para entrar em um diretório ou para sair `..`

+ Os arquivos de configuração são no formato `.toml` que é uma alternativas ao: `JSON`, `YAML` e `INI` , o diferencial desse formato é que é flexível e simples, foi criado por Tom Prester-Werner, por isso o acrônimo: **Tom's Obvious, Minimal Language** ou em português: **Linguagem Mínima e óbvia de Tom** . Ele também permite comentários estilo Shell(`#`) como os demais, como excessão do formato JSON que não permite nenhum tipo de comentário. [Saiba mais](https://en.m.wikipedia.org/wiki/TOML).

+ O editor de texto é bem básico estilo o [Notepad](https://terminalroot.com.br/2017/11/editores-de-texto-linux.html) do [Windows]()
{% highlight bash %}
Testando
# Save as: algo.txt
close
cat algo.txt
{% endhighlight %}

+ No painel do Orbital ainda existe uma: calculadora, um calendário, visualisador de imagens e um mapa de caracteres.

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

# Instalando novos pacotes
O gerenciador de caixotes(baseado em crates) é o [pkgutils](https://github.com/redox-os/pkgutils) com o comando `pkg`. Para saber todos os parâmetros de utilização, rode:
{% highlight bash %}
pkg --help
{% endhighlight %}

Nesse exemplo vamos instalar o mini clone do [Vim](https://terminalroot.com.br/vim/) : o [Sodium](https://github.com/redox-os/sodium) . Basta rodar o comando:
{% highlight bash %}
pkg install sodium
{% endhighlight %}
> Redimensione a janela para conseguir ver a barra inferior . Alguns comandos são similares ao [Vim](https://terminalroot.com.br/vim/) , mas como ainda está em desenvolvimento, ele não reconheceu os comandos: `w`(escrever as mudanças) e `q`(para sair), tive que fechar a janela e as mudanças no arquivo `algo.txt` com `sodium algo.txt` não foram efetivadas.

Para atualizar os caixotes use o comando: `pkg upgrade`

Para sair do Redox OS, basta abrir o terminal e digitar:
{% highlight bash %}
shutdown
{% endhighlight %}

# Conclusão
Bom, eu gostei muito do Redox OS, achei uma ideia inovadora e apoio totalmente o projeto, também pelo fato que sou fã de [Rust](https://terminalroot.com.br/tags#rust) . Mas como há na própria documentação do Redox:
{% highlight txt %}
"Atualmente, o Redox não vai substituir o seu sistema operacional existente, mas é uma coisa divertida de tentar..."
Redox OS
{% endhighlight %}

# Assista o Vídeo sobre o Redox

<iframe width="910" height="390" src="https://www.youtube.com/embed/7yZb3HLU1tU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


