---
layout: post
title: "Tree++, o comando tree com ícones"
date: 2025-04-10 15:38:41
image: '/assets/img/cpmandos/tree++.png'
description: "🌳 É outra opção de árvore de diretórios, mas com ícones =)"
icon: 'ion:terminal-sharp'
iconname: 'Cli/C++'
tags:
- cli
- comandos
- cpp
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Criei outro comando com Modern [C++](https://terminalroot.com.br/tags#cpp) só para passar o tempo. É outra opção de árvore de diretórios, mas com ícones =)

---

## 🌳 Construir e instalar
{% highlight bash %}
git clone https://github.com/terroo/treepp
cmake -B build .
cmake --build build/
sudo cmake --install build/
{% endhighlight %}

---

## ✍️ Uso
> Exemplos
{% highlight bash %}
tree++ .
tree++ /caminho/para/diretório
# ou
tree++ /caminho/para/diretório
{% endhighlight %}
> A barra no final é indiferente.

---

## 🎄 `tree` padrão
Se você quiser que este seja o seu comando `árvore` padrão, execute:

{% highlight bash %}
sudo apt remove tree
sudo ln -s /usr/local/bin/árvore++ /usr/local/bin/árvore
{% endhighlight %}

---

## 📝 Nova tarefa
- [ ] - Adicionar cores! =)
