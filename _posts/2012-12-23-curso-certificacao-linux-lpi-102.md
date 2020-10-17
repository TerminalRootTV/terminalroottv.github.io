---
layout: post
title: "Curso Certificação Linux LPI-102: Administração do Sistema"
date: '2012-12-23T11:07:00.000-08:00'
image: '/assets/img/lpi/sysadm.jpg'
description: "Em um sistema multi-usuário, é necessário existir mecanismos para proteger os usuários, de forma que seus arquivos privativos fiquem seguros, inacessíveis aos outros."
tags:
- linux
- lpi
---

![Curso Certificação Linux LPI-102: Administração do Sistema](/assets/img/lpi/sysadm.jpg "Curso Certificação Linux LPI-102: Administração do Sistema")

Em um sistema __multi-usuário__, é necessário existir mecanismos para proteger os usuários, de forma que seus arquivos privativos fiquem seguros, inacessíveis aos outros. Outro aspecto é em relação aos recursos do sistema reservados: não deve ser possível a um usuário criar arquivos que ocupem todo o espaço do disco, por exemplo, e assim, indiretamente, proibir todos os outros usuários de salvarem seus próprios arquivos. 

Atingimos esse objetivo criando contas, que representam todos os recursos e informações pertencentes a um determinado usuário. A origem do nome conta, depende muito da história da computação, quando o espaço em disco e tempo de uso da máquina tinha que ser cobrado de acordo com o seu uso, de forma semelhante a uma conta telefõnica.

A cada usuário é destinado um nome de login e senha, como [já vimos anteriormente](http://terminalroot.com.br/2012/11/curso-certificacao-linux-lpi-1.html), bem como um __UID__, __GID__, nome do diretório __home__ e __shell__ inicial (veja imagem do arquivo /etc/passwd). Maiores informações podem ser obtidas com o comando man 5 passwd.

![Blog Linux](/assets/img/lpi/count-users.jpg "Blog Linux")

Adicionar usuários
{% highlight bash %}
useradd nome_do_usuario
{% endhighlight %}

Modificar dados de um usuário
{% highlight bash %}
usermod [opções] nome_do_usuario
{% endhighlight %}

Deletar usuários(a opção -r remove também a pasta do usuário)
{% highlight bash %}
userdel -r nome_do_usuario
{% endhighlight %}

## O comando chage
Lida com a data de expiração das contas de usuário.Essa data é gravada no arquivo __/etc/shadow__.
{% highlight bash %}
chage [opções] nome_do_usuario
{% endhighlight %}

Ex.:(deve-se escrever em formato de data americano mês/dia/ano [mm/dd/aaaa])
{% highlight bash %}
chage -E 12/31/2012 nome_do_usuario
{% endhighlight %}

# Mais sobre Admnistração do Sistema (Contas de Usuários)

+ O diretório __/etc/skel/__ é utilizado para fornecer a estrutura básica do diretório home do usuário.Nele contém os arquivos
{% highlight bash %}
/etc/skel$ ls -a
. .. .bash_logout .bashrc .profile
{% endhighlight %}

+ Durante o processo de logon de um usuário, quando o shel inicia, ele executa o script /etc/profile.
+ O bash também procura pelo arquivo /etc/bashrc que também tem uma função parecida com o profile, mas o bashrc é executado todas as vezes que o bash é executado.
+ Existem agendadores de tarefas um dele é o cron(imagem)

![Blog Linux](/assets/img/lpi/cron.jpg "Blog Linux")

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



