---
layout: post
title: "10 Recursos Modernos do Java que Desenvolvedores Sêniores Usam"
date: 2026-01-30 12:34:47
image: '/assets/img/java/java-menos-codigo.jpg'
description: "☕ Para reduzir significativamente sua base de código Java."
icon: 'ion:terminal-sharp'
iconname: 'Java'
tags:
- java
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você ainda está digitando getters, setters, `equals()` e `hashCode()` manualmente, ou se seus *Data Transfer Objects* (DTOs) parecem ter sido escritos em 2012, você está perdendo o segredo.

**Você está escrevendo [Java](https://terminalroot.com.br/java/) demais.**

Já trabalhei em equipes que passaram semanas debatendo *Lombok* versus frameworks de imutabilidade, só para introduzir problemas complexos de *build* e *bugs* ocultos. A *Java Virtual Machine* (JVM) moderna — especificamente [Java](https://terminalroot.com.br/java/) 17 LTS e versões posteriores — já resolveu esses problemas nativamente.

Isso não é apenas "açúcar sintático". Esses recursos reduzem fundamentalmente o código repetitivo (*boilerplate*), melhoram a legibilidade do código e, mais importante, permitem otimizações mais profundas do compilador que reduzem a carga cognitiva.

Este é o verdadeiro "código secreto" para construir microsserviços mais rápidos, sustentáveis e baratos.

Aqui estão os 10 recursos que os desenvolvedores sêniores utilizam para reduzir sua base de código [Java](https://terminalroot.com.br/java/) pela metade.

---

## 1. `record`: O Exterminador de *Boilerplate*

Esta é a maior conquista para classes centradas em dados. Se o propósito principal de uma classe é armazenar dados, use um `record`. Eles são imutáveis e geram automaticamente construtores, getters, `equals()`, `hashCode()` e `toString()`.

A matemática é simples: 10 linhas de configuração se tornam uma.

### A Maneira Antiga (Java < 16)
{% highlight java %}
// User.java (aproximadamente 25 linhas de boilerplate + 2 campos)
public final class User {
    private final long id;
    private final String username;

    public User(long id, String username) {
        this.id = id;
        this.username = username;
    }
    // Mais 15 linhas de getters, equals, hashcode e toString...
}
{% endhighlight %}

### A Maneira Nova (Java 17+)
{% highlight java %}
// User.java (1 linha)
public record User(long id, String username) { }

// Uso:
var user = new User(42, "theIndieDev");
long userId = user.id(); // Os acessadores têm o nome do campo
{% endhighlight %}

**Observação:** Os `record` são imutáveis por padrão, o que quase sempre é o que você quer em uma arquitetura moderna. Se você precisa de mutabilidade, geralmente está modelando uma entidade com estado, não um DTO, e deve usar uma classe tradicional.

> Aprenda **Java** da forma correta:
> 
> <https://terminalroot.com.br/java>


---

## 2. *Pattern Matching* para `instanceof`: Adeus ao Inferno dos *Casts*

Quantas vezes você já escreveu a mesma sequência cansativa: verificar o tipo e, em seguida, fazer o *cast* explícito? Agora o compilador faz o *cast* para você, dentro do bloco, desde que a verificação seja bem-sucedida.

Isso economiza uma linha, mas, mais criticamente, limpa instantaneamente a lógica aninhada.

### A Maneira Antiga
{% highlight java %}
public void process(Object o) {
    if (o instanceof String) {
        String s = (String) o; // Cast explícito necessário
        System.out.println("Length: " + s.length());
    }
}
{% endhighlight %}

### A Maneira Nova
{% highlight java %}
public void process(Object o) {
    // 's' é automaticamente convertida para String e está no escopo
    if (o instanceof String s) {
        System.out.println("Length: " + s.length());
    }
    // 's' está fora do escopo aqui
}
{% endhighlight %}

---

## 3. Expressões `switch`: O Simplificador de Fluxo

As declarações tradicionais `switch` eram uma fonte de *bugs* sutis devido ao *fall-through* acidental e, além disso, eram apenas declarações — você não podia atribuir o resultado a uma variável.

As expressões `switch` corrigem isso garantindo um resultado e usando a sintaxe de seta (`->`) para eliminar a necessidade do `break`.

### A Maneira Antiga
{% highlight java %}
String dayType;
switch (day) {
    case MONDAY:
    case FRIDAY:
        dayType = "Busy";
        break; // O break é crucial!
    case SATURDAY:
    case SUNDAY:
        dayType = "Weekend";
        break;
    default:
        dayType = "Normal";
}
{% endhighlight %}

### A Maneira Nova (Uma Única Expressão)
{% highlight java %}
String dayType = switch (day) {
    case MONDAY, FRIDAY -> "Busy";
    case SATURDAY, SUNDAY -> "Weekend";
    default -> "Normal";
};
{% endhighlight %}

> Aprenda **Java** da forma correta:
> 
> <https://terminalroot.com.br/java>


---

## 4. Classes Seladas (*Sealed Classes*): O *Power-Up* Arquitetural

As classes seladas, introduzidas no [Java](https://terminalroot.com.br/java/) 17, não têm como objetivo direto reduzir linhas de código. Elas servem para reduzir possíveis *bugs* e permitir que o compilador ajude na correção.

Agora você pode declarar explicitamente quais classes ou *records* podem implementar ou estender um tipo selado, impondo uma hierarquia controlada.

{% highlight java %}
// Impondo que apenas Circle, Square e Rectangle podem ser formas
public sealed interface Shape
    permits Circle, Square, Rectangle { }

public record Circle(double radius) implements Shape { }
public final class Square implements Shape { /* ... */ }
// Qualquer classe que não seja explicitamente 'permitida' não pode implementar Shape
{% endhighlight %}

A mágica acontece quando você combina isso com uma Expressão `switch`. O compilador agora pode garantir que você tratou todos os subtipos possíveis, eliminando a necessidade de uma cláusula `default` defensiva. Isso é poderoso para modelagem *Domain-Driven Design* (DDD).

---

## 5. Blocos de Texto (*Text Blocks*): O Salvador do SQL/JSON

Se seu código [Java](https://terminalroot.com.br/java/) lida com strings de várias linhas — consultas SQL, *payloads* JSON, trechos HTML ou arquivos de configuração complexos — você provavelmente já teve strings concatenadas feias com caracteres `\n` inseridos manualmente.

Os Blocos de Texto (`"""..."""`) resolvem esse problema de forma elegante.

### A Maneira Antiga
{% highlight java %}
String JSON_PAYLOAD = "{\n"
    + "  \"name\": \"AccountCreatedEvent\",\n"
    + "  \"timestamp\": \"" + now() + "\"\n"
    + "}";
{% endhighlight %}

### A Maneira Nova
{% highlight java %}
String JSON_PAYLOAD = """
    {
      "name": "AccountCreatedEvent",
      "timestamp": "%s"
    }
    """.formatted(now()); // Funciona muito bem com .formatted()!
{% endhighlight %}

---

## 6. Inferência de Tipo de Variável Local (`var`): Despoluindo o Código

Esse recurso, muitas vezes mal compreendido, tem como objetivo reduzir o ruído causado por declarações de tipo redundantes. A chave são as variáveis locais onde o tipo é claro a partir do contexto.

Você economiza na digitação, mas o benefício real são linhas mais limpas, especialmente com genéricos.

### A Maneira Antiga
{% highlight java %}
Map<String, List<User>> userMap = new HashMap<String, List<User>>();
try (BufferedReader reader = new BufferedReader(new FileReader("data.txt"))) {
    // ...
}
{% endhighlight %}

### A Maneira Nova
{% highlight java %}
// O tipo é óbvio a partir do lado direito (RHS)
var userMap = new HashMap<String, List<User>>();

// Ainda suficientemente explícito para legibilidade
try (var reader = new BufferedReader(new FileReader("data.txt"))) {
    // ...
}
{% endhighlight %}

**Sabedoria do Dev Sênior:** Use `var` apenas onde o tipo seja imediatamente óbvio no lado direito (RHS). Não o use para ofuscar tipos de retorno de métodos ou para campos.

---

## 7. Melhorias no `Optional`: Menos Código Defensivo

A classe `Optional` é essencial para programação no estilo funcional, mas versões mais antigas tornavam tarefas comuns muito verbosas. O [Java](https://terminalroot.com.br/java/) adicionou métodos mais limpos para tornar o tratamento de erros e efeitos colaterais mais elegantes.

### A Maneira Antiga (Pré-Java 11)
{% highlight java %}
// Tratando um valor ausente com erro
String result = optionalValue.orElseThrow(
    () -> new NoSuchElementException("Missing value"));

// Tratando efeitos colaterais de sucesso ou falha
optionalValue.ifPresent(
    (v) -> doSomething(v)
);
if (!optionalValue.isPresent()) {
    doSomethingElse();
}
{% endhighlight %}

### A Maneira Nova (Java 11+)
{% highlight java %}
// Maneira mais limpa de lançar uma exceção
String result = optionalValue.orElseThrow(
    NoSuchElementException::new);

// Maneira mais limpa de lidar com efeitos colaterais
optionalValue.ifPresentOrElse(
    this::doSomething,
    this::doSomethingElse
);
{% endhighlight %}

> Aprenda **Java** da forma correta:
> 
> <https://terminalroot.com.br/java>


---

## 8. Melhorias na API de *Streams* (`takeWhile` / `dropWhile`)

A API de *Streams* é a base do [Java](https://terminalroot.com.br/java/) funcional moderno. `takeWhile` e `dropWhile` permitem uma filtragem poderosa, baseada em condições e com curto-circuito.

Em vez de consumir todo o *stream* com um `filter` genérico, você pode parar a iteração imediatamente quando uma condição for atendida, levando a um processamento mais rápido de grandes conjuntos de dados.

### O Conceito
{% highlight java %}
// Dados: [1, 2, 4, 6, 9, 10, 12]

// takeWhile: Pega elementos *enquanto* o predicado for verdadeiro, depois para.
// Exemplo: takeWhile(n -> n < 5) retorna [1, 2, 4]
// dropWhile: Descarta elementos *enquanto* o predicado for verdadeiro, depois retorna o restante.
// Exemplo: dropWhile(n -> n < 5) retorna [6, 9, 10, 12]
{% endhighlight %}

---

## 9. `Collectors.toUnmodifiableList/Set/Map`: Defensivo por Padrão

Em versões mais antigas do Java, os desenvolvedores constantemente se esquecia de encapsular coleções mutáveis em cópias defensivas (por exemplo, `Collections.unmodifiableList(...)`). Essa é uma fonte clássica de problemas de concorrência e corrupção de estado.

Agora, você pode coletar diretamente em uma lista imutável.

### A Maneira Antiga
{% highlight java %}
List<String> mutableResults = sourceList.stream()
    .filter(...)
    .collect(Collectors.toList());
// Mais tarde, você poderia retornar assim, permitindo modificação externa:
// return mutableResults; // PERIGO!

// A maneira defensiva era verbosa:
List<String> safeList = sourceList.stream()
    .filter(...)
    .collect(Collectors.collectingAndThen(
        Collectors.toList(),
        Collections::unmodifiableList
    ));
{% endhighlight %}

### A Maneira Nova (Java 10+)
{% highlight java %}
// Uma linha, garantidamente imutável e segura
List<String> safeList = sourceList.stream()
    .filter(...)
    .toList(); // Esta é a sintaxe simplificada do [Java](https://terminalroot.com.br/java/) 16+

// OU (para [Java](https://terminalroot.com.br/java/) 10+)
List<String> safeList = sourceList.stream()
    .filter(...)
    .collect(Collectors.toUnmodifiableList());
{% endhighlight %}

> Aprenda **Java** da forma correta:
> 
> <https://terminalroot.com.br/java>


---

## 10. `Stream::toList()`: O Finalizador de *Streams*

Embora `Collectors.toList()` exista há muito tempo, o método de instância `Stream::toList()` (Java 16+) é uma maneira concisa e sem *boilerplate* de finalizar um *stream* em uma `List` padrão e imodificável.

É o máximo economizador de linhas para a operação de *Stream* mais comum.

### A Maneira Antiga (Verbosamente)
{% highlight java %}
List<String> names = employees.stream()
    .map(Employee::getName)
    .collect(Collectors.toList());
{% endhighlight %}

### A Maneira Nova (Conciso e Seguro)
{% highlight java %}
List<String> names = employees.stream()
    .map(Employee::getName)
    .toList(); // Uma única chamada de método
{% endhighlight %}

---

## Conclusão: Pare de Escrever Código Descartável

A complexidade no software empresarial raramente está na lógica de negócio em si; está no "tecido conjuntivo" — o código repetitivo (*boilerplate*), as cópias defensivas, as instruções `break` esquecidas e os *casts* manuais.

O [Java](https://terminalroot.com.br/java/) moderno (17+) foi projetado para eliminar esse "tecido conjuntivo". Ao adotar esses 10 recursos, você não está apenas agradando ao compilador; está libertando seu cérebro da carga cognitiva. **O código que você não escreve é código que não pode ter bugs**.

Se você mantém uma grande base de código, insisto fortemente para que você pare de usar os padrões antigos e verbosos e comece a migrar seus DTOs para `record` hoje mesmo. Essa única mudança sozinha lhe dará uma redução imediata e quantificável de 50% na contagem de linhas em seus modelos de dados.

**Pare de escrever código descartável. Comece a escrever lógica de negócio.**

## [Curso de Java para Iniciantes](https://terminalroot.com.br/java)
### <https://terminalroot.com.br/java>

---

<span style="font-size:9px;">Via: *medium.com/@martinastaberger/*

