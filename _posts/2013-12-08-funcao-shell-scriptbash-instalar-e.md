---
layout: post
title: "Função Shell Script (Bash): Instalar e Configurar o NFS"
date: '2013-12-08T14:37:00.002-08:00'
image: '/assets/img/shell-script/prompt.jpg'
description: "Acesse pastas de outros computadores com Linux via Rede"
tags:
- linux
- shell script
- servidores
- redes
---
![Função Shell Script (Bash): Instalar e Configurar o NFS](/assets/img/shell-script/prompt.jpg "Função Shell Script (Bash): Instalar e Configurar o NFS")


Você (pode e deve) customizá-lo para sua instalação, por exemplo

> o user root foi só um exemplo;
 
* o uso do apt-get é para distros Debian e Debian Like, mas você pode trocar, altere, caso queira ao seu gosto.

>  Uso: __./installNFS__

## Código

{% highlight bash %}
#!/bin/bash
# --------------------------------------
# ./installNFS
#
# Função Shell Script(Bash): Instalar e Configurar o NFS
#
# Você (pode e deve) customizá-lo para sua instalação, por exemplo:
# o user root foi só um exemplo;
# 
# o uso do apt-get é para distros Debian e Debian Like, mas você pode trocar;
# altere, caso queira ao seu gosto.
#
# Uso: ./installNFS
AJUDA="Exemplo:
SINOPSE
 ./installNFS [OPÇÕES]
DESCRIÇÃO
 Função Shell Script(Bash): Instalar e Configurar o NFS
 -h, --help
 NFS é um protocolo de sistema de arquivos para compartilhamento entre arquivos e diretórios entre computadores 
 conectados em rede.è com NFS que é feito o acesso, existem outras formas, mas certifique-se que essa é a mais simples e a melhor.
 -- 
 Como instalar o NFS em: http://www.terminalroot.com.br/2011/11/compartilhando-pasta-do-linux-para.html. 
 "
ENTRAR="
-e, --enter
  1) Você pode montar a pasta com: mount -t nfs IP:caminho_da_pasta 
  2) Caso não consiga o acesso, lembre-se de dar permissões locais com o 'chmod'."
CONF="
-c, --conf
 'rw' permissão de leitura(r) e escrita(w); o item async permite que o NFS transfira arquivos de forma 'assíncrona', 
 sem precisar esperar pela resposta do cliente; e o IP que pode acessar a pasta que foi compartilhada.Depois de 
 adicionar a linha, salve o arquivo, lembrando que caso você deseje liberar uma faixa de ips, basta 
 usar o *(asterisco), exemplo: 192.168.1.*, todos dessa faixa poderão acessar, ou até mesmo utilizar nome da Estação.
"
AUTOR="   
-a, --author
 Verificar o author e o endereço na internet do Script :
  Marcos da B. M. Oliveira , terminalroot.com.br
  Desde: Dom 08 Dez 2013 20:00:42 BRST 
  Licença: GPL
"
# --------------------------------------
installNFS(){
if [ "$1" ];
 then
  
  case $1 in
 
   -h | --help)  reset &amp;&amp; echo "$AJUDA $ENTRAR $CONF $AUTOR" ;; 
   -e | --enter) echo "$ENTRAR" ;; 
   -c | --conf) echo "$CONF" ;; 
   -a | --author) echo "$AUTOR" ;;
   *)    echo "Opção inválida." ;;
  
  esac
  shift
 exit 0
fi
  if [ -f "/etc/init.d/nfs-kernel-server" ];
   then
     echo "Já está Instalado.";
     exit 0
  else
    if [ "$USER" == "root" ];
    then
   
     reset
     echo -ne "Deseja instalar o NFS ? (S/n)" &amp;&amp; read RESP
   
     if [ "$RESP" == "S" ]; then
     
      echo -e "* Iniciando instalação    [OK]"
      sleep 1 
     else 
      echo "Abortar."; 
      exit 0;
     fi
   
     apt-get install -y nfs-kernel-server nfs-common portmap 2>/dev/null
   
     echo -e "Informe o IP ou nome da máquina que poderá acessar essa máquina: "
     read ip
   
     echo -e "Informe a pasta com o caminho, ex.: /home/$USER/minha_pasta: "
     read pasta
   
     echo -e "* Inserindo dados no arquivo /etc/exports: "
     sleep 1
     echo "$pasta $ip(rw,async)" >> /etc/exports
     sleep 1
     
     echo -e "* Exportando para o Kernel com: exportfs -ra    [OK]"
     sleep 1
     
     echo -e "* Exportando para o Kernel com: exportfs -ra    [OK]"
     sleep 1
     
     echo -e "* Restartando o nfs-kernel-server e o portmap    [OK]"
     sleep 1
     /etc/init.d/nfs-kernel-server restart
     sleep 1
     etc/init.d/portmap restart
     sleep 1
   
     echo -e "* Pronto!
Obs.: 
 1) Você pode montar a pasta com: mount -t nfs $ip:$pasta 
 2) Caso não consiga o acesso, lembre-se de dar permissões locais com o 'chmod'.
     "   
   else
     echo "Você precisa ser root.";
     echo "Abortar.";
   fi
  fi
}
installNFS $1
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

