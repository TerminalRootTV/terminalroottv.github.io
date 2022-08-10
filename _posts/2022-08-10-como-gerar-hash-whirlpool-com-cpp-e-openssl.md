---
layout: post
title: "Como Gerar Hash Whirlpool com C++ e OpenSSL"
date: 2022-08-10 08:50:56
image: '/assets/img/cpp/whirlpool.jpg'
description: 'A Galáxia do Redemoinho (M51) inspirou o nome do algoritmo, apesar da sua tradução ao pé da letra ser: hidromassagem.'
icon: 'ion:terminal-sharp'
iconname: 'C++/OpenSSL'
tags:
- cpp
- openssl
- criptografia
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

No artigo anterior nós mostramos como gerar [Hash](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) com [MD5](https://terminalroot.com.br/2022/08/como-gerar-hash-md5-com-cpp-e-openssl.html), assim como descrito lá, os conceitos serão semelhantes.

Whirlpool (às vezes denominado WHIRLPOOL ) é uma função hash criptográfica baseada em uma cifra de bloco tipo [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) . 

Ele gera uma hash de comprimento de 128 caracteres .

---

# Utilizando com C++
Para esse exemplo, vamos criar a hash da palavra Terminal Root . Segue o código abaixo:

> `whirlpool.cpp`

{% highlight cpp %}
#include <iostream>
#include <iomanip>
#include <sstream>
#include <openssl/whrlpool.h>

std::string whirlpool(const std::string &str){
  unsigned char hash[WHIRLPOOL_DIGEST_LENGTH];

  WHIRLPOOL_CTX whirlpool;
  WHIRLPOOL_Init(&whirlpool);
  WHIRLPOOL_Update(&whirlpool, str.c_str(), str.size());
  WHIRLPOOL_Final(hash, &whirlpool);

  std::stringstream ss;

  for(int i = 0; i < WHIRLPOOL_DIGEST_LENGTH; i++){
    ss << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>( hash[i] );
  }
  return ss.str();
}

int main() {
  std::cout << whirlpool("Terminal Root") << '\n';
  return 0;
}
{% endhighlight %}

Para compilar rode:
{% highlight bash %}
g++ whirlpool.cpp -lcrypto
{% endhighlight %}

A possível e esperada saída será:
{% highlight bash %}
edef01c730c67430584283292a59e3a6e910ecf7c903c0b1040243498c67053a849c0eacc07dfdbd76be36d2d1e50eaa0e0b6324f96743828eccdf8dac471891
{% endhighlight %}

Para verificar se está correta use, preterivelmente, o comando `rhash` com os seguintes argumentos: 
{% highlight bash %}
rhash --whirlpool -m "Terminal Root"
{% endhighlight %}

---

# Links úteis
+ <https://www.openssl.org/docs/man3.0/man3/EVP_whirlpool.html>
+ <https://en.wikipedia.org/wiki/Whirlpool_(hash_function)>
+ <https://en.wikipedia.org/wiki/Advanced_Encryption_Standard>


