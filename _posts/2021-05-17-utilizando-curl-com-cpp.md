---
layout: post
title: "Utilizando cURL com C++"
date: 2021-05-17 13:01:57
image: '/assets/img/cppdaily/curl-cpp.jpg'
description: 'Um código básico de exemplo, mas já útil para entendimento de como funciona.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cppdaily
- cpp
- curl
---

![Utilizando CURL com C++](/assets/img/cppdaily/curl-cpp.jpg)

**cURL** realmente é uma biblioteca incrível e no [cpp::daily](https://terminalroot.com.br/tags#cppdaily) vamos falar basicamente do uso dela com [C++](https://terminalroot.com.br/cpp) ! 
Nós fizemos um vídeo com diversos detalhes de como utilizar o cURL via [linha de comando](https://terminalroot.com.br/tags#comandos) e você pode ver nesse link: [12 DICAS para você usar o COMANDO curl como um NINJA](https://youtu.be/HxezVt5IEHQ) .

Mas utilizá-lo com [C++](https://terminalroot.com.br/cpp) é uma tarefa um pouco mais árdua, porém possível até porque muitas aplicações são feitas utilizando o **cURL** .

---

Antes de mais nada certifique-se que você possui a biblioteca cURL instalada no seu sistema, exemplos:
> Lembre-se de que não é o comando e sim a biblioteca

{% highlight bash %}
sudo emerge net-misc/curl # Gentoo, Funtoo, ...
sudo apt install libcurl3 # ou a libcurl4, para Debian, Ubuntu, Linux Mint, ...
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

# Utilizando com [C++](https://terminalroot.com.br/cpp)
Existem muitas particularidades tanto em escrever o código como compilar. Mas para ficar simples( até porque futuramente teremos um vídeo mais detalhado sobre cURL com C++ ), vou mostrar um exemplo de código que acessa o endereço: <https://gnu.terminalroot.com.br/ip.php> que devolve dados de acesso como: Sistemas Operacional, Navegador, Arquitetura e número de IP e vamos obtê-lo com C++ .

Perceba que precisamos incluir o cabeçalho: `#include <curl/curl.h>` e instanciar a class `CURL`, usamos também a função `size_t WriteCallback` para nos exibir o retorno. Leia e analise todo o código para uma maior compreensão.

Exemplo: `vim curl.cpp`
{% highlight cpp %}
#include <iostream>
#include <curl/curl.h>

static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp){
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

int main(){
  CURL * curl;
  CURLcode res;
  std::string readBuffer;

  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "https://gnu.terminalroot.com.br/ip.php");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
    res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);

    std::cout << readBuffer << std::endl;
  }
  return 0;
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


E para compilar precisamos informar a biblioteca para o compilador, exemplo:
{% highlight bash %}
c++ curl.cpp -lcurl -o get-data
{% endhighlight %}

Se rodarmos o `./get-data` perceberemos que a saída será com os dados informados acima, mas podemos filtrar e então obter nosso endereço de IP: global
{% highlight bash %}
./get-data | grep -i ip
IP: 201.51.63.71
{% endhighlight %}

Só com esse exemplo básico já dá pra você "brincar" com diversas possibilidades!

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




