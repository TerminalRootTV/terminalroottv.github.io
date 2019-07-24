---
layout: post
title: "Curso Certificação Linux LPI-102: Gerenciador de Pacotes YUM e pacotes RPM"
date: '2013-04-16T17:46:00.000-07:00'
image: '/assets/img/lpi/redhat-yum-rpm-fedora-centos.jpg'
description: "Gerenciador de Pacotes YUM e pacotes RPM"
main-class: 'linux'
tags:
- Linux
- LPI'
---

![Gerenciador de Pacotes YUM e pacotes RPM](/assets/img/lpi/redhat-yum-rpm-fedora-centos.jpg "Gerenciador de Pacotes YUM e pacotes RPM")

## 1.0 - Gerenciador de Pacotes YUM

O gerenciador de pacotes __YUM__ é o __gerenciador de pacote__ padrão do __Red Hat__, __Fedora__, __CentOS__ e derivados.Antes criado e utilizado no __Yellow Dog Linux__ que é uma distribuicao baseada em Red Hat e que so funciona em maquinas com o __processador PowerPC__ ou derivados como o __Cell__.

Os arquivos de configuracao do __YUM__ se encontram no diretorio __/etc/yum/__ e os repositorios se encontram no diretorio __/etc/yum.repos.d__ que é muito similar ao __/etc/apt/sources.list.d__ do __Debian__ . Pois seria possivel a centralizacao de tudo tb no /__etc/yum/yum.conf__.

__As instruções aqui são baseadas na distribuição Fedora__. O arquivo de configuração do __yum__ é o __/etc/yum.conf__. Além disso, os repositórios (sites que contém os pacotes dos programas) são configurados através de cada arquivo de extensão .repo, localizados no diretório __/etc/yum.repos.d__ . A configuração padrão do __yum__ contida no __/etc/yum.conf__ é suficiente para o bom funcionamento do programa. Você só precisará de alguns repositórios já configurados.

{% highlight bash %}
[fedora]
name=Fedora $releasever - $basearch
baseurl=http://fedora.c3sl.ufpr.br/linux/releases/$releasever/Everything/$basearch/os/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora file:///etc/pki/rpm-gpg/RPM-GPG-KEY
{% endhighlight %}

As linhas acima significam que o repositório denominado fedora terá

* __name__: Nome descritivo, no exemplo: Fedora (versão da distribuição) – (arquitetura da distribuição, ex. i386);
* __baseurl__: O endereço que contém a lista dos programas e os pacotes;
* __enabled__: Se o repositório está habilitado ou não (1 significa sim, 0 significa não);
* __gpgcheck__: Se todos os pacotes devem ter sua autenticidade verificada
(extremamente recomendado, 1 significa sim, 0 significa não);
* __gpgkey__: Qual chave criptográfica utilizar para a verificação dos pacotes.


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


Com este repositório configurado, pode-se instalar e remover todos os pacotes básicos da distribuição. No caso das atualizações de pacotes, o
repositório é outro e pode ser configurado no arquivo __/etc/yum.repos.d/fedora-updates.repo__

{% highlight bash %}
[updates]
name=Fedora $releasever - $basearch – Updates
baseurl=http://fedora.c3sl.ufpr.br/linux/updates/$releasever/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora
{% endhighlight %}

Há varios outros repositórios de terceiros disponíveis (como o __livna, dag, freshrpms, atrpms__) que contém outros programas que podem não estar
na lista principal por diversos motivos. Cada um desses repositórios têm configurações próprias e por isso criam arquivos __.repo__ dentro do 
diretório __/etc/yum.repos.d__ . Aqui não iremos listar todos os repositórios e sim apenas os oficiais.

Uma vez configurados os repositórios desejados, é hora de utilizar o __yum__. Para procurar por um pacote usando alguma palavra relacionada, 
utilizamos o parâmetro search. Por exemplo, procurar todos os pacotes  relacionados com a palavra ‘__DVD__’

{% highlight bash %}
yum search DVD
{% endhighlight %}

Para instalar um pacote

{% highlight bash %}
yum install pacote
{% endhighlight %}

Para desinstalar o pacote

{% highlight bash %}
yum remove pacote
{% endhighlight %}

Atualizando um pacote específico, caso exista uma atualização para o mesmo

{% highlight bash %}
yum update pacote
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


Ou se precisarmos atualizar todo o sistema, instalando todos os pacotes novos que tenham atualizações disponíveis

{% highlight bash %}
yum update
{% endhighlight %}

Para verificar quais os pacotes que precisam de atualização

{% highlight bash %}
yum check-update
{% endhighlight %}

Listando todos os pacotes disponíveis, tanto no repositório quanto os já instalados

{% highlight bash %}
yum list
{% endhighlight %}

Listando todos os pacotes disponíveis para a instalação

{% highlight bash %}
yum list available
{% endhighlight %}

Existem também os grupos de pacotes. Um grupo de pacotes é um conjunto de pacotes necessários para se instalar alguma funcionalidade no sistema e são definidos pelos desenvolvedores da distribuição. Para listar todos os grupos de pacotes
{% highlight bash %}
yum grouplist
{% endhighlight %}

Como podemos ver, o yum mostra os grupos já instalados no sistema (__Installed Groups__) e os disponíveis para a instalação (__Available Groups__). Se quisermos, por exemplo, instalar o suporte ao gerenciador de janelas __XFCE__, instalamos seu grupo

{% highlight bash %}
yum groupinstall "XFCE"
{% endhighlight %}

