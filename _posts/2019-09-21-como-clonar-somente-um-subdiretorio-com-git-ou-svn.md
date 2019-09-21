---
layout: post
title: "Como Clonar Somente um Subdiretório com Git ou SVN"
date: 2019-09-21 13:33:54
image: '/assets/img/git/git-clone-min.jpg'
description: 'No Git já é possível, mas no SVN é bem mais simples.'
main-class: 'git'
tags:
- git
- svn
- github
---

![Como Clonar Somente um Subdiretório com Git ou SVN](/assets/img/git/git-clone-min.jpg)

Nessa dica vou mostar algo que parece simples (no Git), mas é bem complicadinho! =) Pois, na verdade, eu criei um script [Shell Script](https://terminalroot.com.br/shell) que você pode rodar como comando na sua `$PATH` .

Também vou disponibilizar uma solução a mais , mas não do [Git](https://terminalroot.com.br/git) e sim do [SVN](https://subversion.apache.org/) , que pra ser sincero, nem precisaria de uma função Shell, mas pra ficar ainda mais fácil também vou mostrar.

Pra você entender esse artigo você deve possuir conhecimentos básicos de [Git](https://git-scm.com/) e [GitHub](https://github.com/) ou qualquer outro repositório Git.

Para isso recomendo você conhecer nossa paǵina específica para iniciantes em Git e GitHub: <https://terminalroot.com.br/git> . Lá você vai encontrar dicas em textos e vídeos, inclusive um mini-curso de [Git e GitHub para Iniciantes](https://www.youtube.com/watch?v=CsyumQN6ZdA&list=PLUJBQEDDLNclXAjLaiPWakoO9VosPDzC1) .

## Introdução

Em resumo, clonar um *repositório* significa: copiar todos os arquivos dele para seu computador.

[git clone](https://git-scm.com/docs/git-clone) é um utilitário de linha de comando Git que é usado para direcionar um repositório existente e criar um clone ou cópia do repositório de destino. É muito simples para clonar repositórios Git: [GitHub](https://github.com/terroo/) , [GitLab](https://gitlab.com/terminalroot/) , [BitBucket](https://bitbucket.org/terminalroot/) e entre outros.

O comando resume em:

{% highlight bash %}
git clone [repositório]
{% endhighlight %}

Por exemplo, eu tenho um repositório que é <https://github.com/terroo/fonts> , supondo que você deseja clonar esse repositório,  o comando seria:

{% highlight bash %}
git clone https://github.com/terroo/fonts
{% endhighlight %}

Você ainda pode clonar já renomeando e/ou com o mesmo nome em um novo caminho do seu computador, exemplo:

1. Clona com um novo nome: **novas-fonts**:

{% highlight bash %}
git clone https://github.com/terroo/fonts novas-fonts
{% endhighlight %}

2. Clona com um novo nome dentro do Diretório *Downloads*:

{% highlight bash %}
git clone https://github.com/terroo/fonts Downloas/novas-fontes
{% endhighlight %}

Ou até mesmo clonar com o mesmo nome em outro caminho:

{% highlight bash %}
git clone https://github.com/terroo/fonts Downloads/fonts
{% endhighlight %}

> *Observação*: Se você informar um novo caminho, obrigatóriamente você precisa informar um *nome* , seja ele o mesmo nome ou um novo. Se você fizer assim, sem informar um nome, ele informará um erro: `fatal: destination path 'Downloads' already exists and is not an empty directory.` .

Além disso existem diversos parâmetros que você pode usar, aqui veremos alguns, mas você pode obter a documentação completa no site oficial do [Git](https:/) mais especificamente na URL: <https://git-scm.com/docs/git-clone> .

## Clonando um Sub-diretório

Esse repositório que eu usei como exemplo foi totalmente mal projetado, lá você não vai encontrar somente *fonts* , mas também: Wallpapers, arquivos de configuração para WM e entre outras coisas . E por conta disso, às vezes eu quero copiar somente um *sub-diretório* denrto dele .

Por exemplo, nesse [repositório](https://github.com/terroo/fonts) existe uma pasta/diretório de nome *files* e vamos supôr que eu queira copiar/clonar somente esse diretório/sub-diretório , se eu fizer isso: ~~`git clone https://github.com/terroo/fonts/files`~~ não dará certo, o Git não permite isso, haverá falha no comando clone:

{% highlight bash %}
marcos@gentoo ~ $ git clone https://github.com/terroo/fonts/files
Cloning into 'files'...
remote: Not Found
fatal: repository 'https://github.com/terroo/fonts/files/' not found
marcos@gentoo ~ $ 
{% endhighlight %}

E é bem inconveniente você clonar todo o repositório (que por sinal é bem grande) que vai demorar bastante, somente para usar os arquivos de um diretório específico do repositório.

Até a versão **2.18** do Git isso não era possível, mas a partir da versão **2.19** já é possível, logo verifique a versão do seu Git antes de prosseguir, use o comando `git --version` para saber a versão. Se for igual ou maior de **2.19** é possível clonar somente um diretório específico.

Para clonar esse diretório (*files*, dentro do repositório) vamos usar os seguintes comandos, explicação nos comentários (**#**):

{% highlight bash %}
# Criar um diretório, para o Git não ficar bagunçado, e entrar no mesmo 
mkdir meu-dir && cd meu-dir

# Iniciar um repositório Git
git init

# Rastrear o repositório, não informe o subdiretório
git remote add -f origin https://github.com/terroo/fonts/

# Ativar o recurso de verificação em árvore
git config core.sparseCheckout true

# Criar um arquivo no caminho: .git/info/sparse-checkout
# Que esttá dentro do diretório oculto .git que foi criado
# ao rodar o comando: git init
# E dentro dele inserir o nome do sub-diretório que você deseja somente clonar
echo 'files' >> .git/info/sparse-checkout

## Fazer o download com o pull e não com o clone
git pull origin master
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

Para cada comando , se você não entendeu bem, recomendo você dar uma olhada por cima no manual, por exemplo: `man git remote` .

Se você acha muito processo rodar todos esse comandos, você pode usar um script em Shell, como eu havia dito para ficar automático e rodar somente um comando, veja o script clicando no link abaixo:

### [📁 git.dir.sh](https://gist.github.com/TerminalRootTV/9e6edc6cae411e57eceb1a83831b558b)

Se quiser que vire um comando para usar em qualquer diretório que você estiver, `:floppy_disk:` salve com o nome: `git-dir` (ou o nome que você deseja) e mova pra onde desejar, exemplo:

{% highlight bash %}
sudo mv git-dir /usr/local/bin/git-dir
# Ou se você for um fanchato do UNIX: 
# sudo install -D -v git-dir -t /usr/local/bin/git-dir
{% endhighlight %}

E pra usar basta rodar `git-dir` em qualquer lugar que você estiver que o mesmo já mostrará o *help* exibindo as opções.

## Alternativa - Usando o SVN

Pode-se notar que quando usamos o Git pra isso, esse *clone* , apesar de ser de um subdiretório , ainda assim vai ser muito lento. Para isso existe uma solução *bem mais rápida* que é o usando o [SVN]() que é uma alternativa ao Git da [Apache Software Foundation](https://pt.wikipedia.org/wiki/Apache_Software_Foundation) .

A diferença do SVN para o Git, na minha opinião, se resume nessas duas imagens abaixo, ou seja, não existe melhor e nem pior, existe aquele que atende suas necessidades específicas para cada caso.

![Git](/assets/img/git/01-git.svg)
![SVN](/assets/img/git/02-svn.svg)


O Apache Subversion (também conhecido por SVN) é um sistema de controle de versão desenhado especificamente para ser um substituto moderno do CVS, que se considera ter algumas limitações. O Subversion utiliza banco de dados Berkeley BD. 

Antes de tudo , você precisa possuir ele instalado no seu sistema. Para isso use o gerenciador de pacotes da sua distro:

{% highlight bash %}
sudo emerge subversion # Gentoo, Funtoo e Portage baseds
sudo apt-get install subversion # Debian, Ubuntu, Linux Mint APT baseds
sudo pacman -S subversion # Arch Linux, Manjaro e PacMan baseds
sudo yum install subversion # Red Hat, CentOS e YUM baseds
sudo dnf install subversion # Fedora
{% endhighlight %}

E pra clonar basta usar o parâmetro `export` com o *fake-dir* : `trunk` entre o repositório e o subdiretório, exemplo:

{% highlight bash %}
svn export [repository]/trunk/[subdirectory]
{% endhighlight %}

Exemplo para o nosso caso:

{% highlight bash %}
svn export https://github.com/terroo/fonts/trunk/files
{% endhighlight %}

Se quiser que seja seu comando, basta criar um comando ou adicionar essa função ao seu `~/.bashrc`:

{% highlight bash %}

git-svn(){
  if [[ ! -z "$1" && ! -z "$2" ]]; then
          echo "Iniciando o clone/cópia ..."
          repo=$(echo $1 | sed 's/\/$\|.git$//')
          svn export "$repo/trunk/$2"
  else
          echo "Use: git-svn <repository> <subdirectory>"
  fi  
}

{% endhighlight %}

> Nesse caso tratei o final do nome do repositório, caso o usuário copie com *.git* ou com */* no final do nome da URL.

E para usar, basta rodar: `git-svn [repository] [subdirectory]`

Bem mais simples, né ?

Fica à sua escolha qual modo utilizar. Deixe suas dicas/dúvida nos comentários pra gente interagir na solução ou discussão sobre assuntos relacionados!

Abraços!

## Links úteis:

+ <https://git-scm.com/docs/git-clone>
+ <https://subversion.apache.org/>
+ <https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/52269934>
+ <https://www.youtube.com/watch?v=CsyumQN6ZdA&list=PLUJBQEDDLNclXAjLaiPWakoO9VosPDzC1>
+ <https://terminalroot.com.br/git>
+ <https://terminalroot.com.br/shell>
+ <https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-clone>
    
