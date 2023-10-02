---
layout: post
title: "Aprenda a Criar Bibliotecas pra Python com C/C++"
date: 2023-10-01 15:25:38
image: '/assets/img/cpp/libpycpp.jpg'
description: 'Simples e rápido!'
icon: 'ion:terminal-sharp'
iconname: 'C++/Python'
tags:
- cpp
- python
- linguagemc
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

🔊 As bibliotecas de diversas [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) são escritas em [C](https://terminalroot.com.br/tags#linguagemc) e [C++](https://terminalroot.com.br/tags#cpp). Nesse vídeo veremos como fazer isso em [C++](https://terminalroot.com.br/cpp) para [Python](https://terminalroot.com.br/tags#python).

---

# Assista ao Vídeo

<iframe width="1253" height="705" src="https://www.youtube.com/embed/prpWqtlBw30" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

# Códigos criados no vídeo

### Arquivo com os exemplos criados:


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Arquivo `main.cpp`:
{% highlight cpp %}
#include <Python.h>

int world(){
  printf("Olá, Mundo!\n");
  return 0;
}

int add(int x, int y){
  return x + y;
}

int print(const char* str){
  printf("%s", str);
  return 0;
}

static PyObject* world(PyObject* self, PyObject* args){
  return Py_BuildValue("s", world());
}

static PyObject* print(PyObject* self, PyObject* args){
  const char* z;
  if(!PyArg_ParseTuple(args, "s", &z)){
    return NULL;
  }
  return Py_BuildValue("s", print(z));
}

static PyObject* add(PyObject* self, PyObject* args){
  int a, b;
  if(!PyArg_ParseTuple(args, "ii", &a, &b)){
    return NULL;
  }
  return Py_BuildValue("i", add(a, b));
}

static PyMethodDef hello_methods[] = {
  {"world", world, METH_VARARGS, "Print Hello World"},
  {"add", add, METH_VARARGS, "Add two numbers."},
  {"print", print, METH_VARARGS, "Print string"},
  {NULL, NULL, 0, NULL}
};

static struct PyModuleDef hello_module = {
  PyModuleDef_HEAD_INIT,
  "hello",
  NULL,
  -1,
  hello_methods
};

PyMODINIT_FUNC PyInit_hello(void){
  return PyModule_Create(&hello_module);
}
{% endhighlight %}

Código Python criado:
> `script.py`

{% highlight python %}
import hello

hello.world()

num1 = 36 
num2 = 90

print(hello.add(num1, num2))

hello.print("Olá, amigo somente\n")
{% endhighlight %}

Compile:
{% highlight bash %}
g++ -shared -o hello.so -fpic main.cpp -I /usr/include/python* # Altere pra versão que há no seu sistema
{% endhighlight %}

Rode:
{% highlight bash %}
python script.py
{% endhighlight %}


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

## Compilando a `playmp3`:
#### 1. Certifique-se antes de possuir as dependências:
> Exemplo no [Ubuntu](https://terminalroot.com.br/tags#ubuntu)

{% highlight bash %}
sudo apt install libmpg123-dev libao-dev libasound2
{% endhighlight %}

#### 2. Copie e crie os arquivos(`playmp3.hpp` e `playmp3.cpp`) da postagem do vídeo da *playmp3* disponível no endereço:
### [🎶 Como Tocar MP3 com C++ 🎻 🎼 Code Music](https://terminalroot.com.br/2023/09/como-tocar-mp3-com-cpp.html)

#### 3. Crie o `main.cpp` e adicione o código abaixo:
{% highlight cpp %}
#include <Python.h>
#include "playmp3.hpp"

int mp3(char* song){
  auto p = std::make_unique<PlayMP3>();
  p->music(song);
  p->play();
  return 0;
}

static PyObject* mp3(PyObject* self, PyObject* args){
  char* music;
  if (!PyArg_ParseTuple(args, "s", &music)) {
    return NULL;
  }
  mp3(music);
  return Py_BuildValue("");
}

static PyMethodDef playmp3_methods[] = {
  {"mp3", mp3, METH_VARARGS, "Play MP3"},
  {NULL, NULL, 0, NULL}
};

static struct PyModuleDef playmp3_module = {
  PyModuleDef_HEAD_INIT,
  "playmp3",
  NULL,
  -1,
  playmp3_methods
};

PyMODINIT_FUNC PyInit_playmp3(void) {
  return PyModule_Create(&playmp3_module);
}
{% endhighlight %}

#### 4. Adicione o caminho da `libalsa.so` à variável de ambiente: `LD_LIBRARY_PATH`:
{% highlight bash %}
echo export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(dirname "$(find /usr/lib* -name "libalsa.so" 2>/dev/null)") >> ~/.bashrc
{% endhighlight %}

#### 5. Feche e abra o terminal ou rode o comando abaixo:
{% highlight bash %}
source ~/.bashrc
{% endhighlight %}

#### 6. Compile:
{% highlight bash %}
g++ -shared -o playmp3.so -fpic main.cpp playmp3.cpp \
  -I /usr/include/python* \ # Altere para o caminho que há no seu sistema
  -lmpg123 -lao $(find /usr/lib* -name "libalsa.so")
{% endhighlight %}

#### 7. Crie um arquivo Python: `player.py`
{% highlight python %}
import playmp3 as play 
play.mp3("music.mp3")
{% endhighlight %}
> Em `music.mp3` substitua pela música que deseja escutar!

#### 8. Depois é só rodar:
{% highlight bash %}
python player.py
{% endhighlight %}

> Se quiser utilizar a biblioteca diretamente no seu sistema:
{% highlight bash %}
sudo mv playmp3.so /usr/local/lib
echo 'export PYTHONPATH="${PYTHONPATH}:/usr/local/lib"' >> ~/.bashrc
{% endhighlight %}

> Se quiser usar um *plugin* de saída diferente para o `libao`, como o plugin "oss" ([Open Sound System](https://pt.wikipedia.org/wiki/Open_Sound_System)), use:
{% highlight bash %}
export AO_DRIVER=oss
python player.py
{% endhighlight %}

---

# Aprenda [C++](https://terminalroot.com.br/cpp):
## <https://terminalroot.com.br/cpp>



