---
layout: post
title: "Como Gerar Hash MD5 com C++ e OpenSSL"
date: 2022-08-04 10:59:06
image: '/assets/img/cripto/md5.jpg'
description: 'Indicada apenas para compatibilidade com aplicativos existentes. Em novas aplicações, SHA-1 ou RIPEMD-160 devem ser preferidos.'
icon: 'ion:terminal-sharp'
iconname: 'C++/OpenSSL'
tags:
- cpp
- openssl
- criptografia
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nós já publicamos sobre gerar [hash criptográfica](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) com a função [SHA256](https://terminalroot.com.br/2021/11/como-gerar-hash-sha256-com-cpp-e-openssl.html) . Então, para entender melhor esse artigo recomendo você ler, se ainda não leu, o outro artigo:

## [Como Gerar Hash SHA256 com C++ e OpenSSL](https://terminalroot.com.br/2021/11/como-gerar-hash-sha256-com-cpp-e-openssl.html)

Você vai notar muitas semelhanças com a implementação anterior, a única diferença em si é que a função é diferente, nesse caso usaremos a [MD5](https://en.wikipedia.org/wiki/MD5) .

**MD5** é uma função de hash criptograficamente quebrada, mas ainda amplamente usada , produzindo um valor de hash de 128 bits . Embora o MD5 tenha sido inicialmente projetado para ser usado como uma função de hash criptográfica , descobriu-se que ele sofre de extensas vulnerabilidades. 

Ela ainda pode ser usado como uma soma de verificação para verificar a integridade dos dados , mas apenas contra corrupção não intencional. Ela permanece adequado para outros fins não criptográficos, por exemplo, para determinar a partição de uma chave específica em um banco de dados particionado e pode ser preferido devido a requisitos computacionais mais baixos do que os algoritmos de hash seguros mais recentes .

Em resumo:
> MD2, MD4 e MD5 são recomendados apenas para compatibilidade com aplicativos existentes. Em novas aplicações, SHA-1 ou RIPEMD-160 devem ser preferidos.

---

## Instalando a biblioteca OpenSSL
Antes de qualquer coisa você precisa instalar a biblioteca OpenSSL, use o gerenciador de pacotes da sua distro para isso, exemplo para sistemas que usam APT:
> Observação: Geralmente, a maioria dos sistemas já possuem essa biblioteca instalada.

{% highlight bash %}
sudo apt install libssl-dev
{% endhighlight %}

---

## Utilizando com C++
Para esse exemplo, vamos criar a hash da palavra **Terminal Root** . Segue o código abaixo:
> `md5.cpp`

{% highlight cpp %}
#include <iostream>
#include <iomanip>
#include <sstream>
#include <openssl/md5.h>

std::string md5(const std::string &str){
  unsigned char hash[MD5_DIGEST_LENGTH];

  MD5_CTX md5;
  MD5_Init(&md5);
  MD5_Update(&md5, str.c_str(), str.size());
  MD5_Final(hash, &md5);

  std::stringstream ss;

  for(int i = 0; i < MD5_DIGEST_LENGTH; i++){
    ss << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>( hash[i] );
  }
  return ss.str();
}

int main() {
  std::cout << md5("Terminal Root") << '\n';
  return 0;
}
{% endhighlight %}

---

Para compilar rode:
{% highlight bash %}
g++ md5.cpp -lcrypto
{% endhighlight %}
A possível e esperada saída será:
{% highlight bash %}
a69f0efcca0116a76921947f135ccdac
{% endhighlight %}

Para verificar se está correta use, preterivelmente, o comando `printf`:
{% highlight bash %}
printf "Terminal Root" | md5sum
{% endhighlight %}

Você pode simplesmente substituir o `DIGEST_LENGTH`(apesar do tamanho serem os mesmos no cabeçalho haverá outra macro), e os nomes das funções para utilizar para `MD2` e `MD4`(utilizam os cabeçalhos `md2.h` e `md4.h`,respectivamente , já a SHA256 usa `sha.h`) e usar para gerar hash para também essas funções.

---

# Links úteis
+ <https://www.openssl.org/docs/man1.1.1/man3/MD5.html>
+ <https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html>
+ <https://terminalroot.com.br/2021/11/como-gerar-hash-sha256-com-cpp-e-openssl.html>
+ <https://en.wikipedia.org/wiki/MD5>



