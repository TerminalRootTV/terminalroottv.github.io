---
layout: post
title: "Como Utilizar a Biblioteca Zlib com C++"
date: 2021-06-16 13:39:38
image: '/assets/img/cpp/zlib.png'
description: 'Um biblioteca com portabilidade para qualquer sistema operacional.'
icon: 'ion:terminal-sharp'
iconname: 'C/C++'
tags:
- cpp
- cppdaily
- linguagemc
- zlib
---

![Como Utilizar a Biblioteca Zlib com C++](/assets/img/cpp/zlib.png)

[zlib](http://zlib.net/) é uma biblioteca multiplataforma de compressão de dados escrita por **Jean-loup Gailly** e **Mark Adler** como uma generalização do algoritmo DEFLATE usado em seu programa de compressão de dados [gzip](https://terminalroot.com.br/2019/10/como-extrair-varios-formatos-compactados-com-um-comando.html).

A primeira versão pública, originalmente destinada para uso na biblioteca [libpng](http://www.libpng.org/pub/png/libpng.html), foi lançada em 1º de Maio de 1995. zlib é distribuída sob uma licença open-source, a **zlib license**.

Atualmente, zlib é um padrão de fato para compressão de dados em documentos portáveis. Centenas de aplicações para sistemas operacionais [Unix](https://terminalroot.com.br/tags#unix) e assemelhados (como o [Linux](https://terminalroot.com.br/tags#linux)) usam-na e seu uso é crescente em outros sistemas (como o [Microsoft Windows](https://terminalroot.com.br/tags#windows) e o Palm OS). 

Dada a sua elevada portabilidade e aos seus baixos requisitos de memória, zlib também é usada em muitos dispositivos embarcados.

No [site oficial](http://zlib.net/) da Zlib é possível encontrar toda a documentação de como implementá-la no seu código. No entanto, os exemplos são feitos com [Linguagem C](https://terminalroot.com.br/tags#linguagemc) e o exemplo básico é feito utilizando `stdin` e `stdout`.

Mas nesse caso criei um código em [C++](https://terminalroot.com.br/cpp) com classes e que você possa utilizá-la sem `stdin` e `stdout`, basta invocar da seguinte forma:

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
Antes de mais nada você precisa tê-la(a biblioteca) em seu sistema, muito provavelmente já haverá, mas caso não haja você pode instalar da seguinte forma:
> Exemplo de sistemas que usam APT.

{% highlight bash %}
sudo apt install zlib1g-dev
{% endhighlight %}

# Utilização
+ Para **COMPACTAR** basta rodar o binário gerado e o arquivo que deseja compactar:
> Será gerado o arquivo de extensão `.Z`(Z maiúsculo)

{% highlight bash %}
./zpipe arquivo.txt
{% endhighlight %}
> Basta verificar no diretório que executou o binário que haverá uma arquivo de nome: `arquivo.txt.Z` compactado.

+ Para **DESCOMPACTAR** basta rodar o binário gerado e o arquivo que deseja descompactar de extensão `.Z`:
> O conteúdo será extraído e gerará o: `arquivo.txt`

{% highlight bash %}
./zpipe -d arquivo.txt.Z
{% endhighlight %}

Na verdade eu modifiquei e adaptei [esse exemplo](https://zlib.net/zlib_how.html) que é um *minizip* e as partes mais importantes estão comentadas, mas é fácil de entender. Organizei em 4 arquivos que são:

> `zpipe.hpp`
{% highlight cpp %}
#ifndef ZPIPE_H
#define ZPIPE_H
#define SET_BINARY_MODE(file)
#include <iostream>
#include <cstring>
#include <cassert>
#include "zlib.h"

class Zpipe {
  public:
    const long int CHUNK = {16384};
    int def( FILE *, FILE *, int ); // compress
    int inf( FILE *, FILE * ); // decompress
    void zerr( int );
    void usage( char ** );
};
#endif
{% endhighlight %}

> `zpipe.cpp`
{% highlight cpp %}
#include "zpipe.hpp"

int Zpipe::def(FILE *source, FILE *dest, int level){
    int ret, flush;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];

    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    ret = deflateInit(&strm, level);
    if (ret != Z_OK)
        return ret;

    do {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source)) {
            (void)deflateEnd(&strm);
            return Z_ERRNO;
        }
        flush = feof(source) ? Z_FINISH : Z_NO_FLUSH;
        strm.next_in = in;

        do {
            strm.avail_out = CHUNK;
            strm.next_out = out;
            ret = deflate(&strm, flush);    /* nenhum valor de retorno com erro */
            assert(ret != Z_STREAM_ERROR);
            have = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest)) {
                (void)deflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);
        assert(strm.avail_in == 0);

    } while (flush != Z_FINISH);
    assert(ret == Z_STREAM_END);

    /* limpar e retornar */
    (void)deflateEnd(&strm);
    return Z_OK;
}

int Zpipe::inf(FILE *source, FILE *dest){
    int ret;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];

    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    ret = inflateInit(&strm);
    if (ret != Z_OK)
        return ret;

    do {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source)) {
            (void)inflateEnd(&strm);
            return Z_ERRNO;
        }
        if (strm.avail_in == 0)
            break;
        strm.next_in = in;

        do {
            strm.avail_out = CHUNK;
            strm.next_out = out;
            ret = inflate(&strm, Z_NO_FLUSH);
            assert(ret != Z_STREAM_ERROR);
            switch (ret) {
            case Z_NEED_DICT:
                ret = Z_DATA_ERROR;
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
                (void)inflateEnd(&strm);
                return ret;
            }
            have = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest)) {
                (void)inflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);

    } while (ret != Z_STREAM_END);

    (void)inflateEnd(&strm);
    return ret == Z_STREAM_END ? Z_OK : Z_DATA_ERROR;
}

