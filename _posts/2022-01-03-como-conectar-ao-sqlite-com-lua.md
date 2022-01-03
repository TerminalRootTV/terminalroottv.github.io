---
layout: post
title: "Como Conectar ao SQLite com Lua"
date: 2022-01-03 12:45:44
image: '/assets/img/lua/lua-sqlite.jpg'
description: 'Passo à passo desde instalação até conexão ao banco de dados.'
icon: 'ion:terminal-sharp'
iconname: 'Lua/SQLite'
tags:
- lua
- sqlite
---

![Como Conectar ao SQLite com Lua](/assets/img/lua/lua-sqlite.jpg)

---

Fazer conexão com banco de dados em especial o [SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html) é fundamental para desenvolver aplicativos locais e até mesmo online.

Nós possuímos um artigo completo de uso do [SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html) que pode ser consultado no link abaixo:
### [Como utilizar o SQLite](https://terminalroot.com.br/2021/02/como-utilizar-o-sqlite.html)

Também possuímos um guia completo de utilização de Lua para iniciantes [nesse link](https://terminalroot.com.br/lua) .

Nesse artigo vamos ver como conectar ao SQLite usando Lua usando um passo à passo desde instalação até conexão ao banco de dados. 

Para isso vamos usar como referência o [Ubuntu 21.04](https://terminalroot.com.br/tags#ubuntu), mas você pode alterar nomes de pacotes, caminhos de diretórios conforme sua [distribuição](https://terminalroot.com.br/tags#distro) ou sistema operacional .


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

# Instalação 

## 1. Pacotes necessários
Antes de qualquer coisa vamos instalar as dependências necessárias
{% highlight sh %}
sudo apt update
sudo apt install sqlite3 libsqlite3-dev lua5.1 lua5.4 luarocks
{% endhighlight %}
> Observação: Mesmo que você já tenha instalado, recomendo reinstalar, para isso o parâmetro: `--reinstall`

Alguns nomes de pacotes podem ser diferentes na sua distro, use o *search* do seu gerenciador de pacotes para os nomes correspondentes.

### 2. Verifique se ambos estão funcionando normalmente:
Verificar comando e versão.

{% highlight sh %}
lua -v
#Lua 5.1.2  Copyright (C) 1994-2020 Lua.org, PUC-Rio
luarocks --version
#/usr/bin/luarocks 2.4.2
#LuaRocks main command-line interface
{% endhighlight %}

Altere o interpretador para **5.1** modificando o link simbólico do seu interpretador
{% highlight sh %}
sudo ln -sf /usr/bin/lua5.1 /etc/alternatives/lua-interpreter
{% endhighlight %}
> Se você está em outra distribuição ou versão do Ubuntu, crie um link simbólico diretamente, ex.: `sudo ln -sf /usr/bin/lua5.1 /usr/bin/lua`

---

### 3. Agora vamos instalar o LuaSQL com o [Luarocks](https://terminalroot.com.br/lua/#luarocks)
{% highlight lua %}
sudo luarocks install luasql-sqlite3
{% endhighlight %}

Verifique se foi instalado normalmente listando com `luarocks`
{% highlight sh %}
luarocks list
{% endhighlight %}

A saída similar será:
{% highlight sh %}
Installed rocks:
----------------

luasql-sqlite3
   2.6.0-1 (installed) - /usr/local/lib/luarocks/rocks
{% endhighlight %}
> Ou seja, listou o **luasql-sqlite3** normalmente e o arquivo `sqlite3.so` está no caminho: `/usr/local/lib/luarocks/rocks`


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

### 4. Agora vamos tornar possível o `package.path` encontrar o pacote do SQLite instalado pelo Luarocks
Para isso crie um link simbólico com o comando abaixo:
{% highlight sh %}
sudo ln -s /usr/local/lib/lua /usr/lib/lua
{% endhighlight %}

**OBSERVAÇÃO**
> Se quando você rodar esse comando: `ls /usr/local/lib/lua` se a saída não for **5.1** você terá de alterar o link simbólico do comando `lua` para a versão que aparecer conforme fizemos no passo **3**, se aparecer mais de um não haverá problemas, mas se não existir o número da versão do seu comando `lua` você só poderá usar o interpretador para a versão correspondente das disponíveis ao listar esse diretório citado .

---

# Testando
Para testar vamos usar um banco de dados pronto para teste que eu criei e para obtê-lo basta fazer o download com [wget](https://terminalroot.com.br/2019/05/aprenda-a-explorar-o-comando-wget.html) com o comando abaixo:
{% highlight sh %}
wget -q https://git.io/litelua.db
{% endhighlight %}

Agora vamos criar o arquivo `database.lua` com o código [Lua](https://terminalroot.com.br/lua) abaixo e depois vamos explicar algumas partes do mesmo:

{% highlight lua %}
local driver = require('luasql.sqlite3')
local env = driver.sqlite3()
local db = env:connect('./litelua.db')

local results = db:execute[[
  SELECT * FROM example;
]]

local id,mail,url,lang,name = results:fetch()
while id do
  print(id..' | '..mail..' | '..url..' | '..lang ..' | '..name)
  id,mail,url,lang,name = results:fetch()
end

results:close()

db:close()
env:close()
{% endhighlight %}

A saída deverá retornar os dados dos campos da tabela informada.

+ Em `db:execute` você deverá informar o comando do SQLite que deseja, pode ser: `CREATE`, `UPDATE`, `DELETE`...
+ As variáveis possuem quase os mesmos nomes das colunas, mas isso não é uma regra.

# Links úteis
+ <http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki>
+ <https://keplerproject.github.io/luasql/manual.html>


