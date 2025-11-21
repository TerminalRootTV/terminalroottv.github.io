---
layout: post
title: "Como converter várias imagens WEBP para JPG com C++ e ImageMagick"
date: 2025-11-19 12:19:35
image: '/assets/img/cpp/w2j.jpg'
description: "🪄 Com velocidade e precisão."
icon: 'ion:terminal-sharp'
iconname: 'C++/Script'
tags:
- magick
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Há muito tempo atrás eu havia feito um [script](https://terminalroot.com.br/tags#shell) que bastava eu entrar em uma pasta e rodar um comando e, mesmo entre vários arquivos, convertia imagens WEBP para JPG.

No entanto, além de presenciar algumas vezes, *falhas na conversão*, houve uma vez que eu tinha uma pasta com muitos `.webp` e notei uma *leve* **lentidão**.

Então, decidi refazer o código em [C++](https://terminalroot.com.br/tags#cpp).


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

## Código
Antes de mais nada, você precisa possuir instalado o `ImageMagick Dev`(API `.h`) na sua máquina, para isso rode:
> Exemplo em sistemas que possuem o APT:

{% highlight bash %}
sudo apt install imagemagick graphicsmagick-libmagick-dev-compat
{% endhighlight %}

Agora crie o arquivo [C++](https://terminalroot.com.br/tags#cpp), exemplo: `main.cpp` e cole esse código dentro.
> O código por si só é auto exeplicável, ou seja, lista os arquivos `.webp` e converte para `.jpg` e após isso, remove os `.webp`, se não houver nenhum arquivo `.webp` no diretório que você estiver rodando o binário, emite um aviso.

{% highlight cpp %}
#include <Magick++.h>
#include <filesystem>
#include <iostream>

namespace fs = std::filesystem;

int main(int argc, char **argv){
  (void)argc;
  Magick::InitializeMagick(*argv);

  bool found = false;

  for(const auto &entry : fs::directory_iterator(fs::current_path())){
    if(entry.is_regular_file() && entry.path().extension() == ".webp"){
      found = true;
      std::string input = entry.path().string();

      fs::path out_path = entry.path();
      out_path.replace_extension(".jpg");
      std::string output = out_path.string();

      try{
        Magick::Image img(input);
        img.write(output);
        fs::remove(entry.path());
      }catch(Magick::Exception &e){
        std::cerr << input << ": " << e.what() << "\n";
        return EXIT_FAILURE;
      }
    }
  }

  if(!found){
    // Não há imagens para converter.
    std::cout << "There are no images to convert.\n";
  }
}
{% endhighlight %}

Compile, como `-ffast-math`, dará ainda mais velocidade na execução do binário:

{% highlight bash %}
g++ -ffast-math -o w2j $(Magick++-config --cxxflags --cppflags) main.cpp $(Magick++-config --ldflags --libs)
{% endhighlight %}

Depois disso é só instalar:

{% highlight bash %}
sudo install -v w2j /usr/local/bin/
{% endhighlight %}

Depois é só usar, exemplo:
{% highlight bash %}
cd pasta/com/varios/webp/
w2j
{% endhighlight %}

E todos os arquivos WEBP serão convertidos para JPG e automaticamente deletados ao fim.

Só por curiosidade, o script [GNU Bash](https://terminalroot.com.br/tags#bash) que fazia isso era esse:

{% highlight bash %}
w2jpg(){
    shopt -s nullglob
    local files=( *.webp )

    (( ${#files[@]} == 0 )) && {
        echo "Não há imagens para converter."
        return
    }

    for f in "${files[@]}"; do
        convert "$f" "${f%.webp}.jpg"
    done

    rm -- *.webp
}
{% endhighlight %}

<!--
```bash
w2jpg () 
{ 
    ls --color=auto *.webp 1>&- 2>&-;
    if [[ "$?" != 0 ]]; then
        for i in *.webp;
        do
            n=$(echo $i | sed 's/\.webp/.jpg/g');
            convert "${i}" "${n}";
        done;
        rm *.webp;
    else
        printf "%s\n" "Não há imagens para converter.";
        return;
    fi
}
```
-->

---

## Veja também:
### [Como Combinar Imagens com C++ e ImageMagick](https://terminalroot.com.br/2025/11/como-combinar-imagens-com-cpp-e-imagemagick.html)


