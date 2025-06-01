---
layout: post
title: "Obtenha Emojis via Linha de Comando"
date: 2025-05-31 21:51:40
image: '/assets/img/terminal/emoji.jpg'
description: "🚀 Um comando com autocomplete feito com C++."
icon: 'ion:terminal-sharp'
iconname: 'Terminal/C++'
tags:
- terminal
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Eu o dia foi bastante tranquilo e aproveitei pra ficar inventando algumas coisas. Dentre algumas delas, eu encotrei um link de vários emojis no meus favoritos e pensei:

+ *— Por que não obter esses emojis via linha de comando pra ficar mais fácil?!*

E comecei a escrever um código básico e surgiu esse comando simples pra ajudar por mais básica que seja a ajuda.

Veja como compilar e instalar no seu sistema [Unix-like](https://terminalroot.com.br/tags#unix).


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

## 💼 Instalação
Lógico que você precisa ou do [GCC](https://terminalroot.com.br/tags#gcc) ou do [Clang](https://terminalroot.com.br/tags#clang) instalado.

Depois é só seguir esses passos:

### ⤵️  01. Baixe a lista de emoji:
Ou com `wget`:
{% highlight bash %}
wget -q bit.ly/emoji-txt -O ~/.emojis.txt
{% endhighlight %}

Ou com [cURL](https://terminalroot.com.br/tags#curl):
{% highlight bash %}
curl -sL bit.ly/emoji-txt -o ~/.emojis.txt
{% endhighlight %}

### 📄 02. Crie um arquivo [C++](https://terminalroot.com.br/tags#cpp):
> Exemplo: `vim emoji.cpp`

E cole esse código dentro:
{% highlight cpp %}
#include <iostream>
#include <fstream>

constexpr auto show_emoji = [](const std::string& query){
  const std::string user = std::getenv("USER");
  std::ifstream file("/home/" + user + "/.emojis.txt");
  std::string line;
  bool found = false;
   
  while(std::getline(file, line)){
    const size_t space_pos = line.find(' ');
    if (space_pos == std::string::npos) continue;
    const std::string name = line.substr(0, space_pos);
    const std::string emoji = line.substr(space_pos + 1);
    if(name.find(query) != std::string::npos){
      std::cout << emoji << " " << name << '\n';
      found = true;
    }
  }
   
  if(!found){
    std::cerr << "Emoji not found.\n";
  }
};

int main(int argc, char** argv){
  if (argc < 2) return 1;
  show_emoji(argv[1]);
}
{% endhighlight %}

### 🚧 03. Compile e instale:
{% highlight bash %}
g++ -O3 -ffast-math emoji.cpp -o emoji
sudo mv emoji /usr/local/bin
{% endhighlight %}

### 📺 04. Adicione autocomplete para seu terminal:
Para adicionar o autocomplete para Bash:
> Adicione ao final do seu `~/.bashrc`

{% highlight bash %}
_emoji_complete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(grep "^$cur" ${HOME}/.emojis.txt)" -- "$cur") )
}
complete -F _emoji_complete emoji
{% endhighlight %}
Depois rode: `source ~/.bashrc`

Para adicionar o autocomplete para ZSH:
> Adicione ao final do seu `~/.zshrc`

{% highlight bash %}
_emoji_complete() {
  local -a matches
  local cur="$words[2]"

  matches=($(grep "^$cur" "${HOME}/.emojis.txt"))
  compadd -- $matches
}

compdef _emoji_complete emoji
{% endhighlight %}
Depois rode: `source ~/.zshrc`

Teste: 
{% highlight bash %}
$ emoji game<TAB>
game      game_die

$ emoji game<ENTER>
🎮 game
🎲 game_die
{% endhighlight %}

![alt text](/assets/img/terminal/emoji.gif) 

---

Eu preenchi os emojis dessa postagem usando ele: usei palavras como: `emoji tv`, `emoji const`(para construção), `emoji doc`(documento), ... Logo menos, você se acostuma com as palavras e encontra todos facilmente! 😺

Legalzinho, né? 😃 
