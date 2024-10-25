---
layout: post
title: "Qual a mais rápida: std::unordered_map ou std::map?"
date: 2024-10-25 10:31:32
image: '/assets/img/cppdaily/unordered-vs-map.jpg'
description: "🚀 A principal diferença entre elas está na forma como as chaves são armazenadas e acessadas."
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

As duas estruturas de dados, `std::map` e `std::unordered_map`, são oferecidas pela biblioteca padrão do [C++](https://terminalroot.com.br/tags#cpp) para armazenar pares de *chave-valor*. A principal diferença entre elas está na forma como as chaves são armazenadas e acessadas. Vamos detalhar essas diferenças:

+ `std::map`: Mantém as chaves ordenadas, operações O(log n), árvore binária de busca.
+ `std::unordered\_map`: Não mantém ordem, operações O(1) em média, tabela de dispersão.

### `std::map`

*   **Ordenação:** As chaves em um `std::map` são armazenadas em ordem crescente, com base em um critério de comparação (por padrão, `operator<`). Isso significa que a estrutura mantém uma árvore binária de busca balanceada (geralmente uma árvore Red-Black) internamente.
*   **Complexidade de Busca, Inserção e Remoção:** Operações de busca, inserção e remoção têm complexidade logarítmica, ou seja, O(log n), onde n é o número de elementos.
*   **Iteração:** A iteração sobre os elementos de um `std::map` é feita em ordem crescente das chaves.

### `std::unordered_map`

*   **Ordenação:** As chaves em um `std::unordered_map` não são armazenadas em ordem específica. Internamente, ele usa uma tabela de dispersão (hash table).
*   **Complexidade de Busca, Inserção e Remoção:** Em média, essas operações têm complexidade O(1) (tempo constante), desde que a função de hash seja eficiente e a tabela não esteja muito cheia. No pior caso, a complexidade pode ser O(n) se houver muitas colisões.
*   **Iteração:** A ordem de iteração sobre os elementos é indefinida e pode variar conforme as inserções e remoções são realizadas.

---

## Qual das duas tende a ser mais rápida?
A **`std::unordered_map`** tende a ser mais rápida que a **`std::map`** para a maioria dos casos, especialmente quando se trata de operações de busca, inserção e remoção. Isso ocorre devido às seguintes razões:

1.  **Complexidade das Operações:**
    
    *   **`std::unordered_map`:** Em média, as operações de busca, inserção e remoção têm complexidade O(1), desde que a tabela de dispersão esteja bem dimensionada e a função de hash seja eficiente. Isso significa que o tempo de execução dessas operações é constante na maioria dos casos.
    *   **`std::map`:** As mesmas operações têm complexidade O(log n) devido à estrutura de árvore binária de busca balanceada. Portanto, o tempo de execução aumenta logaritmicamente com o número de elementos.
2.  **Sobrecarga de Ordenação:**
    
    *   **`std::unordered_map`:** Não precisa manter as chaves em ordem, o que elimina a sobrecarga associada à manutenção da estrutura ordenada.
    *   **`std::map`:** Precisa manter as chaves em ordem, o que adiciona uma sobrecarga adicional em comparação com `std::unordered_map`.

Por exemplo, se você estiver desenvolvendo uma linguagem de programação com C++, `std::unordered_map` **tende a ser a escolha mais vantajosa** devido à sua eficiência nas operações de acesso.

---

### Quando `std::map` pode ser mais vantajoso?

Apesar de `std::unordered_map` ser geralmente mais rápido, há casos em que `std::map` pode ser preferível:

*   **Necessidade de Ordem:** Quando é necessário iterar sobre os elementos em uma ordem específica (crescente das chaves), `std::map` é a escolha correta.
*   **Funções de Hash Ineficientes:** Se a função de hash não for eficiente, pode haver muitas colisões, o que degrada o desempenho para O(n) no pior caso. Nesse caso, `std::map` pode ser mais estável.

---

Em resumo, **`std::unordered_map` é geralmente mais rápida** para acesso, inserção e remoção, mas **`std::map` é mais apropriada quando a ordenação dos elementos é necessária** ou em situações onde a estabilidade do desempenho é crucial.

