---
layout: post
title: "Gerencie suas contas financeiras pessoais com Terminal Finances"
date: 2021-02-08 12:46:37
image: '/assets/img/cpp/terminal-finances.jpg'
description: 'Indicado para quem deseja controlar as suas contas pessoais de uma forma fácil e simples. Disponível para Linux e Windows.'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- cpp
- qt
- terminalroot
---

![Gerencie suas contas financeiras pessoais com Terminal Finances](/assets/img/cpp/terminal-finances.jpg)

**Terminal Finances** é indicado para quem deseja controlar as suas [contas](https://terminalroot.com.br/2015/11/lista-com-30-softwares-de-contabilidade_8.html) pessoais de uma forma fácil e simples. Disponível para [Linux](https://terminalroot.com.br/linux/) e [Windows](https://terminalroot.com.br/tags#windows).

# Instalação
Se você deseja usar o Terminal Finances sem compilar, escolha uma das opções abaixo para fazer o download:

### No [Linux](https://terminalroot.com.br/tags#linux) para qualquer [distribuição](https://terminalroot.com.br/tags#distros) através de um [AppImage](https://appimage.org/)
Para isso basta fazer o download através [desse link](https://github.com/terroo/terminal-finances/releases/download/v1.0.0/Terminal_Finances-x86_64.AppImage) , dar permissão de execução e rodar, exemplo:
{% highlight bash %}
wget https://github.com/terroo/terminal-finances/releases/download/v1.0.0/Terminal_Finances-x86_64.AppImage
chmod +x Terminal_Finances-x86_64.AppImage
./Terminal_Finances-x86_64.AppImage
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Alternativamente ainda no [Linux](https://terminalroot.com.br/tags#linux) você pode usar o [app-get](https://terminalroot.com.br/2020/05/conheca-o-app-get-um-gerenciador-de-appimages-via-linha-de-comando.html), instale-o da seguinte maneira:
{% highlight bash %}
app-get terminal-finances
{% endhighlight %}

### No [Windows 10](https://terminalroot.com.br/tags#windows)
+ Basta fazer o download [nesse link](https://github.com/terroo/terminal-finances/releases/download/v1.0.0/TerminalFinances_installer_Win10_64.rar)
+ Descompacte o **.rar**
+ Dê um duplo clique no arquivo de instalação
+ Siga os passos da instalação
+ E após terminar, procure o **Terminal Finances** no Menu Iniciar do sistema.

### Compilando
Se você deseja construir esse software na sua máquina, primeiramente você precisará instalar as seguintes dependências:
- [git](https://terminalroot.com.br/git/)
- [qmake](https://en.wikipedia.org/wiki/Qmake)
- [g++](https://gcc.gnu.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- libQt5Widgets
- libQt5Gui
- libQt5Core
- libQt5Sql
- libQt5PrintSupport

Por exemplo, no [Ubuntu](https://terminalroot.com.br/tags#ubuntu), [Linux Mint](https://terminalroot.com.br/tags#mint), [Debian](https://terminalroot.com.br/tags#debian) e [derivados](https://terminalroot.com.br/2020/04/as-melhores-distros-gnu-linux-para-pcs-antigos.html), o [comando](https://terminalroot.com.br/tags/#comandos) seria:
{% highlight bash %}
sudo apt install qmake g++ make libqt5widgets5 libqt5gui5 libqt5core5a libqt5sql libqt5printsupport5
{% endhighlight %}
Depois basta clonar o repositório e compilar da seguinte maneira:
{% highlight bash %}
git clone https://github.com/terroo/terminal-finances
cd terminal-finances
qmake -qt=qt5 src/TerminalFinances.pro
make
sudo make install
{% endhighlight %}

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

# Utilização
O Terminal Finances é muito intuitivo, se resume em 4 telas básicas e algumas ferramentas adicionais de configuração e customização, são elas:

- Essa é a tela inciial do programa e dispõe de links e dicas de atalhos e informações sobre seu desenvolvimento:
**Terminal Finances**

![Terminal Finances](/assets/img/cpp/terminal-finances-01.jpg)

- Para inserir crédito ou débito, bem como editar ou excluir lançamentos, clique na aba:
**Inserir Crédito e/ou Débito, Editar e Excluir Lançamentos**

![Inserir Crédito e/ou Débito, Editar e Excluir Lançamentos - Terminal Finances](/assets/img/cpp/terminal-finances-02.jpg)

> Se quiser editar ou excluir um lançamento dê um duplo clique em cima do lançamento listado.
 
- Para gerar relatórios, enviar relatório por e-mail e imprimir ou salvar em `pdf`, use a aba:
**Relatórios de Lançamentos e Consultar Saldos**

![Relatórios de Lançamentos e Consultar Saldos - Terminal Finances](/assets/img/cpp/terminal-finances-03.jpg)

- Para pesquisar lançamentos específicos, utilize a aba:
**Pesquisa por Descrição, Valores e Contas**

![Pesquisa por Descrição, Valores e Contas - Terminal Finances](/assets/img/cpp/terminal-finances-04.jpg)

# Customização
O sistema identifica o idioma do seu sistema( somente no Linux ) e já abre com o mesmo, no entanto, se você desejar alterar, basta acessar a **Barra de Menu** em **Idiomas** e escolher o idioma que você deseja, estão disponíveis 3 idiomas: **Inglês**, **Espanhol** e **Português Brasileiro**:

![Idiomas - Terminal Finances](/assets/img/cpp/terminal-finances-05.jpg)

O sistemas também oferece 2 temas para sua escolha: **Dark** e **Light**, como já vimos o Dark nas imagens anteriores, a exibição do Light é assim:

![Light - Terminal Finances](/assets/img/cpp/terminal-finances-06.jpg)

> Esse é o tema padrão exibido assim que você executa o Terminal Finances, a menos que você altere as configurações ficam salvas mesmo que você feche o programa.

# Configurações
Se você desejar fazer o backup do banco de dados de seus lançamentos, clique nesse ícone localizado na barra lateral esquerda e escolha o local de exportação:

![Exportar Banco de Dados - Terminal Finances](/assets/img/cpp/terminal-finances-07.jpg)

> O sistema irá salvar o arquivo com o nome `terminalfinances` e mais a data da exportação(`terminalfinances-xx-xx-xxxx.db`), exemplo se fosse hoje: `terminalfinances-08-02-2021.db` .

Para importar o banco de dados, copie o arquivo que você deseja importar e salve no diretório: `~/.config/terminalfinances/terminalfinances.db`, no Windows ficará no local que você escolheu de instalação, se usar a pasta padrão oferecida pelo instalador, seria: `C:\Users\[SEU_USUARIO]\TerminalFinances\terminalfinances.db` .
> Remova o banco de dados que houver e copie seu backup para dentro desse diretório e renomei para somente: `terminalfinances.db`

No Linux basta você usar o comando:

{% highlight bash %}
cp terminalfinances-xx-xx-xxxx.db ~/.config/terminalfinances/terminalfinances.db
{% endhighlight %}
> Essa rotina é diferente para que o usuário decida sobreescrever o arquivo de forma explícita e com seu consentimento.

Por padrão o software exibirá o símbolo da moeda em [Real Brasileiro], mas você pode alterar também no arquivo de configuração, `currency` atribua o valor do símbolo da moeda do seu país, exemplo para [Euro](https://en.wikipedia.org/wiki/Euro):
{% highlight bash %}
currency = EUR
{% endhighlight %}

Caso deseje assistir à um vídeo apresentando todos os recursos informados nesse artigo, assista o [vídeo](https://www.youtube.com/watch?v=BF809OoXfjM) abaixo:

<iframe width="910" height="390" src="https://www.youtube.com/embed/BF809OoXfjM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- RETANGULO LARGO -->
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

# Licença
O Terminal Finances é lincenciado sob a [GNU GPL versão 3](https://github.com/terroo/terminal-finances/blob/main/LICENSE)

Se quiser relatar problemas ou sugerir novos recursos, utilize o [issues](https://github.com/terroo/terminal-finances/issues) do [GitHub](https://github.com/terroo/terminal-finances/)

A página oficial do [Terminal Finances](https://github.com/terroo/terminal-finances/) é: <https://github.com/terroo/terminal-finances>

Caso deseje desinstalar
- Versão compilada
{% highlight bash %}
git clone https://github.com/terroo/terminal-finances
cd terminal-finances
sudo make uninstall
{% endhighlight %}

- No Windows acesse o Painel de Controle e vá em Adicionar/Remover Programação, clique com o botão direito do mouse sobre o Terminal Finances e escolha: Desinstalar.
- Se você usou o [app-get](https://github.com/terroo/app-get) no Linux, basta rodar o comando:
{% highlight bash %}
app-get --remove terminal-finances
{% endhighlight %}

Abraços!
