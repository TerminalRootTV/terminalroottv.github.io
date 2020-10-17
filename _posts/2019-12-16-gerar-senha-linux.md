---
layout: post
title: "23 Formas de Gerar e Guardar SENHAS FORTES; veja as explicações de comandos"
date: 2019-12-16 14:51:47
image: '/assets/img/artigos/passwords.png'
description: 'As senhas são a tática para proteger informações confidenciais.'
tags:
- password
- gpg
- gnu
- comandos
- terminal
---

[![23 Formas de Gerar e Guardar SENHAS FORTES; veja as explicações de comandos](/assets/img/artigos/passwords.png)](https://help.ubuntu.com/community/StrongPasswords)

Sistemas como GNU/Linux e BSD geram aquela sensação de segurança, no entanto, pequenos procedimentos são ignorados por conta dessa sensação. Uma das formas mais desprezadas pelos usuários é os *tipos* de senha.

E isso é adotado por diversas pessoas, até os [grandes gênios da tecnologia](https://news.terminalroot.com.br/descobriram-as-senhas-de-grandes-da-tecnologia-a-de-ken-thompson-era-a-mais-dificil-saiba-qual.html) procedem de maneira irregular em relação à isso.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

## Introdução

As senhas são a tática de segurança mais usada na computação e são frequentemente usadas para proteger informações confidenciais, como sua conta de email ou sua conta de usuário. A escolha de uma senha forte para qualquer aplicativo ou serviço que possa exigir uma é extremamente importante. Se a senha escolhida for baseada em informações comuns, como uma palavra do dicionário, o invasor poderá usar o chamado método de "ataque ao dicionário" para determinar sua senha e, posteriormente, comprometer a conta ou os dados protegidos com essa senha.

Nesse artigo vamos mostrar algumas formas de gerar senhas para que não haja dores de cabeça e para guardar as mesmas podemos usar o [GPG](https://terminalroot.com.br/2013/04/curso-certificacao-linux-lpi-102_9795.html) além de algumas outras soluções nos itens finais dessa página.

---

## 01. Usando o [GNU Privacy Guard](https://www.gnupg.org/)
O [GNUPG](https://www.gnupg.org/) que é utilizado pelo comando `gpg` é uma ferramenta de criptografia e assinatura [OpenPGP](https://www.openpgp.org/) que é um padrão aberto de criptografia baseado no PGP( **P**retty **G**ood **P**rivacy (PGP), em português "privacidade muito boa", é um software de criptografia que fornece autenticação e privacidade criptográfica para comunicação de dados, funciona através de chaves assimétricas.

```sh
gpg --gen-random --armor 1 12
```

+ O parâmetro `--gen-random` emite a contagem de bytes aleatórios nos níveis de qualidade fornecidos por 0, 1 ou 2. Se a contagem não for fornecida ou zero, uma sequência interminável de bytes aleatórios será emitida. Se usado com `--armor` a saída será codificada em base64 (tipo de codificação).

> Apesar de usar a contagem de 1 até 12 , será gerada uma senha de 16 caracteres por conta dos *níveis de qualidade fornecidos*.

---

## 02. Criptogrando o horário atual
O comando `date` é utilizado para exibir ou modificar a data e o horário atual(veja mais detalhe sobre ele nesse link: [Acertando data e hora no Linux](https://terminalroot.com.br/2013/02/acertando-data-e-hora-no-linux.html)).

O comando `md5sum` gera uma [hash](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) com criptografia **MD5** e o stdout dela mandamos para o comando [awk](https://terminalroot.com.br/2014/12/tutorial-basico-de-awk.html) que imprimirá somente a primeira coluna(**$1**) , pois a segunda é um traço(**-**).

```sh
date | md5sum | awk '{print $1}'
```

## 03. Criando um encode próprio e randômico
O direcionamento de saída **<** provindo de `/dev/urandom` que é um arquivo especial que gera de ruídos de sistema, ou seja, entropia. Esses ruídos são usados para fins de geração de números aleatórios e criptografia. Assim como o `random` é nativo dos sistemas Unix e sistemas Unix-like como o GNU/Linux e outros.

O comando `tr` fica encarregado de fazer substituições(nesse caso, deleta os caracteres de A até Z, minúsculas e maiúsculas, e os números de 0 até 9 além do caractere especial underline). E finalmente encarregamos o comando `head` que imprimi somente as linhas iniciais de uma arquivo, nesse caso predefinido para uma variável de posição 1(**$1**)(se o parâmetro 1 não estiver definido, defina-o como 32 , ex.: `set -- -parametro1ehessagora; echo ${1:-32}` vai printar **-parametro1ehessagora** e depois rode esse: `set -- ; echo ${1:-32}`, vai printar **32** ).

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

O parâmetro `-c` do head emite os primeiros "números bytes" de cada arquivo. O `echo` após separação de comando com ponto e vírgula(**;**) serve para pular uma linha para o stdout não ficar colado com o prompt.

```sh
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
```

## 04. Utilizando o [OpenSSL](https://www.openssl.org/)
[OpenSSL](https://www.openssl.org/) é uma implementação de código aberto dos protocolos SSL e TLS. A biblioteca (escrita na linguagem C) implementa as funções básicas de criptografia e disponibiliza várias funções utilitárias.

Também estão disponíveis wrappers que permitem o uso desta biblioteca em várias outras linguagens. Devido a problemas financeiros, em abril de 2015 apenas quatro programadores cuidavam do protocolo OpenSSL. O baixo número colocava em risco a segurança de milhões de usuários (FAÇA UMA DOAÇÃO AO PROJETO CLICANDO NESSE LINK: <https://www.openssl.org/support/donations.html>) . Em fevereiro de 2017, já eram listados 15 colaboradores.

O OpenSSL está disponível para a maioria dos sistemas do tipo Unix, incluindo Linux, Mac OS X, as quatro versões do BSD de código aberto e também para o Microsoft Windows. O OpenSSL é baseado no SSLeay de Eric Young e Tim Hudson.

O OpenSSL é utilizado para gerar certificados de autenticação de serviços/protocolos em servidores (servers). 

```sh
openssl rand -base64 16
```

No comando acima será gerada uma senha aleatória(`rand`), codificação do tipo `base64` par 16 caracteres, no entanto, após codificação haverá uma saída de 24 caracteres.

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

---

## 05. Mais um encode randômico
O comando `fold` faz parte do [GNU CoreUtils](https://www.gnu.org/software/coreutils/) . O [GNU CoreUtils](https://www.gnu.org/software/coreutils/) é um pacote que possui diversos comandos, entre eles: `chmod`, `cut`, `dd`, `echo` e muitos outros. São comandos baseados nos comandos do Unix, mas foram reescritos sem consulta ao código fonte do Unix, pois o mesmo possuia direitos de propriedade e patente da AT&T .

O comando `fold` faz um wrap para largura de linhas, o parâmetro `-w` seguido de 30 quer dizer que capturará uma linha de largura máxima de 30 colunas(caracteres).

```sh
tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1
```

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

---

## 06. Encode randômico com reversões
O comando [dd](https://terminalroot.com.br/2017/09/como-clonar-particao-com-o-comando-dd.html) é utilizado geralmente para copiar ou converter arquivos/dispositivos. O parâmetro `bs` indica a quantidade de **bytes(bs)** que ele deve ler e escrever de cada vez. Já o parâmetro `count` é usado com quase a mesma finalidade do bs, no entanto, ele define a quantidade de quantos blocos de cada vez.

O comando `base64` faz codificação e decodificação, não confundir com criptografia. Codificação é mais ou menos uma troca, ex.: Trocar todas as ocorrências das letras: **e**, **a** e **o** na palavra **Terminal Root** pelos números: **3**, **4** e **0(zero)**: `echo Terminal Root | tr 'eao' '340'` a saída será: **T3rmin4l R00t** . Já criptografia existe um cálculo matemático avançado para essas substituições, onde a maioria das criptografias são irreversíveis.

E por fim o comando `rev` que inverte uma string, ex.: `echo ROOT | rev` a saída será **TOOR** , e quando você usa ele de novo, logo ele retorna para **ROOT**, ex.: `echo ROOT | rev | rev`.

```sh
dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev
```

## 06. Randomizando com [shuf do GNU CoreUtils](https://www.gnu.org/software/coreutils/)
O comando `shuf` é utilizado para gerar números aleatórios, nesse caso em um intervalo de 1 até 200 . Em seguida criamos um [Hash criptográfica](https://terminalroot.com.br/2019/05/o-que-e-e-como-gerar-uma-hash.html) com o comando `sha512sum` e o stdout mandamos pro comando [cut](https://en.wikipedia.org/wiki/Cut_(Unix)) imprimir somente do primeiro(1) até a vigésima(20) posição de caractere.

```sh
shuf -i 1-200 -n 1 | sha512sum | cut -c1-20
```

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

## 07. Apesar da linha ter ficado extensa, essa é a forma mais simples
Utilizando o comando `strings` que printa somente os caracteres imprimíveis de arquivos, selecionamos somente as ocorrências alfanuméricas utilizando o comando `grep`. Então *capturamos* somente as 30 primeiras linhas usando o comando `head` e deletamos as "quebras de linha" com o parâmetro `-d` do comando `tr` e por fim para que o *stdout* não fique colado no prompt, separamos o conjuto com **;**(ponto e vírgula) e *pulamos* com `echo`

```sh
strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo
```

---

Além de poder criar `aliases` desses comando, você ainda pode instalar aplicativos CLI que fazem isso pra você, exemplos:

## 08. Usando o [pwgen](https://sourceforge.net/projects/pwgen/)
O Pwgen é um pequeno gerador de senhas da GPL que cria senhas que podem ser facilmente memorizadas por um ser humano.
> Instale-o antes, ex.: `sudo emerge -a pwgen`

```sh
# Exemplos de uso
pwgen -s
pwgen -s -1
pwgen -s -1 14
pwgen -s 10 5 -1 -y
```

Saiba mais: <https://sourceforge.net/projects/pwgen/>

---

## 09. Usando o `apg`
O apg gera várias senhas aleatórias. Ele usa vários algoritmos de geração de senha e um gerador de números pseudo-aleatórios embutido.
> Instale-o antes, ex.: `sudo apt install apg`

```sh
# Exemplos de uso
apg -a 1
```

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 10. Usando o `makepasswd`
O comando `mkpasswd` - gera uma senha facilmente via linha de comando, foi desenvolvido por  Don Libes para o National Institute of Standards and Technology.
> Instale-o antes, ex.: `sudo apt install makepasswd`

```sh
# Exemplos de uso
makepasswd -count 1 -minchars 12
```

---

## 11. Usando o `xkcdpass`
 Gera senhas seguras com várias palavras, inspiradas no XKCD 
> Instale-o antes usando o [pip](https://pypi.org/project/xkcdpass/) , ex.: `pip install xkcdpass`

```sh
xkcdpass -n 10
```

---

## 12. Usando o `diceware`
Diceware é um método para criar senhas e outras variáveis ​​criptográficas usando dados comuns como um gerador de números aleatórios de hardware . Para cada palavra na senha, são necessários cinco lançamentos dos dados. Os números de 1 a 6 que aparecem nos rolos são montados como um número de cinco dígitos, por exemplo, 43146 . Esse número é usado para procurar uma palavra em uma lista de palavras. Na lista em inglês 43146 corresponde a munch . Ao gerar várias palavras em sequência, uma senha longa pode ser construída.

> Instale-o antes, ex.: `sudo apt install diceware`

```sh
# Exemplos de uso
diceware
```

Link: <https://github.com/ulif/diceware>

---

Para gerar e guardar suas senhas você ainda tem:

## 13. [Bitwarden](https://bitwarden.com/)
Você pode usar o Bitwarden em quase qualquer dispositivo e sistema operacional. Até o Tor Browser, Brave e Vivaldi são suportados.

Link: <https://bitwarden.com/>

---

## 14. [KeePassXC](https://keepassxc.org/)
Se você é um ex-usuário do Windows, é provável que esteja familiarizado com o KeePass, um gerenciador de senhas gratuito e de código aberto, e o KeePassXC é um fork dele que faz armazenamento local de banco de dados.

Link: <https://keepassxc.org/>

---

## 15. [pass](https://www.passwordstore.org/)
O passe combina a criptografia GPG com o Git, um sistema de controle de versão distribuído, há uma interface baseada em [dmenu](https://tools.suckless.org/dmenu/) para passar, chamada passmenu, além de um aplicativo [Android](https://www.android.com/intl/pt-BR_br/).

Link: <https://www.passwordstore.org/>

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 16. [LastPass](https://www.lastpass.com/)
O LastPass é um dos gerenciadores de senhas proprietários baseados na nuvem. Possui muitas opções de autenticação de dois fatores, funcionam em qualquer lugar, e uma ótima versão gratuita, além de possuir também uma versão paga.

Link: <https://www.lastpass.com/>

---

## 20. [1Password](https://1password.com/)
O 1Password é serviço pago para gerenciar senhas de forma elegante e fácil de usar, com sincronização automática de senhas e proteção integrada contra violações de dados. O 1Password está em conformidade com os padrões mais rigorosos do setor e possui recursos avançados de segurança, como proteção de força bruta com PBKDF2, armazenamento de chave secreta local e outros.

Link: <https://1password.com/>

---

## Conclusão

Existem diversas formas de você fazer isso, mas o mais importante desse artigo é mesmo captar as funcionalidades que geram tais senhas para que você não acabe trocando "gato por lebre" quando for gerar e guardar suas senhas. Entender o funcionamento é essencial para não acabar sendo enganado.

E além de todos esses serviços existem diversos online, mas sinceramente, não me arriscaria em utulizá-los, mas caso você queira para um caso não tão importante, pesquise no seu buscador de preferência, veja o exemplo de pesquisa clicando nesse link: <https://is.gd/Vjz2nf>

Abraços!


