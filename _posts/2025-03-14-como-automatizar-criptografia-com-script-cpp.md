---
layout: post
title: "Como Automatizar Criptografia com script C++"
date: 2025-03-14 15:52:04
image: '/assets/img/cppdaily/gnupg-cpp-terlang.png'
description: "🚀 Da série C++ como Shell Script."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
- gnupg
- shellscript
- criptografia
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Dia desse eu notei que havia compactado diversos arquivos como backup em uma mídia de DVD(os DVDs tinham pelo menos uns [15 anos](https://www.instagram.com/p/DGWWW2-S4f4/?img_index=1)) e também havia criptografado todos eles com [GnuPG](https://gnupg.org/).

E todos esses arquivos tinham a mesma senha para o `.gpg` e eu precisava saber o que havia dentro deles.

Como muitos eram arquivos de [muito tempo](https://www.instagram.com/p/DGWWW2-S4f4/?img_index=1), haviam até arquivos de mais 5GB =)

Eu já ia começar a escrever o código [shell script](https://terminalroot.com.br/tags#shellscript) para descriptografar e descompactar todos de uma vez só pra descobrir o que havia dentro deles.

Mas, lembrei do comando [limpeza](https://terminalroot.com.br/2024/06/usando-cpp-como-shell-script.html) e isso poderia ser rápido em escrever o código, mas iria me tomar muito tempo na execução.

Eu poderia usar a API do [GPGME](https://www.gnupg.org/software/gpgme/index.html) e criar ele diretamente via código C++, mas não se trata de uma aplicação completa, é só um *scriptzinho* básico!!!

Então, decidi, mais uma vez, criar um script que poderia ser feito com [GNU Bash](https://terminalroot.com.br/tags#bash) em [C++](https://terminalroot.com.br/tags#cpp).


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

## Introdução
Primeiramente, **o que é o GnuPG?**

[GnuPG](https://gnupg.org/) é o acrônimo/sigla para: "**GNU** **P**rivacy **G**uard (GnuPG ou GPG)" é um [software livre](https://terminalroot.com.br/tags#freesoftware) alternativo ao conjunto de softwares criptográficos PGP da Symantec. 

**GnuPG** é parte da [Free Software Foundation](https://www.fsf.org/) e do [Projeto GNU](https://terminalroot.com.br/tags#gnu). Além disso, ele recebeu grande patrocínio do Governo Alemão.

### Instalação do GnuPG
Use o gerenciador de pacotes do seu sistema operacional, exemplos:

+ No [Windows](https://terminalroot.com.br/tags#windows)
{% highlight bash %}
winget install --id=GnuPG.GnuPG  -e
{% endhighlight %}
> Via: <https://winstall.app/apps/GnuPG.GnuPG> ou <https://winget.run/pkg/GnuPG/GnuPG>.

+ No [macOS](https://terminalroot.com.br/tags#macos)
{% highlight bash %}
brew install gnupg
{% endhighlight %}
> Via: <https://formulae.brew.sh/formula/gnupg>

+ No Ubuntu
{% highlight bash %}
sudo apt install gnupg
{% endhighlight %}

### Uso básico do GnuPG
Suponhamos que você possua uma pasta de nome `files/` e compactou ela em formato `.zip` e ele se tornou: `files.zip`.

Se você quiser proteger com senha e criptografia, basta rodar o comando:
{% highlight bash %}
gpg -c files.zip
{% endhighlight %}

Em seguida lhe será solitada uma senha e a confirmação da senha para criar o arquivo: `files.zip.gpg`. Só quem tem acesso a essa senha conseguirá descriptografar.

O legal(e perigoso) é que você pode inserir a senha via linha de comando, tanto para criptografar quanto para descriptografar e isso pode lhe poupar tempo de ficar toda hora entrando no modo interativo e digitar senha por senha...

E foi pensando em não sofrer esse *tédio/estresse* repetitivo que eu tive essa ideia!

---

## Criando o script C++
Antes de mais nada esses arquivos do tipo `.gpg` estavam misturados com outros tipos de arquivos e eu não queria filtrar, pois manter onde eles estavam era o ideal antes de mandar eles pro meu server local aqui em casa. Então, vão incluir também o cabeçalho `<filesystem>` para tratar esses arquivos:

{% highlight cpp %}
#include <iostream>
#include <filesystem>
#include <vector>

namespace fs = std::filesystem;


int main(){
  // Indicar o caminho da pasta, nesse caso, onde está o script
  std::string directory_path = "./";
  std::vector<std::string> gpg_files {};

  // Verificar se o diretório existe
  if (!fs::exists(directory_path) || !fs::is_directory(directory_path)) {
    std::cerr << "O diretório não existe ou não válido." << std::endl;
    return 1;
  }

  // Iterar sobre os arquivos no diretório
  for (const auto& entry : fs::directory_iterator(directory_path)) {
    if (entry.is_regular_file() && entry.path().extension() == ".gpg") {
      gpg_files.push_back(entry.path().filename().string());
    }
  }

  // Opcional
  // Exibe os nomes dos arquivos .gpg encontrados
  std::cout << "Arquivos .gpg encontrados:" << std::endl;
  for (const auto& file : gpg_files) {
    std::cout << file << ' ';
  }
  std::cout.put('\n');

  // Definir a senha para todos os arquivos
  std::string str = "SENHA_SECRETA";
}
{% endhighlight %}

Agora é só rodar o comando para descriptografar os arquivos encontrados e listados:
{% highlight cpp %}
  for (const auto& file : gpg_files) {
    std::string com = "gpg --yes --batch --passphrase=" + str + " " + file + " 2>/dev/null";
    std::cout << "Descriptografando: " << file << std::endl;
    std::system(com.data());
  }
{% endhighlight %}

Eu ainda iria descompactar eles automaticamente adicionando ao `loop`, mas desisti, nesse caso usando o comando [extract]() porque os tipos poderiam se variados: `zip`, `rar`, `tar.gz`,...
{% highlight cpp %}
// filename se iguala a file para separar a lógica
std::string filename = file;

// Remover o .gpg do nome do arquivo
if (filename.size() >= 4) {
  filename = filename.substr(0, filename.size() - 4);
}

// Executar
std::string extract = "/usr/bin/extract " + filename;
std::cout << extract << std::endl;
std::system(extract.data());
{% endhighlight %}

Eu desisti de fazer isso porque isso iria misturar minha tarefa específica, e depois cheguei até tentar, mas o resultado não foi tão bom.

O código completo ficou: `decript.cpp`

{% highlight cpp %}
#include <iostream>
#include <filesystem>
#include <vector>

namespace fs = std::filesystem;

int main(){
  // Indicar o caminho da pasta, nesse caso, onde está o script
  std::string directory_path = "./";
  std::vector<std::string> gpg_files {};

  // Verificar se o diretório existe
  if (!fs::exists(directory_path) || !fs::is_directory(directory_path)) {
    std::cerr << "O diretório não existe ou não válido." << std::endl;
    return 1;
  }

  // Iterar sobre os arquivos no diretório
  for (const auto& entry : fs::directory_iterator(directory_path)) {
    if (entry.is_regular_file() && entry.path().extension() == ".gpg") {
      gpg_files.push_back(entry.path().filename().string());
    }
  }

  // Opcional
  // Exibe os nomes dos arquivos .gpg encontrados
  std::cout << "Arquivos .gpg encontrados:" << std::endl;
  for (const auto& file : gpg_files) {
    std::cout << file << ' ';
  }
  std::cout.put('\n');

  // Definir a senha para todos os arquivos
  std::string str = "SENHA_SECRETA";
}

{% endhighlight %}

Se quiser fazer o mesmo script, mas para criar arquivos `.gpg` com senha dinamicamente, substitua `com` por:
{% highlight cpp %}
std::string com = "gpg --yes --batch --passphrase=" + str + " -c " + file;
{% endhighlight %}
> Note o uso do `-c`.


<!-- RECTANGLE 2 - OnParagragraph -->
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

---

## Script final
> `decript.cpp`

{% highlight cpp %}
#include <iostream>
#include <filesystem>
#include <vector>

namespace fs = std::filesystem;

int main(){
  std::string directory_path = "./";
  std::vector<std::string> gpg_files {};

  if (!fs::exists(directory_path) || !fs::is_directory(directory_path)) {
    std::cerr << "O diretório não existe ou não válido." << std::endl;
    return 1;
  }

  for (const auto& entry : fs::directory_iterator(directory_path)) {
    if (entry.is_regular_file() && entry.path().extension() == ".gpg") {
      gpg_files.push_back(entry.path().filename().string());
    }
  }

  std::cout << "Arquivos .gpg encontrados:" << std::endl;
  for (const auto& file : gpg_files) {
    std::cout << file << ' ';
  }
  std::cout << "\n\n";

  std::string str = "SENHA_SECRETA";

  for (const auto& file : gpg_files) {
    std::string com = "gpg --yes --batch --passphrase=" + str + " " + file + " 2>/dev/null";
    std::cout << "Descriptografando: " << file << std::endl;
    int run = std::system(com.data());
    if(run != 0){
      std::cerr << "Failed to run: " << com << std::endl;
    }
  }

  return EXIT_SUCCESS;
}
{% endhighlight %}

Se quiser garantir que não há violação de memória, compile:
{% highlight bash %}
g++ -g -Wpedantic -Wall -Werror -fsanitize=address decript.cpp
{% endhighlight %}

Mas, para rodar, adicione [mais velocidade na execução](https://terminalroot.com.br/2025/03/conheca-algumas-flags-para-melhorar-a-velocidade-do-seu-software.html):
{% highlight bash %}
g++ -Ofast decript.cpp
{% endhighlight %}

Depois é só rodar: `./a.out`.

Para extrair eu usei um script em [Terlang](https://github.com/terroo/terlang):

{% highlight cpp %}
auto files = {"TheDir.tar.gz", "MyFolder.zip", "BigData.tar.gz"}
auto filesSize = 3

for(auto i = 0; i < filesSize; ++i){
  output("Descompactando: " + files[i])
  exec("extract " + files[i])
}
{% endhighlight %}

Para mais informações sobre [Terlang](https://terminalroot.com.br/mylang), conheça nosso Curso de Como Criar Sua Própria Linguagem de Programação:
### <https://terminalroot.com.br/mylang>

---

E assim, eu fiz, do meu jeito, uma tarefa que poderia me levar muito tempo, de forma rápida e prática! 😃 


