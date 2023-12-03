---
layout: post
title: "Como configurar o Squid"
date: '2015-01-04T12:56:00.001-08:00'
image: '/assets/img/servidor/squid.jpg'
description: "O Squid é um servidor proxy que suporta HTTP, HTTPS, FTP e outros."
color: '#3b5998'
tags:
- gnulinux
- servidores
- gnu
- redes
categories:
---

![Squid Blog Linux](/assets/img/servidor/squid.jpg)

> O Squid é um servidor proxy que suporta HTTP, HTTPS, FTP e outros. Ele reduz a utilização da conexão e melhora os tempos de resposta fazendo cache de requisições freqüentes de páginas web numa rede de computadores. Ele pode também ser usado como um proxy reverso.

## Instalação

Para instalar o Squid no Debian e Debians-Like (Ubuntu, Linux Mint...):
{% highlight bash %}
su
apt-get install squid3
{% endhighlight %}

O Arquivo de configuração do Squid:
{% highlight bash %}
vi /etc/squid3/squid.conf
{% endhighlight %}

no arquivo que se abrirá, apague tudo (pode fazer um backup do arquivo antes) e inclua o seguinte código:
{% highlight bash %}
http_port 3128
visible_hostname marcospinguim
cache_mgr marcospinguim@linuxmail.org
error_directory /usr/share/squid3/errors/Portuguese
{% endhighlight %}

http_port: DETERMINA A PORTA QUE SERÁ USADA PELO SERVIDOR.
visible_hostname: DEFINA O NOME DE EXIBIÇÃO DO SERVIDOR.
cache_mgr: DEFINA O E-MAIL DO ADMINISTRADOR PARA RECEBER MENSAGEM EM CASOS GRAVES.
error_directory: DEFINA O IDIOMA DAS PÁGINAS DE MENSAGEM DE ERROS EM PORTUGUÊS.

## Cache

No cache são armazenados os objetos da Internet (ex. dados de páginas web) disponíveis via protocolo HTTP, FTP e Gopher num sistema mais próximo ao do cliente. Os navegadores podem então usar o Squid local como um servidor Proxy HTTP, reduzindo o tempo de acesso aos objetos e reduzindo a utilização da conexão.

Para configurar o cache no Squid, adicione as seguintes configurações:
{% highlight bash %}
hierarchy_stoplist cgi-bin ?
cache_mem 64 MB
maximum_object_size_in_memory 128 KB
maximum_object_size 200 MB
cache_dir ufs /var/spool/squid3 4096 16 256
{% endhighlight %}

hierarchy_stoplist: DEFINA PALAVRAS QUE SE FOR ENCONTRADAS NA URL, A PÁGINA IRÁ SER CARREGADA DIRETO DO CACHE.
cache_mem: DEFINA A QUANTIDADE DE MEMÓRIA QUE O SERVIDOR IRÁ USAR PARA O CACHE.
maximum_object_size_in_memory: DEFINA O TAMANHO MÁXIMO DO OBJETO QUE PODERÁ SER ARMAZENADO NA MEMÓRIA, SENÃO SERÁ ARMAZENADO NO DISCO RÍGIDO.
maximum_object_size: DEFINA O TAMANHO MÁXIMO DO OBJETO QUE PODERÁ SER ARMAZENADO NO DISCO RÍGIDO, SENÃO SERÁ DESCARTADO O OBJETO.
cache_dir ufs /var/spool/squid3 4096 32 512: O DIRETÓRIO DO CACHE, AONDE SERÁ ARMAZENADO OS OBJETOS E ATRIBUIR 4GB DE ESPAÇO DE ARMAZENAMENTO NO CACHE.

Definindo o tempo de vida dos objetos, para o Squid saber se deve atualizar ou não.

{% highlight bash %}
refresh_pattern ^ftp:    360 20% 10080
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern .    0 20% 4320
{% endhighlight %}

1ª coluna: defina o tempo em minutos, em cada acesso, quando deve verificar se houve modificação no objeto.
2ª coluna: defina a porcentagem mínima da modificação do objeto que deve ter para ser atualizado.
3ª coluna: defina o tempo em minutos, quando deve efetuar uma atualização mesmo não ter sido modificado.

Insira essa configiração abaixo também no arquivo para especificar o caminho do LOG de acesso e do Cache:
{% highlight bash %}
access_log /var/log/squid3/access.log
cache_log /var/log/squid3/cache.log
{% endhighlight %}

## Controle de Acesso

A ACL ou Lista de Controle de Acesso, é onde define aonde pode acessar ou não pela Internet. Uma coisa importante que deve saber é que o Squid interpreta as ACL's de cima para baixo, então deve ficar atento quando for criar as regras.

Crie duas acl com o tipo src (IP de origem) e adicione o IP do servidor e o IP da rede:

{% highlight bash %}
acl localhost src 127.0.0.1/32
acl intranet src 192.168.1.1/24
{% endhighlight %}

