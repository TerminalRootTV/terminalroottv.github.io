---
layout: post
title: 'Como Obter Informações de Hardware no Linux'
date: '2014-10-19T14:04:00.001-07:00'
image: '/assets/img/hardware/lshw.jpg'
description: "Dicas de vários utilitários para ver seu hardware, sem falar dos mais conhecidos: lspci,..."
main-class: 'linux'
tags:
- Linux
- Dicas
- Hardware
---


## lshw

![Como Obter Informações de Hardware no Linux](/assets/img/hardware/lshw0.jpg "Como Obter Informações de Hardware no Linux")

lshw  é a  utilitário de linha de comando   que fornece informações detalhadas de hardware, como versões de firmware,   Informações BIOS, placa-mãe, e configuração de memória, informações de CPU e assim por diante. O que é legal sobre lshw é que ele pode obtê-lo a  saída as informações de hardware para um arquivo HTML ou XML. 

## lshw-GTK 

lshw-gtk é uma interface gráfica de usuário para lshw.Ele pode exibir informações muito detalhadas sobre o hardware do seu computador dispositivos de processador, memória, placas de vídeo, ligados a: configuração Portas USB e assim por diante. lshw-gtk usa colunas Miller por   navegação através de vários componentes de hardware que é um pouco confuso de usar, mas, além disso, lshw-gtk é uma grande ferramenta e em comparação com o outras ferramentas GUI neste post, ele oferece o hardware mais detalhada informações.
  
## HardInfo

![Como Obter Informações de Hardware no Linux](/assets/img/hardware/hardinfo.jpg "Como Obter Informações de Hardware no Linux")
 
HardInfo pode exibir informações tanto sobre o hardware do seu sistema e do sistema operacional, algo que não está disponível em lshw.
As informações do sistema operacional   inclui: resolução do desktop e outras informações de exibição, Linux Versão do kernel, nome do computador e nome de utilizador, ambiente de trabalho, tempo de atividade,   média de carga, módulos do kernel, idiomas disponíveis, informações de sistema de arquivos, variáveis ​​de ambiente e muito mais.

  
## SysInfo

Sysinfo é um, alternativa minimalista leve para HardInfo e lshw-gtk e pode exibir as seguintes informações: System (versão da distribuição Linux, versões do GNOME, kernel, gcc e Xorg e hostname);  CPU (identificação do fornecedor, nome do modelo, a frequência, cache level2, bogomips, números de modelo e bandeiras);  Memória (RAM total do sistema, memória livre, troca de espaço total e livre, cache, memória ativa, inativa);  (interface IDE, todos os dispositivos IDE, dispositivos SCSI) de armazenamento;  Hardware (placa-mãe, placa de vídeo, placa de som, dispositivos de rede);  NVIDIA placa gráfica:. somente com NVIDIA driver de vídeo instalado. Sysinfo é uma ferramenta que é um pouco mais avançado do que o Monitor do sistema   (Monitor do sistema vem por padrão com o Ubuntu e outros Linux distribuições que usam o GNOME), então não espere para listar muitos detalhes sobre o hardware. Mas é muito útil se você quiser dar uma rápido olhar para o hardware do seu computador sem ter que passar por muitos de informações. 
