---
layout: post
title: "Como instalar o Postman no Ubuntu e em qualquer Distro Linux"
date: 2021-02-23 19:04:56
image: '/assets/img/dev/postman.jpg'
description: 'Postman é atualmente uma das ferramentas mais populares usadas no desenvolvimento de API.'
icon: 'ion:terminal-sharp'
iconname: 'terminalroot'
tags:
- desenvolvimentoweb
- laravel
- javascript
---

![Como instalar o Postman no Ubuntu e em qualquer Distro Linux](/assets/img/dev/postman.jpg)


Postman é atualmente uma das ferramentas mais populares usadas no desenvolvimento de API. Postman é um aplicativo de ambiente de desenvolvimento de API completo para simplificar cada etapa da construção de uma API e otimizar a colaboração. Assim, você pode criar APIs melhores e mais rápidas.

# Instalação em qualquer Distro Linux
+ Acesse <https://www.getpostman.com/downloads/> e clique no botão Download para baixar o aplicativo Postman mais recente para Linux. Da mesma forma, você pode baixar diretamente a versão mais recente em <https://dl.pstmn.io/download/latest/linux>.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

![Postman Download](/assets/img/postman-0.jpg)

+ Depois de baixar Postman em seu sistema, execute os seguintes comandos para instalar o Postman em seu sistema.
> Certifique-se que está no diretório onde você fez o download do Postman
{% highlight bash %}
tar zxvf Postman-linux-x64-*.tar.gz
{% endhighlight %}

+ Mova o Postman para o diretório `opt`
{% highlight bash %}
sudo mv Postman /opt
{% endhighlight %}

+ Crie um link simbóolico
{% highlight bash %}
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
{% endhighlight %}

+ Agora teste rodando o `postman` pelo terminal:
{% highlight bash %}
postman
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

+ Crie um ícone do Postman para aparecer no seu Dashboard e não precisar ficar abrindo-o via comando no terminal:
{% highlight bash %}
sudo cat <<EOF > /usr/share/applications/postman.desktop
{% endhighlight %}
E cole isso dentro:
{% highlight bash %}
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Exec="/opt/Postman/Postman"
Comment=Postman GUI
Categories=Development;Code;
{% endhighlight %}
> Lembre-se de pressionar mais um ENTER para pular uma linha e digite `EOF` para terminar a inserção, ou utilize um editor de texto, mas precisa ser com `sudo`.

+ Agora digite "postman" no campo de pesquisa no Dashboard e abra-o, exemplo:
![Postman Dashboard](/assets/img/postman-1.jpg)

Se você ainda não tiver uma conta, você precisará registrar assim que abri-lo e seguir os passos do registro!
![Postman Opened](/assets/img/postman-2.jpg)


# Instalação no Ubuntu 20.04 LTS
Se você estiver no Ubuntu e quiser poupar tempo, basta usar o [snap](https://snapcraft.io/)
{% highlight bash %}
sudo snap install postman
{% endhighlight %}

E então, desfrute do [Postman](https://www.postman.com/)

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

Esse artigo foi originalmente criado por [Speedy Sense](https://speedysense.com/install-postman-on-ubuntu-20-04/) e modificado e traduzido por [Marcos Oliveira](https://github.com/terroo) para [Terminal Root - Linux e Desenvolvimento](https://terminalroot.com.br/) .




