---
layout: post
title: "O Que Fazer Após Instalação do CentOS/Red Hat 7"
date: 2017-08-22 20:58:00
image: '/assets/img/redhat/serie-centos-redhat-3.jpg'
description: "O vídeo mostra como atualizar o sistema com o yum instalar e remover programas, alterar ícone do painel do gnome, transformar em svg, alterar o host do computador..."
tags:
- redhat
- centos
---

> O vídeo mostra como atualizar o sistema com o yum instalar e remover aplicativos/programas, alterar ícone do painel do gnome transformar em svg, alterar o host do computador, entre outros.

## Atualizaçã do Sistema
{% highlight bash %}
yum update -y && yum upgrade -y
{% endhighlight %}

> Caso haja algum problema com o __PackageKit__ ou outro software bloqueando a atualização, copie o número do processo e use o comando __kill -9 [N° DO PROCESSO]__

## Instalar aplicativos/programas

> Onde o __-y__ diz automaticamente sim para a pergunta se deseja continuar do __yum__

{% highlight bash %}
yum install [APLICATIVO]
{% endhighlight %}

## Remover aplicativos/programas
{% highlight bash %}
yum remove [APLICATIVO]
{% endhighlight %}

## Listar repositórios instalados
{% highlight bash %}
yum repolist
{% endhighlight %}

## Adicionar repositório
{% highlight bash %}
yum-config-manager --add-repo [URL/Nome.repo]
# ou adicinoando 'na mão' o repositório com o formato do arquivo .repo
# exemplo se fosse um repositório com o nome Terceiros.repo
nano /etc/yum.repo.d/Terceiros.repo
{% endhighlight %}

## Alterar nome do Host
{% highlight bash %}
/bin/hostname [NOME-PARA-SEU-PC]
# E para ficar definitivo mesmo após reinicializar o sistema
echo "[NOME-PARA-SEU-PC]" > /proc/sys/kernel/hostname
{% endhighlight %}

> Ou ainda editando o arquivo __/etc/sysconfig/network__ e colocando a linha com o conteúdo __HOSTNAME=NOME-PARA-SEU-PC__

## Alterar ícone do painel do GNOME
{% highlight bash %}
cp start-here.svg /usr/share/icons/hicolor/scalable/apps/
{% endhighlight %}

> O arquivo do ícone que você quer pôr precisa ter o nome __start-here__ e precisa estar no formato __svg__

Caso não carregue o ícone, tente restartar o gnome-shell com o comando
{% highlight bash %}
kill -3 gnome-shell
{% endhighlight %}

## Remover ícones da Áre de Trabalho

> Aplicativos &raquo; Utilitários &raquo; Ferramenta de Ajustes &raquo; Área de Trabalho

> Habilite a mudança de [OFF] para [ON] e marque/desmarque itens desejados

## Assista o vídeo

# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=Ufc_7Dnh7Ao)


## Esse vídeo faz parte da série
[#VamosUsarRedHat](https://www.youtube.com/playlist?list=PLUJBQEDDLNcnr4BziCur10Ot9EGzBCn4_) ou [#VamosUsarCentOS](https://www.youtube.com/playlist?list=PLUJBQEDDLNcnr4BziCur10Ot9EGzBCn4_)

## Links Úteis

<https://www.redhat.com/pt-br>

<https://www.centos.org/>

## Deixe seu comentário!

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



