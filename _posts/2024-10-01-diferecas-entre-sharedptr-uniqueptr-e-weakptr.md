---
layout: post
title: "Diferenças entre shared_ptr, unique_ptr e weak_ptr"
date: 2024-10-01 15:35:47
image: '/assets/img/cppdaily/smarts.jpg'
description: "🏹 Utilizados para gerenciar a alocação e desalocação automática de memória."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Os [ponteiros inteligentes](https://terminalroot.com.br/2022/08/entenda-ponteiros-inteligentes-em-cpp-smart-pointers.html) em C++ (`std::shared_ptr`, `std::unique_ptr` e `std::weak_ptr`) são utilizados para gerenciar a alocação e desalocação automática de [memória](https://terminalroot.com.br/2022/01/entenda-ponteiros-em-c-cpp-e-como-a-memoria-ram-funciona.html), ajudando a evitar problemas como vazamentos de memória e *dangling pointers* (ponteiros que apontam para um local de memória que já foi desalocado). 

Vamos ver a diferença entre os principais ponteiros inteligentes!


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

## `std::shared_ptr`
+ Um ponteiro compartilhado que pode ter vários donos.
+ Mantém um <u>contador de referência</u>. Cada vez que uma nova cópia do `shared_ptr` é feita, esse contador é incrementado. Quando todos os `shared_ptr` que apontam para o mesmo objeto são destruídos (contador chega a zero), o objeto apontado é desalocado.
+ Útil quando você precisa que vários lugares do código compartilhem a posse de um recurso.

Exemplo:
{% highlight cpp %}
#include <iostream>
#include <memory>

struct Resource{
    Resource(){ std::cout << "Resource acquired\n"; }
    ~Resource(){ std::cout << "Resource destroyed\n"; }
};

int main(){
    std::shared_ptr<Resource> ptr1 = std::make_shared<Resource>();
    {
        std::shared_ptr<Resource> ptr2 = ptr1;  // ptr2 também compartilha o objeto.
        std::cout << "Reference count: " << ptr1.use_count() << "\n";  // Exibe o contador.
    }
    // Quando ptr2 sai do escopo, o contador é decrementado, mas o recurso ainda existe.

    std::cout << "Reference count: " << ptr1.use_count() << "\n";  // Exibe o contador.
    // Quando ptr1 sai do escopo, o objeto é destruído, pois o contador chega a 0.
}
{% endhighlight %}
Saída:
{% highlight bash %}
Resource acquired
Reference count: 2
Reference count: 1
Resource destroyed
{% endhighlight %}

---

## `std::unique_ptr`
+ Um ponteiro único, que tem **exclusividade de posse** sobre o objeto. Apenas um `unique_ptr` pode apontar para o mesmo recurso de cada vez.
+ **Não permite cópias**, apenas movimentações via [std::move](https://terminalroot.com.br/2021/04/cpp-daily-std-set-multiset-move.html)(mover semântica) o que garante que o objeto será gerenciado por um único ponteiro.
+ Ideal quando você quer garantir que um recurso não será compartilhado.

Exemplo:
{% highlight cpp %}
#include <iostream>
#include <memory>

struct Resource {
    Resource() { std::cout << "Resource acquired\n"; }
    ~Resource() { std::cout << "Resource destroyed\n"; }
};

int main() {
    std::unique_ptr<Resource> ptr1 = std::make_unique<Resource>();
    // std::unique_ptr<Resource> ptr2 = ptr1;  // Isso não compilaria, cópia não permitida.
    
    std::unique_ptr<Resource> ptr2 = std::move(ptr1);  // Transferência de posse.
    
    if (!ptr1) {
        std::cout << "ptr1 is null\n";
    }

    // Quando ptr2 sai do escopo, o recurso é automaticamente destruído.
}
{% endhighlight %}
Saída:
{% highlight bash %}
Resource acquired
ptr1 is null
Resource destroyed
{% endhighlight %}

---

## `std::weak_ptr`
+ Um ponteiro fraco, que **não possui** o objeto. Ele observa um objeto gerenciado por um `shared_ptr` sem contribuir para o contador de referência.
+ É útil para **evitar ciclos de referência** (quando dois ou mais `shared_ptr` se referenciam mutuamente, criando um ciclo que impede a liberação da memória).
+ Antes de acessar o objeto, você precisa verificar se ele ainda é válido utilizando `lock()`, que retorna um `std::shared_ptr` se o objeto ainda existir.

Exemplo:
{% highlight cpp %}
#include <iostream>
#include <memory>

struct Resource {
    Resource() { std::cout << "Resource acquired\n"; }
    ~Resource() { std::cout << "Resource destroyed\n"; }
};

int main() {
    std::shared_ptr<Resource> ptr1 = std::make_shared<Resource>();
    std::weak_ptr<Resource> weakPtr = ptr1;  // weakPtr observa, mas não contribui para o contador.
    
    if (auto tempPtr = weakPtr.lock()) {  // Verifica se o recurso ainda existe.
        std::cout << "Resource is still alive\n";
    } else {
        std::cout << "Resource has been destroyed\n";
    }
    
    ptr1.reset();  // Libera o recurso.
    
    if (auto tempPtr = weakPtr.lock()) {
        std::cout << "Resource is still alive\n";
    } else {
        std::cout << "Resource has been destroyed\n";
    }
}
{% endhighlight %}
Saída:
{% highlight bash %}
Resource acquired
Resource is still alive
Resource destroyed
Resource has been destroyed
{% endhighlight %}

---

Ou seja, `shared_ptr`: Possuído por vários donos, com contagem de referências para gerenciar a destruição do objeto. `unique_ptr`: Posse exclusiva, não pode ser copiado, apenas movido. `weak_ptr`: Observa o recurso gerenciado por um `shared_ptr`, mas não interfere na contagem de referências, usado para evitar ciclos de referência.

