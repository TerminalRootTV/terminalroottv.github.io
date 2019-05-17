---
layout: post
title: "Passo a Passo como conectar duas máquinas Linux e Windows via rede com cabo Cross-Over e Samba."
date: '2014-11-08T16:18:00.002-08:00'
description: Passo a Passo como conectar duas máquinas Linux e Windows via rede com cabo
image: '/assets/img/rede/rede.jpg'
main-class: 'misc'
color: '#34a853'
tags:
- Servidores
- Redes
categories:
twitter_text: "Passo a Passo como conectar duas máquinas Linux e Windows"
introduction: "Passo a Passo como conectar duas máquinas Linux e Windows"
---

![Linux x Windows](/assets/img/rede/rede.jpg)


1 - Criar o cabo Cross-Over TP(par trançado): [Como criar "cabo crossover" e "cabo direto"](http://www.infowester.com/tutcabosredes.php)


2 - Criar uma conta no Windows com o mesmo nome e mesma senha(talvez) de uma conta no Linux *(procure no google como criar, caso não saiba)*

3 - Compartilhar a pasta ou unidade Windows e incluir o usuário Windows que você permitirá, e verificar permissões da rede e total:

> clique com o botão direito em cima da pasta ou unidade e vá até propriedades e selecione compartilhar, no compartilhamento avançado(outra opção no mesmo menu) inclua o nome do usuário que receberá o acesso do Samba, ex.: marcos. Qualquer dúvida pesquise na internet como fazer isso.

4 - Instalar o Samba e o smbclient no Linux:


{% highlight bash %}
apt-get install samba smbclient
{% endhighlight %}


4.1 - Por comando vc deve utilizar o comando tipo esse exemplo, supondo que o ip da máquina Windows seja 10.1.1.3: 

{% highlight bash %}
smbclient -L 10.1.1.3 -U marcos
{% endhighlight %}


5 - Criar um backup do *smb.conf* :

{% highlight bash %}
cd /etc/samba
mkdir backupsmb
cp smb.conf backupsmb/
mv backupsmb/smb.conf backupsmb/smb.conf.bkp
{% endhighlight %}

6 - Editar o *smb.conf*

{% highlight bash %}
vim /etc/samba/smb.conf
{% endhighlight %}

use essa como base, mas altere com seus nomes de usuário:

{% highlight bash %}

[global]
netbios name = linux
server string = Servidor público
workgroup = WORKGROUP
local master = yes
os level = 100
preferred master = yes
wins support = yes
map to guest = bad user
guest account = marcos

[arquivos]
path = /mnt
writable = yes
guest ok = yes

[backups]
path = /mnt
writable = yes
guest ok = yes
{% endhighlight %}

7 - Ao final o arquivo ficará mais ou menos assim, perceba que o __global__ tá no meio do arquivo e os __arquivos__ e __backups__ estão no final: __VEJA O CÓDIGO NO FINAL DESTE POST__

8 - Crie um usuario samba no Linux, com a mesma senha (não necessariamente) do usuário que existe no sistema Linux e no Windows, e dê a permissão para a montagem:

{% highlight bash %}
smbpasswd -a marcos
chown -R marcos:marcos /mnt
{% endhighlight %}

9 - Pare e inicie o daemon do Samba:
{% highlight bash %}
/etc/init.d/samba stop
/etc/init.d/samba start
{% endhighlight %}

10 - Teste o samba, ...:
{% highlight bash %}
testparm
{% endhighlight %}

11 - Configure a placa de rede no Windows:

* clique com o botão direito no icone de rede no desktop, e depois em Alterar Configurações de Rede do Adaptador
* clique com o botão direito em cima da placa de rede(se houver duas, desative a outra) e vá até propriedades
* desative (desmarque o protocolo ipv6) e dê um duplo clique no ipv4, na janela que se abrirá, configure o ip da máquina, gateway e máscara, ex.:
   
> ip  - 10.1.1.3

> gateway - 10.1.1.2

> máscara - 255.0.0.0


* aplique e salve, se for o caso, depois feche
* desative e ative a conexão de rede, para pegar as configurações e aguarde o reconhecimento da mesma.

12 - Desative a placa de rede no Linux e reative com o ip e netmask correspondentes

{% highlight bash %}
ipconfig eth0 down
ipconfig eth0 10.1.1.2 netmask 255.0.0.0 up
{% endhighlight %}

> obs.: Caso o icone da area de trabalho fique desconectado, desconsidere, confirme os dados com comando

{% highlight bash %}
ifconfig
{% endhighlight %}

Mais ou menos aparecerá:
 
{% highlight bash %}

eth0 Link encap:Ethernet Endereço de HW 00:87:56:9e:88:41 
 inet end.: 10.1.1.2 Bcast:10.255.255.255 Masc:255.0.0.0
 endereço inet6: fe80::221:97ff:fe6d:6450/64 Escopo:Link
 UP BROADCASTRUNNING MULTICAST MTU:1500 Métrica:1
 RX packets:107715 errors:0 dropped:0 overruns:0 frame:0
 TX packets:85580 errors:0 dropped:0 overruns:0 carrier:0
 colisões:0 txqueuelen:1000 
 RX bytes:126178753 (120.3 MiB) TX bytes:11810528 (11.2 MiB)
 IRQ:25 Endereço de E/S:0x6000 

lo Link encap:Loopback Local 
 inet end.: 127.0.0.1 Masc:255.0.0.0
 endereço inet6: ::1/128 Escopo:Máquina
 UP LOOPBACKRUNNING MTU:16436 Métrica:1
 RX packets:8159 errors:0 dropped:0 overruns:0 frame:0
 TX packets:8159 errors:0 dropped:0 overruns:0 carrier:0
 colisões:0 txqueuelen:0 
 RX bytes:726321 (709.2 KiB) TX bytes:726321 (709.2 KiB)
{% endhighlight %}
 
13 - Depois ping no ip da maquina do windows pra ver se está tudo normal:

{% highlight bash %}
ping 10.1.1.3 -c3
{% endhighlight %}

resultado, mais ou menos esse:

{% highlight bash %}
PING 10.1.1.3 (10.1.1.3) 56(84) bytes of data.
64 bytes from 10.1.1.3: icmp_req=1 ttl=128 time=0.169 ms
64 bytes from 10.1.1.3: icmp_req=2 ttl=128 time=5.03 ms
64 bytes from 10.1.1.3: icmp_req=3 ttl=128 time=0.168 ms

--- 10.1.1.3 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 0.168/1.791/5.037/2.295 ms
{% endhighlight %}

14 - Agora abra o Nautilus (uma pasta qualquer no modo gráfico), e aperte Ctrl+L, e na barra de endereços digite:

> smb://10.1.1.3


pedirá usuario, grupo e senha. Preencha com marcos(o nome que vc escolheu), __WORKGROUP__ e a *senha* do *usuário*.

pronto, vc acessará!

## Qualquer duvida é só comentar!

### Abraços!

#### DADOS DO SMB.CONF:

{% highlight bash %}
#
# Sample configuration file for the Samba suite for Debian GNU/Linux.
#
#
# This is the main Samba configuration file. You should read the
# smb.conf(5) manual page in order to understand the options listed
# here. Samba has a huge number of configurable options most of which 
# are not shown in this example
#
# Some options that are often worth tuning have been included as
# commented-out examples in this file.
# - When such options are commented with ";", the proposed setting
# differs from the default Samba behaviour
# - When commented with "#", the proposed setting is the default
# behaviour of Samba but the option is considered important
# enough to be mentioned here
#
# NOTE: Whenever you modify this file you should run the command
# "testparm" to check that you have not made any basic syntactic 
# errors. 
# A well-established practice is to name the original file
# "smb.conf.master" and create the "real" config file with
# testparm -s smb.conf.master >smb.conf
# This minimizes the size of the really used smb.conf file
# which, according to the Samba Team, impacts performance
# However, use this with caution if your smb.conf file contains nested
# "include" statements. See Debian bug #483187 for a case
# where using a master file is not a good idea.
#

#======================= Global Settings =======================

[global]
netbios name = linux
server string = Servidor público
workgroup = WORKGROUP
local master = yes
os level = 100
preferred master = yes
wins support = yes
map to guest = bad user
guest account = marcos

#### Networking ####

# The specific set of interfaces / networks to bind to
# This can be either the interface name or an IP address/netmask;
# interface names are normally preferred
; interfaces = 127.0.0.0/8 eth0

# Only bind to the named interfaces and/or networks; you must use the
# 'interfaces' option above to use this.
# It is recommended that you enable this feature if your Samba machine is
# not protected by a firewall or is a firewall itself. However, this
# option cannot handle dynamic or non-broadcast interfaces correctly.
; bind interfaces only = yes



#### Debugging/Accounting ####

# This tells Samba to use a separate log file for each machine
# that connects
 log file = /var/log/samba/log.%m

# Cap the size of the individual log files (in KiB).
 max log size = 1000

# If you want Samba to only log through syslog then set the following
# parameter to 'yes'.
# syslog only = no

# We want Samba to log a minimum amount of information to syslog. Everything
# should go to /var/log/samba/log.{smbd,nmbd} instead. If you want to log
# through syslog you should set the following parameter to something higher.
 syslog = 0

# Do something sensible when Samba crashes: mail the admin a backtrace
 panic action = /usr/share/samba/panic-action %d


####### Authentication #######

# "security = user" is always a good idea. This will require a Unix account
# in this server for every user accessing the server. See
# /usr/share/doc/samba-doc/htmldocs/Samba3-HOWTO/ServerType.html
# in the samba-doc package for details.
# security = user

# You may wish to use password encryption. See the section on
# 'encrypt passwords' in the smb.conf(5) manpage before enabling.
 encrypt passwords = true

# If you are using encrypted passwords, Samba will need to know what
# password database type you are using. 
 passdb backend = tdbsam

 obey pam restrictions = yes

# This boolean parameter controls whether Samba attempts to sync the Unix
# password with the SMB password when the encrypted SMB password in the
# passdb is changed.
 unix password sync = yes

# For Unix password sync to work on a Debian GNU/Linux system, the following
# parameters must be set (thanks to Ian Kahan  for
# sending the correct chat script for the passwd program in Debian Sarge).
 passwd program = /usr/bin/passwd %u
 passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .

# This boolean controls whether PAM will be used for password changes
# when requested by an SMB client instead of the program listed in
# 'passwd program'. The default is 'no'.
 pam password change = yes

########## Domains ###########

# Is this machine able to authenticate users. Both PDC and BDC
# must have this setting enabled. If you are the BDC you must
# change the 'domain master' setting to no
#
; domain logons = yes
#
# The following setting only takes effect if 'domain logons' is set
# It specifies the location of the user's profile directory
# from the client point of view)
# The following required a [profiles] share to be setup on the
# samba server (see below)
; logon path = \\%N\profiles\%U
# Another common choice is storing the profile in the user's home directory
# (this is Samba's default)
# logon path = \\%N\%U\profile

# The following setting only takes effect if 'domain logons' is set
# It specifies the location of a user's home directory (from the client
# point of view)
; logon drive = H:
# logon home = \\%N\%U

# The following setting only takes effect if 'domain logons' is set
# It specifies the script to run during logon. The script must be stored
# in the [netlogon] share
# NOTE: Must be store in 'DOS' file format convention
; logon script = logon.cmd

# This allows Unix users to be created on the domain controller via the SAMR
# RPC pipe. The example command creates a user account with a disabled Unix
# password; please adapt to your needs
; add user script = /usr/sbin/adduser --quiet --disabled-password --gecos "" %u

# This allows machine accounts to be created on the domain controller via the 
# SAMR RPC pipe. 
# The following assumes a "machines" group exists on the system
; add machine script = /usr/sbin/useradd -g machines -c "%u machine account" -d /var/lib/samba -s /bin/false %u

# This allows Unix groups to be created on the domain controller via the SAMR
# RPC pipe. 
; add group script = /usr/sbin/addgroup --force-badname %g

########## Printing ##########

# If you want to automatically load your printer list rather
# than setting them up individually then you'll need this
# load printers = yes

# lpr(ng) printing. You may wish to override the location of the
# printcap file
; printing = bsd
; printcap name = /etc/printcap

# CUPS printing. See also the cupsaddsmb(8) manpage in the
# cupsys-client package.
; printing = cups
; printcap name = cups

############ Misc ############

# Using the following line enables you to customise your configuration
# on a per machine basis. The %m gets replaced with the netbios name
# of the machine that is connecting
; include = /home/samba/etc/smb.conf.%m

# Most people will find that this option gives better performance.
# See smb.conf(5) and /usr/share/doc/samba-doc/htmldocs/Samba3-HOWTO/speed.html
# for details
# You may want to add the following on a Linux system:
# SO_RCVBUF=8192 SO_SNDBUF=8192
# socket options = TCP_NODELAY

# The following parameter is useful only if you have the linpopup package
# installed. The samba maintainer and the linpopup maintainer are
# working to ease installation and configuration of linpopup and samba.
; message command = /bin/sh -c '/usr/bin/linpopup "%f" "%m" %s; rm %s' &amp;

# Domain Master specifies Samba to be the Domain Master Browser. If this
# machine will be configured as a BDC (a secondary logon server), you
# must set this to 'no'; otherwise, the default behavior is recommended.
# domain master = auto

# Some defaults for winbind (make sure you're not using the ranges
# for something else.)
; idmap uid = 10000-20000
; idmap gid = 10000-20000
; template shell = /bin/bash

# The following was the default behaviour in sarge,
# but samba upstream reverted the default because it might induce
# performance issues in large organizations.
# See Debian bug #368251 for some of the consequences of *not*
# having this setting and smb.conf(5) for details.
; winbind enum groups = yes
; winbind enum users = yes

# Setup usershare options to enable non-root users to share folders
# with the net usershare command.

# Maximum number of usershare. 0 (default) means that usershare is disabled.
; usershare max shares = 100

#======================= Share Definitions =======================

[homes]
 comment = Home Directories
 browseable = no

# By default, the home directories are exported read-only. Change the
# next parameter to 'no' if you want to be able to write to them.
 read only = yes

# File creation mask is set to 0700 for security reasons. If you want to
# create files with group=rw permissions, set next parameter to 0775.
 create mask = 0700

# Directory creation mask is set to 0700 for security reasons. If you want to
# create dirs. with group=rw permissions, set next parameter to 0775.
 directory mask = 0700

# By default, \\server\username shares can be connected to by anyone
# with access to the samba server.
# The following parameter makes sure that only "username" can connect
# to \\server\username
# This might need tweaking when using external authentication schemes
 valid users = %S

# Un-comment the following and create the netlogon directory for Domain Logons
# (you need to configure Samba to act as a domain controller too.)
;[netlogon]
; comment = Network Logon Service
; path = /home/samba/netlogon
; guest ok = yes
; read only = yes

# Un-comment the following and create the profiles directory to store
# users profiles (see the "logon path" option above)
# (you need to configure Samba to act as a domain controller too.)
# The path below should be writable by all users so that their
# profile directory may be created the first time they log on
;[profiles]
; comment = Users profiles
; path = /home/samba/profiles
; guest ok = no
; browseable = no
; create mask = 0600
; directory mask = 0700

[printers]
 comment = All Printers
 browseable = no
 path = /var/spool/samba
 printable = yes
 guest ok = no
 read only = yes
 create mask = 0700

# Windows clients look for this share name as a source of downloadable
# printer drivers
[print$]
 comment = Printer Drivers
 path = /var/lib/samba/printers
 browseable = yes
 read only = yes
 guest ok = no
# Uncomment to allow remote administration of Windows print drivers.
# You may need to replace 'lpadmin' with the name of the group your
# admin users are members of.
# Please note that you also need to set appropriate Unix permissions
# to the drivers directory for these users to have write rights in it
; write list = root, @lpadmin

# A sample share for sharing your CD-ROM with others.
;[cdrom]
; comment = Samba server's CD-ROM
; read only = yes
; locking = no
; path = /cdrom
; guest ok = yes

# The next two parameters show how to auto-mount a CD-ROM when the
# cdrom share is accesed. For this to work /etc/fstab must contain
# an entry like this:
#
# /dev/scd0 /cdrom iso9660 defaults,noauto,ro,user 0 0
#
# The CD-ROM gets unmounted automatically after the connection to the
#
# If you don't want to use auto-mounting/unmounting make sure the CD
# is mounted on /cdrom
#
; preexec = /bin/mount /cdrom
; postexec = /bin/umount /cdrom

[arquivos]
path = /mnt
writable = yes
guest ok = yes

[backups]
path = /mnt
writable = yes
guest ok = yes
{% endhighlight %}


## Veja um Vídeo Demonstrativo

# Como acessar Arquivos do Windows pelo Linux e vice versa


# [Clique Aqui para Ver o Vídeo](https://www.youtube.com/watch?v=WGTbBfdEgJ0)


