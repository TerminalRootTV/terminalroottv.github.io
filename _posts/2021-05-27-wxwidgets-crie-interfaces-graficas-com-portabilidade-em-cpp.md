---
layout: post
title: "wxWidgets - Crie Interfaces Gráficas com Portabilidade em C++"
date: 2021-05-27 12:01:20
image: '/assets/img/gui/wxwidgets.jpg'
description: 'Escreva uma vez e utilize no Linux, Windows e macOS.'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- gui
---

![wxWidgets - Crie Interfaces Gráficas com Portabilidade em C++](/assets/img/gui/wxwidgets.jpg)

Criar interface gráfica é uma tarefa indispensável para muitos casos. Nós possuímos um [Curso específico de criação de interface gráfica com Qt](https://terminalroot.com.br/cpp) para [Linux](https://terminalroot.com.br/tags#linux) e [Windows](https://terminalroot.com.br/tags#windows), além também de uma série com criação de interface gráfica com [Gtkmm](https://www.youtube.com/watch?v=83vtYDbvB1Q&list=PLUJBQEDDLNclqDgPBN9Y2iHPqUBiDEcZc) .

Mas nesse [cpp::daily](https://terminalroot.com.br/tags#cppdaily) de hoje vamos conhecer uma que também não fica para atrás e seu diferencial é a PORTABILIADADE.

# Introdução
[wxWidgets](https://www.wxwidgets.org/) é uma biblioteca [C++](https://terminalroot.com.br/cpp) que permite aos desenvolvedores criar aplicativos para [Windows](https://terminalroot.com.br/tags#windows), [macOS](https://terminalroot.com.br/tags#macos), [Linux](https://terminalroot.com.br/linux) e outras plataformas com uma única base de código.

É possível também utilizá-la em linguagem populares como: [Python](https://terminalroot.com.br/tags#python), [Perl](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html#10-perl), [Ruby](https://terminalroot.com.br/tags/#ruby) e muitas [outras linguagens](https://terminalroot.com.br/2021/03/testei-o-desempenho-de-10-linguagens-de-programacao-com-ranking.html) . 

Ao contrário de outros kits de ferramentas de plataforma cruzada, wxWidgets dá aos aplicativos uma aparência verdadeiramente nativa porque usa a API nativa da plataforma em vez de emular a GUI. Também é extenso, gratuito, de código aberto e maduro.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


# Instalação
No site do wxWidgets há o procedimento para instalar para todas as plataformas, veja [esse link](https://www.wxwidgets.org/downloads/). Mas como exemplo, vamos mostrar o procedimento no Linux, mais precisamente em [distros](https://terminalroot.com.br/tags#distros) que usam o **APT**, o comando é:
{% highlight bash %}
sudo apt-add-repository 'deb https://repos.codelite.org/wx3.1.5/ubuntu/ groovy universe'
sudo apt update
sudo  apt install libwxbase3.1-0-unofficial \
                 libwxbase3.1unofficial-dev \
                 libwxgtk3.1-0-unofficial \
                 libwxgtk3.1unofficial-dev \
                 wx3.1-headers \
                 wx-common \
                 libwxgtk-media3.1-0-unofficial \
                 libwxgtk-media3.1unofficial-dev \
                 libwxgtk-webview3.1-0-unofficial \ 
                 libwxgtk-webview3.1unofficial-dev \ 
                 libwxgtk-webview3.1-0-unofficial-dbg \ 
                 libwxbase3.1-0-unofficial-dbg \
                 libwxgtk3.1-0-unofficial-dbg \
                 libwxgtk-media3.1-0-unofficial-dbg \
                 wx3.1-i18n \
                 wx3.1-examples
{% endhighlight %}

Existem outras formas e como havia dito, também há para outras distros.

# Utilização
A documentação do [wxWidgets](https://www.wxwidgets.org/docs/) é invejável, mas vamos criar um exemplo básico aqui, mais ou menos um **Hello, World!** só que com alguns recursos a mais pra não ficar tão básico.

O código tem o header e o source incluso e sem main: `vim wx.cpp`.

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

E insira esse código:
{% highlight cpp %}
// wxWidgets "Hello World" Program
// For compilers that support precompilation, includes "wx/wx.h".
#include <wx/wxprec.h>
#ifndef WX_PRECOMP
    #include <wx/wx.h>
#endif

class MyApp : public wxApp{
public:
    virtual bool OnInit();
};

class MyFrame : public wxFrame{
public:
    MyFrame();
private:
    void OnHello(wxCommandEvent& event);
    void OnExit(wxCommandEvent& event);
    void OnAbout(wxCommandEvent& event);
};

enum{
    ID_Hello = 1
};

wxIMPLEMENT_APP(MyApp);

bool MyApp::OnInit(){
    MyFrame *frame = new MyFrame();
    frame->Show(true);
    return true;
}

MyFrame::MyFrame() : wxFrame(NULL, wxID_ANY, "Hello World"){
    wxMenu *menuFile = new wxMenu;
    menuFile->Append(ID_Hello, "&Hello...\tCtrl-H",
                     "Help string shown in status bar for this menu item");
    menuFile->AppendSeparator();
    menuFile->Append(wxID_EXIT);
    wxMenu *menuHelp = new wxMenu;
    menuHelp->Append(wxID_ABOUT);
    wxMenuBar *menuBar = new wxMenuBar;
    menuBar->Append(menuFile, "&File");
    menuBar->Append(menuHelp, "&Help");
    SetMenuBar( menuBar );
    CreateStatusBar();
    SetStatusText("Bem-vindo ao Terminal Root!");
    Bind(wxEVT_MENU, &MyFrame::OnHello, this, ID_Hello);
    Bind(wxEVT_MENU, &MyFrame::OnAbout, this, wxID_ABOUT);
    Bind(wxEVT_MENU, &MyFrame::OnExit, this, wxID_EXIT);
}

void MyFrame::OnExit(wxCommandEvent& event){
    Close(true);
}

void MyFrame::OnAbout(wxCommandEvent& event){
    wxMessageBox("Isso é um exmeplo, mas já funciona certinho!",
                 "Sobre Terminal Root", wxOK | wxICON_INFORMATION);
}

void MyFrame::OnHello(wxCommandEvent& event){
    wxLogMessage("Terminal Root - Linux e Desenvolvimento");
}
{% endhighlight %}

Pra compilar, rode o comando:
{% highlight bash %}
g++ wx.cpp $(wx-config --cxxflags --libs)
{% endhighlight %}

E aparecerá:
> Nesse exemplo, cliquei em **File** > **Hello** e apareceu o *messageBox*

![wxWidgets Running](/assets/img/gui/wxwidgets-example.jpg)

Simples, né?! Para mais informações consulte o site: <https://www.wxwidgets.org/>

---

Por hoje é só, são pequenas doses diárias que farão sempre nos manter antenado com o [C++](https://terminalroot.com.br/cpp/) !

## Acompanhe o [cpp::daily](https://terminalroot.com.br/tags#cppdaily)

# Deseja aprender [C++](https://terminalroot.com.br/cpp/) e criar seus programas Gráficos e para Terminal com portabilidade para Linux e Windows?
Então se inscreva nos nossos [Cursos de C++ Moderno](https://terminalroot.com.br/cpp/) . Você aprender criar:
- [Games](https://terminalroot.com.br/tags#games)
- [Ncurses](https://terminalroot.com.br/2021/02/crie-programas-graficos-no-terminal-com-cpp-e-ncurses.html)
- Interface Gráfica: [GTK+](https://terminalroot.com.br/2020/08/anjuta-o-melhor-ide-para-c-com-gtkmm.html) e [Qt](https://terminalroot.com.br/2021/02/gerencie-suas-contas-financeiras-pessoais-com-terminal-finances.html)
- Acesso à Banco de Dados([MySQL](https://terminalroot.com.br/mysql/) e SQLite) via [C++](https://terminalroot.com.br/cpp/)
- Padronização
- E muito mais!

Acesse o endereço:
# <https://terminalroot.com.br/cpp/> e saiba mais!

