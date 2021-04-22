---
layout: post
title: "Funções para gerar base64 encode e decode no C++"
date: 2021-04-22 11:36:14
image: '/assets/img/cppdaily/base64-cpp.png'
description: 'Simples e útil para o dia a dia .'
icon: 'ion:terminal-sharp'
iconname: 'base64'
tags:
- cppdaily
- cpp
---

![Funções para gerar base64 encode e decode no C++](/assets/img/cppdaily/base64-cpp.png)

Hoje a dica do [cpp::daily](https://terminalroot.com.br/tags#cppdaily) será bem simples, mas bem útil.

Dia desse surgiu uma dúvida de um dos alunos do [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp) de como ele iria criar uma codificação com **base64** com [C++](https://terminalroot.com.br/cpp) .

Tudo isso pode ser feito de várias maneiras, mas a maneira mais simples e mais portável entre sistemas que encontrei e fiz algumas modificações para ficar mais simples possível a implementação foi essa:


# Função para fazer encode e decode em base64
> Código pronto para ser implementado.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


```cpp
#include <iostream>
#include <vector>
#include <algorithm>

static std::string base64_encode(const std::string &in) {

  std::string out;

  int val = 0, valb = -6;
  for (u_char c : in) {
    val = (val << 8) + c;
    valb += 8;
    while (valb >= 0) {
      out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[(val>>valb)&0x3F]);
      valb -= 6;
    }
  }
  if (valb>-6) out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[((val<<8)>>(valb+8))&0x3F]);
  while (out.size()%4) out.push_back('=');
  return out;
}

static std::string base64_decode(const std::string &in) {

  std::string out;

  std::vector<int> T(256,-1);
  for (int i=0; i<64; i++){
    T["ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[i]] = i;
  }

  int val=0, valb=-8;
  for (u_char c : in) {
    if (T[c] == -1) break;
    val = (val << 6) + T[c];
    valb += 6;
    if (valb >= 0) {
      out.push_back(char((val>>valb)&0xFF));
      valb -= 8;
    }
  }
  return out;
}

int main(){

  std::string meu_conteudo = {"Isso será codificado!"};
  std::string codificado = base64_encode( meu_conteudo );

  std::cout << codificado << '\n';

  std::string decodificado = base64_decode( codificado );

  std::cout << decodificado << '\n';

  return 0;
}
{% endhighlight %}

Se quiser você ainda pode usar `argc` e `argv` para gerar parâmetros via linha de comando para você codificar e/ou decodificar em tempo de execução.

Leia o código e analise para maior compreensão.

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

