---
layout: post
title: "Como Criar uma API com Laravel 8 (CRUD)"
date: 2021-04-24 20:02:03
image: '/assets/img/laravel/laravel-8-api.jpg'
description: 'Nesse artigo/vídeo vamos criar uma API RESTful com Laravel 8 .'
icon: 'ion:terminal-sharp'
iconname: 'Laravel'
tags:
- laravel
- php
- desenvolvimentoweb
---

![Como Criar uma API com Laravel 8 (CRUD)](/assets/img/laravel/laravel-8-api.jpg)

Nesse artigo/vídeo vamos criar uma API que servirá para:
- Cadastrar um artigo(estilo de blog, mas nesse caso somente: título e texto do artigo)
- Atualizar um artigo
- Listar todos os artigos
- Listar um único artigo
- Deletar um artigo

Somente enviado requisição à uma URL . Podemos dizer que será um CRUD .

Abaixo segue conceitos e comandos na ordem para chegarmos a esse feito da forma mais direta possível.

Detalhes sobre o [Laravel](https://terminalroot.com.br/tags#laravel) recomendo ver antes [esse vídeo](https://www.youtube.com/watch?v=TKH4S4_d9PA):
### [Como Criar um CRUD com LARAVEL](https://www.youtube.com/watch?v=TKH4S4_d9PA)

E para mais detalhes ainda sobre sua arquitetura e conceitos e técnicas de [PHP](https://terminalroot.com.br/php) recomendo você fazer nosso:
### [Curso de Desenvolvimento Web com PHP, MySQL, HTML5, CSS3, Javascript, Jekyll, GitHub, GitLab, Netlify e Shell Web no Linux](https://terminalroot.com.br/php)

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

# O que é uma API?
Interface de Programação de Aplicação, cuja sigla API provém do Inglês **A**pplication **P**rogramming **I**nterface, é um conjunto de rotinas e padrões estabelecidos por um software.

O propósito das APIs é o de simplificar o desenvolvimento de programas e aplicações. Isso permite que o desenvolvedor possa utilizar os serviços fornecidos pelas APIs de seu interesse.

---

# API Web
É um conjunto de interfaces no contexto de desenvolvimento Web, geralmente expresso nos formatos XML ou JSON. Atualmente a técnica mais utilizada é REST.

---

# O que é REST?
Representational State Transfer (REST), em português Transferência Representacional de Estado, é um estilo de arquitetura de software que define um conjunto de restrições a serem usadas para a criação de web services (serviços Web).

Os Web services que estão em conformidade com o estilo arquitetural REST, denominados Web services RESTful .

---

# RESTful
Para que uma API seja considerada do tipo RESTful, ela precisa está em conformidade com os seguintes critérios:

+ Ter uma arquitetura cliente/servidor formada por clientes, servidores e recursos, com solicitações gerenciadas por meio de HTTP.
+ Realizar comunicação cliente/servidor stateless. Isso significa que cada solicitação é separada e não conectada com outras, e que nenhuma informação do cliente é armazenada entre elas.
+ Armazenar dados em cache para otimizar as interações entre cliente e servidor.
+ Ter uma interface uniforme entre os componentes para que as informações sejam transferidas em um formato padronizado. Para tanto, é necessário que:
  - os recursos solicitados sejam identificáveis e estejam separados das representações enviadas ao cliente;
  - os recursos possam ser manipulados pelo cliente por meio da representação recebida com informações suficientes para tais ações;
  - as mensagens autodescritivas retornadas ao cliente contenham informações suficientes para descrever como processá-las;
  - hipermídia seja incorporada. Isso significa que após acessar um recurso, o cliente precisa ser capaz de usar hiperlinks para encontrar todas as demais ações disponíveis para ele no momento.
+ Ter um sistema em camadas que organiza os tipos de servidores (responsáveis pela segurança, pelo carregamento de carga e assim por diante) envolvidos na recuperação das informações solicitadas em hierarquias que o cliente não pode ver.
+ Possibilitar código sob demanda (opcional): a capacidade de enviar do servidor para o cliente um código executável quando solicitado, a fim de ampliar as funções do cliente.

Nem todos os serviços que conhecemos respeitam as características citadas acima, mas [acidentalmente são chamadas de RESTful](http://www.markbaker.ca/blog//2005/04/14/#2005-04-amazon-next)

---

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

---

# 1. Criar e configurar projeto inicial
{% highlight bash %}
cd /var/www/localhost/htdocs
laravel new artigos
cd artigos/
chmod -R guo+w ./storage
gio open http://localhost/artigos/public/
mysql -u root -p"123456" -e "DROP DATABASE IF EXISTS artigos;CREATE DATABASE artigos"
sed -i 's/DB_PASSWORD=/DB_PASSWORD=123456/g' ./.env
{% endhighlight %}

---

# 2. Criar Migration e definir campos da tabela
{% highlight bash %}
php artisan make:migration create_artigos_table --create=artigos
vim ./database/migrations/*create_arti*
{% endhighlight %}

{% highlight php %}
$table->string('titulo');
$table->text('conteudo');
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

---

# 3. Criar Model e Controller 
{% highlight bash %}
php artisan make:model Artigo
php artisan migrate
php artisan make:controller ArtigoController --resource
{% endhighlight %}

---

# 4. Definir controller
Editar o arquivo: `vim ./app/Http/Controllers/ArtigoController.php`

{% highlight php %}
<?php

namespace App\Http\Controllers;

use App\Models\Artigo as Artigo;
use App\Http\Resources\Artigo as ArtigoResource;
use Illuminate\Http\Request;

class ArtigoController extends Controller {

  public function index(){
    $artigos = Artigo::paginate(15);
    return ArtigoResource::collection($artigos);
  }

  public function show($id){
    $artigo = Artigo::findOrFail( $id );
    return new ArtigoResource( $artigo );
  }

  public function store(Request $request){
    $artigo = new Artigo;
    $artigo->titulo = $request->input('titulo');
    $artigo->conteudo = $request->input('conteudo');

    if( $artigo->save() ){
      return new ArtigoResource( $artigo );
    }
  }

   public function update(Request $request){
    $artigo = Artigo::findOrFail( $request->id );
    $artigo->titulo = $request->input('titulo');
    $artigo->conteudo = $request->input('conteudo');

    if( $artigo->save() ){
      return new ArtigoResource( $artigo );
    }
  } 

  public function destroy($id){
    $artigo = Artigo::findOrFail( $id );
    if( $artigo->delete() ){
      return new ArtigoResource( $artigo );
    }

  }
}

{% endhighlight %}

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

---

# 5. Criar Rotas
Editar o arquivo: `vim ./routes/api.php`

{% highlight php %}
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArtigoController;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// List artigos
Route::get('artigos', [ArtigoController::class, 'index']);

// List single artigo
Route::get('artigo/{id}', [ArtigoController::class, 'show']);

// Create new artigo
Route::post('artigo', [ArtigoController::class, 'store']);

// Update artigo
Route::put('artigo/{id}', [ArtigoController::class, 'update']);

// Delete artigo
Route::delete('artigo/{id}', [ArtigoController::class,'destroy']);

{% endhighlight %}

---

# 6. Criar e definir resource
{% highlight bash %}
php artisan make:resource Artigo
vim ./app/Http/Resources/Artigo.php
{% endhighlight %}

{% highlight php %}
<?php

namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;

class Artigo extends JsonResource {
  public function toArray($request){
    //return parent::toArray($request);
    return [
      'id' => $this->id,
      'titulo' => $this->titulo,
      'conteudo' => $this->conteudo
    ];
  }

  /* public function with( $request ){
    return [
      'version' => '1.0.0',
      'author_url' => url('https://terminalroot.com.br')
    ];
  } */
}
{% endhighlight %}

---

# 7. Testar API
Para testar a API vamos utilizar [Postman](https://terminalroot.com.br/2021/02/como-instalar-o-postman-no-ubuntu-e-em-qualquer-distro-linux.html). Veja esse artigo para saber como instalar o Postman:
### [Como instalar o Postman no Ubuntu e em qualquer Distro Linux](https://terminalroot.com.br/2021/02/como-instalar-o-postman-no-ubuntu-e-em-qualquer-distro-linux.html)

---

+ Inserir: `POST` <http://localhost/artigos/public/api/artigo> , **Headers(KEY → Content-Type) and VALUE(application/json) + Body(raw)**:

{% highlight json %}
{
  "titulo": "Primeiro artigo pelo Postman",
  "conteudo": "Descrição desse artigo de número um."
}

{
  "titulo": "Segundo artigo pelo Postman",
  "conteudo": "Descrição desse artigo de número dois."
}

{
  "titulo": "Terceiro artigo pelo Postman",
  "conteudo": "Descrição desse artigo de número três."
}
{% endhighlight %}

+ Listar todos: `GET` <http://localhost/artigos/public/api/artigos>
+ Listar somente o segundo: `GET` <http://localhost/artigos/public/api/artigo/2>
+ Atualizar o 1º artigo: `PUT` <http://localhost/artigos/public/api/artigo/1> , **Headers(KEY → Content-Type) and VALUE(application/json) + Body(raw)**:

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

{% highlight json %}
{
  "titulo": "ATUALIZANDO Primeiro artigo pelo Postman",
  "conteudo": "Descrição desse artigo de número um sendo ATUALIZADO."
}
{% endhighlight %}

+ Deletar somente o segundo: `DELETE` <http://localhost/artigos/public/api/artigo/2>

# Assista ao vídeo

<iframe width="910" height="390" src="https://www.youtube.com/embed/XHDxVl93LRQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Links Úteis
+ <https://pt.wikipedia.org/wiki/Interface_de_programação_de_aplicações>
+ <https://pt.wikipedia.org/wiki/REST>
+ <https://www.redhat.com/pt-br/topics/api/what-is-a-rest-api>


