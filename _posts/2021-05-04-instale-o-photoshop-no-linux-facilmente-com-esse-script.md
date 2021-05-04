---
layout: post
title: "Instale o Photoshop no Linux facilmente com esse script"
date: 2021-05-04 08:51:46
image: '/assets/img/dicas/setup-photoshopcc.png'
description: 'Pode ser que ajude.'
icon: 'ion:terminal-sharp'
iconname: 'Dicas'
tags:
- dicas
- gimp
---

![Instale o Photoshop no Linux facilmente com esse script](/assets/img/dicas/setup-photoshopcc.png)

O [Photoshop CC v19 installer for Linux](https://github.com/Gictorbit/photoshopCClinux) é um script [Bash](https://terminalroot.com.br/bash) que ajuda você a instalar o Photoshop CC versão 19 em sua máquina Linux usando o [WINE](https://pt.wikipedia.org/wiki/Wine) nos bastidores e configura alguns componentes necessários para o melhor desempenho.

## Características
+ Baixa os componentes necessários e os instala (`vcrun`, `atmlib`, `msxml` ...)
+ Faz download instalador photoshop.exe
+ Cria o comando do Photoshop e um *atalho* na área de trabalho
+ Modo WINE dark
+ Suporta placas gráficas como (intel, Nvidia)
+ Salva os arquivos baixados em seu diretório de cache
+ É grátis e você não vai precisar de nenhuma chave de licença
+ Funciona em qualquer [distribuição](https://terminalroot.com.br/tags#distros) [Linux](https://terminalroot.com.br/tags#linux)

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

## Dependências
+ [git](https://terminalroot.com.br/git)
+ `wine`
+ `wine64`
+ `winetricks`
+ `md5sum`

Exemplo no [Arch Linux](https://terminalroot.com.br/tags#archlinux)

---

## Instalação
Basta clonar/baixar, dá permissão de execução e rodar o script:
```sh
git clone https://github.com/Gictorbit/photoshopCClinux.git
cd photoshopCClinux
chmod +x setup.sh
./setup.sh
```

Durante a instalação, preste atenção às mensagens do script

> Observação: Certifique-se de que a versão do sistema operacional no wine está no [Windows 7](https://terminalroot.com.br/tags#windows)

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


![Photoshop no Linux](/assets/img/dicas/photoshop-no-linux.jpg)

---

# Análise
Essas informações foram retiradas do repositório do script. Eu particularmente não testei e não pretendo, me sinto bem com o [GIMP](), mas como algumas me pedem essa dica, resolvi postar essa . Mas lembre-se de contribuir com o projeto relatando [issues](https://github.com/Gictorbit/photoshopCClinux/issues) ou até mesmo [melhorando o código](https://terminalroot.com.br/shell) .

Link do projeto: <https://github.com/Gictorbit/photoshopCClinux> .



