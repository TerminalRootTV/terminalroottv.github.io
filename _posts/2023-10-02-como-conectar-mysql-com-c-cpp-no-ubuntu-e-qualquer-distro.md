---
layout: post
title: "Como Conectar MySQL com C/C++ no Ubuntu e Qualquer Distro"
date: 2023-10-02 11:48:17
image: '/assets/img/mysql/mysql-c-cpp-ubuntu-gnu-linux.png'
description: 'Tanto com o Connector C como como o Connector C++.'
icon: 'ion:terminal-sharp'
iconname: 'MySQL/C/C++'
tags:
- mysql
- sql
- cpp
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Nesse artigo veremos como conectar ao [MySQL](https://terminalroot.com.br/tags#mysql) com [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp) no [Ubuntu](https://terminalroot.com.br/tags#ubuntu) e também um procedimento de instalação que serve para qualquer distro [GNU](https://terminalroot.com.br/tags#gnu)/[Linux](https://terminalroot.com.br/tags#linux).

---

# Instalação
Antes de mais nada você precisa ter o [MySQL/MariaDB](https://terminalroot.com.br/tags#mariadb) instalado n seu sistema, isso nós mostramos na maneira correta no artigo:
### [Como instalar MariaDB/MySQL no Ubuntu 22.10](https://terminalroot.com.br/2023/03/como-instalar-mariadb-mysql-no-ubuntu-2210.html)

Demais conceitos necessários você pode encontrar no artigo:
### [Como Conectar ao MySQL com C/C++ no Windows](https://terminalroot.com.br/2023/09/como-conectar-ao-mysql-com-c-cpp-no-windows.html)
Que descreve as diferenças entre: *MySQL Connector C* e o *MySQL Connector C++*!

## MySQL Connector C++ `MÉTODO 1 | Ubuntu`
Para instalar o **MySQL Connector C no Ubuntu** você pode usar o gerenciador de pacotes APT:
{% highlight bash %}
sudo apt install libmysqlcppconn-dev libmysqlcppconn7v5
{% endhighlight %}

---

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

Para testar crie um código de teste:
{% highlight cpp %}
#include <iostream>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <mysql_connection.h>

auto main() -> int {
  sql::Driver *driver = get_driver_instance();
  try {
    std::unique_ptr<sql::Connection> con(
        driver->connect("HOST", "USER", "SENHA")); // PREENCHA AQUI
    if (con != NULL) {
      std::cout << "MySQL Conectado com sucesso!\n";
    }
  } catch (sql::SQLException &e) {
    std::cerr << "MySQL NÃO foi iniciado ou Credenciais incorretas.\n";
    return 1;
  }
}
{% endhighlight %}

Compile e rode:
{% highlight bash %}
g++ main.cc -lmysqlcppconn
./a.out
{% endhighlight %}

---

<!-- RECTANGLE LARGE -->
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

---

## MySQL Connector C++ `MÉTODO 2 | Qualquer Distro`
Você também pode instalar manualmente caso estiver em outra distro, ou em uma versão que está com problema ao usar o APT.

#### 01. Remova os pacotes do seu sistema se houver, e faça a limpeza posteriormente:
{% highlight bash %}
sudo apt remove --purge libmysqlcppconn-dev libmysqlcppconn7v5 -y
sudo apt autoremove
{% endhighlight %}

#### 02. Faça o Download do Binário no endereço: <https://dev.mysql.com/downloads/connector/cpp>
  - Escolha: **Select Operating System: `Linux - Generic`**
  - E no *select* de baixo: **Select OS Version: `All`**
  - Clique no arquivo: **Archive**: `(mysql-connector-c++-X.X.X-linux-glibcX.XX-x86-64bit.tar.gz)`
  - Depois clique em: **No thanks, just start my download.** e o Download será realizado!

#### 03. Após o download, descompacte o arquivo baixado:
{% highlight bash %}
tar zxvf mysql-connector-c++-*.tar.gz
{% endhighlight %}

#### 04. Entre no diretório descompactado e mova os diretórios internos conforme os comandos abaixo:
{% highlight bash %}
cd mysql-*
sudo mv include/jdbc/* /usr/include/
sudo mv lib64/* /usr/lib/x86_64-linux-gnu/
{% endhighlight %}
> Se quiser escolha um caminho diferente: `sudo mv lib64/* /usr/lib64/`.

#### 05. Agora permita a [GNU GlibC](https://www.gnu.org/software/libc/) entender sua instalação, para isso rode o comando abaixo:
{% highlight bash %}
sudo ldconfig
{% endhighlight %}
> Se escolheu um caminho diferente: `echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/' >> ~/.bashrc && source ~/.bashrc`.

#### 06. Para testar utilize o mesmo código de teste:
{% highlight cpp %}
#include <iostream>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <mysql_connection.h>

auto main() -> int {
  sql::Driver *driver = get_driver_instance();
  try {
    std::unique_ptr<sql::Connection> con(
        driver->connect("HOST", "USER", "SENHA")); // PREENCHA AQUI
    if (con != NULL) {
      std::cout << "MySQL Conectado com sucesso!\n";
    }
  } catch (sql::SQLException &e) {
    std::cerr << "MySQL NÃO foi iniciado ou Credenciais incorretas.\n";
    return 1;
  }
}
{% endhighlight %}

---

<!-- RECTANGLE 2 - OnParagragraph -->
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

#### 07. Mas para compilar e rodar, use o seguinte comando:
{% highlight bash %}
g++ main.cpp -lmysqlcppconn
# Ou: g++ main.cpp /usr/lib64/libmysqlcppconn.so.9
./a.out
{% endhighlight %}
> Caso não funcione, tente compilar com a flag: `-pthread`.

Se escolheu caminho alternativo(`/usr/lib64`) e não quiser adicionar conteúdo ao `~/.bashrc` você também pode criar um link simbólico para usar a `flag`:
{% highlight bash %}
sudo ln -s /usr/lib64/libmysqlcppconn.so.9 /usr/lib/x86_64-linux-gnu/libmysqlcppconn.so.9
{% endhighlight %}

E também se quiser que apareça a descrição para o `pkg-config --list-all`, basta criar esse arquivo:
{% highlight bash %}
sudo vim /usr/lib/pkgconfig/mysqlcppconn.pc
{% endhighlight %}

E adicione esse conteúdo dentro:
{% highlight bash %}
prefix=/usr
exec_prefix=${prefix}
libdir=/usr/lib64
includedir=${prefix}/include

Name: mysqlcppconn
Description: MySQL Connector/C++ is a MySQL database connector for C++.
URL: https://github.com/mysql/mysql-connector-cpp
Version: 8.1.0
Libs: -L"${libdir}" -lpthread
Cflags: -I"${includedir}" -I/usr/local/include
#Requires.private: @GLFW_PKG_DEPS@
#Cflags: -I"${includedir}" -I/usr/local/include
{% endhighlight %}
> Veja o conteúdo: `pkg-config --list-all | grep mysqlcppconn`

Você também pode compilar do zero, basta clonar o repositório: <https://github.com/mysql/mysql-connector-cpp> e seguir o procedimento [listado aqui](https://dev.mysql.com/doc/connector-cpp/8.1/en/connector-cpp-apps-platform-considerations.html).

Se quiser desinstalar TUDO:
{% highlight bash %}
sudo unlink /usr/lib/x86_64-linux-gnu/libmysqlcppconn.so.9 2>/dev/null
sed -i '/LD_LIBRARY_PATH/d' ~/.bashrc
cd /usr/include/
sudo rm -rf cppconn/ mysql_*
cd /usr/lib/x86_64-linux-gnu/ # Ou se escolheu diretório alternativo: cd /usr/lib64/
sudo rm -rf libmysqlcppconn8.so libmysqlcppconn8.so.2 libmysqlcppconn8.so.2.8.1.0 \
            libmysqlcppconn.so libmysqlcppconn.so.9 libmysqlcppconn.so.9.8.1.0 plugin private
sudo rm /usr/lib/pkgconfig/mysqlcppconn.pc
{% endhighlight %}

---

## MySQL Connector C `Ubuntu`
Para instalar o **MySQL Connector C no Ubuntu** você pode usar o gerenciador de pacotes APT:
{% highlight bash %}
sudo apt install libmysqlclient-dev
{% endhighlight %}

Para testar a conexão crie um arquivo de teste:

> `main.cpp`
{% highlight cpp %}
#include <iostream>
#include <mysql/mysql.h>

auto main() -> int {
  MYSQL *connect = mysql_init(NULL);
  !connect ? std::cerr << "MySQL NÃO foi iniciado.\n"
           : std::cout << "MySQL Conectado com sucesso!\n";
  mysql_close(connect);
}
{% endhighlight %}

Compile e rode:
{% highlight bash %}
g++ main.cpp -lmysqlclient
./a.out
{% endhighlight %}

Alternativamente você pode instalar diretamente:
{% highlight bash %}
wget -q https://terminalroot.com.br/downs/libmysqlclient-dev-8.0.34-0ubuntu0.23.04.1-amd64.tar.gz
tar zxvf libmysqlclient-dev-8.0.34-0ubuntu0.23.04.1-amd64.tar.gz
cd libmysqlclient-dev-8.0.34-0ubuntu0.23.04.1-amd64
sudo mv include/mysql/ /usr/include/
sudo mv lib/libmysqlclient.* /usr/lib/x86_64-linux-gnu/
{% endhighlight %}

---

Nós realizamos um CRUD, além de outras dicas com C++ utilizando o MySQL Connector C no [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp). Adquira para obter o conteúdo completo!


<!-- MINI ADS -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# Links úteis
+ https://dev.mysql.com/doc/connector-cpp/1.1/en/connector-cpp-examples-connecting.html
+ https://dev.mysql.com/doc/connector-cpp/8.1/en/connector-cpp-apps-general-considerations.html
+ https://dev.mysql.com/doc/connector-cpp/8.1/en/connector-cpp-installation-binary.html
+ https://dev.mysql.com/downloads/c-api/
+ https://dev.mysql.com/downloads/connector/cpp/
+ https://dev.mysql.com/downloads/installer/
+ https://downloads.mysql.com/archives/c-c/



