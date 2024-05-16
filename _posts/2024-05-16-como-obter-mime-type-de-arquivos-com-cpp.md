---
layout: post
title: "Como obter Mime-Type de arquivos com C++"
date: 2024-05-16 10:07:12
image: '/assets/img/cpp/mime-types-cpp.jpg'
description: 'A forma correta para evitar insegurança de dados!'
icon: 'ion:terminal-sharp'
iconname: 'Terminal Root'
tags:
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

**MIME** (*Multipurpose Internet Mail Extensions*) type é um padrão utilizado na internet para indicar o tipo de conteúdo de um arquivo. 

> Originalmente desenvolvido para identificar os tipos de arquivos anexados a e-mails, o MIME type é agora amplamente utilizado em diferentes contextos, como na web, para indicar o tipo de conteúdo de arquivos transmitidos por meio do protocolo HTTP.

Cada tipo de arquivo é associado a um tipo MIME específico, que é representado por uma string. Por exemplo, o tipo MIME para arquivos de texto simples é text/plain, enquanto o tipo MIME para imagens JPEG é `image/jpeg`. Existem centenas de tipos MIME padrão que cobrem uma variedade de tipos de arquivos, desde documentos de texto até arquivos de áudio e vídeo.

Nesse artigo veremos como identificar o `mime-type` de um arquivo usando [C++](https://terminalroot.com.br/tags#cpp) tanto em distribuições [GNU+Linux](https://terminalroot.com.br/tags#gnulinux) e como dica no [Windows](https://terminalroot.com.br/tags#windows).


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

# Identificando mime-type no Linux
Para conseguirmos esse feitos em [distribuições](https://terminalroot.com.br/tags#distro) [GNU+Linux](https://terminalroot.com.br/tags#gnulinux) utilizaremos a biblioteca [libmagic](https://terminalroot.com.br/tags#https://man.netbsd.org/libmagic.3).

Ela é a biblioteca utilizada pelo comando [file](https://darwinsys.com/file/), o qual será incluido o cabeçalho [magic.h](https://github.com/torvalds/linux/blob/master/include/uapi/linux/magic.h) que é vinculada de forma [estática](https://en.wikipedia.org/wiki/Static_library)([static](https://www.ibm.com/docs/pt-br/integration-bus/10.0?topic=libraries-static)).

Para instalar você pode usar o gerenciador de pacotes do seu sistema, alguns exemplos abaixo:

{% highlight bash %}
sudo apt install libmagic-dev # Debian, Ubuntu, Mint, ...
sudo pacman -S libmagic # Arch
sudo dnf install file-devel # Fedora
brew install libmagic # macOS
{% endhighlight %}

Caso você não encontre no repositório do seu sistema, <u>você pode compilar do zero</u>:
> Lembre-se antes de possuir as ferramentas de compilação: [gcc](https://terminalroot.com.br/tags#gcc), [make](https://terminalroot.com.br/tags#make), além do [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) para fazermos o download do tarball.

{% highlight bash %}
wget ftp://ftp.astron.com/pub/file/file-5.40.tar.gz
tar -xzf file-5.40.tar.gz
cd file-5.40
./configure
make
sudo make install
{% endhighlight %}
> [Veja aqui o caminho onde são instalados os arquivos](https://gist.github.com/terroo/8adeb310dac49dca7eb5529b53600ac8)

Para esse exemplo, vamos ver o `mime-type` dessa imagem abaixo que é do formato PNG, faça o download clicando com o botão direito do mouse sobre a imagem e clicando em: *Salvar como* no diretório que estará o binário do código.

![imagem: cpp-icon.png, para download](/assets/img/cpp/cpp-icon.png) 
> `cpp-icon.png`

Crie um arquivo `main.cpp` e cole o código abaixo:
> O código está devidamente comentado explicando cada bloco de código para elucidar ações.

{% highlight cpp %}
// Inclui a libmagic e iostream para escrever na saída padrão
#include <iostream>
#include <magic.h>

int main() {
  // Inicia o cookie
  magic_t magic_cookie;

  // Informa o arquivo que queremos ver o mime-type
  const char *file_path = "cpp-icon.png";

  // Inicializa a libmagic
  magic_cookie = magic_open(MAGIC_MIME_TYPE);
  if (magic_cookie == NULL) {
    std::cerr << "Não foi possível inicializar a libmagic\n";
    return 1;
  }

  // Carrega as definições do banco de dados de mime types
  if (magic_load(magic_cookie, NULL) != 0) {
    std::cerr << "Não foi possível carregar as definições do banco de dados\n";
    magic_close(magic_cookie);
    return 1;
  }

  // Determina o MIME type do arquivo
  const char *mime_type = magic_file(magic_cookie, file_path);
  if (mime_type == NULL) {
    std::cerr << "Não foi possível determinar o MIME type do arquivo\n";
    magic_close(magic_cookie);
    return 1;
  }

  std::cout << "MIME type do arquivo: " << mime_type << "\n";

  // Fecha a libmagic
  magic_close(magic_cookie);

  return 0;
}
{% endhighlight %}

Feito isso, é só compilarmos, é necessário passar a flag `-lmagic` e rodar:
{% highlight bash %}
g++ main.cpp -lmagic
./a.out
{% endhighlight %}

A possível e provavel saída será:
{% highlight bash %}
MIME type do arquivo: image/png
{% endhighlight %}

Note que se alterarmos a extensão do arquivo para uma extensão qualquer, mesmo o gerenciador de arquivos exibindo um ícone referente a extensão, a *libmagic* é segura e correta em relação a isso, mostrará qual o verdadeiro mime-type daquele arquivo.
> Isso acontece muito em sistemas que pessoas mal intencinadas querem executar código na Web e a página pede para carregar somente arquivo: jpeg e png, mas alteram só a extensão, mas na verdade o arquivo é um *script*.

Se eu renomear o arquivo para `.mp4`, por exemplo:
{% highlight bash %}
mv cpp-icon.png cpp-icon.mp4
{% endhighlight %}

E alterar no código para carregar o `cpp-icon.mp4`:
{% highlight cpp %}
const char *file_path = "cpp-icon.mp4";
{% endhighlight %}

Após compilar e rodar, você verá que a libmagic exibirá o **Mime-Type CORRETO!** E não o da extensão.


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

# Dica para identificar Mime-Type no Windows
No [Windows](https://terminalroot.com.br/tags#windows), você pode usar a `urlmon.h` com o código abaixo:

{% highlight cpp %}
#include <iostream>
#include <urlmon.h>
#include <windows.h>

#pragma comment(lib, "urlmon.lib")

int main() {
    LPCWSTR file_path = L"caminho_do_arquivo";
    LPWSTR mime_type = NULL;

    HRESULT hr = FindMimeFromData(NULL, file_path, NULL, 0, NULL, 0, &mime_type,
0); if (SUCCEEDED(hr) && mime_type != NULL) { std::wcout << L"MIME type do
arquivo: " << mime_type << std::endl; CoTaskMemFree(mime_type); } else {
        std::cerr << "Não foi possível determinar o MIME type do arquivo\n";
    }

    return 0;
}
{% endhighlight %}

Lembrando que para você conseguir compilar, você precisa habilitar a `urlmon.dll` no Registro do Windows, como descreve [nesse link](https://answers.microsoft.com/en-us/windows/forum/all/lost-urlmondll/13eddedb-444c-40b8-9bf6-871f95741eee).

---

# Evite "*pegadinhas*"!
Existem diversas *"bibliotecas"* C++ no GitHub que faz um **FAKE MIME-TYPE**, ou seja, se fizermos o procedimento que descrevemos acima de renomear a extensão do arquivo, essas "*bibliotecas*", nos informa o incorreto mime-type. Isso é inseguro e perigoso!

Por exemplo, encontrei essa aqui <https://github.com/lasselukkari/MimeTypes>, se você clonar:
{% highlight bash %}
git clone https://github.com/lasselukkari/MimeTypes
{% endhighlight %}

Usar esse exemplo após renomear a extensão:
{% highlight cpp %}
#include <iostream>
#include "MimeTypes/MimeTypes.h"

int main(){
  std::cout << MimeTypes::getType("./cpp-icon.mp4") << '\n';
  return 0;
}
{% endhighlight %}

Compile seu arquivo e o `MimeTypes.cpp` desse repositório:
{% highlight bash %}
g++ main.cpp MimeTypes/MimeTypes.cpp 
{% endhighlight %}

Após rodar, note que ela informará incorretamente o tipo MIME do arquivo:
{% highlight bash %}
video/mp4
{% endhighlight %}

Isso não ocorre com a `libmagic`!

---

Nem todos os repositórios no GitHub fazem um *fake mime-type*, mas fiquem atentos para esses casos!


