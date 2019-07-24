---
layout: post
title: 'Resumo de definições de Programação Orientada a Objetos'
date: '2011-11-07T19:09:00.000-08:00'
description: 'Ideias sobre PHP, mas alguns tópicos servem pra outras linguagens.'
main-class: 'misc'
tags:
- PHP
---

+ 01-Variáveis ​​dentro da classe são chamados de "propriedades".
+ 02-Funções ​​dentro da classe são chamados de "métodos".
+ 03-Itens(Propriedades ou Métodos)declarados como public podem ser acessados por todo mundo. 
+ 04-Itens(Propriedades ou Métodos)declarados como protected limita o acesso a classes herdadas (e para a classe que define o item). 
+ 05-Itens(Propriedades ou Métodos)declarados como private limita a visibilidade para apenas a classe que define o item. 
+ 06-Classes que tem um método(Função) construtor(__construct()), não precisa chamá-lo(setar), ele é chamado automaticamente ao instanciar uma classe.
+ 07-se nenhuma declaração de visibilidade for usada, então o membro ou método será tratado como se fosse declarado como public.
+ 08-Classes que tem um método destrutor(__destruct()), não precisa chamá-lo(setar), ele é chamado automaticamente por último, mesmo q um método esteja antes dele.
+ 09-Quando você estender uma classe(class X extends Y), a subclasse herda todos os métodos públicos e protegidos da classe pai.
+ 10-__autoload é uma função que pode ser definida para não precisar ficar incluindo diversos arquivos, basta usar essa função, customizada.
+ 11-O Operador de Resolução de Escopo, dois pontos duplo(::), é um token que permite acesso a métodos ou membros estáticos, constantes, e sobrecarregados de uma classe. 
Quando referenciando esses itens de fora da definição da classe, você usa o nome da classe. Duas palavras-chaves especiais self e parent(quando extendidas) são usadas para acessar membros ou métodos de dentro da definição da classe. 
+ 12-Declarar membros ou métodos de uma classe como estáticos(static) faz deles acessíveis sem precisar instanciar a classe. Um membro declarados como estático não pode ser acessado com um objeto instanciado da classe (embora métodos estáticos podem).Como métodos estáticos podem ser chamados sem uma instância do objeto ter sido criada, a pseudo-variável $this não é disponível dentro do método declarado como estático.
+ 13-Não é permitido criar uma instância de uma class que foi definida como abstrata(abstract). Qualquer classe que contém pelo menos um método abstrato deve também ser abstrata. Métodos definidos como abstratos simplesmente declaram a assinatura do método, eles não podem definir a implementação. 
+ 14-Interfaces de Objetos permite a criação de código que especifica quais métodos e variáveis uma classe deve implementar, sem ter que definir como esses métodos serão tratados.Todos os métodos declarados em uma interface devem ser public, essa é a natureza de uma interface.Para implementar uma interface, o operador implements é usado(interface class X)(class Y implements X).
+ 15-É possível definir valores constantes em cada classe permanecendo a mesma e imutável. Constantes diferem de variáveis normais no não uso do símbolo $ para declará-las ou usá-las(const propriedade = 'valor'). 
+ 16-Sobrecarga em PHP provê recursos para "criar" dinamicamente membros e métodos. Estas entidades dinâmicas são processadas via métodos mágicos que podem estabelecer em uma classe para vários tipos de ações( __set() é executado ao se escrever dados para membros inacessíveis. __get() é utilizados para ler dados de membros inacessíveis.
 __isset() é disparado para chamar isset() ou empty() em membros inacessíveis. __unset() é invocado quando unset() é usado em membros inacessíveis.  __call() é disparado quando invocando métodos inacessíveis em um contexto de objeto. __callStatic() é disparado quando invocando métodos inacessíveis em um contexto estático. ).
+ 17-Iteração de Objetos, maneira de definir objetos para que seja possível iterar por uma lista de items, como, por exemplo, uma instrução foreach.
+ 18-a palavra-chave 'final', as classes que possuem algum metodo ou ela mesmo com 'final, nao podem ser extendidas'(final class)(final function funcao).
+ 19-Clonando objetos, a palavra-chave 'clone' (que chama o método __clone() do objeto, se possível).
+ 20-Referências estáticas para a atual classe como self:: ou __CLASS__ são resolvidas usando a classe na qual a função pertence.
+ 21-Exceções

{% highlight php %}

//namespace MyProject\DB;(forma nova de se incluir)

function calcular($x) {
    if (!$x) {
        throw new Exception('Divisao por Zero.');
    }
    else return 1/$x;
}

try {
    echo calcular(5) . "\n";
    echo calcular(0) . "\n";
} catch (Exception $e) {
  echo "Exceção pega: ",  $e->getMessage(), "\n";
}

// continua a execução

echo 'Olá mundo!';

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

