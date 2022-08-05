---
layout: post
title: "Conheça o Davis, um cliente MPD"
date: 2021-12-09 12:25:35
image: '/assets/img/multimidia/davis.jpg'
description: 'Para você que curte Música, esse é o software até que é legalzinho.'
icon: 'ion:terminal-sharp'
iconname: 'MPD'
tags:
- multimidia
---

![Conheça o Davis, um cliente MPD escrito em Rust](/assets/img/multimidia/davis.jpg)

---

Para você que curte [Rust](https://terminalroot.com.br/tags#rust) e [Música](https://terminalroot.com.br/2020/06/escute-musicas-na-nuvem-direto-do-seu-terminal-linux.html), **Davis** é o player perfeito via [linha de comando](https://terminalroot.com.br/tags#comandos)

# Instalação
Você vai precisar possuir o [MPD](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html), o [Git](https://terminalroot.com.br/tags#git) e o [Rust](https://terminalroot.com.br/tags#rust) .

Após isso basta usar o [cargo](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html) para instalar o **Davis**:

{% highlight sh %}
cargo install davis
{% endhighlight %}

Para utilizar lembre-se de possuir o diretório do `cargo` na sua variável `$PATH`, use esses comandos para adicionar se aidna não estiver

> Para [Bash](https://terminalroot.com.br/tags#bash)
{% highlight sh %}
echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}


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

# Utilização

Primeiramente rode o *daemon* do MPD:

{% highlight sh %}
mpd
{% endhighlight %}

Iniciado normalmente, agora é só adicionar uma playlist ao seu `davis`, exemplo:
> Adicionado um diretório/subdiretório ao `davis`

{% highlight sh %}
davis add ~/Música/marvin-gaye
{% endhighlight %}

Tudo certo é só tocar:

{% highlight sh %}
davis play
{% endhighlight %}

Para ver a lista de *playlists* adicionadas, rode:

{% highlight sh %}
davis queue
{% endhighlight %}

É possível: pular a faixa, parar, pular para a anterior e entre outras opções, inclusive adicionar art do álbum. Para mais detalhes rode o `help`:
> A saída será similar a essa:

{% highlight sh %}
$ davis help

davis 0.1.0
Simon Persson <simon@flaskpost.me>

USAGE:
    davis [FLAGS] [OPTIONS] [SUBCOMMAND]

FLAGS:
        --help     Prints help information.
    -v, --verbose  Enable verbose output.
    -p, --plain    Disable decorations in output, useful for scripting.

OPTIONS:
    -h, --host <host>  IP/hostname or a label defined in the config file.

SUBCOMMANDS:
    davis add <path>                   Add items in path to queue.
    davis albumart -o <output> [path]  Download albumart.
    davis clear                        Clear the current queue.
    davis current                      Display the currently playing song.
    davis del <index>                  Remove song at index from queue.
    davis help                         Prints this message.
    davis list <tag> [query]           List values for tag filtered by query.
    davis load <path>                  Load playlist at path to queue.
    davis ls [path]                    List items in path.
    davis mv <from> <to>               Move song in queue by index.
    davis next                         Skip to next song in queue.
    davis pause                        Pause playback.
    davis play                         Continue playback from current state.
    davis play [index]                 Start playback from index in queue.
    davis prev                         Go back to previous song in queue.
    davis queue                        Display the current queue.
    davis read-comments <file>         Read raw metadata tags for file.
    davis search <query>               Search for files matching query.
    davis seek <position>              Seek to position.
    davis status                       Display MPD status.
    davis stop                         Stop playback.
    davis toggle                       Toggle between play/pause.
    davis update                       Update the MPD database.
{% endhighlight %}

Para mais dicas e detalhes consulte o [repositório](https://github.com/SimonPersson/davis) no GitHub.

---

### Veja também
# [Instale e Configure o ncmpcpp e mpd no seu Linux](https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html)
# [VIMPC - Um Cliente MPD inspirado no Vim](https://terminalroot.com.br/2021/08/vimpc-um-cliente-mpd-inspirado-no-vim.html)