Crie uma acl com o tipo proto (protocolo) e adicione o protocolo "cache_object":

{% highlight bash %}
acl manager proto cache_object
{% endhighlight %}

O protocolo "cache_object" é usado para obter informações sobre o estado do Squid.

É recomendável que permita apenas o servidor obter as informações do Squid, então adicione a seguinte regra:

{% highlight bash %}
http_access allow manager localhost
http_access deny manager
{% endhighlight %}

Crie uma acl do tipo method (método de requisição) e adicione o método PURGE:

{% highlight bash %}
acl purge method PURGE
{% endhighlight %}

O método de requisição PURGE serve para limpar/excluir objetos armazenados no cache.

Para permitir que apenas o servidor possa exclua objetos, adicione a seguinte regra:

{% highlight bash %}
http_access allow purge localhost
http_access deny purge
{% endhighlight %}

Crie uma acl do tipo port (porta) e adicione as portas que serão liberadas:

{% highlight bash %}
acl Safe_ports port 21 70 80 210 280 443 488 563 591 631 777 873 901 1025-65535
{% endhighlight %}

Se quiser deixar mais organizado, ou seja, adicionar uma porta de cada vez para poder comentar em cada linha a descrição do protocolo da porta que está sendo liberada, também pode deixando assim:

{% highlight bash %}
acl Safe_ports port 21    # ftp
acl Safe_ports port 70    # gopher
acl Safe_ports port 80    # http
acl Safe_ports port 210   # wais
acl Safe_ports port 280   # http-mgmt
acl Safe_ports port 443   # https
acl Safe_ports port 488   # gss-http
acl Safe_ports port 563   # nntps
acl Safe_ports port 591   # filemaker
acl Safe_ports port 631   # cups
acl Safe_ports port 777   # multiling http
acl Safe_ports port 873   # rsync
acl Safe_ports port 901   # swat
acl Safe_ports port 1025-65535   # unregistered ports
{% endhighlight %}

Para bloquear o acesso em portas que não foram liberadas, adicione a seguinte regra:

{% highlight bash %}
http_access deny !Safe_ports
{% endhighlight %}

Crie uma acl do tipo dstdomain (domínio de destino) e adicione um dóminio iniciando com o ponto:

{% highlight bash %}
acl domains dstdomain .twitter.com
{% endhighlight %}

Se no caso for vários domínios de destino, define o caminho do arquivo que será adicionado os domínios:

{% highlight bash %}
acl domains dstdomain "/etc/squid/domains"
{% endhighlight %}

Crie o arquivo que foi definido na acl e adicione os domínios de destino:

{% highlight bash %}
.orkut.com
.google.com
.youtube.com
{% endhighlight %}

Para bloquear o acesso nos domínios de destino, adicione a seguinte regra:

{% highlight bash %}
http_access deny domains
{% endhighlight %}

Crie uma acl do tipo url_regex (expressão regular na url) e adicione uma expressão regular:

{% highlight bash %}
acl words url_regex orkut
{% endhighlight %}

A acl do tipo url_regex percorre url em busca de expressões regulares. A acl é case-sensitive, se no caso estiver procurando a expressão "jogo" e tiver "Jogo", serão consideradas diferentes.

Para adicionar várias expressões, define o caminho do arquivo que será adicionado as expressões. E use a opção "-i" para tornar a acl em case-insensitive:

{% highlight bash %}
acl words url_regex -i "/etc/squid/words"
{% endhighlight %}

Crie o arquivo que foi definido na acl e adicione as expressões regulares:

{% highlight bash %}
microsoft
google
orkut
windows
{% endhighlight %}

Para bloquear o acesso em urls com as expressões regulares, adicione a seguinte regra:

{% highlight bash %}
http_access deny words
{% endhighlight %}

Criar uma acl do tipo urlpath_regex (expressão regulares no caminho da url) e define o caminho do arquivo que será adicionado as expressões regulares:

{% highlight bash %}
acl extensions urlpath_regex -i "/etc/squid/extensions"
{% endhighlight %}

A acl do tipo urlpath_regex é semelhante a url_regex, só que é ignorado o domínio e protocolo. Por exemplo, essa url "http://www.invasao.com.br/site/index.php", irá fazer a busca da expressão regular apenas nessa parte "/site/index.php":

Para bloquear o acesso em urls path com expressões regulares, adicione a seguinte regra:

{% highlight bash %}
http_access deny extensions
{% endhighlight %}

Sem mais acl para criar, adicione a seguinte regra para permitir que apenas as máquinas da rede e o servidor sejam liberados para acessar a Internet:

{% highlight bash %}
http_access allow intranet
http_access allow localhost
http_access deny all
{% endhighlight %}


Após ter terminado as configurações, recarregue as configurações no Squid:
{% highlight bash %}
/etc/init.d/squid3 reload
{% endhighlight %}


Fontes:

http://pt.wikipedia.org/

http://www.hardware.com.br/

http://blog.cesar.augustus.nom.br/




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



