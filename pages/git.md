---
layout: page
title: "Tutorial de Git e GitHub para Iniciantes"
permalink: "/git/"
description: 'Principais Comandos do Git'
color: '#2f3d4a'
---
![Tutorial de Git e GitHub para Iniciantes](/assets/img/cursos/git.jpg "Tutorial de Git e GitHub para Iniciantes")

Principais Comandos do Git
--------------------------

- `git config -–list` » Lista as configurações do Git, se estiver dentro do repositório, lista mais itens
- `git config -–global user.name "Meu Nome"` » Define o nome de usuário para o Git
- `git config -–global user.email "email@dominio.com"` » Define o e-mail de usuário para o Git (tem de ser o cadastrado no GitHub)
- `git config -–global core.editor vim` » Define o editor de texto padrão para abrir automaticamente arquivos informados pelo Git
- `git init` » Inicializa um repositório Git
- `git status` » Vê o estado atual do projeto
- `git add arquivo.txt` » Adiciona o arquivo arquivo.txt ao projeto

> Opções do parâmetro **add**

{% highlight bash %}
git-add # mesmo comando que 'git add' 
# O comando git-add não irá adicionar arquivos ignorados por padrão a menos que seja utilizado o parâmetro '-f' 
git add -A # Adiciona todos arquivos que foram modificados, mesmo que: --all, --no-ignore-removal 
git add *.txt # Adiciona todos os arquivos '.txt' que foram modificados
man git-add # manual completo sobre git-add 
{% endhighlight %}

- `git commit -m "Minhas mudanças efetuadas"` » Armazena as mudanças efetuadas e descreve o que foi alterado
- `git log` » Mostra todas as mudanças que já foram efetuadas: commit, autor e data
- `git push -u origin master` » Envia todos os arquivos modificados e "commitados" para o repositório no github
  - `-u` - faz com que o Git armazene esse comando e da próxima vez basta utilizarmos `git push`
  - `origin`- diz que o repositório no github possui o mesmo nome do projeto/diretório que você está enviando
  - `master` - é o nome da *branch* (**indicador**) [Clique aqui para saber mais sobre branches](https://goo.gl/2ZT5Cd)
- `git pull origin master` » Verifica as mudanças efetuadas por outros colaboradores do projeto
- `git diff HEAD` » Verifica as partes dos arquivos alterados no último commit, **veja mais opções em** `man git-diff`
- `git reset arquivo.txt` » Remove um arquivo do projeto
- `git checkout – arquivo.txt` » Desfaz a última alteração feita num arquivo
- `git rm "*.txt"` » Remove 1 ou mais arquivos utilizando "curinga"
- `git clone https://github.com/user/project.git` » Copia um projeto pro seu PC
- `info git` » Obtém a Documentação do git
- `man git` » Obtém o Manual do git

<div class="text-center">
     <a href="https://pag.ae/bhgSpYQ"><button type="button" class="btn btn-success">
       Me pague um café <i class="fa fa-coffee"></i> com 
       <strong>PagSeguro</strong>
      </button>
    </a> 

     <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MDBKEUL69LKSY">
      <button type="button" class="btn btn-info">
       &nbsp;&nbsp;&nbsp;&nbsp;Me pague um café <i class="fa fa-coffee"></i> com 
       <strong>PayPal</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </button>
    </a> 
</div>

Assista os Vídeos {#assista-os-vdeos}
=================

+ [▶️ 01 - Introdução](https://www.youtube.com/watch?v=CsyumQN6ZdA "Curso de Git e GitHub Para Iniciantes")
+ [▶️ 02 - Como Instalar e Configurar o Git](https://www.youtube.com/watch?v=ty-8-d7Y8JA "Curso de Git e GitHub Para Iniciantes")
+ [▶️ 03 - Como Criar uma Conta e um Repositório no GitHub](https://www.youtube.com/watch?v=T1HuwSPd3eg "Curso de Git e GitHub Para Iniciantes")
+ [▶️ 04 - Aprenda os Principais Comandos doGit](https://www.youtube.com/watch?v=5WFm5pvcWwM "Curso de Git e GitHub Para Iniciantes")
+ [▶️ 05 - Criando um projeto no Git e Enviando pro GitHub pelo Terminal](https://www.youtube.com/watch?v=C30fCXy3ZcY "Curso de Git e GitHub Para Iniciantes")
+ [▶️ 06 - Branches e Agradecimentos.](https://www.youtube.com/watch?v=SgOdsVVeXsE "Curso de Git e GitHub Para Iniciantes")

Vídeos Adicionais {#vdeos-adicionais}
=================

- [▶️ Como Criar um Blog no GitHub](https://www.youtube.com/watch?v=MBiw57swnsI "Terminal Root")
- [▶️ Como Importar seu blog do Blogger para o GitHub](https://www.youtube.com/watch?v=wpHWQqnlpG0 "Terminal Root")
- [▶️ Dicas Importantes para seu Blog no GitHub](https://www.youtube.com/watch?v=sOSWfN6iGno "Terminal Root")
- [▶️ Como Criar um Pull Request](https://www.youtube.com/TerminalRootTV "Terminal Root")

