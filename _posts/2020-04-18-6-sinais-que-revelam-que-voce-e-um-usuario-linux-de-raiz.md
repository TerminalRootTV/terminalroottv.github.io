---
layout: post
title: "6 Sinais que revelam que você é um usuário Linux de raiz"
date: 2020-04-18 13:09:11
image: '/assets/img/linux/linux-user-root.jpg'
description: 'Se você é um usuário root do Linux, provavelmente reconhecerá essas tendências comuns.'
icon: 'logos:linux-tux'
iconname: 'linux'
tags:
- artigos
- linux
- gnu
---

![6 Sinais que revelam que você é um usuário Linux de raiz](/assets/img/linux/linux-user-root.jpg)

> Se você é um usuário *root* do Linux, provavelmente reconhecerá essas tendências comuns.

Os usuários do [Linux](https://terminalroot.com.br/linux) são um grupo diversificado, mas muitos de nós compartilham alguns hábitos. Você pode não ter nenhum dos sinais reveladores listados neste [artigo](https://terminalroot.com.br/tags/#artigos) e, se você é um novo usuário do Linux, pode não reconhecer muitos deles ... ainda.

Vão lá à esses 6 sinais!

---

# 1. Até onde você sabe, o mundo começou em 1º de janeiro de 1970
Existem muitos rumores sobre o motivo pelo qual um relógio de computador [Unix](https://terminalroot.com.br/tags/#unix) sempre volta para 01-01 1970 quando é redefinido. Mas a verdade mundana é que a "época" do Unix serve como um ponto de referência comum e simples para sincronização.

Um computador requer valores firmes e claramente definidos; portanto, o valor 1970-01-01T00: 00: 00Z foi escolhido como o início da época do Unix. Sempre que um computador POSIX perde a noção do tempo, um serviço como o Network Time Protocol (NTP) pode fornecer o número de segundos desde 1970-01-01T00: 00: 00Z, que o computador pode converter para uma data amigável ao ser humano.

Data e hora são coisas famosamente complexas a serem rastreadas na computação, em grande parte porque há exceções quase padrão. Um mês nem sempre tem 30 dias, um ano nem sempre tem 365 dias e até segundos tendem a variar um pouco a cada ano. Se você está procurando um exercício de programação divertido e frustrante, tente programar um aplicativo de calendário confiável!

Para mais detalhes sugiro você assistir à [esse vídeo](https://www.youtube.com/watch?v=8FF7JSogTHU)

---

# 2. Você acha que é uma tarefa difícil digitar algo com muitas letras para fazer alguma coisa
Os comandos Unix mais comuns são notoriamente curtos. Além de [comandos](https://terminalroot.com.br/tags/#comandos) como `cd` e `ls` e `mv`, há um comando que literalmente não pode ser mais curto: `w` (que mostra quem está atualmente conectado de acordo com o arquivo `/var/run/utmp`).

Por um lado, comandos extremamente curtos parecem pouco intuitivos. Um novo usuário provavelmente não vai adivinhar que digitar `ls` listaria diretórios. Depois de aprender os comandos, porém, quanto mais curtos, melhor. Se você passa o dia todo em um terminal, menos teclas digitadas significa que pode gastar mais tempo realizando seu trabalho.

Felizmente, os comandos de uma letra estão distantes entre si, o que significa que você pode usar a maioria das letras para *aliases*. Por exemplo, eu crio URL amigáveis do [git.io](https://git.io) com frequência e o comando é muito longo para digitar, por isso criei um **alias/função** e adicionei esta linha ao meu arquivo `~/.bashrc`:

{% highlight bash %}
gist(){
	[[ -z "$1" || -z "$2" ]] && {
		printf "%s\n" "Use: gist [URL] [SHORT-URL]"
		return
	}
	curl https://git.io/ -i -F "url=$1" -F "code=$2"
	echo
}
{% endhighlight %}

Então para criar a URL amigável, basta usar esse comando, e se esquecer a ordem é só digitar o comando sem parâmetros que o mano `help` me ajudará! 😄 .

Você também pode alternar os comandos temporariamente criando alias diretamente no seu prompt para situações específicas, faço isso bastante, se você também faz, considere fazer parte do grupo do título 😃 .

<!-- LISTA MIN -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# 3. Você gosta de Interface Gráfica, mas prefere um WM
Toda vez que eu posto alguma dica de um gerenciador de janelas lado a lado ([Tiling Window Manager](https://terminalroot.com.br/tags/#unixporn)) , vejo em algum lugar alguém comentar: "Não consigo usar WM.", "Difícil vai ser usar esse troço.",... Já eu penso totalmente ao contrário do cara! 🐥 .

Essa facilidade de com um único comando abrir um aplicativo e de ver os dados disponíveis em *desktops* separados , além de ter janelas lado a lado que facilitam debugar e trabalhar, isso me fez não conseguir mais usar: [GNOME](https://terminalroot.com.br/tags/#gnome), [MATE](https://terminalroot.com.br/tags/#mate),...

Eu tenho o GNOME instalado aqui, acho que o [Portage](https://wiki.gentoo.org/wiki/Portage) já atualizou ele umas 3 vezes, e até hoje, nem se quer entrei lá pra ver o que mudou! 😄. E o mais importante, tudo funciona levemente como tomar água de côco numa ilha! 😸 .

---

# 4. Você nunca executou nenhuma ação em um computador mais de três vezes porque já a automatizou pela terceira vez
Perdoe a hipérbole, mas muitos usuários de Linux esperam que seu computador trabalhe mais do que eles. Embora demore algum tempo para aprender a automatizar tarefas comuns, tende a ser mais fácil no Linux do que em outras plataformas, porque o terminal Linux e o sistema operacional Linux são muito bem integrados.

As coisas fáceis de automatizar são as ações que você já executa em um terminal, porque os comandos são apenas cadeias que você digita em um intérprete e esse intérprete (o [shell](https://terminalroot.com.br/tags/#shellscript) em execução no [terminal](https://terminalroot.com.br/tags/#terminal)) não se importa se você digitou as cadeias manualmente ou se você está apenas apontando para um script.

Por exemplo, comumente limpo o: histórico, thumbnails, lixeira, bookmarks backups do Firefox e entre outros com um único comando, o `tchau`, eu adicionei essa função ao meu `~/.bashrc` e toda vez que eu quero limpar tudo, basta eu dar um tchau para eles! ✋
{% highlight bash %}
tchau(){
    [[ -d "${HOME}/.cache/thumbnails" ]] && rm -rf ${HOME}/.cache/thumbnails/    
    [[ -d "${HOME}/.cache/mozilla" ]] && rm -rf ${HOME}/.cache/mozilla/    
    rm ${HOME}/.local/share/recently-used.xbel
    touch ${HOME}/.local/share/recently-used.xbel
    _DIRB="$(find ${HOME}/.mozilla/firefox -type d -name "*bookmarkbackups*")"
    rm $_DIRB/* 2>/dev/null
    rm -rf "${HOME}/.local/share/Trash/files/*"
}
{% endhighlight %}
> A variável `_DIRB` criei propositadamente porque todos os meus comandos são portáveis, eu uso em qualquer sistema ou quando eu vou formatar ou algo desse tipo, o nome encriptado do diretório do Firefox é alterado pelo próprio Firefox, em um novo ambiente.

---

# 5. Sua distro não é comum
Sou um usuário apaixonado pelo [Gentoo](https://terminalroot.com.br/tags/#gentoo), isso mesmo, o fato dele demorar de compilar algumas coisas(WebKitGTK e QtWebEngine, o segundo então, bota demora nisso), eu aproveito pra fazer inúmeras coisas e quando eu termino, eu fico lendo a documentação do Gentoo e até mesmo auxiliando em algumas coisas, sim eu [participo da documentação do Gentoo](https://wiki.gentoo.org/wiki/User:Marcos.oliveira).

Não importa o quão grande é uma [distribuição](https://terminalroot.com.br/tags/#distros); parte do prazer de ser usuário de [Linux](https://terminalroot.com.br/tags/#linux) é a liberdade de ser indeciso sobre qual distro você executa. À primeira vista, todos são basicamente iguais, em linhas finais. Mas você quer aquela que você se identifica. Não consigo em um tópico de artigo descrever as diferenças da distro que eu escolhi, mas com certeza um dos motivos principais está diretamente ligado a minha outra paixão: [C++](https://terminalroot.com.br/cpp).

Tenho uma partição aqui no meu HD que é somente para outras distros, geralmente eu só instalo coisas que é melhor de examinar e utilizar sem ser num [Docker](https://terminalroot.com.br/tags/#docker) ou Máquina Virtual.

Se um dia eu saísse do Gentoo com certeza eu migraria para o [OpenBSD](https://terminalroot.com.br/tags/#openbsd).
> OpenBSD, não uma distribuição Linux

O ponto é que as distribuições Linux são projetos apaixonantes, e é divertido interagir nesse mundo com outras pessoas.

---

# 6. Você é apaixonado por Open Source e Free Software
Apesar de você não alterar sequer uma única linha de código, e muitas vezes nem saber programar, isso não lhe impede de ser apaixonado por essas tecnologias, porque você sabe que não está sendo enganado.

De que ninguém está vigiando sua vida, isso me dá um alívio, por isso prefiro [Software Livre](https://terminalroot.com.br/tags/#freesoftware) e [Código aberto](https://terminalroot.com.br/tags/#opensource), e compilar eles direto da fonte!

---

Espero que vocês tenham gostado do artigo. Lembrando que apesar dele se parecer e se basear em diversos trechos do artigo da [OpenSource.com](https://opensource.com/article/19/10/signs-linux-user), ele foi modificado em grande parte para se adaptar às minhas realidades!

# Assista à esse vídeo sobre Dicas para seu Linux

<iframe width="1234" height="694" src="https://www.youtube.com/embed/LpASuM1Uhw8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Abraços! 😀️




