---
layout: post
title: "Curso Certificação Linux LPI-102:  Compartilhamento via NFS"
date: '2013-04-03T17:22:00.000-07:00'
image: '/assets/img/lpi/nfs.jpg'
description: "NFS é um protocolo de sistema de arquivos para compartilhamento entre arquivos e diretórios entre computadores conectados em rede."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Compartilhamento via NFS](/assets/img/lpi/nfs.jpg "Compartilhamento via NFS")

Nesse post vou mostrar como compartilhar uma pasta no __Linux__ para acesso via rede por comando, o processo é bem simples.Esse acesso será baseado em __NFS__, não tem nada a ver com o Samba, isso é pra compartilhamento entre duas ou mais máquinas __Linux__(de Linux pra Linux), mais pra frente vou explicar via samba, mas por enquanto isso aqui é mais importante.

__NFS__ é um protocolo de sistema de arquivos para compartilhamento entre arquivos e diretórios entre computadores conectados em rede. É com NFS que é feito o acesso, existem outras formas, mas certifique-se que essa é a mais simples e a melhor.

> Primeiramente temos de ter dois pacotes instalados, precisa ser __root__

* 1 - __nfs-kernel-server__ ---- que deve ser instalado no __Server__(a máquina que compartilhará o arquivo ou a pasta).
Para instalá-lo no Debian e similares
{% highlight bash %}
apt-get install nfs-kernel-server
{% endhighlight %}

> Convém também instalar o portmap, caso não esteja instalado

{% highlight bash %}
apt-get install portmap
{% endhighlight %}

* 2 - __nfs-common__ ---- que deve ser instalado no __Client__(máquina que acessará a tal pasta ou arquivo).

> Para instalá-lo no __Debian e similares__

{% highlight bash %}
apt-get install nfs-common
{% endhighlight %}

* No __Server__, precisamos informar qual a pasta será compartilhada e quais as permissões, para isso edite o arquivo

{% highlight bash %}
vim /etc/exports
{% endhighlight %}

* Após as linhas iniciais e comentado __com #__(tralha), crie uma nova linha __sem #__(tralha) e informe o endereço da pasta no PC e as permissões do mesmo, exemplo

{% highlight bash %}
/home/usuario/pasta_a_ser_compartilhada 192.168.1.102(rw,async)
{% endhighlight %}

* Ou seja, o caminho da pasta;"__rw__" permissão de __leitura(r)__ e __escrita(w)__; o item __async__ permite que o __NFS__ transfira arquivos de forma "__assíncrona__", sem precisar esperar pela resposta do cliente; e o __IP__ que pode acessar a pasta que foi compartilhada.Depois de adicionar a linha, salve o arquivo, lembrando que caso você deseje liberar uma faixa de ips, basta usar o __*(asterisco)__, exemplo: __192.168.1.*__, todos dessa faixa poderão acessar, ou até mesmo utilizar nome da Estação.

> Para aplicar as alterações no arquivo exports para que o mesmo possa ser lido pelo __Kernel__, é necessario, exportar e reiniciar o serviço, reinicie também o __Portmaps__, com os comando

{% highlight bash %}
exportfs -ra
/etc/init.d/nfs-kernel-server restart
/etc/init.d/portmap restart
{% endhighlight %}

> Agora vamos no cliente(máquina que acessará a pasta).Para isso iremos precisar montar a pasta compartilhada da rede, então nada melhor do que você criar uma pasta para receber a montagem, então crie no local onde você deseja essa pasta, exemplo

{% highlight bash %}
mkdir /home/usuario/nome_da_pasta
{% endhighlight %}

> E então montamos a pasta compartilhada dentro da que criamos com o seguinte comando

{% highlight bash %}
mount -t nfs 192.168.1.101:/home/server/pasta_compartilhada /home/cliente/pasta_criada
{% endhighlight %}

> Ou seja, a opção (__-t__) do mount informa o tipo, e especificamos o tipo com o nome do tipo que é "__nfs__", depois informamos o __IP__ que está a pasta compartilhada(o __Server__) e o local onde montaremos essa pasta, endeço no cliente.

Caso não consiga o acesso, lembre-se de dar permissões locais com o "__chmod__".Se seu __PC__ pegou um __IP__ via __DHCP__ diferente do que você permitiu no "__exports__", você pode alterálo com o seguinte comando
{% highlight bash %}
ifconfig eth0 192.168.1.102/16 dev eth0
{% endhighlight %}

> Note que o ip fica a seu critério e o __/16__ é a mascara __255.255.0.0__ na tabela, se desejar especificar um __gateway__, utilize

{% highlight bash %}
route add default gw 192.168.1.1 netmask 255.255.0.0 dev eth0
{% endhighlight %}

### Veja um vídeo sobre NFS

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=NDQy_saxxZU)

