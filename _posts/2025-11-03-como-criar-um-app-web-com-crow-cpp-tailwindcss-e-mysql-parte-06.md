---
layout: post
title: "Como Criar um App Web com Crow C++ - Inserindo Tarefas :: Parte 06"
date: 2025-11-03 09:27:09
image: '/assets/img/cpp/crow/crow-todo-06.jpg'
description: "🐦‍⬛ Nesse vídeo criamos a tabela para gravar tarefas e fizemos inserção via Web no MySQL."
icon: 'ion:terminal-sharp'
iconname: 'Desenvolvimento Web/C++'
tags:
- crow
- cpp
- desenvolvimentoweb
- mysql
- web
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

☕ Nesse vídeo criamos a tabela para gravar tarefas e fizemos inserção via [Web](https://terminalroot.com.br/tags#web) no [MySQL](https://terminalroot.com.br/tags#mysql).

---

## 📹 Assista ao Vídeo

<iframe width="800" height="450" src="https://www.youtube.com/embed/WHx0XrIHLTs" title="Como Criar um App Web com Crow C++, TailwindCSS e MySQL do Zero" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## 🔗 Links úteis
+ 👑 Aprenda a criar sua própria linguagem de programação: <https://terminalroot.com.br/mylang>
+ ✅ Aprenda Criação de Games com C++ e SFML: <https://terminalroot.com.br/games>
+ ✅ Pacote Promocional C++: <https://terminalroot.com.br/promo>
+ ✅ Aprenda C++ e Qt: <https://terminalroot.com.br/cpp>
+ ✅ Conheça nossos Cursos: <https://bit.ly/CursosTerminalRoot>
+ 🎁 Todos os Cursos na Udemy: <https://bit.ly/UdemyTerminalRoot>

---

## 📝 Códigos feitos no vídeo
Comando SQL:

```sql
CREATE TABLE tasks (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  task VARCHAR(512) NOT NULL,
  task_date DATE NOT NULL DEFAULT (CURDATE()),
  task_time TIME NOT NULL DEFAULT (CURTIME())
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

<a href="https://terminalroot.com.br/downs/crow-06.tar.gz" class="btn btn-danger btn-lg" download>📦 Clique aqui para fazer DOWNLOAD dos arquivos</a>


---

Até o próximo capítulo!

