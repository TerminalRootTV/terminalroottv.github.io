---
layout: post
title: "Como Conectar ao MySQL com C/C++ no Windows"
date: 2023-09-27 14:44:41
image: '/assets/img/cpp/prints-mysql-win-c-cpp/win-mysql-c-cpp-slide.jpg'
description: 'Tanto utilizando o Visual Studio como com GCC/g++ com MinGW via linha de comando.'
icon: 'ion:terminal-sharp'
iconname: 'MySQL/C/C++'
tags:
- windows
- mysql
- sql
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

Esse vídeo/conteúdo faz parte do [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp) e nele veremos como conectar ao [MySQL](https://terminalroot.com.br/tags#mysql) com [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) no [Windows](https://terminalroot.com.br/tags#windows) tanto com o [Visual Studio](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html#23-visual-studio) como com [GCC/g++ MinGW](https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html).

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/j3RdlTDbo-I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Conteúdo escrito

---

## Instalação
Antes de mais nada você precisa ter o [MySQL](https://terminalroot.com.br/tags#mariadb) instalado no seu sistema, isso nós mostramos da maneira correta no artigo:
### [Como Instalar o MySQL no Windows](https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#mysql)
> Detalhe não precisa instalar o PHP como tem no artigo, basta o **MySQL**, e o Apache é opcional!

Após tudo funcionando normalmente, você coseguindo logar no MySQL com o comando `mysql -u root -p`, agora precisamos saber que existem duas formas de conexão: pra **C** e pra **C++**:
+ [MySQL Connector C](https://dev.mysql.com/doc/c-api/8.0/en/) -  Para Linguagem C;
+ [MySQL Connector C++](https://dev.mysql.com/doc/connector-cpp/1.1/en/) - Para o C++.

Nesse tutorial eu irei usar, e recomendo, o **MySQL Connector C**, pois funciona tanto no C quanto no C++.

## MySQL Connector C `Visual Studio`
Após devidamente instalado e logando normalmente no MySQL pela linha de comando ou com um [cliente MySQL](https://terminalroot.com.br/2022/08/instale-esse-cliente-sql-que-tem-uma-interface-moderna.html)

Vamos seguir os passos com as imagens:

---

#### 01-criar-projeto-vs
![01-criar-projeto-vs](/assets/img/cpp/prints-mysql-win-c-cpp/01-criar-projeto-vs.jpg)

---

#### 02-cpp-projeto-vazio-proximo
![02-cpp-projeto-vazio-proximo](/assets/img/cpp/prints-mysql-win-c-cpp/02-cpp-projeto-vazio-proximo.jpg)

---

#### 03-nome-do-projeto
![03-nome-do-projeto](/assets/img/cpp/prints-mysql-win-c-cpp/03-nome-do-projeto.jpg)

---

#### 04-release-x64
![04-release-x64](/assets/img/cpp/prints-mysql-win-c-cpp/04-release-x64.jpg)

---

#### 05-adicionar-novo-item
![05-adicionar-novo-item](/assets/img/cpp/prints-mysql-win-c-cpp/05-adicionar-novo-item.jpg)

---

#### 06-main-cpp-ou-Origem-cpp
![06-main-cpp-ou-Origem-cpp](/assets/img/cpp/prints-mysql-win-c-cpp/06-main-cpp-ou-Origem-cpp.jpg)

---

#### 07-codigo-cpp
![07-codigo-cpp](/assets/img/cpp/prints-mysql-win-c-cpp/07-codigo-cpp.jpg)

---

#### 08-projeto-propriedades
![08-projeto-propriedades](/assets/img/cpp/prints-mysql-win-c-cpp/08-projeto-propriedades.jpg)

---

#### 09-todas-config-x64
![09-todas-config-x64](/assets/img/cpp/prints-mysql-win-c-cpp/09-todas-config-x64.jpg)

---

#### 10-c-cpp-geral
![10-c-cpp-geral](/assets/img/cpp/prints-mysql-win-c-cpp/10-c-cpp-geral.jpg)

---

#### 11-diretorio-de-inc-add-editar
![11-diretorio-de-inc-add-editar](/assets/img/cpp/prints-mysql-win-c-cpp/11-diretorio-de-inc-add-editar.jpg)

---

#### 12-nova-linha
![12-nova-linha](/assets/img/cpp/prints-mysql-win-c-cpp/12-nova-linha.jpg)

---

#### 13-caminho-para-include-1
![13-caminho-para-include-1](/assets/img/cpp/prints-mysql-win-c-cpp/13-caminho-para-include-1.jpg)

---

#### 14-caminho-para-include-2
![14-caminho-para-include-2](/assets/img/cpp/prints-mysql-win-c-cpp/14-caminho-para-include-2.jpg)

---

#### 15-clica-linha-azul-cola-ok
![15-clica-linha-azul-cola-ok](/assets/img/cpp/prints-mysql-win-c-cpp/15-clica-linha-azul-cola-ok.jpg)

---

#### 16-vinculador-geral
![16-vinculador-geral](/assets/img/cpp/prints-mysql-win-c-cpp/16-vinculador-geral.jpg)

---

#### 17-dir-bibli-adic-seta-editar
![17-dir-bibli-adic-seta-editar](/assets/img/cpp/prints-mysql-win-c-cpp/17-dir-bibli-adic-seta-editar.jpg)

---

#### 18-caminho-para-lib-1
![18-caminho-para-lib-1](/assets/img/cpp/prints-mysql-win-c-cpp/18-caminho-para-lib-1.jpg)

---

#### 19-caminho-para-lib-2
![19-caminho-para-lib-2](/assets/img/cpp/prints-mysql-win-c-cpp/19-caminho-para-lib-2.jpg)

---

#### 20-nova-linha-cola-ok
![20-nova-linha-cola-ok](/assets/img/cpp/prints-mysql-win-c-cpp/20-nova-linha-cola-ok.jpg)

---

#### 21-c-cpp-vinculador-entrada-seta-editar
![21-c-cpp-vinculador-entrada-seta-editar](/assets/img/cpp/prints-mysql-win-c-cpp/21-c-cpp-vinculador-entrada-seta-editar.jpg)

---

#### 22-copia-so-nome-libmysql-lib
![22-copia-so-nome-libmysql-lib](/assets/img/cpp/prints-mysql-win-c-cpp/22-copia-so-nome-libmysql-lib.jpg)

---

#### 23-cola-o-nome-ok
![23-cola-o-nome-ok](/assets/img/cpp/prints-mysql-win-c-cpp/23-cola-o-nome-ok.jpg)

---

#### 24-ok-preferencias
![24-ok-preferencias](/assets/img/cpp/prints-mysql-win-c-cpp/24-ok-preferencias.jpg)

---

#### 25-cin-get
![25-cin-get](/assets/img/cpp/prints-mysql-win-c-cpp/25-cin-get.jpg)
{% highlight cpp %}
#include <iostream>
#include <mysql.h>

int main(){
  MYSQL *connect = mysql_init(NULL);
  !connect ? std::cerr << "MySQL NÃO foi iniciado.\n"
           : std::cout << "MySQL Conectado com sucesso!\n";
  mysql_close(connect);
  std::cin.get();
}
{% endhighlight %}

---

#### 26-copia-a-libmysql
![26-copia-a-libmysql](/assets/img/cpp/prints-mysql-win-c-cpp/26-copia-a-libmysql.jpg)

---

#### 27-cola-dentro-do-seu-projeto-onde-esta-a-main-cpp
![27-cola-dentro-do-seu-projeto-onde-esta-a-main-cpp](/assets/img/cpp/prints-mysql-win-c-cpp/27-cola-dentro-do-seu-projeto-onde-esta-a-main-cpp.jpg)

---

#### 28-depurador-local-do-windows
![28-depurador-local-do-windows](/assets/img/cpp/prints-mysql-win-c-cpp/28-depurador-local-do-windows.jpg)

---

#### 29-mysql-conectado-com-sucesso
![29-mysql-conectado-com-sucesso.jpg](/assets/img/cpp/prints-mysql-win-c-cpp/29-mysql-conectado-com-sucesso.jpg)

---

## MySQL Connector C `GCC/g++ MinGW`
Nesse procedimento você pode usar qualquer [Editor de Códigos/IDE](https://terminalroot.com.br/2021/12/os-32-melhores-ides-editores-de-texto-para-cpp.html), geralmente eu uso o [VSCode](https://terminalroot.com.br/tags#vscode) ou [Vim](https://terminalroot.com.br/vim)/[Neovim](https://terminalroot.com.br/tags#neovim)

Ou seja, crie um código similar ao que vimos, mas não precisa do `std::cin.get();`:
> Se quiser antes crie uma pasta em qualquer lugar do seu PC e entre nessa pasta.

{% highlight cpp %}
#include <iostream>
#include <mysql.h>

int main(){
  MYSQL *connect = mysql_init(NULL);
  !connect ? std::cerr << "MySQL NÃO foi iniciado.\n"
           : std::cout << "MySQL Conectado com sucesso!\n";
  mysql_close(connect);
}
{% endhighlight %}

Agora copie a `libmysql.dll`(que está no caminho: `C:\...libmysql.dll`) para dentro da pasta onde está o arquivo `main.cpp` que você criou, salve e saia!

Para compilar e rodar o código, use os comandos abaixo de acordo com o que você usar, exemplos:

### [PowerShell](https://terminalroot.com.br/tags#powershell):
> Note que eu *protegi* o caminho com 'ASPAS SIMPLES', se estiver usando [Windows Terminal](), talvez "aspas duplas" pode não funcionar.

{% highlight bash %}
g++ .\main.cpp -I'C:\Program Files\MySQL\MySQL Server 8.0\include' -L'C:\Program Files\MySQL\MySQL Server 8.0\lib' -lmysql
.\a.exe
{% endhighlight %}
> A provável saída será: `MySQL Conectado com sucesso!`.

### `CMD`
> Dessa vez eu usei "ASPAS DUPLAS", agora no CMD talvez as 'aspas simples' é que não funcione!

{% highlight bash %}
g++ .\main.cpp -I"C:\Program Files\MySQL\MySQL Server 8.0\include" -L"C:\Program Files\MySQL\MySQL Server 8.0\lib" -lmysql
.\a.exe
{% endhighlight %}

### [Git Bash](https://terminalroot.com.br/2023/03/como-instalar-git-e-git-bash-no-windows.html)
> No *Git Bash* tudo é diferente, é no estilo [Unix](https://terminalroot.com.br/tags#unix) e você pode usar o `<Tab>` para autocompletar os nomes dos caminhos:

{% highlight bash %}
g++ main.cpp -I /c/Program\ Files/MySQL/MySQL\ Server\ 8.0/include/ -L /c/Program\ Files/MySQL/MySQL\ Server\ 8.0/lib/ -lmysql
./a.exe
{% endhighlight %}

---

## MySQL Connector C++
Se você preferir usar o **MySQL Connector C++** o processo é quase o mesmo, só muda o caminho do `include`, `lib` e `dll`, mas o código não funciona em C, usa `namespaces`, basta seguir os mesmo passos para o Visual Studio, mas altere:

+ Nas `Propriedades do Projeto` em: `C/C++ > Geral > Diretórios de Inclusão Adicionais`, cole o caminho do Connector:
{% highlight bash %}
C:\Program Files\MySQL\Connector C++ 8.0\include\jdbc
{% endhighlight %}

+ Em `Vinculador > Geral > Diretórios de Biblioteca Adicionais`, adicione o caminho: 
{% highlight bash %}
C:\Program Files\MySQL\Connector C++ 8.0\lib64i\vs14
{% endhighlight %}

+ E  também em: `Vinculador > Entrada > Dependências Adicionais`, adicione a lib:
{% highlight bash %}
mysqlcppconn.lib
# Nome da lib: C:\Program Files\MySQL\Connector C++ 8.0\lib64\mysqlcppconn.lib
{% endhighlight %}

+ E copie as `lib`s abaixo para dentro do seu projeto:
{% highlight bash %}
C:\Program Files\MySQL\Connector C++ 8.0\lib64 mysqlcppconn8-2-vs14.dll
C:\Program Files\MySQL\Connector C++ 8.0\lib64\mysqlcppconn-9-vs14.dll
{% endhighlight %}

Para testar a conexão crie um arquivo de teste:

{% highlight cpp %}
#include <iostream>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <mysql_connection.h>

auto main() -> int {
    sql::Driver* driver = get_driver_instance();
    try {
        std::unique_ptr<sql::Connection> con(
            driver->connect("HOST", "USUARIO", "SENHA")); // PREENCHA AQUI
        if (con != NULL) {
            std::cout << "MySQL Conectado com sucesso!\n";
            std::cin.get();
        }
    }
    catch (sql::SQLException& e) {
        std::cerr << "MySQL NÃO foi iniciado ou Credenciais incorretas.\n";
        return 1;
    }
}
{% endhighlight %}

> Se usar o **GCC/g++ MinGW** copie também as `DLL` e use um comando similar: Exemplo: `g++ .\main.cpp -I'C:\Program Files\MySQL\Connector C++ 8.0\include\jdbc' -L'C:\Program Files\MySQL\Connector C++ 8.0\lib64' -lmysqlcppconn`.

---

Lembrando que se você estiver no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) com [WSL](https://learn.microsoft.com/pt-br/windows/wsl/install) ou [VirtualBox](https://terminalroot.com.br/2018/03/como-instalar-o-mac-os-x-em-virtualbox-no-linux.html) você tem de instalar o [MySQL](https://terminalroot.com.br/2023/03/como-instalar-mariadb-mysql-no-ubuntu-2210.html) usando [esse procedimento](https://terminalroot.com.br/2023/03/como-instalar-mariadb-mysql-no-ubuntu-2210.html) e depois instalar o **MySQL Connector C** com esse comando:
{% highlight bash %}
sudo apt install libmysqlclient-dev
# Para o conector C++: sudo apt install libmysqlcppconn-dev libmysqlcppconn7v5
{% endhighlight %}
> E o cabeçalho tem de ser `#include <mysql/mysql.h>`.

---

Nós realizamos um CRUD, além de outras dicas com C++ utilizando o **MySQL Connector C** no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp). Adquira para obter o conteúdo completo:
## <https://terminalroot.com.br/cpp>

---

# Dependências:
+ <https://terminalroot.com.br/2023/05/como-instalar-o-apache-php-8-e-mysql-no-windows.html#mysql>
+ <https://terminalroot.com.br/2022/12/como-instalar-gcc-gpp-mingw-no-windows.html>
+ <https://visualstudio.microsoft.com/>
+ <https://code.visualstudio.com/>

# Clientes SQL:
+ <https://terminalroot.com.br/2022/08/instale-esse-cliente-sql-que-tem-uma-interface-moderna.html>
+ <https://terminalroot.com.br/2023/09/top-8-melhores-extensoes-para-seu-vscode.html#05-database-client>

# Links úteis:
+ <https://dev.mysql.com/downloads/c-api/>
+ <https://dev.mysql.com/downloads/installer/>
+ <https://downloads.mysql.com/archives/c-c/>


