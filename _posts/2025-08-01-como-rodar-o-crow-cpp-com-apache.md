---
layout: post
title: "Como Rodar o Crow C++ com Apache"
date: 2025-08-01 22:46:21
image: '/assets/img/web/crow-apache.jpg'
description: "🐦‍⬛ Passo a passo no Arch e Ubuntu e dica para Windows."
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web'
tags:
- desenvolvimentoweb
- webdev
- cpp
- crow
- web
- apache
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Neste artigo, vamos mostrar como integrar o [Crow](https://terminalroot.com.br/2022/09/crow-cpp-um-framework-web-facil-e-veloz.html) com o servidor [Apache](https://terminalroot.com.br/tags#apache), permitindo rodar aplicações [C++](https://terminalroot.com.br/tags#cpp) com suporte a HTTP, *proxy reverso* e configuração em produção.


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

## 📦 Dependências
Antes é necessário, lógico, possuir o [Crow C++](https://terminalroot.com.br/2022/09/crow-cpp-um-framework-web-facil-e-veloz.html) instalado no seu sistema, para isso, instale as dependências:

### No [Windows](https://terminalroot.com.br/tags#windows) 
Veja aqui: [Como Instalar o Crow C++ no Windows](https://terminalroot.com.br/2025/06/como-instalar-o-crow-cpp-no-windows.html), é mais interessante rodar sem ser no Apache usando diretamente com o servidor do Crow rodando o binário!

### No Ubuntu:
{% highlight bash %}
sudo apt install git build-essential cmake make libasio-dev g++
{% endhighlight %}

### No Arch:
{% highlight bash %}
sudo pacman -S git base-devel cmake asio
{% endhighlight %}

Agora clone, compile e instale o Crow C++:

{% highlight bash %}
git clone https://github.com/CrowCpp/Crow
cd Crow
cmake . -B build -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF
sudo cmake --install build
{% endhighlight %}

> Se quiser, já pode remover o repositório clonado: `cd .. && rm -rf CrowCpp`


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

## ⚙️ Rodar no Apache
Certifique-se de possuir o Apache instalado e com as devidas permissões de escrita e leitura. 

+ Se resume em:
{% highlight bash %}
sudo apt install apache2
sudo chown -R $USER:$USER /var/www/html/
{% endhighlight %}
+ E no Arch:
{% highlight bash %}
sudo pacman -S apache
sudo chown -R $USER:$USER /srv/http
{% endhighlight %}

#### 01. Crie uma pasta na raiz do seu Apache entre na mesma, exemplo
{% highlight bash %}
# Ubuntu
mkdir -p /var/www/html/crow
cd /var/www/html/crow

# Arch
mkdir -p /srv/http/crow
cd /srv/http/crow
{% endhighlight %}

#### 02. Crie um código exemplo simples para teste:
> `main.cpp`

{% highlight cpp %}
#include <crow.h> // No Windows use aspas duplas

int main(){
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        return "Hello world";
    });

    app.port(18080).multithreaded().run();
}
{% endhighlight %}

Compile: `g++ main.cpp -o app` e teste: `./app` e acesse no navegador: <http://localhost:18080>.

---

## 🏃 Rodar diretamente no Apache sem precisar rodar o binário
Use os caminhos e comandos similares no Arch.

#### 01. Crie um arquivo para o `systemd`:
> `sudo vim /etc/systemd/system/crow-app.service`, ou com seu editor preferido.

Cole isso dentro:
> No Arch altere todos: `/var/www/html` para `/srv/http` e em vez de `www-data` use somente: `http` tanto para `User` quanto para `Group`

{% highlight ini %}
[Unit]
Description=Crow C++ Web Application
After=network.target

[Service]
Type=simple
User=www-data
Group=www-data
WorkingDirectory=/var/www/html/crow
ExecStart=/var/www/html/crow/app
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
{% endhighlight %}
> Salve e saia.


#### 02. Ative e inicie o serviço:
{% highlight bash %}
sudo systemctl daemon-reload
sudo systemctl enable crow-app
sudo systemctl start crow-app
sudo systemctl status crow-app  # para verificar se está rodando
{% endhighlight %}

Vai aparecer mais ou menos isso:

![Crow Apache](/assets/img/web/img-crow-apache.png) 


#### 03. Configure o Apache como Proxy Reverso

Ative os módulos necessários:

+ No Ubuntu:
{% highlight bash %}
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
{% endhighlight %}

+ No Arch:
Edite o arquivo: `sudo vim /etc/httpd/conf/httpd.conf` e E descomente (ou adicione, se não estiver presente) as seguintes linhas:
{% highlight bash %}
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
LoadModule lbmethod_byrequests_module modules/mod_lbmethod_byrequests.so
LoadModule rewrite_module modules/mod_rewrite.so
{% endhighlight %}

E também encontre (ou adicione) a seguinte linha:
> Se tiver comentada(com `#` tralha na frente, remova), descomente.

{% highlight bash %}
Include conf/extra/httpd-vhosts.conf
{% endhighlight %}

#### 04. Adicione esta configuração no seu VirtualHost do Apache
+ Ubuntu: `sudo vim /etc/apache2/sites-available/000-default.conf` 
+ e Arch: `sudo vim /etc/httpd/conf/extra/httpd-vhosts.conf`

Apague tudo que estiver dentro e cole isso:
> No Arch altere a linha `/var/www/html` para `/srv/http` e também troque: `${APACHE_LOG_DIR}` por `/var/log/httpd`

{% highlight toml %}
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    # Proxy reverso simples que remove o prefixo
    ProxyRequests Off
    ProxyPreserveHost On
    
    # Proxy para porta 18080
    ProxyPass /crow/ http://127.0.0.1:18080/
    ProxyPassReverse /crow/ http://127.0.0.1:18080/

    # Reescrever URLs para remover o prefixo /crow/
    RewriteEngine On
    RewriteRule ^/crow/(.*)$ http://127.0.0.1:18080/$1 [P,L]
    RewriteRule ^/crow/?$ http://127.0.0.1:18080/ [P,L]

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
{% endhighlight %}

Ative o modo *rewrite*, reinicie o Apache e teste acessando a URL:
> No Arch basta reiniciar com esse comando: `sudo systemctl restart httpd`.

{% highlight bash %}
sudo pkill -f app # Opcional se não modificou o binário
sudo a2enmod rewrite
sudo systemctl restart apache2
xdg-open http://localhost/crow/
{% endhighlight %}

Pronto, agora é só [desenvolver suas aplicações com Crow](https://terminalroot.com.br/2022/09/crow-cpp-um-framework-web-facil-e-veloz.html)!

Lembrando que sempre que fizer alterações no binário, é necessário *restartar* o binário, usando `pkill`:
{% highlight bash %}
sudo pkill -f app
{% endhighlight %}

No Arch prefira usar esses dois comandos abaixo:
{% highlight bash %}
sudo systemctl daemon-reexec # ou daemon-reload, se você não alterou o binário do systemd
sudo systemctl enable --now crow-app.service
{% endhighlight %}
> Se quiser verificar o status: `sudo systemctl status crow-app.service`


