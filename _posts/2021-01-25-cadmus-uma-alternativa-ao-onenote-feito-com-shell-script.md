---
layout: post
title: "Cadmus - Uma alternativa ao OneNote feito com Shell Script"
date: 2021-01-25 11:39:54
image: '/assets/img/dicas/cadmus.jpg'
description: 'Scripts Shell para facilitar a gerencia de notas de forma eficaz.'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- shellscript
- dicas
---

![Cadmus - Uma alternativa ao OneNote feito com Shell Script](/assets/img/dicas/cadmus.jpg)


[Cadmus](https://github.com/RyanGreenup/cadmus) fornece uma interface orientada a comandos para localizar e editar arquivos Markdown, como localizar por nome, pesquisar termos, filtrar por tags, gerar backlinks e gerar links relativos a outras notas utilizando um monte de scripts que basicamente usam pipes e ripgrep com skim para exibi-los.

# Instalação
Cadmus está disponível no [AUR](https://terminalroot.com.br/2020/12/como-instalar-pacotes-do-aur-via-yay-no-arch-linux.html) para o [Arch Linux](https://terminalroot.com.br/2020/01/arch-linux-openbox-tint2.html), no entanto, a partir do diretório do usuário normal `~/.cadmus/`, então basta utilizar o [git](https://terminalroot.com.br/git/):
{% highlight bash %}
cd $(mktemp -d)
wget https://raw.githubusercontent.com/RyanGreenup/cadmus/master/install.sh
bash install.sh
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

**Instalação manual**
É necessário possuir todas as dependências: [bat](https://github.com/sharkdp/bat), [cut](https://www.gnu.org/software/coreutils/manual/html_node/The-cut-command.html), [fd](https://github.com/sharkdp/fd), [find](https://terminalroot.com.br/2015/07/20-exemplos-do-comando-find.html), [fzf](https://github.com/junegunn/fzf), [GNU realpath](https://www.gnu.org/software/coreutils/manual/html_node/realpath-invocation.html#realpath-invocation), [grep](https://terminalroot.com.br/2017/01/como-buscar-recursivamente-usando-o-grep.html), [highlight](https://www.archlinux.org/packages/community/x86_64/highlight/), [jq](https://packages.ubuntu.com/search?keywords=jq), [mdcat](https://aur.archlinux.org/packages/mdcat/), [node](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html), [Pandoc](https://github.com/jgm/pandoc), [perl](https://wiki.archlinux.org/index.php/Perl), [python](https://terminalroot.com.br/2019/10/script-basico-de-python-para-aprendizado.html), [ranger](https://www.archlinux.org/packages/community/any/ranger/), [recode](https://www.archlinux.org/packages/extra/x86_64/recode/), [Recoll](https://www.lesbonscomptes.com/recoll/), [sd](https://github.com/chmln/sd), [sed](https://www.gnu.org/software/sed/), [skim](https://github.com/lotabout/skim), [tmsu](https://aur.archlinux.org/packages/tmsu/),  [xclip](https://terminalroot.com.br/2020/10/copie-e-cole-via-linha-de-comando-do-linux-com-xclip.html) ou [wl-clipboard](https://github.com/bugaevc/wl-clipboard) e [rg](https://github.com/BurntSushi/ripgrep) . 

Depois clone o repositório e inclua na sua `$PATH`:
{% highlight bash %}
git clone https://github.com/RyanGreenup/cadmus ~/.cadmus  \
|| echo "Delete $HOME/.cadmus first"
mkdir -p $HOME/.local/bin
ln -s "$HOME/.cadmus/bin/cadmus" "$HOME/.local/bin/"
echo $PATH | grep "$HOME/.local/bin" &> /dev/null && echo "$HOME/.local/bin in path already" || ls "$HOME/.local/bin" &> /dev/null && echo 'PATH="$PATH:$HOME/.local/bin"' >> $HOME/.profile
{% endhighlight %}

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

# Utilização
Após instalado basta rodar o comando `cadmus` no terminal e ele lhe guiará para a gerar um arquivo de configuração.

Para exportar um documentos em **PDF** ou **HTML**, basta rodar o comando:
{% highlight bash %}
cadmus export pdf/html/docs
{% endhighlight %}

# Teclas de atalho

| Teclas | Descrição |
|---|---|
| `PgUp/PgDn` | Visualização de rolagem |
| `Ctrl-w` | Copiar caminho absoluto para a nota |
| `Alt-w` | Copiar caminho relativo para a nota |
| `Ctrl-o` | Abre a nota no aplicativo padrão sem sair |
| `Alt-y` | Copiar o conteúdo do arquivo para a área de transferência |

---

# Comparação com outras ferramentas

|           | FOSS | Offline | Linux/BSD? | terminal? | RawFiles? | Markdown | AnyEditor? |
|-----------|------|---------|------------|-----------|-----------|----------|------------|
| OneNote   | ❌   | ❌      | ❌         | ❌        | ❌        | ❌       | ❌         |
| EverNote  | ❌   | ?       | ❌         | ❌        | ❌        | ❌       | ❌         |
| Notable   | ❌   | ✅      | ✅         | ❌        | ✅        | ✅       | ✅         |
| Zim       | ✅   | ✅      | ✅         | ❌        | ✅        | ✅       | ✅         |
| Obsidian  | ❌   | ✅      | ✅         | ❌        | ✅        | ✅       | ✅         |
| dokuwiki  | ✅   | ❌      | ✅         | ❌        | ✅        | ✅       | ✅         |
| joplin    | ✅   | ✅      | ✅         | ✅        | ❌        | ✅       | ❌ †       |
| mediawiki | ✅   | ❌      | ✅         | ❌        | ❌        | ❌       | ❌ ‡       |
| Org-Mode  | ✅   | ✅      | ✅         | ✅        | ✅        | ❌       | ❌         |
| Cadmus    | ✅   | ✅      | ✅         | ✅        | ✅        | ✅       | ✅         |

---

Quer saber mais sobre o Cadmus ? Visite o projeto no [GitHub](https://github.com/RyanGreenup/cadmus) e também o [site com a toda a documentação](https://ryangreenup.github.io/cadmus/) .

Cadmus em ação:

![Cadmus](/assets/img/dicas/cadmus.gif)

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


