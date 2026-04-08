---
layout: post
title: "Visualize Áudio com Python"
date: 2026-04-08 11:36:22
image: '/assets/img/python/librosa.jpg'
description: "📢 Muito usada em IA, DSP e projetos musicais."
icon: 'ion:terminal-sharp'
iconname: 'Python'
tags:
- python
- multimidia
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **Librosa** é uma biblioteca [Python](https://terminalroot.com.br/python) focada em **análise e processamento de áudio e música**.

Uma lib construída sobre NumPy/SciPy para trabalhar com **sinais de áudio no domínio do tempo e da frequência**. Muito usada em **IA, DSP e projetos musicais**.


---

### Instalação (Python)

{% highlight bash %}
pip install librosa matplotlib
{% endhighlight %}

Se der erro com áudio:

{% highlight bash %}
pip install soundfile
{% endhighlight %}

**Em distros [GNU/Linux](https://terminalroot.com.br/tags#gnulinux) é necessário antes criar um ambiente virtual pra usar o PIP**

{% highlight bash %}
python -m venv venv
source venv/bin/activate
{% endhighlight %}

---

## Exemplo de uso
> `main.py`

{% highlight python %}
import librosa
import librosa.display
import matplotlib.pyplot as plt

y, sr = librosa.load(librosa.example('trumpet'))
plt.figure(figsize=(10, 4))
librosa.display.waveshow(y, sr=sr)
plt.title("Waveform of Sample Audio")
plt.show()
{% endhighlight %}

Execute o código:
{% highlight bash %}
python main.py
{% endhighlight %}

---

Para mais informações acesse o [site oficial da Librosa](https://librosa.org/).

## [Aprenda Python do Zero](https://terminalroot.com.br/python)
### <https://terminalroot.com.br/python>

