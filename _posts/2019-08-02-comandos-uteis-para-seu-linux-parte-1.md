---
layout: post
title: "Comandos Úteis para seu Linux Parte 1"
date: 2019-08-02 12:51:21
image: '/assets/img/'
description: 'Em algum momento de alguma entrevista ou exame de seleção, acontece de esquercemos essas coisas básicas.'
main-class: 'linux'
tags:
- linux
- comandos
- terminal
---

![Terminal Root , a raíz / do seu conhecimento em Linux](/assets/img/linux/comandos-uteis.jpg "Terminal Root , a raíz / do seu conhecimento em Linux")


Opa pessoal! Vamos criar alguns artigos de conhecimentos rápidos e simples (para não ficar cansativo) de coisas que muitas vezes já sabemos , mas em algum momento de alguma entrevista ou exame de seleção, acontece de dar um "*branco*" , e esses artigos simples costumam exercitar nossa mente para fixar e evitar esquecimentos . E sempre com comandos mais inteligentes que nos farão memorizar cada vez melhor. Vamos então a **5 Comandos Úteis para seu Linux** !!!

1. Descrobrir se seu usuário está inserido em um grupo

{% highlight bash %}
# Forma 1
groups $USER

# Forma 2
grep $USER /etc/group | cut -d: -f1 | tr '\n' ' ';echo


# Forma 3
id $USER | sed "s/)[^(]*(/ /g;s/.*(\|//;s/.$//;s/$USER $USER //"
{% endhighlight %}

2. Inserir usuário em um grupo 

{% highlight bash %}
# Forma 1
sudo usermod -G grupo -a usuario

# Forma 2
gpasswd -a usuario grupo
{% endhighlight %}

3. Verificar se seu usuário pode usar o **sudo**

{% highlight bash %}
# Insira a senha de Root
[[ $(su -c "grep $USER /etc/sudoers") ]] && echo Sim || echo Não
{% endhighlight %}

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

4. Obtendo informações sobre um arquivo

  - Crie um arquivo qualquer, somente para analizarmos

{% highlight bash %}
touch arquivo.txt
{% endhighlight %}

 - Obtendo informações sobre o arquivo:
{% highlight bash %}
stat arquivo.txt

    Arquivo: arquivo.txt
    Tamanho: 0         	Blocos: 0          bloco de E/S: 4096   arquivo comum vazio
Dispositivo: 807h/2055d	Inode: 19930988    Links: 1
     Acesso: (0644/-rw-r--r--)  Uid: ( 1000/  marcos)   Gid: ( 1000/  marcos)
     Acesso: 2019-08-02 12:15:22.951126025 -0300
Modificação: 2019-08-02 12:15:22.951126025 -0300
  Alteração: 2019-08-02 12:15:22.951126025 -0300
    Criação: -
{% endhighlight %}

Verificamos que alguns dados interessantes, dentre eles selecionamos:
> **Tamanho**: 0 , *nenhum byte*
> 
> **Dono e permissões**: Acesso: (0644/-rw-r--r--) , *tem o octeto 0644 por padrão* que também pode ser descrito por **-rw-r--r--** , ou seja, pelo fato de começar com um traço **-** é um arquivo, se fosse a letra *d* seria um diretório, *l* link simbólico,*b*(disp. bloco) e *c*(disp. caracter) . Logo depois temos a ordem de permissão: **Dono(quem o criou, u), Grupo(g), Outros(o) e Todos(a)** a cada 3 casas por 3 informações . E o UID(User Idenfier) é **marcos** (o dono desse arquivo) e o GID(Grupo Identifier) também é *marcos* .

5. Trabalhando com permissões

 - Se fôssemos dar permissão zero para o todos, poderíamos usar o `chmod` ou o `chown`: 
{% highlight bash %}
chmod 0 arquivo.txt
{% endhighlight %}
 - Se quisermos retornar as permissões iniciais, usaríamos igual como estava: `chmod 644 arquivo.txt`
 - E para alterar o dono: `sudo chmod root arquivo.txt` dessa forma alteramos o dono e não o grupo, se quiséssemos alterar o grupo também usaríamos: `sudo chown root:root arquivo.txt`

 Visualizando de novo com `stat` percebemos que o dono e/ou o grupo foram alterados, mas percebemos que o grupo tem permissão só de ler (r, read), se quiséssemos tirar essa permissão, podemos também usar ou o `chmod` ou o `chown`
  - com chmod: `sudo chmod g-r` , para o grupo(g) tire(-) a permissão de leitura(r, read), se verificamos de novo o arquivo veremos que em vez de **0644** e **-rw-r--r--** agora está: **0604/-rw----r--** , ou seja, outros ainda podem ler(r--), mas se ele só fizer parte do grupo *marcos* , a permissão dele correspondente ao 3º octeto é ZERO **0** ou **---** .

  Logo percebemos que o **0** é **---** .
  
Dica com imagem para cada número a correspondente saída para o **octeto**:
![7 é rwx, 0 é --- e assim por diante](/assets/img/lpi/permissoes/4.jpg "7 é rwx, 0 é --- e assim por diante")

## Links para Pesquisa:
+ <https://terminalroot.com.br/2012/11/curso-certificacao-linux-lpi-1.html>, legal para entender visualmente.
+ <https://en.wikipedia.org/wiki/Chmod> , muito interessante para análise técnica e detalhista.
+ <https://pt.wikipedia.org/wiki/Identificador_de_usu%C3%A1rio> , complemento top!

Até a próxima!
