---
layout: post
title: "Função Shell Script(Bash): Instalar e Configurar o OpenSSH"
date: '2013-11-23T15:21:00.000-08:00'
image: '/assets/img/shell-script/prompt.jpg'
description: "Acesse outros computadores com Linux via Rede pelo Terminal"
tags:
- shell script
- servidores
---

![Função Shell Script(Bash): Instalar e Configurar o OpenSSH](/assets/img/shell-script/prompt.jpg "Função Shell Script(Bash): Instalar e Configurar o OpenSSH")

Você (pode e deve) customizá-lo para sua instalação, por exemplo

> o user root foi só um exemplo;
 
* o uso do apt-get é para distros Debian e Debian Like, mas você pode trocar, altere, caso queira ao seu gosto.

>  Uso: __./installOpenSSH__

## Código

{% highlight bash %}
## Código

#!/bin/bash
# --------------------------------------
# ./installOpenSSH
#
# Função Shell Script(Bash): Instalar e Configurar o OpenSSH
#
# Você (pode e deve) customizá-lo para sua instalação, por exemplo:
# o user root foi só um exemplo;
# a porta foi só um exemplo;
# o uso do apt-get é para distros Debian e Debian Like, mas você pode trocar;
# altere, caso queira ao seu gosto.
#
# Uso: ./installOpenSSH
AJUDA="Exemplo:
SINOPSE
 ./installOpenSSH [OPÇÕES]
DESCRIÇÃO
 Função Shell Script(Bash): Instalar e Configurar o OpenSSH
 -h, --help
 Para verificar como usar ."
ENTRAR="
-e, --enter
  Para conectar a máquina remota(Obs.: Se sua máquina usar o 'sudo', coloque o sudo antes):
  ssh -p 2222 [IP da máquina remota]
  ou
  sudo ssh -p 2222 [IP da máquina remota]
  
  Ex.:
  ssh -p 2222 192.168.1.2
  ou
  sudo ssh -p 2222 192.168.1.2"
COPIAR="
-c, --copy
 Para copiar da máquina remota para seu PC (Obs.: Se sua máquina usar o 'sudo', coloque o sudo antes), (-r para diretórios, recursivamente):
  scp -P 2222 -r [IP da máquina REMOTA]:/[PASTA e/ou ARQUIVO da máquina REMOTA] /[PASTA do seu PC]
  ou
  sudo scp -P 2222 -r [IP da máquina REMOTA]:/[PASTA e/ou ARQUIVO da máquina REMOTA] /[PASTA do seu PC]
  
  Ex.:
  scp -P 2222 192.168.1.2:/home/user/arquivo.pdf /home/marcos/Downloads/
  ou
  sudo scp -P 2222 192.168.1.2:/home/user/arquivo.pdf /home/marcos/Downloads/
  
  
 Para copiar do seu PC para a máquina remota, ex.:
  scp -P 2222 /home/user/ 192.168.1.2:/home/marcos/arquivo.pdf"
AUTOR="   
-a, --author
 Verificar o author e o endereço na internet do Script :
  Marcos da B. M. Oliveira , http://www.terminalroot.com.br/
  Desde: Sáb 23 Nov 2013 19:54:46 BRST 
  Licença: GPL
"
# --------------------------------------
installOpenSSH(){
if [ "$1" ];
 then
  
  case $1 in
 
   -h | --help)  reset &amp;&amp; echo "$AJUDA $ENTRAR $COPIAR $AUTOR" ;; 
   -e | --enter) echo "$ENTRAR" ;; 
   -c | --copy) echo "$COPIAR" ;; 
   -a | --author) echo "$AUTOR" ;;
   *)    echo "Opção inválida." ;;
  
  esac
  shift
 exit 0
fi
  if [ $(which sshd) ];
   then
     echo "Já está Instalado.";
     exit 0
  else
    if [ "$USER" == "root" ];
    then
   
     reset
     echo -ne "Deseja instalar o OpenSSH ? (S/n)" &amp;&amp; read RESP
   
     if [ "$RESP" == "S" ]; then
     
      echo -e "* Iniciando instalação    [OK]"
      sleep 1 
     else 
      echo "Abortar."; 
      exit 0;
     fi
   
     apt-get install -y openssh-client openssh-server 2>/dev/null
   
     echo -e "* Alterando a Porta    [OK]"
     sleep 1
     sed -i 's/Port 22/Port 2222/' /etc/ssh/sshd_config
   
     echo -e "* Adicionando o usuário ROOT:   [OK]"
     sleep 1
     sed -i "s/Subsystem sftp \/usr\/lib\/openssh\/sftp\-server/Subsystem sftp \/usr\/lib\/openssh\/sftp\-server\\nAllowUsers root/" /etc/ssh/sshd_config
   
     echo -e "* Restartando o SSHD    [OK]"
     sleep 1
     /etc/init.d/ssh restart 2>/dev/null
   
     echo -e "* Pronto!"   
   else
     echo "Você precisa ser root.";
     echo "Abortar.";
   fi
  fi
}
installOpenSSH $1
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

