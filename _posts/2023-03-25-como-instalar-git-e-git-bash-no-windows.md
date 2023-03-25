---
layout: post
title: "Como Instalar Git e Git Bash no Windows"
date: 2023-03-25 07:52:13
image: '/assets/img/git/git-windows.jpg'
description: 'Procedimento válido tanto para Windows 10 quanto o 11.'
icon: 'ion:terminal-sharp'
iconname: 'Windows'
tags:
- windows
- git
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

[Git](https://terminalroot.com.br/tags#git) é uma das ferramentas mais usadas atualmente por desenvolvedores, logo é indispensável você possuí-lo instalado no seu sistema mesmo sabendo que há alternativa de fazer download de pacotes [zip]() dos repositórios.

Vai muito além disso, importante para controlar seus projetos de forma organizada e colaborativa com outros desenvolvedores.

---

No [Windows](https://terminalroot.com.br/tags#windows) há duas formas:
+ Baixar um arquivos executável;
+ Ou via linha de comando no [PowerShell](https://terminalroot.com.br/tags#powershell) ou pelo `CMD`.

Caso queira a primeira opção, graficamente(através do executável), você pode baixar o arquivo clicando no botão abaixo.
> Lembrando que essa é a versão `2.40.0` mais recente de acordo com a data de publicação desse artigo.

<a href="https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe" class="btn btn-danger btn-lg">Download Git 2.40.0 64-bit</a>

Após efetuado o download, basta dar um duplo clique no arquivo e seguir o setup.
> Talvez seja também necessário configurar a variável de ambiente `PATH` do sistema para conseguir usá-lo via linha de comando.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

A forma mais rápida e simples(e a que eu recomendo), onde a variável de ambiente `PATH` do sistema já estará configurada, é abrir o [PowerShell](https://terminalroot.com.br/tags#powershell) e rodar o comando abaixo:

{% highlight bash %}
winget install --id Git.Git -e --source winget
{% endhighlight %}
> Copie esse coamndo e cole com `Ctrl + V` dentro do PowerShell e em seguida pressione ENTER. 

Durante a instalação ele pedirá que você clique em *permitir instalação* , aquela clássica janela de autotização de administrador.

Ele carregarará também uma janela de instalação similar à abaixo:

![Instalação Git no Windows](/assets/img/git/git-windows-01.jpg) 

Após finalizado, feche o PowerShell e abra novamente para testar se o Git foi instalado corretamente rode o comando:
{% highlight bash %}
git --version
{% endhighlight %}

A saída será similar à imagem abaixo:

![Git version Windows](/assets/img/git/git-windows-02.jpg) 

Após isso o **Git Bash**, que é um terminal com comandos básicos do [GNU](https://terminalroot.com.br/tags#gnu), mas tem até um [Vim](https://terminalroot.com.br/tags#vim) também disponível e que ao invés do PowerShell o interpretador é o [Bash](https://terminalroot.com.br/tags#bash).
> Veja o Git Bash abaixo após rodar os comandos `sed --version` e `vim --version`:

![Git Bash Windows](/assets/img/git/git-windows-04.jpg) 

Você pode abrí-lo dentro de uma pasta clicando com o botão direito do mouse e escolhendo: **Git Bash Here**.

![Git Bash Windows](/assets/img/git/git-windows-03.jpg) 

---

Há também outras opções como: Portable, 32-bit, outras versões [aqui nesse link](https://git-scm.com/download/win).

Para conhecer os comandos básicos e mais informações sobre Git veja nossa página exclusiva sobre isso:
### <https://terminalroot.com.br/git>

---

