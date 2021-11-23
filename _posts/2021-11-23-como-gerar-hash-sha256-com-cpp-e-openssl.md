---
layout: post
title: "Como Gerar Hash SHA256 com C++ e OpenSSL"
date: 2021-11-23 13:36:53
image: '/assets/img/cpp/crypto-cpp.jpg'
description: 'Existem outras bibliotecas que podem fazer a mesma coisa, mas a OpenSSL é a mais largamente utilizada principalmente para códigos escritos em C++ e C.'
icon: 'ion:terminal-sharp'
iconname: 'OpenSSL'
tags:
- cpp
- cppdaily
---

![Como Gerar Hash SHA256 com C++ e OpenSSL](/assets/img/cpp/crypto-cpp.jpg)

[OpenSSL](https://www.openssl.org/) é uma biblioteca de software para aplicativos que protegem as comunicações em redes de computadores contra espionagem ou necessidade de identificar a parte na outra extremidade. É amplamente utilizado por servidores da Internet , incluindo a maioria dos sites HTTPS .

Uma função **Hash** é qualquer função que pode ser usada para mapear dados de tamanho arbitrário para valores de tamanho fixo. Os valores são geralmente usados para indexar uma tabela de tamanho fixo chamada de tabela hash . Nós falamos mais sobre Hash nesse vídeo: [O que é e como gerar uma HASH ?](https://youtu.be/Rwyf04a1tAc) .

**SHA-2** ( Secure Hash Algorithm 2 ) é um conjunto de funções criptográficas de hash projetado pela Agência de Segurança Nacional dos Estados Unidos (NSA) e publicado pela primeira vez em 2001.

SHA-2 inclui mudanças significativas em relação ao seu antecessor, SHA-1 . A família SHA-2 consiste em seis funções hash com resumos (valores hash) que são 224, 256, 384 ou 512 bits: SHA-224, **SHA-256**, SHA-384, SHA-512, SHA-512/224, SHA -512/256.


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Instalando a biblioteca OpenSSL
Antes de qualquer coisa você precisa instalar a **biblioteca** OpenSSL, use o gerenciador de pacotes da sua distro para isso, exemplo para sistemas que usam APT:
> **Observação**: Geralmente, a maioria dos sistemas já possuem essa biblioteca instalada.

{% highlight sh %}
sudo apt install libssl-dev
{% endhighlight %}

---

# Utilizando com [C++](https://terminalroot.com.br/cpp)
Existem outras bibliotecas que podem fazer a mesma coisa, mas a OpenSSL é a mais largamente utilizada principalmente para códigos escritos em [C++](https://terminalroot.com.br/cpp) e [C](https://terminalroot.com.br/tags#linguagemc).

Para esse exemplo, vamos criar a hash da palavra **Terminal Root** .

> `nvim crypto.cpp`

{% highlight cpp %}
#include <iostream>
#include <iomanip>
#include <sstream>
#include <openssl/sha.h>

std::string sha256(const std::string str){
  unsigned char hash[SHA256_DIGEST_LENGTH];

  SHA256_CTX sha256;
  SHA256_Init(&sha256);
  SHA256_Update(&sha256, str.c_str(), str.size());
  SHA256_Final(hash, &sha256);

  std::stringstream ss;

  for(int i = 0; i < SHA256_DIGEST_LENGTH; i++){
    ss << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>( hash[i] );
  }
  return ss.str();
}

int main() {
  std::cout << sha256("Terminal Root") << '\n';
  return 0;
}
{% endhighlight %}

Para compilar use:
{% highlight sh %}
g++ -I/usr/include/openssl/ crypto.cpp -lcrypto
{% endhighlight %}

A saída será:
{% highlight sh %}
c01dcc1559af39e445c88200a485f01827a662ff4d03d626593e4792489a32e1
{% endhighlight %}
Que é a palavra **Terminal Root** criptografada.

---

# Conferindo se a Hash está correta
Não use o comando ~~`echo 'Terminal Root' | sha256sum`~~ porque o `echo` possui um `\n`.

Use o `printf` se quiser comparar pelo [terminal](https://terminalroot.com.br/tags#terminal), exemplo:

{% highlight sh %}
printf "Terminal Root" | sha256sum
{% endhighlight %}

Você também pode conferir se a hash gerada está realmente correta utilizando algum serviço online, exemplo o site: <https://emn178.github.io/online-tools/sha256.html> . Acesse o site e escreva a palavra que deseja no campo que tem a palavra **Input**, no campo abaixo desse mostrará a hash SHA256 .

---

# Links úteis
+ <https://en.wikipedia.org/wiki/Hash_function>
+ <https://en.wikipedia.org/wiki/OpenSSL>
+ <https://www.openssl.org/>
+ <https://en.wikipedia.org/wiki/SHA-2>


