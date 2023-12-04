---
layout: post
title: "NixOS, um Sistema Operacional para Programadores"
date: 2021-12-06 13:02:00
image: '/assets/img/distros/nixos.jpg'
description: '🔊 Nesse vídeo fizemos a instalação do zero do NixOS, sem interface gráfica, e posteriormente configuramos o configuration.nix e instalamos o Xorg e XFCE.'
icon: 'ion:terminal-sharp'
iconname: 'NixOS'
tags:
- programacao
- gnulinux
- distros
- sistemasoperacionais
---

![NixOS, um Sistema Operacional para Programadores](/assets/img/distros/nixos.jpg)

🔊 Nesse vídeo fizemos a instalação do zero do NixOS, sem interface gráfica, e posteriormente configuramos o configuration.nix e instalamos o Xorg e XFCE além de algumas outras dicas.

NixOS é uma distribuição Linux construída sobre o gerenciador de pacotes Nix . Ele usa configuração declarativa e permite atualizações de sistema confiáveis. Duas ramificações principais são oferecidas: versão Stable atual e Unstable seguindo o desenvolvimento mais recente. O NixOS possui ferramentas dedicadas a DevOps e tarefas de implantação.

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/J8uH_6WY3WA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

# Site oficial do NixOS: <https://nixos.org/>


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Comandos utilizados no vídeo
2. PS1
{% highlight sh %}
# Pré comandos
sudo loadkeys br-abnt2
export PS1="$(echo $PS1" " | sed 's/^..//g') "

# Manual
nixos-help

# Particionamento
parted -l
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -2GiB
parted /dev/sda -- mkpart primary linux-swap -2GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 esp on

# Formatando
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

# Montagem de dispositivos
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

# Gerar o o arquivo configuration.nix
nixos-generate-config --root /mnt

# Editar o arquivo, veja exemplo do arquivo abaixo
vim /mnt/etc/nixos/configuration.nix

# Instalar e reiniciar
nixos-install
reboot

# Instalações realizadas
sudo nix-env -iAv nixos.vim
sudo nix-env -iAv nixos.neofetch
{% endhighlight %}


<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Arquivo de configuração `configuration.nix`
{% highlight lua %}
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  
  # Configure keymap in X11
  services.xserver.layout = "br";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcos = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     firefox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
{% endhighlight %}

---

# Links Úteis
Instalação:
+ <https://nixos.org/manual/nixos/stable/#sec-installation>

Manual para instalações de pacotes, exemplo XFCE
+ <https://nixos.org/manual/nixos/stable/index.html#sec-xfce>

Mais informação sobre o NixOS na Wikipédia
+ <https://en.wikipedia.org/wiki/NixOS>

Manual de como o gerenciador de pacotes Nix funciona
+ <https://nixos.org/guides/how-nix-works.html>

Wallpaper(Papel de Parede) utilizado no vídeo
+ <https://git.io/nixwall>

---