void Zpipe::zerr(int ret) {
    std::cerr << "zpipe: ";
    switch (ret) {
    case Z_ERRNO:
        if (ferror(stdin)){
            std::cerr << "Erro ao ler stdin . " << '\n';
        }else if (ferror(stdout)){
            std::cerr << "Erro ao escrever stdout ." << '\n';
        }
        break;
    case Z_STREAM_ERROR:
        std::cerr << "Nível de compressão inválido . " << '\n';
        break;
    case Z_DATA_ERROR:
        std::cerr << "Dados vazis, inválidos ou incompletos . " << '\n';
        break;
    case Z_MEM_ERROR:
        std::cerr << "Sem memória . " << '\n';
        break;
    case Z_VERSION_ERROR:
        std::cerr << "Versão da zlib é incompatível . " << '\n';
    }
}

void Zpipe::usage( char ** argv ){
  std::cout << "Compactar: " << argv[0] << " file.txt # Vai gerar o arquivo: file.txt.Z " << '\n';
  std::cout << "Descompactar: " << argv[0] << " -d file.txt.Z # Gera o arquivo: file.txt " << '\n';
}
{% endhighlight %}


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


> `main.cpp`
{% highlight cpp %}
#include "zpipe.hpp"

int main(int argc, char ** argv){
    Zpipe zpipe;
    int ret;
    FILE *filename, *zipped;
    std::string s;
    
    if( argc == 2 ){
      filename = fopen( argv[1] , "rb");
      s = argv[1];
      s = s + ".Z";
      zipped = fopen( &s[0], "w" );
      ret = zpipe.def( filename, zipped, Z_DEFAULT_COMPRESSION);
      if (ret != Z_OK){
        zpipe.zerr(ret);
      }
      return ret;
    } else if (argc == 3 && strcmp(argv[1], "-d") == 0 ) {
        zipped = fopen( argv[2], "rb");
        s = argv[2];
        s = s.substr( 0, s.length() - 2 );
        filename = fopen( &s[0], "w" );
        ret = zpipe.inf(zipped, filename);
        if (ret != Z_OK){
            zpipe.zerr(ret);
        }
        return ret;
    } else {
        zpipe.usage( argv );
        return 1;
    }
}
{% endhighlight %}

E por final um [Makefile](https://terminalroot.com.br/2019/12/como-criar-um-makefile.html) para compilarmos rodando somente o comando `make`.

{% highlight makefile %}
TARGET=zpipe
CC=g++
DEBUG=-g
OPT=-O2
WARN=-Wall
LZ=-lz
CCFLAGS=$(DEBUG) $(OPT) $(WARN)
LD=g++
OBJS= main.o zpipe.o
all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(LZ)
	@rm -f *.o

main.o: main.cpp
	$(CC) -c $(CCFLAGS) $(LZ) main.cpp -o main.o
 
zpipe.o: zpipe.cpp
	$(CC) -c $(CCFLAGS) $(LZ) zpipe.cpp -o zpipe.o
{% endhighlight %}


Bem, simples, né?! Isso é só um exemplo para únicos arquivos, para mais detalhes consulte a documentação.

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

---

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

Fontes:
+ [Wikipédia em Português](https://pt.wikipedia.org/wiki/Zlib)
+ [Wikipédia em Inglês](https://en.wikipedia.org/wiki/Zlib)
+ [zlib.net](http://zlib.net/)
+ [GitHub](https://github.com/madler/zlib)
