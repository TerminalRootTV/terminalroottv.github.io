---
layout: post
title: 'Curso Certificação Linux LPI-1: Trabalhando com Permissões'
date: '2012-11-25T15:42:00.000-08:00'
image: '/assets/img/lpi/permissoes/permissions.jpg'
description: "Cada arquivo no Linux tem o definido controle de acesso."
tags:
- linux
- lpi
---

![Curso Certificação Linux LPI-1: Trabalhando com Permissões](/assets/img/lpi/permissoes/permissions.jpg "Curso Certificação Linux LPI-1: Trabalhando com Permissões")

> Cada arquivo no [Linux](http://www.terminalroot.com.br/tags#linux) tem o definido controle de acesso.

## Este controle é definidopor três classes

* __Permissões de usuário__: Dono do arquivo(quem o criou).
* __Permissões de grupo__: grupo que ao qual ele pertence.
* __Permissões de outros usuários__: outros(não dono e outro grupo).

### E para cada classe há 3 tipos de acesso

* __leitura(r)__
* __escrita(w)__
* __execução(x)__
![Curso Certificação Linux LPI-1: Trabalhando com Permissões](/assets/img/lpi/permissoes/15659.gif "Curso Certificação Linux LPI-1: Trabalhando com Permissões")
![Blog Linux](/assets/img/lpi/permissoes/1.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/permissoes/2.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/permissoes/3.jpg "Blog Linux")

#### Bits especiais

> Os __3__ primeiros __bits__ da esquerda para direita são __bits__ de __atributos especiais__

* __SUID (Set User ID)__ - afeta somente arquivos executáveis
* __SGID (Set Group ID)__ - afeta execução de programas do grupo do dono.
* __Sticky (Stick Bit)__ - permance na memória mesmo depois de terminado(Colado na memória).

![Blog Linux](/assets/img/lpi/permissoes/4.jpg "Blog Linux") 
![Blog Linux](/assets/img/lpi/permissoes/5.jpg "Blog Linux")
![Blog Linux](/assets/img/lpi/permissoes/6.jpg "Blog Linux")

> Como os bits de permissão especiais são utilizados com pouca frequência, e sob condições especiais, eles são representados pela letra (__s__) no lugar de (__x__) de execução para os bits __SUID__ e __SGID__ nas classes de Dono do arquivo e Grupo, e (__t__) no lugar de (__x__) para __bit sticky__ na classe de Outros.

![Blog Linux](/assets/img/lpi/permissoes/7.jpg "Blog Linux")

Quando novos arquivos são criados no sistema, eles são criados com permissões definidas gravadas no perfil de cada usuário e configuradas pelo comando __umask__.

O comando __umask__ mostra a máscara das permissões quando os arquivos são criados e aceira como argumento um número de 3 dígitos para configurar as permissões.

No [Linux](http://www.terminalroot.com.br/tags#linux), as permissões padrão para criação de

* __arquivos__ = __666__ (__rw-rw-rw__).
* __diretórios__ = __777__ (__drwxrwxrwx__).

## Depois de definida a máscara de criação dos arquivos, ela deverá ser subtraída das permissões padrão, exemplo

{% highlight bash %}
umask 27
{% endhighlight %}

> O número __27__ deverá ser lido como __027__, e define od bits da máscara como

* __000__ para Dono do arquivo.
* __010__ para Grupo
* __11_1__ para Outros.

## O comando chmod

__chmod__ (abreviação de __ch__ange __mod__e, em português: __alterar modo__) é um comando do [Unix](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=unix) usado para alterar permissões de arquivos e diretórios (pastas). Sua sintaxe é a seguinte

> chmod [opções] modo[,modo] arquivo1 [arquivo2 ...]


> Para a representação das permissões através de __letras__, você poderá utilizar

![Blog Linux](/assets/img/lpi/permissoes/9.jpg "Blog Linux")

### Exemplo

![Blog Linux](/assets/img/lpi/permissoes/10.jpg "Blog Linux")

## O comando chown

O comando __chown__ da shell de um sistema operacional do tipo [Unix](http://www.terminalroot.com.br/tags#unix) (como é o caso o [GNU](http://www.terminalroot.com.br/tags#gnu)/[Linux](http://www.terminalroot.com.br/tags#linux)) é usado para alterar o dono de um determinado arquivo.

### Uso

> chown [opções] usuário arquivo

### Exemplos

{% highlight bash %}
chown root /var/run/httpd.pid
chown $USER:linux strace.log
chown nobody:nogroup /tmp /var/tmp
chown :512 /home
chown -R usuario:grupo
{% endhighlight %}

## Os comandos chattr, lsattr e ln

## chattr

> Esse comando __modifica os atributos de arquivos/diretórios__

> chattr [opção] [atributo] [arquivo/diretório]

## lsattr

### Comando que lista os atributos atribuídos a um arquivo/diretório

> lsattr [opção] [arquivo/diretório]

## O comando ln

> O comando __ln__ permite criar links. Existem dois tipos de links suportados pelo [Linux](http://www.terminalroot.com.br/tags#linux), os hard links(__links físicos__) e os __links simbólicos__. Os __links simbólicos__ têm uma função parecida com os atalhos do [Windows](https://cse.google.com.br/cse/publicurl?cx=004473188612396442360:qs2ekmnkweq&q=Windows), eles apontam para um arquivo, mas se o arquivo é movido para outro diretório o link fica quebrado. Os __hard links__(__links físicos__) são semelhantes aos atalhos do __OS/2 da IBM__, eles são mais intimamente ligados ao arquivo e são alterados junto com ele. Se o arquivo muda de lugar, o link é automaticamente atualizado.
O comando __ln__ dado sem argumentos cria um __hard link__, como em
{% highlight bash %}
ln /home/$USER/arquivo.txt arquivo
{% endhighlight %}

Onde será criado um __link__ chamado "__arquivo__" no diretório corrente, que apontará para o __arquivo.txt__ dentro do diretório __/home/$USER__
Para __criar__ um __link simbólico__, basta acrescentar o argumento "__-s__", como em

{% highlight bash %}
ln -s /home/$USER/arquivo.txt arquivo
{% endhighlight %}


* __-s__ : __Cria__ um __link simbólico__. O padrão do comando ln são links físicos.
* __-f__ : __Força a criação de um link mesmo que este já exista__.
* __-i__ : __Exibe número de identificação__.


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

