---
layout: post
title: "Exa - Uma alternativa ao ls"
date: 2021-08-09 10:23:10
image: '/assets/img/rust/exa.jpg'
description: 'Mais amigável, simples e rápido.'
icon: 'ion:terminal-sharp'
iconname: 'Comandos'
tags:
- comandos
---

![Exa - Uma alternativa ao ls escrita em Rust](/assets/img/rust/exa.jpg)

**exa** é um substituto moderno para o programa de linha de comando de listagem de arquivos `ls` que vem com os sistemas operacionais Unix e Linux, oferecendo a ele mais recursos e melhores padrões.

Ele usa cores para distinguir tipos de arquivo e metadados. Ele conhece links simbólicos, atributos estendidos e Git. E é pequeno, rápido e apenas um único binário.

Ao tomar algumas decisões de forma deliberada de forma diferente, exa tenta ser uma versão de ls com mais recursos e mais amigável. 

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Instalação
Exa está disponível para diversas [distribuições](https://terminalroot.com.br/tags#distros) e sistemas operacionais.

Verifique a forma de instalação clicando no seu sistema/distro abaixo:

<script>
  function change_code(num){
    const com = ["emerge sys-apps/exa", "apt install exa", "dnf install exa", "pacman -S exa",
                "xbps-install -S exa", "zypper install exa", "cargo install exa"]
    const btn = ["primary", "secondary", "danger", "info", "dark", "warning", "link"]
    //document.getElementsByClassName("language-bash").innerHTML = com[num]
    document.getElementById("code").innerHTML = "sudo " + com[num]
    //alert( com[num] )
    for( var i = 0; i <= 6; i++ ){
      if( i == num ){
        //document.getElementById("cc-" + i).style.color = "#000"
        var element = document.getElementById("cc-" + i);
        element.classList.remove("btn-" + btn[i]);
        element.classList.add("btn-outline-" + btn[i]);
      }else{
        //document.getElementById("cc-" + i).style.color = "#fff"
        var element = document.getElementById("cc-" + i);
        element.classList.remove("btn-outline-" + btn[i]);
        element.classList.add("btn-" + btn[i]);
      }
    }
  }
</script>


<p>
  <button class="btn btn-outline-primary btn-sm" id="cc-0" onclick="change_code(0)">Gentoo</button> 
  <button class="btn btn-secondary btn-sm" id="cc-1" onclick="change_code(1)">Debian/Ubuntu/Mint</button> 
  <button class="btn btn-danger btn-sm" id="cc-2" onclick="change_code(2)">Fedora/Red Hat</button> 
  <button class="btn btn-info btn-sm" id="cc-3" onclick="change_code(3)">Arch/Manjaro</button>
  <button class="btn btn-dark btn-sm" id="cc-4" onclick="change_code(4)">Void Linux</button>
  <button class="btn btn-warning btn-sm" id="cc-5" onclick="change_code(5)">OpenSUSE</button>
  <button class="btn btn-link btn-sm" id="cc-6" onclick="change_code(6)">Outro Sistema/Distro</button>
</p>

<pre><code id="code">emerge sys-apps/exa</code></pre>

---

# Utilização
Após instalado, basta rodar o comando `exa` para listar os arquivos. Entre as opções de argumentos são:
+ `-1`, `--oneline:`: exibe uma entrada por linha
+ `-G`, `--grid`: exibe as entradas como uma grade (padrão)
+ `-l`, `--long`: exibe detalhes e atributos estendidos
+ `-R`, `--recurse`: redireciona para diretórios
+ `-T`, `--tree`: retorna aos diretórios como uma árvore
+ `-x`, `--across`: classifica a grade transversalmente, em vez de para baixo
+ `-F`, `--classify`: indicador de tipo de exibição por nomes de arquivo
+ `--colo[u]r`: quando usar cores de terminal
+ `--colo[u]r-scale`: destaca os níveis de tamanhos de arquivo de maneira distinta
+ `--icons`: ícones de exibição
+ `--no-icons`: não exibe ícones (sempre substitui `--icons`)

E entre muitas outras opções que podem ser consultadas no site oficial do exa:
### <https://the.exa.website/>

Não deixe de passar lá e conferir!

Até mais!