O yum se encarregará de baixar todos os pacotes necessários para o __XFCE__. Para remover todos os pacotes do grupo

{% highlight bash %}
yum groupremove "XFCE"
{% endhighlight %}

Todas estas ações do yum necessitam de uma conexão de Internet, pois a lista de pacotes é sempre requisitada no repositório para consulta. 
Mesmo para consultar um simples nome de pacote, precisa-se de conexão com a Internet. Caso já tenha se utilizado o __yum__ para fazer alguma ação (e por consequência, ele já tenha baixado a lista de pacotes para o seu sistema), podemos optar por não precisar nos conectar ao servidor na 
Internet toda vez que usarmos o yum utilizando o parâmetro __-C__. Exemplos


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


{% highlight bash %}
yum -C search DVD
yum -C check-update
yum -C list | grep kde
{% endhighlight %}

> Na instalacao do fedora é possivel instalar o __apt__ e no __Debian__ e __Ubuntu__ vc tb pode instalar o __yum__ pelo __apt-get__ para estudos: __alien__ .

## 2.0 - Pacotes RPM e Sistema de Gerenciamento de Pacotes RPM

RPM (Red Hat Package Manager) é um sistema de gerenciamento de pacotes desenvolvido pela Red Hat para ser utilizado em sua própria distro. Posteriormente outras distros Linux, e mesmo alguns outros sistemas operacionais, também adotaram o formato RPM para gerenciamento de seus pacotes. A LSB (Linux Standard Base) indicou o formato RPM como o padrão para distros Linux.

Outro utilitário para gerenciamento de pacotes RPM em modo texto é o Yum (Yellow Dog Updater, Modified), disponível nas distros Red Hat Enterprise Linux, CentOS, Oracle Entreprise Linux e Fedora.

Com o Yum, é possível realizar instalações e atualizações de pacotes localmente ou a partir de repositórios de pacotes localizados na internet. Sua grande vantagem em relação ao utilitário RPM é tentar resolver automaticamente todas as dependências requeridas por pacotes que estiverem sendo instalados ou atualizados e também por proporcionar uma forma fácil de atualizar todo o sistema pela Internet.

Os três principais formatos de pacotes utilizados em sistemas Linux são

* RPM: utilizado pela distro Red Hat Enterprise Linux (RHEL) e por distros derivadas como CentOS, Oracle Enterprise Linux, Fedora e SuSE.
* DEB: utilizado pela distro Debian e por distros derivadas como Ubuntu.
* TGZ: utilizado pela distro Slackware e por distros derivadas como Vector Linux.

Além destes formatos, há também outros. No entanto, não vou me prolongar a respeito deles para não perder o foco do artigo e também para não deixá-lo extenso.

O rótulo (nomenclatura) típico de um pacote RPM é nome-versao-release.arquitetura.rpm, onde

* Nome: é o nome do software que está sendo distribuído. Versão: é a versão do software. Release: é o versão de construção do pacote para a mesma versão do software. Arquitetura: é a plataforma para a qual o software foi desenvolvido. Noarch significa que o software não foi desenvolvido para uma plataforma específica, podendo ser utilizado em qualquer uma. Src significa que o pacote contém os arquivos-fonte do software.
* .rpm: é a extensão do nome do arquivo de pacote RPM.

> Exemplo: oracle-xe-univ-10.2.0.1-1.0.i386.rpm, sqldeveloper-3.0.04.34-1.noarch.rpm

## Instalação


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


Para instalar pacotes RPM em sistemas Linux, é necessário estar logado como root (su). Note que o sistema de gerenciamento de pacotes RPM não resolve as dependências automaticamente para você.

Portanto, as dependências necessárias deverão ser instaladas antes da instalação do pacote que as requer. Uma outra forma de resolver isso é executar a instalação utilizando o utilitário Yum em distros RHEL e derivadas ou o equivalente em outras distros.

## Instalações locais

Para instalar um pacote localizado localmente, execute o comando 
{% highlight bash %}
rpm -ivh 
{% endhighlight %}

* __-i__: é o modo de instalação.
* __-v__: (opcional) apresenta mensagens detalhadas de saída para o processo de instalação.
* __-h__: (opcional) exibe cerquilhas (#) à medida em que o processo de instalação avança.

> Exemplo: __rpm -ivh AdobeReader_ptb-8.1.7-1.i486.rpm__

É possível testar a instalação de um pacote antes de instalá-lo no sistema # rpm -ivh –test , onde

__–test__: esta opção testa o processo de instalação do pacote e, caso haja algum problema, notifica a respeito.

{% highlight bash %}
rpm -ivh –test AdobeReader_ptb-8.1.7-1.i486.rpm
{% endhighlight %}

## Instalações com o utilitário Yum
A forma típica do comando Yum para instalações é

{% highlight bash %}
yum -y install –nogpgcheck 
{% endhighlight %}


* -y: (opcional) resposta automática positiva para a confirmação do processo de instalação.
* install: é a opção de instalação do Yum.
* –nogpgcheck: (opcional) instrui o Yum a não verificar a assinatura do pacote.


{% highlight bash %}
yum -y install –nogpgcheck AdobeReader_ptb-8.1.7-1.i486.rpm
yum -y install gparted
{% endhighlight %}

> Observação: No exemplo 1, acima, o pacote está disponível localmente. Em 2, o pacote está localizado em um repositório utilizado pelo Yum, isto é, na Internet. Em ambos os casos, o Yum tenta resolver quaisquer dependências, baixando-as e instalando-as automaticamente.

Fonte: http://imasters.com.br


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

