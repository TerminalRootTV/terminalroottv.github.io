---
layout: post
title: "Xonsh - Um Shell para os Amantes de Python"
date: 2019-06-18 12:30:03
image: '/assets/img/python/xonsh.jpg'
description: 'O Xonsh é uma Shell e um prompt de comando compatíveis com Unix, Python e multiplataforma.'
main-class: 'shell'
tags:
- python
- shellscript
- terminal
---

![Xonsh - Um Shell para os Amantes de Python](/assets/img/python/xonsh.jpg)

Já faz um tempo que eu conheci o [Xonsh](https://xon.sh/), desde o dia que eu resolvi *passear* por alguns aplicativos do [Portage](https://wiki.gentoo.org/wiki/Portage) e encontrei o Xonsh . Á princípio só fiz um teste básico , mas só depois de um tempo resolvi descobri ver o que tem de diferente nesse [Shell](https://terminalroot.com.br/shell/). E instalei a versão mais recente (que não está nos repositórios das distros) , bem como também suas dependências que o deixam mais intuitivo.

Vamos lá conhecer esse Xonsh!

## Introdução

O Xonsh é uma Shell e um prompt de comando compatíveis com Unix, [Python](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Python) e multiplataforma, disponível para [Linux](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Linux), [macOS](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=macOS) e [Windows](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=Windows). É destinado à especialistas e novatos. Para quem é desenvolvedor Python, o Xonsh é uma verdadeira *mão na roda* , pois ele é praticamente um utilitário híbrido e reconhece duas linguagens no mesmo ambiente.

## Instalação

O Xonsh está disponível no repositório das principais distribuições Linux, e você pode instalá-lo usando seu gerenciador de pacotes, assim:

> Lembrando que na maioria das distribuições, o Xonsh não está com sua versão atualizada.

{% highlight bash %}
emerge xonsh # Gentoo, Funtoo, Sabayon e similares
sudo apt install xonsh # Debian, Ubuntu, Mint e similares
pacman -S xonsh # Arch Linux, Manjaro e similares
{% endhighlight %}

Mas a forma mais correta, na minha opinião, de instalá-lo é:

+ 1° Instale as dependências

**Portage**

{% highlight bash %}
emerge dev-python/ply prompt_toolkit setproctitle wcwidth pygments
{% endhighlight %}


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


**APT**

{% highlight bash %}
python3-ply python3-prompt-toolkit python3-pygments python3-setproctitle python3-wcwidth
{% endhighlight %}

**Para sua distribuição, use o comando de busca do gerenciador e pesquise o nome dessas dependências**

+ 2° Depois vamos clonar o Xonsh com o Git

{% highlight bash %}
git clone https://github.com/xonsh/xonsh.git
{% endhighlight %}

+ 3° Entre no diretório clonado e instale com *root* ou *sudo*

{% highlight bash %}
cd xonsh
sudo python setup.py install
{% endhighlight %}


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


Certifique-se que o comando python está apontando para o Python3.6 `ls -l /usr/bin/python*`, se não estiver, remova e recrie o link simbólico, exemplo:

{% highlight bash %}
sudo rm /usr/bin/python
sudo ln -sf /usr/bin/python3.6 /usr/bin/python
{% endhighlight %}

## Configurações

Após instalado, você pode entrar/rodar o Xonsh, apenas rodando o comando `xonsh` , mas você verá que o mesmo funcionará, no entanto, isso pode lhe confundir. Para evitar isso, saia do xonsh `exit` e crie um arquivo de configuração `vim ~/.xonshrc` com as configurações básicas:

> Lembrando que essas configurações podem ser encontradas, digitando **Ctrl + f** no seu navegador na página principal do Xonsh <https://xon.sh/> e depois digitando **xonshrc** , ou indo até secção: **Config Files and Settings** e depois no link **Snippets for xonshrc** que seria o mesmo em ir direto no link: <https://xon.sh/xonshrc.html#snippets-for-xonshrc>

{% highlight python %}
# alias to quit AwesomeWM from the terminal
def _quit_awesome(args, stdin=None):
    lines = $(ps ux | grep "gnome-session --session=awesome").splitlines()
    pids = [l.split()[1] for l in lines]
    for pid in pids:
        kill @(pid)

aliases['qa'] = _quit_awesome

# some customization options, see https://xon.sh/envvars.html for details
$MULTILINE_PROMPT = '`·.,¸,.·*¯`·.,¸,.·*¯'
$XONSH_SHOW_TRACEBACK = True
$XONSH_STORE_STDOUT = True
$XONSH_HISTORY_MATCH_ANYWHERE = True
$COMPLETIONS_CONFIRM = True
$XONSH_AUTOPAIR = True
{% endhighlight %}

Se quiser usar um Prompt customizado adicione essa linha: `$PROMPT = '{user}@{hostname}:{cwd} > '`
> De acordo com a documentação: **Config Files and Settings** >> **Environment Variables** >> **$PROMPT** >> <https://xon.sh/tutorial.html#customizing-the-prompt> , além de incluí-lo na sua lista de Shells `which xonsh | sudo tee -a /etc/shells` ou até mesmo torná-lo seu shell padrão: `chsh -s $(which xonsh)` e também `echo '$SHELL = \'/usr/bin/xonsh\'' >> ~/.xonshrc`

## Utilização

Você pode customizar ainda mais seu PROMPT, cores, criar funções, aliases,... entre diversas customizações para variáveis de ambiente, utilizar o Python e o Shell diretamente via linha de comando . Assista ao vídeo e saiba mais:

<iframe width="920" height="400" src="https://www.youtube.com/embed/7dKWvTFoRts" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## O que você achou do Xonsh ? Conte-nos nos comentários!

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

